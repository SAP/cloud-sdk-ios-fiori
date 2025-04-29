import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ActivationScreenBaseStyle: ActivationScreenStyle {
    @FocusState var isFocused: Bool

    public func makeBody(_ configuration: ActivationScreenConfiguration) -> some View {
        // Add default layout here
        GeometryReader { proxy in
            let availableHeight = proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom
            let supportedType = FioriOnboardingUtil.currentSupportedType(height: availableHeight)
            let activationScreenSpec = getActivationScreenSpec(height: availableHeight)

            ScrollView {
                VStack(spacing: 0) {
                    VStack(spacing: activationScreenSpec.activationDetailLabelTopPadding) {
                        if configuration.showsIllustratedMessage {
                            configuration.illustratedMessage
                        } else {
                            configuration.title
                                
                            configuration.descriptionText
                        }
                    }
                    #if !os(visionOS)
                    .padding(.top, configuration.showsIllustratedMessage ? 32 : activationScreenSpec.activationHeadlineLabelTopPadding)
                    #else
                    .padding(.top, activationScreenSpec.activationHeadlineLabelTopPadding)
                    #endif
                    
                    VStack(spacing: (supportedType == FioriOnboardingUtil.SupportedType.extraLarge || supportedType == FioriOnboardingUtil.SupportedType.extraExtraLarge) ? 24 : 22) {
                        PlaceholderTextField(text: configuration.$inputText, placeholder: {
                            Text("john.doe@email.com")
                                .font(.fiori(forTextStyle: .body, isItalic: true))
                                .tint(.preferredColor(.tertiaryLabel))
                        })
                        .font(.fiori(forTextStyle: .body))
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                        .frame(minHeight: 44)
                        .keyboardType(.emailAddress)
                        .submitLabel(.done)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.preferredColor(self.isFocused ? .tintColor : .separator), style: StrokeStyle(lineWidth: self.isFocused ? 2.0 : 1.0))
                        }
                        .focused(self.$isFocused)
                        
                        VStack(spacing: (supportedType == FioriOnboardingUtil.SupportedType.extraLarge || supportedType == FioriOnboardingUtil.SupportedType.extraExtraLarge) ? 18 : 16) {
                            configuration.action
                                .disabled(configuration.inputText.isEmpty)
                                .frame(minWidth: 201, minHeight: 36)
                                .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity))
                            
                            configuration.footnote
                            
                            configuration.secondaryAction
                                .frame(minWidth: 201, minHeight: 36)
                                .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity))
                        }
                        .padding([.leading, .trailing], 0)
                    }
                    #if !os(visionOS)
                    .padding(.top, configuration.showsIllustratedMessage ? 24 : activationScreenSpec.activationStackTopPadding)
                    #else
                    .padding(.top, activationScreenSpec.activationStackTopPadding)
                    #endif
                    .padding(.bottom, activationScreenSpec.activationStackBottomPadding)
                    .padding([.leading, .trailing], 0)
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .scrollIndicators(.hidden)
            .padding(.leading, activationScreenSpec.activationLeftPadding)
            .padding(.trailing, activationScreenSpec.activationRightPadding)
            .onTapGesture {
                self.isFocused = false
            }
        }
    }
}

// Default fiori styles
extension ActivationScreenFioriStyle {
    struct ContentFioriStyle: ActivationScreenStyle {
        func makeBody(_ configuration: ActivationScreenConfiguration) -> some View {
            ActivationScreen(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let activationScreenConfiguration: ActivationScreenConfiguration
        @State var isTruncated: Bool = false

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .lineLimit(2)
                .background(
                    ViewThatFits(in: .horizontal) {
                        Title(configuration)
                            .lineLimit(1)
                            .hidden()
                            .onAppear {
                                self.isTruncated = false
                            }
                        Color.clear
                            .hidden()
                            .onAppear {
                                self.isTruncated = true
                            }
                    }
                )
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(Font.fiori(fixedSize: self.isTruncated ? getActivationScreenSpec(height: Screen.bounds.size.height).activationHeadlineLabelWrappedTextFont : getActivationScreenSpec(height: Screen.bounds.size.height).activationHeadlineLabelFont, weight: .bold))
                .multilineTextAlignment(.center)
        }
    }

    struct DescriptionTextFioriStyle: DescriptionTextStyle {
        let activationScreenConfiguration: ActivationScreenConfiguration

        func makeBody(_ configuration: DescriptionTextConfiguration) -> some View {
            DescriptionText(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .body))
                .multilineTextAlignment(.center)
        }
    }

    struct FootnoteFioriStyle: FootnoteStyle {
        let activationScreenConfiguration: ActivationScreenConfiguration

        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            Footnote(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .body))
        }
    }

    struct ActionFioriStyle: ActionStyle {
        let activationScreenConfiguration: ActivationScreenConfiguration

        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
                .lineLimit(2)
        }
    }

    struct SecondaryActionFioriStyle: SecondaryActionStyle {
        let activationScreenConfiguration: ActivationScreenConfiguration

        func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
            SecondaryAction(configuration)
                .lineLimit(2)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.system(size: 15))
        }
    }

    struct TextInputFioriStyle: TextInputStyle {
        let activationScreenConfiguration: ActivationScreenConfiguration

        func makeBody(_ configuration: TextInputConfiguration) -> some View {
            TextInput(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .body))
                .multilineTextAlignment(.center)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
        }
    }
}

// MARK: - Layout Specifications

/// Protocol defining the layout specifications for activation screen elements
protocol ActivationScreenSpec {
    var activationLeftPadding: CGFloat { get }
    var activationRightPadding: CGFloat { get }

    var activationHeadlineLabelTopPadding: CGFloat { get }
    var activationDetailLabelTopPadding: CGFloat { get }
    var activationStackTopPadding: CGFloat { get }
    var activationStackBottomPadding: CGFloat { get }

    var activationHeadlineLabelFont: CGFloat { get }
    var activationHeadlineLabelWrappedTextFont: CGFloat { get }
}

class ActivationScreenSpec_Small: ActivationScreenSpec {
    var activationLeftPadding: CGFloat { 32.0 }
    var activationRightPadding: CGFloat { self.activationLeftPadding }

    var activationHeadlineLabelTopPadding: CGFloat { 20.0 }
    var activationDetailLabelTopPadding: CGFloat { 32.0 }
    var activationStackTopPadding: CGFloat { 32.0 }
    var activationStackBottomPadding: CGFloat { 48.0 }

    var activationHeadlineLabelFont: CGFloat { 24.0 }
    var activationHeadlineLabelWrappedTextFont: CGFloat { 22.0 }
}

class ActivationScreenSpec_Medium: ActivationScreenSpec {
    var activationLeftPadding: CGFloat { 32.0 }
    var activationRightPadding: CGFloat { self.activationLeftPadding }

    var activationHeadlineLabelTopPadding: CGFloat { 48.0 }
    var activationDetailLabelTopPadding: CGFloat { 40.0 }
    var activationStackTopPadding: CGFloat { 64.0 }
    var activationStackBottomPadding: CGFloat { 48.0 }

    var activationHeadlineLabelFont: CGFloat { 28.0 }
    var activationHeadlineLabelWrappedTextFont: CGFloat { 24.0 }
}

class ActivationScreenSpec_Large: ActivationScreenSpec {
    var activationLeftPadding: CGFloat { 32.0 }
    var activationRightPadding: CGFloat { self.activationLeftPadding }

    var activationHeadlineLabelTopPadding: CGFloat { 48.0 }
    var activationDetailLabelTopPadding: CGFloat { 40.0 }
    var activationStackTopPadding: CGFloat { 64.0 }
    var activationStackBottomPadding: CGFloat { 48.0 }

    var activationHeadlineLabelFont: CGFloat { 28.0 }
    var activationHeadlineLabelWrappedTextFont: CGFloat { 24.0 }
}

class ActivationScreenSpec_ExtraLarge: ActivationScreenSpec {
    var activationLeftPadding: CGFloat { 76 }
    var activationRightPadding: CGFloat { self.activationLeftPadding }

    var activationHeadlineLabelTopPadding: CGFloat { 80.0 }
    var activationDetailLabelTopPadding: CGFloat { 60.0 }
    var activationStackTopPadding: CGFloat { 80.0 }
    var activationStackBottomPadding: CGFloat { 48.0 }

    var activationHeadlineLabelFont: CGFloat { 28.0 }
    var activationHeadlineLabelWrappedTextFont: CGFloat { 28.0 }
}

class ActivationScreenSpec_ExtraExtraLarge: ActivationScreenSpec {
    var activationLeftPadding: CGFloat { 76 }
    var activationRightPadding: CGFloat { self.activationLeftPadding }

    var activationHeadlineLabelTopPadding: CGFloat { 212.0 }
    var activationDetailLabelTopPadding: CGFloat { 64.0 }
    var activationStackTopPadding: CGFloat { 80.0 }
    var activationStackBottomPadding: CGFloat { 48.0 }

    var activationHeadlineLabelFont: CGFloat { 28.0 }
    var activationHeadlineLabelWrappedTextFont: CGFloat { 28.0 }
}

func getActivationScreenSpec(height: CGFloat) -> ActivationScreenSpec {
    let supportedType = FioriOnboardingUtil.currentSupportedType(height: height)
    switch supportedType {
    case .small:
        return ActivationScreenSpec_Small()
    case .medium:
        return ActivationScreenSpec_Medium()
    case .large:
        return ActivationScreenSpec_Large()
    case .extraLarge:
        return ActivationScreenSpec_ExtraLarge()
    case .extraExtraLarge:
        return ActivationScreenSpec_ExtraExtraLarge()
    }
}
