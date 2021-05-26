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

        typealias TitleCumulative = EmptyModifier
        struct DescriptionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 17))
                    .foregroundColor(.preferredColor(.primary1))
                    .multilineTextAlignment(.center)
            }
        }

        typealias DescriptionTextCumulative = EmptyModifier
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
                    .frame(minWidth: 169.0, minHeight: 20.0)
            }
        }

        typealias ActionTextCumulative = EmptyModifier
        struct Footnote: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.primary1))
            }
        }

        typealias FootnoteCumulative = EmptyModifier
        struct SecondaryActionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.primary1))
            }
        }

        typealias SecondaryActionTextCumulative = EmptyModifier
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let textInputValue = TextInputValue()
        static let actionText = ActionText()
        static let footnote = Footnote()
        static let secondaryActionText = SecondaryActionText()
        static let titleCumulative = TitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let textInputValueCumulative = TextInputValueCumulative()
        static let actionTextCumulative = ActionTextCumulative()
        static let footnoteCumulative = FootnoteCumulative()
        static let secondaryActionTextCumulative = SecondaryActionTextCumulative()
    }
}

extension ActivationScreen: View {
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
                .buttonStyle(StatefulButtonStyle())
                .padding(.bottom, 16)
            
            footnote
                .padding(.bottom, 16)
            secondaryActionText
                .buttonStyle(StatefulButtonStyle())
            Spacer()
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
    }
}
