// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/SectionHeader+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement SectionHeader `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum SectionHeader {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
		typealias Attribute = EmptyModifier
        typealias AttributeCumulative = EmptyModifier

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
		static let attribute = Attribute()
        static let titleCumulative = TitleCumulative()
		static let attributeCumulative = AttributeCumulative()
    }
}

// FIXME: - Implement SectionHeader View body

extension SectionHeader: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement SectionHeader specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct SectionHeaderLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(SectionHeader(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
