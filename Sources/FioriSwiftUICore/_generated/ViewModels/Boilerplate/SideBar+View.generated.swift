// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/SideBar+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement SideBar `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum SideBar {
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
        static let subtitle = Subtitle()
        static let subtitleCumulative = SubtitleCumulative()
    }
}

// FIXME: - Implement SideBar View body

@available(iOS 14, *)
extension SideBar: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement SideBar specific LibraryContentProvider

@available(iOS 14.0, *)
struct SideBarLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(SideBar(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
