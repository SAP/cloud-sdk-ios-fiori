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
        
        struct TextInputValue: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.primary1))
                    .multilineTextAlignment(.center)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
            }
        }

        typealias TextInputValueCumulative = EmptyModifier
        
        struct ActionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .buttonStyle(StatefulButtonStyle())
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
        
        struct SecondaryActionText: ViewModifier {
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

        typealias TitleCumulative = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
        typealias ActionTextCumulative = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
        typealias FootnoteCumulative = EmptyModifier
        typealias SecondaryActionTextCumulative = EmptyModifier
        typealias IconCumulative = EmptyModifier
        
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let textInputValue = TextInputValue()
        static let actionText = ActionText()
        static let subtitle = Subtitle()
        static let footnote = Footnote()
        static let secondaryActionText = SecondaryActionText()
        static let icon = Icon()
        static let titleCumulative = TitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let textInputValueCumulative = TextInputValueCumulative()
        static let actionTextCumulative = ActionTextCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let footnoteCumulative = FootnoteCumulative()
        static let secondaryActionTextCumulative = SecondaryActionTextCumulative()
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
            
            textInputValue
                .padding(.bottom, 30)
            
            actionText
                .padding(.bottom, 24)
            
            subtitle
            footnote
                .padding(.top, 8)
            
            secondaryActionText
                .padding(.top, 8)
            Spacer()
            icon
                .padding(.bottom, 60)
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
    }
}
