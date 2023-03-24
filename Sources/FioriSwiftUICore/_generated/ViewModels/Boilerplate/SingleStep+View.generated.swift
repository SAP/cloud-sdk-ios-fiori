// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/SingleStep+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement SingleStep `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum SingleStep {
        typealias Name = EmptyModifier
        typealias NameCumulative = EmptyModifier
		typealias Node = EmptyModifier
        typealias NodeCumulative = EmptyModifier

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
        static let name = Name()
		static let node = Node()
        static let nameCumulative = NameCumulative()
		static let nodeCumulative = NodeCumulative()
    }
}

// FIXME: - Implement SingleStep View body

extension SingleStep: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement SingleStep specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct SingleStepLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(SingleStep(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
