/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

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
        
        struct ActionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .frame(width: 169.0, height: 20.0)
            }
        }
        
        struct SecondaryActionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.tintColorDark))
            }
        }
        
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let actionText = ActionText()
        static let secondaryActionText = SecondaryActionText()
        
        typealias TitleCumulative = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
        typealias ActionTextCumulative = EmptyModifier
        typealias SecondaryActionTextCumulative = EmptyModifier

        static let titleCumulative = TitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let actionTextCumulative = ActionTextCumulative()
        static let secondaryActionTextCumulative = SecondaryActionTextCumulative()
    }
}

// FIXME: - Implement InfoView View body

extension InfoView: View {
    public var body: some View {
        VStack {
            title
                .padding(.top, 80)
                .padding(.bottom, 40)
            descriptionText
//                .padding(.bottom, 80)
            Spacer()
            if #available(iOS 14.0, *) {
                ProgressView()
                    .frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
            } else {
                // Fallback on earlier versions
            }
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

// FIXME: - Implement InfoView specific LibraryContentProvider

@available(iOS 14.0, *)
struct InfoViewLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(InfoView(title: "SAP BTP SDK for iOS", descriptionText: "SAP BTP SDK for iOS enables you to quickly develop your own native apps, with Swift. The SDK extends the standard Swift Apple iOS frameworks with the reusable UI components from the SAP Fiori for iOS Design Language, and provides APIs which seamlessly integrate apps with SAP BTP services.", actionText: "Primary Button", secondaryActionText: "Secondary Button"))
    }
}
