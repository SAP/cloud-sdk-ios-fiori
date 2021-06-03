// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/ChartFloorplan+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement ChartFloorplan `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum ChartFloorplan {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
		typealias Subtitle = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
		typealias Status = EmptyModifier
        typealias StatusCumulative = EmptyModifier
		typealias ValueAxisTitle = EmptyModifier
        typealias ValueAxisTitleCumulative = EmptyModifier
		typealias SeriesTitles = EmptyModifier
        typealias SeriesTitlesCumulative = EmptyModifier
		typealias CategoryAxisTitle = EmptyModifier
        typealias CategoryAxisTitleCumulative = EmptyModifier

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
		static let subtitle = Subtitle()
		static let status = Status()
		static let valueAxisTitle = ValueAxisTitle()
		static let seriesTitles = SeriesTitles()
		static let categoryAxisTitle = CategoryAxisTitle()
        static let titleCumulative = TitleCumulative()
		static let subtitleCumulative = SubtitleCumulative()
		static let statusCumulative = StatusCumulative()
		static let valueAxisTitleCumulative = ValueAxisTitleCumulative()
		static let seriesTitlesCumulative = SeriesTitlesCumulative()
		static let categoryAxisTitleCumulative = CategoryAxisTitleCumulative()
    }
}

// FIXME: - Implement ChartFloorplan View body

extension ChartFloorplan: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement ChartFloorplan specific LibraryContentProvider

@available(iOS 14.0, *)
struct ChartFloorplanLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(ChartFloorplan(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
