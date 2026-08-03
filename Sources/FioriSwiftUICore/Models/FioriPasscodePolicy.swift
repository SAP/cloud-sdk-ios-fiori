import Foundation

/// A passcode policy that defines the requirements a passcode must satisfy.
///
/// This is the SwiftUI counterpart of the UIKit `FUIPasscodePolicy`. It carries the pure
/// validation business logic (minimum length, required character classes, minimum unique
/// characters, and user-defined rules) and is decoupled from any UI so it can be reused and
/// unit-tested. Use it together with `PasscodePolicyAuthenticationStyle` to drive a
/// requirement checklist in the `Authentication` component.
///
/// Example:
/// ```swift
/// var policy = FioriPasscodePolicy(minLength: 8, hasDigit: true, hasUpper: true, hasSpecial: true, minUniqueChars: 4)
/// policy.addPasscodeRule(FioriPasscodeRule(displayName: "At least 2 lowercase", isDisplayed: true) { passcode in
///     passcode.unicodeScalars.filter { CharacterSet.lowercaseLetters.contains($0) }.count >= 2
/// })
/// let isValid = policy.validate(passcode: "Abc12!de")
/// ```
public struct FioriPasscodePolicy {
    /// The default minimum length of characters in a passcode.
    public static let defaultMinLength = 8

    /// Represents "no limit" for `Int` properties such as `minUniqueChars`.
    public static let noLimit = -1

    /// The minimum number of characters in the passcode.
    /// `validate(passcode:)` returns `false` if the passcode length is less than this value.
    public var minLength: Int

    /// Whether the passcode must contain at least one digit.
    public var hasDigit: Bool

    /// Whether the passcode must contain at least one uppercase character.
    public var hasUpper: Bool

    /// Whether the passcode must contain at least one lowercase character.
    public var hasLower: Bool

    /// Whether the passcode must contain at least one special (non-alphanumeric) character.
    public var hasSpecial: Bool

    /// When `true`, the passcode must contain digits only. All of `hasDigit`, `hasUpper`,
    /// `hasLower`, and `hasSpecial` are ignored when this is `true`. User-defined rules added
    /// via `addPasscodeRule(_:)` are still evaluated.
    public var isDigitsOnly: Bool

    /// The minimum number of unique characters the passcode must contain.
    /// A value of `noLimit` (or `0`) disables this check.
    public var minUniqueChars: Int

    /// The user-defined passcode rules added to this policy.
    public private(set) var passcodeRules: [FioriPasscodeRule]

    // When `minUniqueChars` is 0 or `noLimit`, the check is always satisfied, so skip it.
    var hasMinUniqueChars: Bool {
        self.minUniqueChars > 0
    }

    /// Creates a passcode policy.
    /// - Parameters:
    ///   - minLength: Minimum number of characters. Defaults to `defaultMinLength` (8).
    ///   - hasDigit: Requires at least one digit. Defaults to `false`.
    ///   - hasUpper: Requires at least one uppercase character. Defaults to `false`.
    ///   - hasLower: Requires at least one lowercase character. Defaults to `false`.
    ///   - hasSpecial: Requires at least one special character. Defaults to `false`.
    ///   - isDigitsOnly: Requires the passcode to contain digits only. Defaults to `false`.
    ///   - minUniqueChars: Minimum number of unique characters. Defaults to `noLimit`.
    public init(minLength: Int = FioriPasscodePolicy.defaultMinLength,
                hasDigit: Bool = false,
                hasUpper: Bool = false,
                hasLower: Bool = false,
                hasSpecial: Bool = false,
                isDigitsOnly: Bool = false,
                minUniqueChars: Int = FioriPasscodePolicy.noLimit)
    {
        self.minLength = minLength
        self.hasDigit = hasDigit
        self.hasUpper = hasUpper
        self.hasLower = hasLower
        self.hasSpecial = hasSpecial
        self.isDigitsOnly = isDigitsOnly
        self.minUniqueChars = minUniqueChars
        self.passcodeRules = []
    }

    /// Adds a user-defined passcode rule to the policy.
    /// - Parameter rule: The rule to add.
    public mutating func addPasscodeRule(_ rule: FioriPasscodeRule) {
        self.passcodeRules.append(rule)
    }

    /// Validates a passcode against the policy.
    ///
    /// The passcode passes only if every enabled requirement is satisfied. User-defined rules
    /// added via `addPasscodeRule(_:)` are always evaluated, including when `isDigitsOnly` is `true`.
    /// - Parameter passcode: The passcode to check.
    /// - Returns: `true` if the passcode satisfies all requirements.
    public func validate(passcode: String) -> Bool {
        if passcode.count < self.minLength {
            return false
        }

        for rule in self.passcodeRules where !rule.rule(passcode) {
            return false
        }

        if self.isDigitsOnly {
            guard self.checkDigitOnly(passcode) else { return false }
            if self.hasMinUniqueChars, !self.checkUniqueChars(passcode) {
                return false
            }
            return true
        }

        if self.hasDigit, !self.checkDigit(passcode) {
            return false
        }
        if self.hasUpper, !self.checkUpper(passcode) {
            return false
        }
        if self.hasLower, !self.checkLower(passcode) {
            return false
        }
        if self.hasSpecial, !self.checkSpecial(passcode) {
            return false
        }
        if self.hasMinUniqueChars, !self.checkUniqueChars(passcode) {
            return false
        }

        return true
    }

    /// Returns each enabled requirement together with whether it is currently satisfied by
    /// the given passcode. This is intended to drive a live requirement checklist in the UI.
    ///
    /// - Note: Displayed user-defined rules (see `addPasscodeRule(_:)`) are always included,
    ///   regardless of `isDigitsOnly`.
    /// - Parameter passcode: The passcode to evaluate.
    /// - Returns: The list of requirements with their current satisfaction state.
    public func requirements(for passcode: String) -> [(requirement: FioriPasscodeRequirement, isSatisfied: Bool)] {
        var result = self.requirements()
            .map { (requirement: $0, isSatisfied: $0.check(passcode)) }
        // Include displayed user-defined rules. Use the rule's index for a stable, unique id so
        // rules that share a display name do not collide in SwiftUI's ForEach.
        for (index, rule) in self.passcodeRules.enumerated() where rule.isDisplayed {
            let requirement = FioriPasscodeRequirement(id: "rule.\(index)", displayName: rule.displayName, check: rule.rule)
            result.append((requirement: requirement, isSatisfied: requirement.check(passcode)))
        }
        return result
    }

    /// Builds the list of enabled built-in requirements (without evaluating them).
    private func requirements() -> [FioriPasscodeRequirement] {
        var result = [FioriPasscodeRequirement]()

        if self.minLength > 0 {
            let format = "At least %d characters".localizedFioriString()
            let name = String(format: format, self.minLength)
            result.append(FioriPasscodeRequirement(id: "minLength", displayName: name) { $0.count >= self.minLength })
        }

        if self.isDigitsOnly {
            result.append(FioriPasscodeRequirement(id: "isDigitsOnly", displayName: "Digits only".localizedFioriString(), check: self.checkDigitOnly))
        } else {
            if self.hasDigit {
                result.append(FioriPasscodeRequirement(id: "hasDigit", displayName: "At least one digit".localizedFioriString(), check: self.checkDigit))
            }
            if self.hasUpper {
                result.append(FioriPasscodeRequirement(id: "hasUpper", displayName: "At least one uppercase letter".localizedFioriString(), check: self.checkUpper))
            }
            if self.hasLower {
                result.append(FioriPasscodeRequirement(id: "hasLower", displayName: "At least one lowercase letter".localizedFioriString(), check: self.checkLower))
            }
            if self.hasSpecial {
                result.append(FioriPasscodeRequirement(id: "hasSpecial", displayName: "At least one special character".localizedFioriString(), check: self.checkSpecial))
            }
        }

        if self.hasMinUniqueChars {
            let format = "At least %d unique characters".localizedFioriString()
            let name = String(format: format, self.minUniqueChars)
            result.append(FioriPasscodeRequirement(id: "minUniqueChars", displayName: name, check: self.checkUniqueChars))
        }

        return result
    }

    // MARK: - Character checks (ported from UIKit FUIPasscodePolicy)

    func checkDigit(_ passcode: String) -> Bool {
        for c in passcode.unicodeScalars where CharacterSet.decimalDigits.contains(c) {
            return true
        }
        return false
    }

    func checkDigitOnly(_ passcode: String) -> Bool {
        for c in passcode.unicodeScalars where !CharacterSet.decimalDigits.contains(c) {
            return false
        }
        return !passcode.isEmpty
    }

    func checkUpper(_ passcode: String) -> Bool {
        for c in passcode.unicodeScalars where CharacterSet.uppercaseLetters.contains(c) {
            return true
        }
        return false
    }

    func checkLower(_ passcode: String) -> Bool {
        for c in passcode.unicodeScalars where CharacterSet.lowercaseLetters.contains(c) {
            return true
        }
        return false
    }

    func checkSpecial(_ passcode: String) -> Bool {
        // A special character is anything that is not alphanumeric.
        for c in passcode.unicodeScalars where !CharacterSet.alphanumerics.contains(c) {
            return true
        }
        return false
    }

    func checkUniqueChars(_ passcode: String) -> Bool {
        var seen = Set<UnicodeScalar>()
        for c in passcode.unicodeScalars {
            seen.insert(c)
        }
        return seen.count >= self.minUniqueChars
    }
}

/// A single passcode requirement that can be displayed in a requirement checklist.
public struct FioriPasscodeRequirement: Identifiable {
    /// A stable identifier for the requirement.
    public let id: String
    /// The user-facing description of the requirement.
    public let displayName: String
    /// The closure that evaluates whether a passcode satisfies this requirement.
    let check: (String) -> Bool

    init(id: String, displayName: String, check: @escaping (String) -> Bool) {
        self.id = id
        self.displayName = displayName
        self.check = check
    }
}

/// A user-defined passcode rule that can be added to a `FioriPasscodePolicy`.
public struct FioriPasscodeRule {
    /// The text shown for this rule in the requirement checklist.
    public let displayName: String
    /// Whether this rule is shown to the user in the checklist.
    public let isDisplayed: Bool
    let rule: (String) -> Bool

    /// Creates a user-defined passcode rule.
    /// - Parameters:
    ///   - displayName: The text shown for this rule in the requirement checklist.
    ///   - isDisplayed: Whether this rule is shown to the user in the checklist.
    ///   - rule: The closure that returns `true` when the passcode satisfies the rule.
    public init(displayName: String, isDisplayed: Bool, rule: @escaping (String) -> Bool) {
        self.displayName = displayName
        self.isDisplayed = isDisplayed
        self.rule = rule
    }
}
