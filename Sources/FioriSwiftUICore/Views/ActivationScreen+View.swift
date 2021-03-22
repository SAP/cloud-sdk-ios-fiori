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
        
        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.primary1))
            }
        }
        
        struct PrimaryActionLabel: ViewModifier {
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
        
        struct SecondaryActionLabel: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.primary1))
            }
        }
        
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let subtitle = Subtitle()
        static let primaryActionLabel = PrimaryActionLabel()
        static let footnote = Footnote()
        static let secondaryActionLabel = SecondaryActionLabel()
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
            
            TextField("john.doe@abc.com", text: $emailFilled, onEditingChanged: { _ in
                if emailFilled.isEmpty {
                    self.buttonEnabled = false
                } else {
                    self.buttonEnabled = true
                }
            }) {
                self.buttonEnabled = true
            }
            .multilineTextAlignment(.center)
            .padding(.top, 15)
            .padding(.bottom, 15)
            primaryActionLabel
                .disabled(self.buttonEnabled == false)
                .padding(.bottom, 16)
            footnote
                .padding(.bottom, 16)
            secondaryActionLabel
                .buttonStyle(FioriButtonStyle())
            Spacer()
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
    }
}

struct ActivationScreen_preview: PreviewProvider {
    static var previews: some View {
        ActivationScreen(title: "Activation", descriptionText: "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.", subtitle: "abc@def.com", primaryActionLabel: "Next", footnote: "Or", secondaryActionLabel: "Scan")
    }
}
