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
                    .font(.fiori(forTextStyle: .title1).weight(.bold))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
            }
        }

        typealias TitleCumulative = EmptyModifier
        struct DescriptionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
            }
        }

        typealias DescriptionTextCumulative = EmptyModifier

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
                    .frame(minWidth: 169.0, minHeight: 20.0)
            }
        }

        typealias ActionCumulative = EmptyModifier
        struct Footnote: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.primaryLabel))
            }
        }

        typealias FootnoteCumulative = EmptyModifier
        struct SecondaryAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.primaryLabel))
            }
        }

        typealias SecondaryActionCumulative = EmptyModifier
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let textInput = TextInput()
        static let action = Action()
        static let footnote = Footnote()
        static let secondaryAction = SecondaryAction()
        static let titleCumulative = TitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let textInputCumulative = TextInputCumulative()
        static let actionCumulative = ActionCumulative()
        static let footnoteCumulative = FootnoteCumulative()
        static let secondaryActionCumulative = SecondaryActionCumulative()
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

            textInput
                .padding(.bottom, 30)
            
            action
                .buttonStyle(StatefulButtonStyle())
                .padding(.bottom, 16)
            
            footnote
                .padding(.bottom, 16)
            secondaryAction
                .buttonStyle(StatefulButtonStyle())
            Spacer()
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
    }
}

@available(iOS 14.0, *)
struct ActivationScreenLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(ActivationScreen(title: "Activation", descriptionText: "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding. ", footnote: "Or", action: _Action(actionText: "Next"), secondaryAction: _Action(actionText: "Scan")),
                    category: .control)
    }
}
