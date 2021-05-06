import SwiftUI

// TODO: - Implement Fiori style definitions

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

// TODO: - Implement ChartFloorplan View body

extension ChartFloorplan: View {
    public var body: some View {
        EmptyView()
    }
}
