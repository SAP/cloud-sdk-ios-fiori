// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Checkmark {
    let checkmark: any View

    @Environment(\.checkmarkStyle) var style

    var componentIdentifier: String = Checkmark.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder checkmark: () -> any View = { Image(systemName: "checkmark") },
                componentIdentifier: String? = Checkmark.identifier)
    {
        self.checkmark = checkmark()
        self.componentIdentifier = componentIdentifier ?? Checkmark.identifier
    }
}

public extension Checkmark {
    static let identifier = "fiori_checkmark_component"
}

public extension Checkmark {
    init(checkmark: Image? = Image(systemName: "checkmark")) {
        self.init(checkmark: { checkmark })
    }
}

public extension Checkmark {
    init(_ configuration: CheckmarkConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CheckmarkConfiguration, shouldApplyDefaultStyle: Bool) {
        self.checkmark = configuration.checkmark
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Checkmark: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, checkmark: .init(self.checkmark))).typeErased
                .transformEnvironment(\.checkmarkStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Checkmark {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Checkmark(.init(componentIdentifier: self.componentIdentifier, checkmark: .init(self.checkmark)))
            .shouldApplyDefaultStyle(false)
            .checkmarkStyle(.fiori)
            .typeErased
    }
}
