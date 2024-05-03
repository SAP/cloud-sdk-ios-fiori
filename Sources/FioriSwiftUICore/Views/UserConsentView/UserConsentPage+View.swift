/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum UserConsentPage {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .title1).weight(.bold))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct BodyAttributedText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct Action: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .subheadline))
            }
        }
        
        typealias TitleCumulative = EmptyModifier
        typealias BodyAttributedTextCumulative = EmptyModifier
        typealias ActionCumulative = EmptyModifier
        
        static let title = Title()
        static let bodyAttributedText = BodyAttributedText()
        static let action = Action()
        static let titleCumulative = TitleCumulative()
        static let bodyAttributedTextCumulative = BodyAttributedTextCumulative()
        static let actionCumulative = ActionCumulative()
    }
}

extension UserConsentPage: View {
    public var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                title
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                
                bodyAttributedText

                action
                    .padding(.top, 30)
                    .foregroundColor(.preferredColor(.tintColor))
            }
        }
        .padding(.top, 2)
        .padding(.leading, 32)
        .padding(.trailing, 32)
        .navigationBarBackButtonHidden(true)
    }
}

@available(iOS 14.0, *)
struct UserConsentPageLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(UserConsentPage(title: "Data Privacy", bodyAttributedText: NSAttributedString(string: "Detailed text about how data privacy pertains to this app and why it is important for the user to enable this functionality."), action: _Action(actionText: "Learn more about Data Privacy")),
                    category: .control)
    }
}
