// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/_ContactItem+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement _ContactItem `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum _ContactItem {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
		typealias Subtitle = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
		typealias DescriptionText = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
		typealias DetailImage = EmptyModifier
        typealias DetailImageCumulative = EmptyModifier
		typealias ActionItems = EmptyModifier
        typealias ActionItemsCumulative = EmptyModifier

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
		static let subtitle = Subtitle()
		static let descriptionText = DescriptionText()
		static let detailImage = DetailImage()
		static let actionItems = ActionItems()
        static let titleCumulative = TitleCumulative()
		static let subtitleCumulative = SubtitleCumulative()
		static let descriptionTextCumulative = DescriptionTextCumulative()
		static let detailImageCumulative = DetailImageCumulative()
		static let actionItemsCumulative = ActionItemsCumulative()
    }
}

// FIXME: - Implement _ContactItem View body

extension _ContactItem: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement _ContactItem specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct _ContactItemLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(_ContactItem(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
