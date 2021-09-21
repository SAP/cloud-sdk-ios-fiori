// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/ActivityItem+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement ActivityItem `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum ActivityItem {
        typealias Icon = EmptyModifier
        typealias IconCumulative = EmptyModifier
		typealias Subtitle = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier

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
        static let icon = Icon()
		static let subtitle = Subtitle()
        static let iconCumulative = IconCumulative()
		static let subtitleCumulative = SubtitleCumulative()
    }
}

// FIXME: - Implement ActivityItem View body

extension ActivityItem: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement ActivityItem specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct ActivityItemLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(ActivityItem(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
