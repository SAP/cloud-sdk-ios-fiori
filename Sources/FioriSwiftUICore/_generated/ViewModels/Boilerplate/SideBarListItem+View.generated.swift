// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/SideBarListItem+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement SideBarListItem `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum SideBarListItem {
        typealias Icon = EmptyModifier
        typealias IconCumulative = EmptyModifier
		typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
		typealias Subtitle = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
		typealias AccessoryIcon = EmptyModifier
        typealias AccessoryIconCumulative = EmptyModifier

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
		static let title = Title()
		static let subtitle = Subtitle()
		static let accessoryIcon = AccessoryIcon()
        static let iconCumulative = IconCumulative()
		static let titleCumulative = TitleCumulative()
		static let subtitleCumulative = SubtitleCumulative()
		static let accessoryIconCumulative = AccessoryIconCumulative()
    }
}

// FIXME: - Implement SideBarListItem View body

extension SideBarListItem: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement SideBarListItem specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct SideBarListItemLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(SideBarListItem(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
