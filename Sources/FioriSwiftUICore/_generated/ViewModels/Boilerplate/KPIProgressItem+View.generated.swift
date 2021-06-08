// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/KPIProgressItem+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement KPIProgressItem `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum KPIProgressItem {
        typealias Kpi = EmptyModifier
        typealias KpiCumulative = EmptyModifier
		typealias Subtitle = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
		typealias Footnote = EmptyModifier
        typealias FootnoteCumulative = EmptyModifier

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
		static let footnote = Footnote()
        static let kpiCumulative = KpiCumulative()
		static let subtitleCumulative = SubtitleCumulative()
		static let footnoteCumulative = FootnoteCumulative()
    }
}

// FIXME: - Implement KPIProgressItem View body

@available(iOS 14, *)
extension KPIProgressItem: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement KPIProgressItem specific LibraryContentProvider

@available(iOS 14.0, *)
struct KPIProgressItemLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(KPIProgressItem(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
