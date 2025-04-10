// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AuthInput {
    let authInput: any View

    @Environment(\.authInputStyle) var style

    var componentIdentifier: String = AuthInput.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder authInput: () -> any View = { EmptyView() },
                componentIdentifier: String? = AuthInput.identifier)
    {
        self.authInput = authInput()
        self.componentIdentifier = componentIdentifier ?? AuthInput.identifier
    }
}

public extension AuthInput {
    static let identifier = "fiori_authinput_component"
}

public extension AuthInput {
    init(_ configuration: AuthInputConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AuthInputConfiguration, shouldApplyDefaultStyle: Bool) {
        self.authInput = configuration.authInput
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AuthInput: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, authInput: .init(self.authInput))).typeErased
                .transformEnvironment(\.authInputStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AuthInput {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AuthInput(.init(componentIdentifier: self.componentIdentifier, authInput: .init(self.authInput)))
            .shouldApplyDefaultStyle(false)
            .authInputStyle(.fiori)
            .typeErased
    }
}
