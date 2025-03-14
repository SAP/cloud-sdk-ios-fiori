// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `WelcomeScreen` is used to display a welcome/launch screen to the application for onboarding.  The screen mainly displays the application name, instructions on how to start the activation process and an option to trigger the demo mode of the application.
/// ## Usage
/// ```
/// WelcomeScreen(title: {
///     Text(titleStr)
/// }, description: {
///     Text(descriptionStr)
/// }, icon: {
///     Image("oski")
/// }, footnote: {
///     Text("Want to explore?")
/// }, action: {
///     FioriButton { _ in
///         //
///     } label: { _ in
///         Text(primaryButtonTitleStr)
///             .multilineTextAlignment(.center)
///     }
/// }, secondaryAction: {
///     //
/// }, illustratedMessage: {
///     //
/// }, headlineImage: {
///     Image("SAPLogo")
/// }, inputText: self.$email, legalText: {
///     Text("legal text")
/// }, isLegalAgreementRequired: isLegalAgreementRequired, showsIllustratedMessage: self.showsIllustratedMessage, state: state, options: options, isDemoAvailable: isDemoAvailable, footerText: {
///    if showTermsOfService, type != .link, type != .customLogo {
///        Text("footer text")
///    }
/// })
/// ```
public struct WelcomeScreen {
    let title: any View
    let description: any View
    let icon: any View
    let footnote: any View
    let action: any View
    let secondaryAction: any View
    let illustratedMessage: any View
    ///  This image view is to be displayed on the top center of the welcome screen and is typically the company logo image.
    let headlineImage: any View
    @Binding var inputText: String
    let legalText: any View
    /// A flag indicating whether the user must agree to a legal agreement before proceeding. Default is false.
    /// When set to `true`, a checkbox with user-defined text in `legalTextView` will be displayed. The `primaryActionButton` will remain disabled until the checkbox is selected. Otherwise, both the `legalCheckbox` and `legalTextView` will be hidden.
    let isLegalAgreementRequired: Bool
    /// A flag determines whether the illustration message is displayed. Default is false. When `showsIllustratedMessage` is set to `true`, the `illustratedMessage` will be shown and the `description` will be hidden. Conversely, when `showsIllustratedMessage` is set to `false`, the `description` will be displayed and the `illustratedMessage` will be hidden.
    let showsIllustratedMessage: Bool
    /// A property to indicate the state in the onboarding process. The default is `.notConfigured`, to indicate the application has not been configured and additionally setting `options` to allow end-users to provide configuration settings during onboarding.  An `.isConfigured` state indicates that the application contains the necessary configurations to connect to mobile services and should prompt the user to Start.
    /// - See `FUIWelcomeControllerConfigurationOption` for possible configuration options when `state` is `.notConfigured`
    let state: WelcomeScreenState
    /// A property to indicate the configuration option(s) in the onboarding process when `state` is `.notConfigured`.  Default sets no configuration options.
    let options: Set<WelcomeScreenOption>
    /// A flag to indicate demo availability.  Default is true.  Only when it's true, display `Want to explore` label and `Try the Demo` button.  Corresponding `delegate` function is `didSelectDemoMode(_:)` if the property is true.
    let isDemoAvailable: Bool
    /// Designated for displaying text on the footer of the Welcome screen, such as terms of service.
    let footerText: any View

    @Environment(\.welcomeScreenStyle) var style

    var componentIdentifier: String = WelcomeScreen.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder footnote: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder secondaryAction: () -> any View = { EmptyView() },
                @ViewBuilder illustratedMessage: () -> any View = { EmptyView() },
                @ViewBuilder headlineImage: () -> any View = { EmptyView() },
                inputText: Binding<String> = .constant(""),
                @ViewBuilder legalText: () -> any View = { EmptyView() },
                isLegalAgreementRequired: Bool = false,
                showsIllustratedMessage: Bool = false,
                state: WelcomeScreenState = .notConfigured,
                options: Set<WelcomeScreenOption> = Set<WelcomeScreenOption>(),
                isDemoAvailable: Bool = true,
                @ViewBuilder footerText: () -> any View = { EmptyView() },
                componentIdentifier: String? = WelcomeScreen.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.footnote = Footnote(footnote: footnote, componentIdentifier: componentIdentifier)
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self.secondaryAction = SecondaryAction(secondaryAction: secondaryAction, componentIdentifier: componentIdentifier)
        self.illustratedMessage = illustratedMessage()
        self.headlineImage = headlineImage()
        self._inputText = inputText
        self.legalText = legalText()
        self.isLegalAgreementRequired = isLegalAgreementRequired
        self.showsIllustratedMessage = showsIllustratedMessage
        self.state = state
        self.options = options
        self.isDemoAvailable = isDemoAvailable
        self.footerText = footerText()
        self.componentIdentifier = componentIdentifier ?? WelcomeScreen.identifier
    }
}

public extension WelcomeScreen {
    static let identifier = "fiori_welcomescreen_component"
}

public extension WelcomeScreen {
    init(title: AttributedString,
         description: AttributedString? = nil,
         icon: Image? = nil,
         footnote: AttributedString? = nil,
         action: FioriButton? = nil,
         secondaryAction: FioriButton? = nil,
         illustratedMessage: IllustratedMessage? = nil,
         @ViewBuilder headlineImage: () -> any View = { EmptyView() },
         inputText: Binding<String>,
         legalText: AttributedString? = nil,
         isLegalAgreementRequired: Bool = false,
         showsIllustratedMessage: Bool = false,
         state: WelcomeScreenState = .notConfigured,
         options: Set<WelcomeScreenOption> = Set<WelcomeScreenOption>(),
         isDemoAvailable: Bool = true,
         footerText: AttributedString? = nil)
    {
        self.init(title: { Text(title) }, description: { OptionalText(description) }, icon: { icon }, footnote: { OptionalText(footnote) }, action: { action }, secondaryAction: { secondaryAction }, illustratedMessage: { illustratedMessage }, headlineImage: headlineImage, inputText: inputText, legalText: { OptionalText(legalText) }, isLegalAgreementRequired: isLegalAgreementRequired, showsIllustratedMessage: showsIllustratedMessage, state: state, options: options, isDemoAvailable: isDemoAvailable, footerText: { OptionalText(footerText) })
    }
}

public extension WelcomeScreen {
    init(_ configuration: WelcomeScreenConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: WelcomeScreenConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.description = configuration.description
        self.icon = configuration.icon
        self.footnote = configuration.footnote
        self.action = configuration.action
        self.secondaryAction = configuration.secondaryAction
        self.illustratedMessage = configuration.illustratedMessage
        self.headlineImage = configuration.headlineImage
        self._inputText = configuration.$inputText
        self.legalText = configuration.legalText
        self.isLegalAgreementRequired = configuration.isLegalAgreementRequired
        self.showsIllustratedMessage = configuration.showsIllustratedMessage
        self.state = configuration.state
        self.options = configuration.options
        self.isDemoAvailable = configuration.isDemoAvailable
        self.footerText = configuration.footerText
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension WelcomeScreen: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), description: .init(self.description), icon: .init(self.icon), footnote: .init(self.footnote), action: .init(self.action), secondaryAction: .init(self.secondaryAction), illustratedMessage: .init(self.illustratedMessage), headlineImage: .init(self.headlineImage), inputText: self.$inputText, legalText: .init(self.legalText), isLegalAgreementRequired: self.isLegalAgreementRequired, showsIllustratedMessage: self.showsIllustratedMessage, state: self.state, options: self.options, isDemoAvailable: self.isDemoAvailable, footerText: .init(self.footerText))).typeErased
                .transformEnvironment(\.welcomeScreenStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension WelcomeScreen {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        WelcomeScreen(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), description: .init(self.description), icon: .init(self.icon), footnote: .init(self.footnote), action: .init(self.action), secondaryAction: .init(self.secondaryAction), illustratedMessage: .init(self.illustratedMessage), headlineImage: .init(self.headlineImage), inputText: self.$inputText, legalText: .init(self.legalText), isLegalAgreementRequired: self.isLegalAgreementRequired, showsIllustratedMessage: self.showsIllustratedMessage, state: self.state, options: self.options, isDemoAvailable: self.isDemoAvailable, footerText: .init(self.footerText)))
            .shouldApplyDefaultStyle(false)
            .welcomeScreenStyle(WelcomeScreenFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
