import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum ChartFloorplan {
        typealias Title = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias Status = EmptyModifier
        typealias ValueAxisTitle = EmptyModifier
        typealias SeriesTitles = EmptyModifier
        typealias CategoryAxisTitle = EmptyModifier

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
    }
}

// TODO: - Implement ChartFloorplan View body

extension ChartFloorplan: View {
    public var body: some View {
        EmptyView()
    }
}
