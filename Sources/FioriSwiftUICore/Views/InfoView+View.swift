/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum InfoView {
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
        
        struct ProgressIndicator: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 17))
                    .foregroundColor(.preferredColor(.primary1))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct Action: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
            }
        }
        
        struct SecondaryAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.tintColorDark))
            }
        }
        
        typealias ProgressIndicatorStyle = EmptyModifier
        typealias ProgressIndicatorStyleCumulative = EmptyModifier
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let progressIndicator = ProgressIndicator()
        static let action = Action()
        static let secondaryAction = SecondaryAction()
        static let progressIndicatorStyle = ProgressIndicatorStyle()
     
        typealias TitleCumulative = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
        typealias ProgressIndicatorCumulative = EmptyModifier
        typealias ActionCumulative = EmptyModifier
        typealias SecondaryActionCumulative = EmptyModifier

        static let titleCumulative = TitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let progressIndicatorCumulative = ProgressIndicatorCumulative()
        static let progressIndicatorStyleCumulative = ProgressIndicatorStyleCumulative()
        static let actionCumulative = ActionCumulative()
        static let secondaryActionCumulative = SecondaryActionCumulative()
    }
}

extension InfoView: View {
    public var body: some View {
        VStack {
            title
                .padding(.top, 80)
                .padding(.bottom, 40)
            descriptionText
            Spacer()
            progressIndicator
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
        LibraryItem(InfoView(title: "SAP BTP SDK for iOS", descriptionText: "SAP BTP SDK for iOS enables you to quickly develop your own native apps, with Swift. The SDK extends the standard Swift Apple iOS frameworks with the reusable UI components from the SAP Fiori for iOS Design Language, and provides APIs which seamlessly integrate apps with SAP BTP services.", action: Action(actionText: "Primary Button"), secondaryAction: SecondaryAction(secondaryActionText: "Secondary Button")))
    }
}
