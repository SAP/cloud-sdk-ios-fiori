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
        
        struct ProgressIndicatorText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 17))
                    .foregroundColor(.preferredColor(.primary1))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct ActionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
            }
        }
        
        struct SecondaryActionText: ViewModifier {
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
        static let progressIndicatorText = ProgressIndicatorText()
        static let actionText = ActionText()
        static let secondaryActionText = SecondaryActionText()
        static let progressIndicatorStyle = ProgressIndicatorStyle()
     
        typealias TitleCumulative = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
        typealias ProgressIndicatorTextCumulative = EmptyModifier
        typealias ActionTextCumulative = EmptyModifier
        typealias SecondaryActionTextCumulative = EmptyModifier

        static let titleCumulative = TitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let progressIndicatorTextCumulative = ProgressIndicatorTextCumulative()
        static let progressIndicatorStyleCumulative = ProgressIndicatorStyleCumulative()
        static let actionTextCumulative = ActionTextCumulative()
        static let secondaryActionTextCumulative = SecondaryActionTextCumulative()
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
            progressIndicatorText
            Spacer()
            actionText
                .padding(.bottom, 20)
            secondaryActionText
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
        LibraryItem(InfoView(title: "SAP BTP SDK for iOS", descriptionText: "SAP BTP SDK for iOS enables you to quickly develop your own native apps, with Swift. The SDK extends the standard Swift Apple iOS frameworks with the reusable UI components from the SAP Fiori for iOS Design Language, and provides APIs which seamlessly integrate apps with SAP BTP services.", actionText: "Primary Button", secondaryActionText: "Secondary Button", didSelectAction: nil, didSelectSecondaryAction: nil))
    }
}
