/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

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
        
        struct PrimaryButton: ViewModifier {
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
        
        struct ActionTitle: ViewModifier {
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

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
             // replace `typealias Subtitle = EmptyModifier` with:

             struct Subtitle: ViewModifier {
                 func body(content: Content) -> some View {
                     content
                         .font(.body)
                         .foregroundColor(.preferredColor(.primary3))
                 }
             }
         */
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let primaryButton = PrimaryButton()
        static let subtitle = Subtitle()
        static let footnote = Footnote()
        static let actionTitle = ActionTitle()
        static let icon = Icon()
    }
}

// FIXME: - Implement WelcomeScreen View body

extension WelcomeScreen: View {
    public var body: some View {
        VStack {
            title
                .padding(.top, 80)
                .padding(.bottom, 40)
            descriptionText
                .padding(.bottom, 80)
            primaryButton
                .buttonStyle(FioriButtonStyle())
                .padding(.bottom, 20)
            
            subtitle
            footnote
                .padding(.top, 8)
            actionTitle
            
            Spacer()
            icon
                .padding(.bottom, 32)
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
//        .onPreferenceChange(ConfigOptionKey.self) { config in
//
//
//        }
    }
}

// struct ConfigOptionKey: PreferenceKey {
//    static var defaultValue: String = OnboardingState.isConfigured
//
//    static
//    func reduce(value: inout String, nextValue: () -> String) {
//        value = nextValue()
//    }
// }

struct WelcomeScreen_preview: PreviewProvider {
    func onStart(_: String) {
        print("test")
    }

    static var previews: some View {
        WelcomeScreen(title: "SAP Project Companion for Managers", descriptionText: "Please follow the instructions you received in the welcome email to start the activation process.", primaryButton: "Start", subtitle: "abc@def.com", footnote: "Want to explore?", actionTitle: "Try Demo", icon: Image("SAPLogo"))
    }
}

struct ActivationView: View {
    public var body: some View {
        VStack {
            Text("Activation View")
        }
    }
}
        
struct LoginView: View {
    public var body: some View {
        VStack {
            Text("Login View")
        }
    }
}
