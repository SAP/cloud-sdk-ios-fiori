// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `Authentication` is used to display a login screen with customizable detail image, title, subtitle, input fields and sign-in action.
/// ## Usage
/// ```swift
/// // Basic usage
/// @State var password: String = ""
/// @State var name: String = ""
///
/// Authentication(detailImage: {
///     Image(.illustration).resizable().aspectRatio(contentMode: .fit)
/// }, title: {
///     Text("Authentication")
/// }, subtitle: {
///     Text("Please provide your username and password to authenticate.")
/// }, authInput: {
///     VStack(spacing: 16) {
///         TextFieldFormView(title: "", text: self.$name, placeholder: "Enter your name")
///         TextFieldFormView(title: "", text: self.$password, isSecureEnabled: true, placeholder: "Enter your password")
///     }
/// }, isDisabled: password.isEmpty || name.isEmpty) {
///     print("sign in ......")
/// }
///
/// // With banner message and custom style
/// Authentication(detailImage: {
///     Image(.illustration).resizable().aspectRatio(contentMode: .fit)
/// }, title: {
///     Text("Authentication")
/// }, subtitle: {
///     Text("Please provide your username and password.")
/// }, isDisabled: password.isEmpty || name.isEmpty) {
///     // Handle sign in action
/// }
/// .authenticationStyle(BasicAuthenticationStyle(password: self.$password, name: self.$name))
/// .bannerMessageView(isPresented: self.$isPresentedBanner,
///                   pushContentDown: .constant(false),
///                   icon: { EmptyView() },
///                   title: "Verifying...",
///                   messageType: .neutral)
/// ```
public struct Authentication {
    let detailImage: any View
    let title: any View
    let subtitle: any View
    let authInput: any View
    let signInAction: any View
    /// Whether the sign-in button is disabled. Typically controlled by the validation state of the input fields.
    let isDisabled: Bool
    /// Callback triggered when the sign-in action is performed. This is called when the user taps the sign-in button
    /// and the `isDisabled` property is false.
    let didSignIn: (() -> Void)?

    @Environment(\.authenticationStyle) var style

    var componentIdentifier: String = Authentication.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder authInput: () -> any View = { EmptyView() },
                @ViewBuilder signInAction: () -> any View = { FioriButton { _ in Text("Sign In".localizedFioriString()) } },
                isDisabled: Bool,
                didSignIn: (() -> Void)? = nil,
                componentIdentifier: String? = Authentication.identifier)
    {
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.authInput = AuthInput(authInput: authInput, componentIdentifier: componentIdentifier)
        self.signInAction = SignInAction(signInAction: signInAction, componentIdentifier: componentIdentifier)
        self.isDisabled = isDisabled
        self.didSignIn = didSignIn
        self.componentIdentifier = componentIdentifier ?? Authentication.identifier
    }
}

public extension Authentication {
    static let identifier = "fiori_authentication_component"
}

public extension Authentication {
    init(detailImage: Image? = nil,
         title: AttributedString,
         subtitle: AttributedString? = nil,
         @ViewBuilder authInput: () -> any View = { EmptyView() },
         signInAction: FioriButton? = FioriButton { _ in Text("Sign In".localizedFioriString()) },
         isDisabled: Bool,
         didSignIn: (() -> Void)? = nil)
    {
        self.init(detailImage: { detailImage }, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, authInput: authInput, signInAction: { signInAction }, isDisabled: isDisabled, didSignIn: didSignIn)
    }
}

public extension Authentication {
    init(_ configuration: AuthenticationConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AuthenticationConfiguration, shouldApplyDefaultStyle: Bool) {
        self.detailImage = configuration.detailImage
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.authInput = configuration.authInput
        self.signInAction = configuration.signInAction
        self.isDisabled = configuration.isDisabled
        self.didSignIn = configuration.didSignIn
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Authentication: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), subtitle: .init(self.subtitle), authInput: .init(self.authInput), signInAction: .init(self.signInAction), isDisabled: self.isDisabled, didSignIn: self.didSignIn)).typeErased
                .transformEnvironment(\.authenticationStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Authentication {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Authentication(.init(componentIdentifier: self.componentIdentifier, detailImage: .init(self.detailImage), title: .init(self.title), subtitle: .init(self.subtitle), authInput: .init(self.authInput), signInAction: .init(self.signInAction), isDisabled: self.isDisabled, didSignIn: self.didSignIn))
            .shouldApplyDefaultStyle(false)
            .authenticationStyle(AuthenticationFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
