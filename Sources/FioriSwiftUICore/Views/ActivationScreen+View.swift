/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum ActivationScreen {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 28, weight: .thin, design: .default))
                    .foregroundColor(.preferredColor(.primary1))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct DescriptionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 17))
                    .foregroundColor(.preferredColor(.primary1))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct TextFilled: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.primary1))
            }
        }
        
        struct ActionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .frame(width: 169.0, height: 20.0)
            }
        }
        
        struct Footnote: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.primary1))
            }
        }
        
        struct SecondaryActionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.primary1))
            }
        }
        
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let textFilled = TextFilled()
        static let actionText = ActionText()
        static let footnote = Footnote()
        static let secondaryActionText = SecondaryActionText()
    }
}

extension ActivationScreen: View {
    public var body: some View {
        VStack {
            title
                .padding(.top, 40)
                .padding(.bottom, 40)
            descriptionText
                .padding(.bottom, 40)
            
            textFilled
                .multilineTextAlignment(.center)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .padding(.top, 15)
                .padding(.bottom, 15)
            
            actionText
                .disabled(self.emailFilled.userInputValue.isEmpty == true)
                .buttonStyle(FioriButtonStyle())
                .padding(.bottom, 16)
            footnote
                .padding(.bottom, 16)
            secondaryActionText
                .buttonStyle(FioriButtonStyle())
            Spacer()
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
    }
}

struct ActivationScreen_preview: PreviewProvider {
    static var previews: some View {
        ActivationScreen(title: "Activation", descriptionText: "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.", textFilled: "abc@def.com", actionText: "Next", footnote: "Or", secondaryActionText: "Scan")
    }
}
