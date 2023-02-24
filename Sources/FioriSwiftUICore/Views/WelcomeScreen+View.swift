/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import FioriThemeManager
import SwiftUI

extension Fiori {
    enum WelcomeScreen {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .title1).weight(.black))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct DescriptionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct TextInput: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
            }
        }

        typealias TextInputCumulative = EmptyModifier
        
        struct Action: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .buttonStyle(StatefulButtonStyle())
            }
        }
        
        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.primaryLabel))
            }
        }
        
        struct Footnote: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .subheadline))
                    .foregroundColor(.preferredColor(.primaryLabel))
            }
        }
        
        struct SecondaryAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body).weight(.bold))
                    .foregroundColor(.preferredColor(.tintColor))
            }
        }
        
        struct Icon: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .scaleEffect(0.8, anchor: .center)
                    .frame(width: 20, height: 20, alignment: .center)
            }
        }

        typealias TitleCumulative = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
        typealias ActionCumulative = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
        typealias FootnoteCumulative = EmptyModifier
        typealias SecondaryActionCumulative = EmptyModifier
        typealias IconCumulative = EmptyModifier
        
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let textInput = TextInput()
        static let action = Action()
        static let subtitle = Subtitle()
        static let footnote = Footnote()
        static let secondaryAction = SecondaryAction()
        static let icon = Icon()
        static let titleCumulative = TitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()

        static let textInputCumulative = TextInputCumulative()
        static let actionCumulative = ActionCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let footnoteCumulative = FootnoteCumulative()
        static let secondaryActionCumulative = SecondaryActionCumulative()
        static let iconCumulative = IconCumulative()
    }
}

extension WelcomeScreen: View {
    public var body: some View {
        VStack {
            title
                .padding(.top, 80)
                .padding(.bottom, 40)
            descriptionText
                .padding(.bottom, 56)
            
            textInput

                .padding(.bottom, 30)
            
            action
                .padding(.bottom, 24)
            
            subtitle
            footnote
                .padding(.top, 8)
            
            secondaryAction
                .padding(.top, 8)
            Spacer()
            icon
                .padding(.bottom, 60)
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
    }
}
