// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/SortFilterView+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement SortFilterView `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum SortFilterView {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
		typealias Items = EmptyModifier
        typealias ItemsCumulative = EmptyModifier
		typealias CancelAction = EmptyModifier
        typealias CancelActionCumulative = EmptyModifier
		typealias ResetAction = EmptyModifier
        typealias ResetActionCumulative = EmptyModifier
		typealias ApplyAction = EmptyModifier
        typealias ApplyActionCumulative = EmptyModifier

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
		static let items = Items()
		static let cancelAction = CancelAction()
		static let resetAction = ResetAction()
		static let applyAction = ApplyAction()
        static let titleCumulative = TitleCumulative()
		static let itemsCumulative = ItemsCumulative()
		static let cancelActionCumulative = CancelActionCumulative()
		static let resetActionCumulative = ResetActionCumulative()
		static let applyActionCumulative = ApplyActionCumulative()
    }
}

// FIXME: - Implement SortFilterView View body

extension SortFilterView: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement SortFilterView specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct SortFilterViewLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(SortFilterView(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
