// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/_EmptyStateView+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement _EmptyStateView `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum _EmptyStateView {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
		typealias DescriptionText = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
		typealias DetailImage = EmptyModifier
        typealias DetailImageCumulative = EmptyModifier
		typealias Action = EmptyModifier
        typealias ActionCumulative = EmptyModifier

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
		static let descriptionText = DescriptionText()
		static let detailImage = DetailImage()
		static let action = Action()
        static let titleCumulative = TitleCumulative()
		static let descriptionTextCumulative = DescriptionTextCumulative()
		static let detailImageCumulative = DetailImageCumulative()
		static let actionCumulative = ActionCumulative()
    }
}

// FIXME: - Implement _EmptyStateView View body

extension _EmptyStateView: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement _EmptyStateView specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct _EmptyStateViewLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(_EmptyStateView(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
