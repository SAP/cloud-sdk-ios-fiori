// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/SortFilterFullCFG+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement SortFilterFullCFG `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum SortFilterFullCFG {
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
        static let items = Items()
		static let cancelAction = CancelAction()
		static let resetAction = ResetAction()
		static let applyAction = ApplyAction()
        static let itemsCumulative = ItemsCumulative()
		static let cancelActionCumulative = CancelActionCumulative()
		static let resetActionCumulative = ResetActionCumulative()
		static let applyActionCumulative = ApplyActionCumulative()
    }
}

// FIXME: - Implement SortFilterFullCFG View body

extension SortFilterFullCFG: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement SortFilterFullCFG specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct SortFilterFullCFGLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(SortFilterFullCFG(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
