import SwiftUI

struct ComboView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let allIndexs = IndexSet(integersIn: 0 ..< self.model.numOfSeries())
        let lineIndexes = self.model.indexesOfColumnSeries.symmetricDifference(allIndexs).sorted()
        let columnIndexes = self.model.indexesOfColumnSeries.sorted()
        let categoryIndexRange = self.chartContext.displayCategoryIndexes(self.model, rect: rect)
        let categoryIndices = Array(categoryIndexRange)

        return ZStack {
            // column series view
            ForEach(0 ..< categoryIndices.count, id: \.self) { index in
                ColumnSeriesView(seriesIndices: columnIndexes, categoryIndex: categoryIndices[index])
            }.clipped()
            
            // line series view
            ForEach(0 ..< lineIndexes.count, id: \.self) { index in
                LineSeriesView(seriesIndex: lineIndexes[index], fill: false)
            }.opacity(self.model.selections != nil ? 0.25 : 1)
        }
        .frame(width: rect.size.width, height: rect.size.height)
    }
}

struct ComboView_Previews: PreviewProvider {
    static var previews: some View {
        ComboView()
            .environmentObject(Tests.comboModels[0])
            .environment(\.chartContext, ComboChartContext())
            .frame(width: 300, height: 200)
    }
}
