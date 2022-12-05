// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/SearchableList+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement SearchableList `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum SearchableList {
        typealias CancelAction = EmptyModifier
        typealias CancelActionCumulative = EmptyModifier
		typealias DoneAction = EmptyModifier
        typealias DoneActionCumulative = EmptyModifier

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
        static let cancelAction = CancelAction()
		static let doneAction = DoneAction()
        static let cancelActionCumulative = CancelActionCumulative()
		static let doneActionCumulative = DoneActionCumulative()
    }
}

// FIXME: - Implement SearchableList View body

@available(iOS 15.0, macOS 12.0, *)
extension SearchableList: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement SearchableList specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct SearchableListLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(SearchableList(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
