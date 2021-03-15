// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/CollectionItem+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement CollectionItem `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum CollectionItem {
        typealias DetailImage = EmptyModifier
		typealias Title = EmptyModifier
		typealias Subtitle = EmptyModifier

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
        static let detailImage = DetailImage()
		static let title = Title()
		static let subtitle = Subtitle()
    }
}

// FIXME: - Implement CollectionItem View body

extension CollectionItem: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement CollectionItem specific LibraryContentProvider

@available(iOS 14.0, *)
struct CollectionItemLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(CollectionItem(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
