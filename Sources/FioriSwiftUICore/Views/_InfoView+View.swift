/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum _InfoView {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .title1).weight(.bold))
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
        
        struct Action: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body).weight(.semibold))
            }
        }
        
        struct SecondaryAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .body).weight(.semibold))
                    .foregroundColor(.preferredColor(.tintColor))
            }
        }

        typealias TitleCumulative = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
        typealias LoadingIndicatorText = EmptyModifier
        typealias LoadingIndicatorTextCumulative = EmptyModifier
        typealias ActionCumulative = EmptyModifier
        typealias SecondaryActionCumulative = EmptyModifier
        
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let loadingIndicatorText = LoadingIndicatorText()
        static let action = Action()
        static let secondaryAction = SecondaryAction()
        static let titleCumulative = TitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let loadingIndicatorTextCumulative = LoadingIndicatorTextCumulative()
        static let actionCumulative = ActionCumulative()
        static let secondaryActionCumulative = SecondaryActionCumulative()
    }
}

extension _InfoView: View {
    public var body: some View {
        @State var isPresented: Bool = _showLoadingIndicator ?? false
        return VStack {
            title
                .padding(.top, 80)
                .padding(.bottom, 40)
            descriptionText
            Spacer()
            LoadingIndicator(title: AttributedString(_loadingIndicatorText ?? ""), isPresented: $isPresented)
            Spacer()
            action
                .padding(.bottom, 20)
            secondaryAction
                .padding(.top, 8)
                .padding(.bottom, 40)
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
    }
}

@available(iOS 14.0, *)
struct InfoViewLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(_InfoView(title: "SAP BTP SDK for iOS", descriptionText: "SAP BTP SDK for iOS enables you to quickly develop your own native apps, with Swift. The SDK extends the standard Swift Apple iOS frameworks with the reusable UI components from the SAP Fiori for iOS Design Language, and provides APIs which seamlessly integrate apps with SAP BTP services.", showLoadingIndicator: false, loadingIndicatorText: "", action: _Action(actionText: "Primary Button"), secondaryAction: _Action(actionText: "Secondary Button")))
    }
}
