// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/_KPIItem+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement _KPIItem `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum _KPIItem {
        typealias Kpi = EmptyModifier
        typealias KpiCumulative = EmptyModifier
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
        static let kpi = Kpi()
		static let subtitle = Subtitle()
        static let kpiCumulative = KpiCumulative()
		static let subtitleCumulative = SubtitleCumulative()
    }
}

// FIXME: - Implement _KPIItem View body

extension _KPIItem: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement _KPIItem specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct _KPIItemLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(_KPIItem(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
