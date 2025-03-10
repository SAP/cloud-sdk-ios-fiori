import FioriThemeManager
import Foundation
import SwiftUI

/// Describes different onboarding states in onboarding process flow.
public enum WelcomeScreenState {
    /// Application has not been configured, and does not use `WelcomeScreen` flow to obtain configuration.
    case notConfigured
    /// Application contains the necessary configurations to connect to mobile services, and should prompt user to Start.
    case isConfigured
}

/// Describes different onboarding configuration options in onboarding process flow.
public enum WelcomeScreenOption {
    /// Application has not been configured, and should prompt the end user for their email address.
    case discoveryService
    /// Application has not been configured, and should prompt the end user to launch the Barcode Scanner to obtain connection settings.
    case barcodeScanner
}

// Base Layout style
public struct WelcomeScreenBaseStyle: WelcomeScreenStyle {
    @State private var isCheckBoxSelected = false
    
    @FocusState var isFocused: Bool
    
    // swiftlint:disable function_body_length
    public func makeBody(_ configuration: WelcomeScreenConfiguration) -> some View {
        GeometryReader { proxy in
            
            let availableHeight = proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom
            
            let welcomeScreenSpec = getWelcomeScreenSpec(height: availableHeight)
            
            VStack {
                ScrollView {
                    VStack(spacing: 0, content: {
                        configuration.headlineImage
                            .padding(.top, welcomeScreenSpec.headlineImageTopPadding)
                        configuration.title
                            .padding(.top, welcomeScreenSpec.headlineLabelTopPadding)
                    })
                    
                    VStack {
                        if !configuration.showsIllustratedMessage {
                            configuration.description
                        } else {
                            configuration.illustratedMessage
                        }
                    }
                    .padding(.top, welcomeScreenSpec.detailLabelTopPadding)
                    
                    if configuration.isLegalAgreementRequired {
                        HStack(spacing: 10, content: {
                            Button {
                                self.isCheckBoxSelected.toggle()
                            } label: {
                                if self.isCheckBoxSelected {
                                    Image(systemName: "checkmark.square.fill")
                                        .renderingMode(.original)
                                        .font(.fiori(forTextStyle: .body, weight: .light))
                                        .foregroundStyle(Color.preferredColor(.tintColor))
                                } else {
                                    Image(systemName: "square")
                                        .renderingMode(.original)
                                        .font(.fiori(forTextStyle: .body, weight: .light))
                                        .foregroundStyle(Color.preferredColor(.separator))
                                }
                            }
                            
                            configuration.legalText
                            
                            Spacer()
                        })
                        .padding(.top, 16)
                    }
                    
                    if (configuration.state == .notConfigured && configuration.options == [] && configuration.isDemoAvailable)
                        || !(configuration.state == .notConfigured && configuration.options == [])
                    {
                        VStack(spacing: 32, content: {
                            if configuration.state == .notConfigured, configuration.options == [.discoveryService] {
                                PlaceholderTextField(text: configuration.$inputText, placeholder: {
                                    Text("john.doe@email.com")
                                        .font(.fiori(forTextStyle: .body, isItalic: true))
                                        // .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                                        .tint(.preferredColor(.tertiaryLabel))
                                })
                                .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                                .font(.fiori(forTextStyle: .body))
                                .foregroundStyle(Color.preferredColor(.primaryLabel))
                                .frame(minHeight: 44)
                                .keyboardType(.emailAddress)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color.preferredColor(self.isFocused ? .tintColor : .separator), style: StrokeStyle(lineWidth: self.isFocused ? 2.0 : 1.0))
                                }
                                .focused(self.$isFocused)
                            }
                            
                            if !(configuration.state == .notConfigured && configuration.options == []) {
                                configuration.action
                                    .disabled(self.primaryActionDisabled(configuration))
                            }
                            
                            if configuration.isDemoAvailable {
                                VStack(spacing: welcomeScreenSpec.tryDemoTopPadding, content: {
                                    if configuration.state == .notConfigured, configuration.options == [] {
                                        configuration.footnote
                                    }
                                    
                                    configuration.secondaryAction
                                })
                            }
                        })
                        .padding(.top, configuration.isLegalAgreementRequired ? 16 : 24)
                    }
                    
                    Spacer()
                }
                .scrollBounceBehavior(.basedOnSize)
                .scrollIndicators(.hidden)
                
                configuration.icon
                    .padding(.top, welcomeScreenSpec.logoTopPadding)
                    .padding(.bottom, welcomeScreenSpec.logoBottomPadding)
                
                configuration.footerText
                    .padding(.bottom, 8)
            }
            .padding(.leading, welcomeScreenSpec.leftPadding)
            .padding(.trailing, welcomeScreenSpec.rightPadding)
            .onTapGesture {
                self.isFocused = false
            }
        }
    }
    
    func primaryActionDisabled(_ configuration: WelcomeScreenConfiguration) -> Bool {
        var enabled = true
        if configuration.state == .notConfigured, configuration.options == [.discoveryService] {
            enabled = !configuration.inputText.isEmpty
        }
        if configuration.isLegalAgreementRequired {
            enabled = enabled && self.isCheckBoxSelected
        }
        return !enabled
    }
}

// Default fiori styles
extension WelcomeScreenFioriStyle {
    struct ContentFioriStyle: WelcomeScreenStyle {
        func makeBody(_ configuration: WelcomeScreenConfiguration) -> some View {
            WelcomeScreen(configuration)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let welcomeScreenConfiguration: WelcomeScreenConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            if configuration.isDirectChild(self.welcomeScreenConfiguration.componentIdentifier) {
                Title(configuration)
                    .font(.fiori(forTextStyle: .title1).weight(.bold))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
                    .typeErased
            } else {
                Title(configuration)
                    .typeErased
            }
        }
    }

    struct DescriptionFioriStyle: DescriptionStyle {
        let welcomeScreenConfiguration: WelcomeScreenConfiguration

        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            if configuration.isDirectChild(self.welcomeScreenConfiguration.componentIdentifier) {
                Description(configuration)
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
                    .typeErased
            } else {
                Description(configuration)
                    .typeErased
            }
        }
    }

    struct IconFioriStyle: IconStyle {
        let welcomeScreenConfiguration: WelcomeScreenConfiguration

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
        }
    }

    struct FootnoteFioriStyle: FootnoteStyle {
        let welcomeScreenConfiguration: WelcomeScreenConfiguration

        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            if configuration.isDirectChild(self.welcomeScreenConfiguration.componentIdentifier) {
                Footnote(configuration)
                    .font(.fiori(forTextStyle: .subheadline))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .typeErased
            } else {
                Footnote(configuration)
                    .typeErased
            }
        }
    }

    struct ActionFioriStyle: ActionStyle {
        let welcomeScreenConfiguration: WelcomeScreenConfiguration

        func makeBody(_ configuration: ActionConfiguration) -> some View {
            if configuration.isDirectChild(self.welcomeScreenConfiguration.componentIdentifier) {
                Action(configuration)
                    .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity, minHeight: 44))
                    .typeErased
            } else {
                Action(configuration)
                    .typeErased
            }
        }
    }

    struct SecondaryActionFioriStyle: SecondaryActionStyle {
        let welcomeScreenConfiguration: WelcomeScreenConfiguration

        func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
            if configuration.isDirectChild(self.welcomeScreenConfiguration.componentIdentifier) {
                SecondaryAction(configuration)
                    .font(.fiori(forTextStyle: .body).weight(.semibold))
                    .foregroundColor(.preferredColor(.tintColor))
                    .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .tint, maxWidth: .infinity, minHeight: 44))
                    .typeErased
            } else {
                SecondaryAction(configuration)
                    .typeErased
            }
        }
    }
}
