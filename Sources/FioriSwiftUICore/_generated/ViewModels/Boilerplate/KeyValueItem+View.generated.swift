// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/KeyValueItem+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement KeyValueItem `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum KeyValueItem {
        typealias Key = EmptyModifier
        typealias KeyCumulative = EmptyModifier
		typealias Value = EmptyModifier
        typealias ValueCumulative = EmptyModifier

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
        static let key = Key()
		static let value = Value()
        static let keyCumulative = KeyCumulative()
		static let valueCumulative = ValueCumulative()
    }
}

// FIXME: - Implement KeyValueItem View body

extension KeyValueItem: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement KeyValueItem specific LibraryContentProvider

@available(iOS 14.0, *)
struct KeyValueItemLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(KeyValueItem(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
