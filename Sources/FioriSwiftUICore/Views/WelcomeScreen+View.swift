/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum WelcomeScreen {
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
        
        struct PrimaryActionLabel: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .frame(width: 169.0, height: 20.0)
            }
        }
        
        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.primary1))
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
                    .foregroundColor(.preferredColor(.tintColorDark))
            }
        }
        
        struct Icon: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .scaleEffect(0.8, anchor: .center)
                    .frame(width: 20, height: 20, alignment: .center)
            }
        }
        
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let primaryActionLabel = PrimaryActionLabel()
        static let subtitle = Subtitle()
        static let footnote = Footnote()
        static let secondaryActionLabel = SecondaryActionLabel()
        static let icon = Icon()
    }
}

extension WelcomeScreen: View {
    public var body: some View {
        VStack {
            title
                .padding(.top, 80)
                .padding(.bottom, 40)
            descriptionText
                .padding(.bottom, 80)
            primaryActionLabel
                .buttonStyle(FioriButtonStyle())
                .padding(.bottom, 20)
            
            subtitle
            footnote
                .padding(.top, 8)
            
            secondaryActionLabel
                .padding(.top, 8)
            Spacer()
            icon
                .padding(.bottom, 32)
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
    }
}

struct WelcomeScreen_preview: PreviewProvider {
    static var previews: some View {
        WelcomeScreen(title: "SAP Project Companion for Managers", descriptionText: "Please follow the instructions you received in the welcome email to start the activation process.", primaryActionLabel: "Start", subtitle: "abc@def.com", footnote: "Want to explore?", secondaryActionLabel: "Try Demo", icon: Image("SAPLogo"))
    }
}
