// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SignInAction {
    let signInAction: any View

    @Environment(\.signInActionStyle) var style

    var componentIdentifier: String = SignInAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder signInAction: () -> any View = { FioriButton { _ in Text("Sign In".localizedFioriString()) } },
                componentIdentifier: String? = SignInAction.identifier)
    {
        self.signInAction = signInAction()
        self.componentIdentifier = componentIdentifier ?? SignInAction.identifier
    }
}

public extension SignInAction {
    static let identifier = "fiori_signinaction_component"
}

public extension SignInAction {
    init(signInAction: FioriButton? = FioriButton { _ in Text("Sign In".localizedFioriString()) }) {
        self.init(signInAction: { signInAction })
    }
}

public extension SignInAction {
    init(_ configuration: SignInActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SignInActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.signInAction = configuration.signInAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SignInAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, signInAction: .init(self.signInAction))).typeErased
                .transformEnvironment(\.signInActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SignInAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SignInAction(.init(componentIdentifier: self.componentIdentifier, signInAction: .init(self.signInAction)))
            .shouldApplyDefaultStyle(false)
            .signInActionStyle(.fiori)
            .typeErased
    }
}
