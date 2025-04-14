import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct AuthenticationBaseStyle: AuthenticationStyle {
    public func makeBody(_ configuration: AuthenticationConfiguration) -> some View {
        // Add default layout here
        GeometryReader { proxy in
            let availableHeight = proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom
            let availableWidth = proxy.size.width + proxy.safeAreaInsets.leading + proxy.safeAreaInsets.trailing
            ScrollView {
                VStack(spacing: 0) {
                    #if !os(visionOS)
                        configuration.detailImage
                            .frame(width: 140, height: 140)
                            .padding(.top, AuthenticationElement.detailImage.topPadding)
                    #endif
                    configuration.title
                        .padding(.top, AuthenticationElement.title(availableHeight).topPadding)
                        
                    configuration.subtitle
                        .padding(.top, AuthenticationElement.subtitle(availableHeight).topPadding)
                        
                    configuration.authInput
                        .padding(.top, AuthenticationElement.authInput(availableHeight).topPadding)
                    
                    configuration.signInAction
                        .padding(.top, AuthenticationElement.applyAction(availableHeight).topPadding)
                        .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity))
                        .onSimultaneousTapGesture {
                            configuration.didSignIn?()
                        }
                        .disabled(configuration.isDisabled)
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .scrollIndicators(.hidden)
            .padding([.leading, .trailing], AuthenticationElement.bothLeftAndRightSamePadding(availableWidth))
        }
    }
}

// Default fiori styles
extension AuthenticationFioriStyle {
    struct ContentFioriStyle: AuthenticationStyle {
        func makeBody(_ configuration: AuthenticationConfiguration) -> some View {
            Authentication(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct DetailImageFioriStyle: DetailImageStyle {
        let authenticationConfiguration: AuthenticationConfiguration

        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
            // Add default style for DetailImage
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let authenticationConfiguration: AuthenticationConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .ifApply(self.authenticationConfiguration.detailImage.isEmpty) { content in
                    content
                        .font(.title)
                        .bold()
                }
            #if !os(visionOS)
                .ifApply(!self.authenticationConfiguration.detailImage.isEmpty) { content in
                    content
                        .font(.fiori(forTextStyle: .headline, weight: .bold))
                }
            #else
                .font(.largeTitle)
            #endif
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let authenticationConfiguration: AuthenticationConfiguration

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .multilineTextAlignment(.center)
                // Apply different styles for subtitle with detail image
                .ifApply(!self.authenticationConfiguration.detailImage.isEmpty) { content in
                    content
                        .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                        .font(.fiori(forTextStyle: .subheadline))
                }
                // Apply different styles for subtitle without detail image
                .ifApply(self.authenticationConfiguration.detailImage.isEmpty) { content in
                    content
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                        .font(.fiori(forTextStyle: .body))
                }
        }
    }

    struct AuthInputFioriStyle: AuthInputStyle {
        let authenticationConfiguration: AuthenticationConfiguration

        func makeBody(_ configuration: AuthInputConfiguration) -> some View {
            AuthInput(configuration)
            // Add default style for AuthInput
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct SignInActionFioriStyle: SignInActionStyle {
        let authenticationConfiguration: AuthenticationConfiguration
    
        func makeBody(_ configuration: SignInActionConfiguration) -> some View {
            SignInAction(configuration)
            // Add default style for SignInAction
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

// MARK: - Basic Authentication Style

/// Custom style implementation for basic authentication screen
/// Provides a simplified version of the authentication screen with username and password fields
public struct BasicAuthenticationStyle: AuthenticationStyle {
    @Binding var password: String
    @Binding var name: String
    
    /// Initialize the basic authentication style with bindings for password and username
    /// - Parameters:
    ///   - password: Binding for password field
    ///   - name: Binding for username field
    public init(password: Binding<String>, name: Binding<String>) {
        self._password = password
        self._name = name
    }
    
    public func makeBody(_ configuration: AuthenticationConfiguration) -> some View {
        Authentication(detailImage: {
            configuration.detailImage
        }, title: {
            configuration
                .title
                .titleStyle(AuthenticationFioriStyle.TitleFioriStyle(authenticationConfiguration: configuration))
        }, subtitle: {
            configuration
                .subtitle
                .subtitleStyle(AuthenticationFioriStyle.SubtitleFioriStyle(authenticationConfiguration: configuration))
        }, isDisabled: configuration.isDisabled, didSignIn: configuration.didSignIn)
            .authInputStyle(AuthInputFieldStyle(password: self.$password, name: self.$name))
    }
}

// MARK: - Auth Input Field Style

/// Style for authentication input fields
/// Provides a standard layout for username and password input fields
struct AuthInputFieldStyle: AuthInputStyle {
    @Binding var password: String
    @Binding var name: String
    
    func makeBody(_ configuration: AuthInputConfiguration) -> some View {
        VStack(spacing: 16) {
            TextFieldFormView(title: "", text: self.$name, placeholder: AttributedString("username".localizedFioriString()))
                .textFieldFormViewStyle(AuthTextFieldStyle())
            TextFieldFormView(title: "", text: self.$password, isSecureEnabled: true, placeholder: AttributedString("password".localizedFioriString()))
                .textFieldFormViewStyle(AuthTextFieldStyle())
        }
    }
}

// MARK: - Auth Text Field Style

/// Style for authentication Text fields
/// Provides a standard layout for username and password Text fields
public struct AuthTextFieldStyle: TextFieldFormViewStyle {
    @FocusState private var isFocused: Bool
    @State private var isEditing: Bool = false
    @State private var isSecure: Bool = false
    
    public init() {}
    
    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .titleStyle { titleConf in
                Title(titleConf)
                    .foregroundStyle(self.getTitleColor(configuration))
                    .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
            }
            .placeholderTextFieldStyle { config in
                HStack {
                    PlaceholderTextField(config)
                        .foregroundStyle(self.getTextColor(configuration))
                        .font(.fiori(forTextStyle: .body))
                        .accentColor(self.getCursorColor(configuration))
                        .focused(self.$isFocused)
                        .setOnChange(of: configuration.text, action1: { s in
                            self.checkCharCount(configuration, textString: s)
                        }) { _, s in
                            self.checkCharCount(configuration, textString: s)
                        }
                        .frame(minHeight: 44)
                        
                    if !(configuration.isSecureEnabled ?? false) {
                        if self.showsActionButton(configuration), let action = getAction(configuration), let actionIcon = self.getActionIcon(configuration) {
                            actionIcon
                                .frame(minHeight: 44)
                                .padding(.trailing, 8)
                                .onTapGesture {
                                    action()
                                }
                        }
                    }
                }
                .background(RoundedRectangle(cornerRadius: 8).stroke(self.getBorderColor(configuration), lineWidth: self.isFocused ? 4 : 1).background(self.getBackgroundColor(configuration)))
                .cornerRadius(8)
            }
            .textInputFieldStyle(content: { _ in
                if configuration.isSecureEnabled ?? false {
                    HStack {
                        if self.isSecure {
                            TextField("", text: configuration.$text)
                        } else {
                            SecureField("", text: configuration.$text)
                        }
                    }
                    .overlay(alignment: .trailing) {
                        Image(systemName: self.isSecure ? "eye" : "eye.slash")
                            .font(.callout)
                            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                            .onTapGesture {
                                self.isSecure.toggle()
                            }
                    }
                } else {
                    TextField("", text: configuration.$text)
                }
            })
            .textInputInfoViewStyle { config in
                let isError = self.isErrorStyle(configuration)
                let style: any TextInputInfoViewStyle = isError ? .error : .fiori
                TextInputInfoView(config)
                    .textInputInfoViewStyle(style)
                    .typeErased
                    .padding(.top, -3)
            }
            .accessibilityElement(children: .combine)
            .setCustomAction(self.showsActionButton(configuration), configuration: configuration, isFocused: self.$isFocused, isEditing: self.$isEditing, actionIconAccessibilityLabel: self.getActionAccessibilityLabel(configuration))
            .setGestureOnTextFieldView(self.$isFocused, isEditing: self.$isEditing)
    }
    
    func isDisabled(_ configuration: TextFieldFormViewConfiguration) -> Bool {
        configuration.controlState == .disabled
    }

    func getTitleColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getTitleColor()
    }

    func getMandatoryIndicatorColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
        TextInputFormViewConfiguration(configuration, isFocused: false).getTitleColor()
    }

    func getTextColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getTextColor()
    }

    func getCursorColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getCursorColor()
    }

    func getBackgroundColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getBackgroundColor()
    }

    func getBorderColor(_ configuration: TextFieldFormViewConfiguration) -> Color {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).getBorderColor()
    }

    func isErrorStyle(_ configuration: TextFieldFormViewConfiguration) -> Bool {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isErrorStyle()
    }

    func isInfoViewNeeded(_ configuration: TextFieldFormViewConfiguration) -> Bool {
        TextInputFormViewConfiguration(configuration, isFocused: self.isFocused).isInfoViewNeeded()
    }

    func checkCharCount(_ configuration: TextFieldFormViewConfiguration, textString: String) {
        guard let maxTextLength = configuration.maxTextLength, maxTextLength > 0 else {
            return
        }
        if !(configuration.allowsBeyondLimit == true), textString.count > maxTextLength {
            configuration.text = String(textString.prefix(maxTextLength))
        }
    }

    func showsActionButton(_ configuration: TextFieldFormViewConfiguration) -> Bool {
        guard configuration.controlState == .normal, !self.isFocused, !self.isEditing else {
            return false
        }
        guard configuration.actionIcon != nil, configuration.action != nil else {
            return false
        }
        return true
    }

    func getAction(_ configuration: TextFieldFormViewConfiguration) -> (() -> Void)? {
        guard configuration.controlState == .normal, !self.isFocused else {
            return nil
        }
        return configuration.action
    }

    func getActionIcon(_ configuration: TextFieldFormViewConfiguration) -> Image? {
        guard configuration.controlState == .normal, !self.isFocused else {
            return nil
        }
        return configuration.actionIcon
    }

    func getActionAccessibilityLabel(_ configuration: TextFieldFormViewConfiguration) -> String {
        if let actionAccessibilityLabel = configuration.actionIconAccessibilityLabel {
            return actionAccessibilityLabel
        }
        return NSLocalizedString("Custom Action", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Custom Action")
    }
}

// MARK: - Layout Specifications

/// Protocol defining the layout specifications for authentication screen elements
protocol AuthenticationScreenSpec {
    var topPadding: CGFloat { get }
}

/// Enum defining the layout elements and their padding values
enum AuthenticationElement {
    case detailImage
    case title(CGFloat)
    case subtitle(CGFloat)
    case authInput(CGFloat)
    case applyAction(CGFloat)
    
    /// Calculate horizontal padding based on screen width
    /// - Parameter width: Available screen width
    /// - Returns: Padding value for left and right edges
    static func bothLeftAndRightSamePadding(_ width: CGFloat) -> CGFloat {
        switch width {
        case 0 ..< 375: // Small-screen devices such as iPhone SE and mini.
            return 16.0
        case 375 ..< 428: // iPhone standard screen
            return max(24.0, width * 0.064) // ~24px on 375pt width
        case 428 ..< 744: // iPhone Plus/Max and iPad in portrait mode
            return max(32.0, width * 0.075) // ~32px on 428pt width
        case 744 ..< 1024: // iPad horizontal screen
            return max(48.0, width * 0.14) // ~40px on 744pt width
        default: // Larger screen devices
            return max(76.0, width * 0.28) // ~48px on 1024pt width
        }
    }
}

extension AuthenticationElement: AuthenticationScreenSpec {
    var topPadding: CGFloat {
        switch self {
        case .detailImage:
            return 56.0
        case .title(let height):
            switch FioriOnboardingUtil.currentSupportedType(height: height) {
            case .medium, .small:
                return 16.0
            case .large:
                return 32.0
            case .extraLarge:
                return 80.0
            case .extraExtraLarge:
                return 212.0
            }
        case .subtitle(let height):
            switch FioriOnboardingUtil.currentSupportedType(height: height) {
            case .small:
                return 32.0
            case .medium:
                return 40.0
            case .large:
                return 24.0
            case .extraLarge, .extraExtraLarge:
                return 64.0
            }
        case .authInput(let height):
            switch FioriOnboardingUtil.currentSupportedType(height: height) {
            case .small, .medium, .large:
                return 32.0
            case .extraLarge, .extraExtraLarge:
                return 64.0
            }
        case .applyAction:
            return 42.0
        }
    }
}
