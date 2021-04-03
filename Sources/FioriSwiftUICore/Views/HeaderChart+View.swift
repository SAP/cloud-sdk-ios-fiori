import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum HeaderChart {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
        typealias Trend = EmptyModifier
        typealias TrendCumulative = EmptyModifier
        typealias Kpi = EmptyModifier
        typealias KpiCumulative = EmptyModifier

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
        static let trend = Trend()
        static let kpi = Kpi()
        static let titleCumulative = TitleCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let trendCumulative = TrendCumulative()
        static let kpiCumulative = KpiCumulative()
    }
}

// TODO: - Implement HeaderChart View body

extension HeaderChart: View {
    public var body: some View {
        VStack {
            title
            subtitle
            trend
            kpi
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    }
}
