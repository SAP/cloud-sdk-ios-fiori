@testable import FioriSwiftUICore
import XCTest

final class FioriPasscodePolicyTests: XCTestCase {
    // MARK: - validate(passcode:)

    func testTooShortFails() {
        let policy = FioriPasscodePolicy(minLength: 8)
        XCTAssertFalse(policy.validate(passcode: "Abc12!"))
        XCTAssertTrue(policy.validate(passcode: "abcdefgh"))
    }

    func testRequiresDigit() {
        let policy = FioriPasscodePolicy(minLength: 4, hasDigit: true)
        XCTAssertFalse(policy.validate(passcode: "abcd"))
        XCTAssertTrue(policy.validate(passcode: "abc1"))
    }

    func testRequiresUpperLowerSpecial() {
        let policy = FioriPasscodePolicy(minLength: 4, hasUpper: true, hasLower: true, hasSpecial: true)
        XCTAssertFalse(policy.validate(passcode: "abcd"), "missing upper and special")
        XCTAssertFalse(policy.validate(passcode: "Abcd"), "missing special")
        XCTAssertTrue(policy.validate(passcode: "Abc!"))
    }

    func testMinUniqueChars() {
        let policy = FioriPasscodePolicy(minLength: 4, minUniqueChars: 4)
        XCTAssertFalse(policy.validate(passcode: "aabb"), "only 2 unique chars")
        XCTAssertTrue(policy.validate(passcode: "abcd"))
    }

    func testDigitsOnly() {
        let policy = FioriPasscodePolicy(minLength: 4, isDigitsOnly: true)
        XCTAssertFalse(policy.validate(passcode: "12a4"))
        XCTAssertTrue(policy.validate(passcode: "1234"))
    }

    func testDigitsOnlyIgnoresCharacterClassRequirements() {
        // When isDigitsOnly is true, hasUpper/hasLower/hasSpecial are ignored.
        let policy = FioriPasscodePolicy(minLength: 4, hasUpper: true, hasSpecial: true, isDigitsOnly: true)
        XCTAssertTrue(policy.validate(passcode: "1234"))
    }

    func testCustomRule() {
        var policy = FioriPasscodePolicy(minLength: 4)
        policy.addPasscodeRule(FioriPasscodeRule(displayName: "2+ lowercase", isDisplayed: true) { passcode in
            passcode.unicodeScalars.filter { CharacterSet.lowercaseLetters.contains($0) }.count >= 2
        })
        XCTAssertFalse(policy.validate(passcode: "A1B2"), "no lowercase")
        XCTAssertTrue(policy.validate(passcode: "ab12"))
    }

    func testAllRequirementsCombined() {
        var policy = FioriPasscodePolicy(minLength: 8, hasDigit: true, hasUpper: true, hasSpecial: true, minUniqueChars: 4)
        policy.addPasscodeRule(FioriPasscodeRule(displayName: "2+ lowercase", isDisplayed: true) { passcode in
            passcode.unicodeScalars.filter { CharacterSet.lowercaseLetters.contains($0) }.count >= 2
        })
        XCTAssertFalse(policy.validate(passcode: "Ab1!"), "too short")
        XCTAssertTrue(policy.validate(passcode: "Abcd12!x"))
    }

    // MARK: - requirements(for:)

    func testRequirementsListsEnabledChecks() {
        let policy = FioriPasscodePolicy(minLength: 8, hasDigit: true, hasUpper: true, minUniqueChars: 4)
        let ids = policy.requirements(for: "").map(\.requirement.id)
        XCTAssertTrue(ids.contains("minLength"))
        XCTAssertTrue(ids.contains("hasDigit"))
        XCTAssertTrue(ids.contains("hasUpper"))
        XCTAssertTrue(ids.contains("minUniqueChars"))
        XCTAssertFalse(ids.contains("hasLower"), "hasLower not enabled")
        XCTAssertFalse(ids.contains("hasSpecial"), "hasSpecial not enabled")
    }

    func testRequirementsSatisfactionUpdates() {
        let policy = FioriPasscodePolicy(minLength: 8, hasDigit: true)
        let empty = policy.requirements(for: "")
        XCTAssertTrue(empty.allSatisfy { !$0.isSatisfied })

        let full = policy.requirements(for: "abcdefg1")
        XCTAssertTrue(full.allSatisfy(\.isSatisfied))
    }

    func testRequirementsIncludesDisplayedCustomRuleOnly() {
        var policy = FioriPasscodePolicy(minLength: 4)
        policy.addPasscodeRule(FioriPasscodeRule(displayName: "shown", isDisplayed: true) { _ in true })
        policy.addPasscodeRule(FioriPasscodeRule(displayName: "hidden", isDisplayed: false) { _ in true })
        let names = policy.requirements(for: "abcd").map(\.requirement.displayName)
        XCTAssertTrue(names.contains("shown"))
        XCTAssertFalse(names.contains("hidden"))
    }
}
