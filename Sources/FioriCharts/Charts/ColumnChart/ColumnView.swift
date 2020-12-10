import SwiftUI

struct ColumnView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    @State private var animateScale: CGFloat = 1
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let seriesCount = self.model.numOfSeries()
        let categoryIndexRange = self.chartContext.displayCategoryIndexes(self.model, rect: rect)
        let categoryIndices = Array(categoryIndexRange)
        
        return ZStack {
            ForEach(0 ..< categoryIndices.count, id: \.self) { index in
                ColumnSeriesView(seriesIndices: Array(0 ..< seriesCount), categoryIndex: categoryIndices[index])
            }
        }
        .frame(width: rect.size.width, height: rect.size.height)
        .clipped()
    }
}

// swiftlint:disable force_cast
struct ColumnView_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
            let model = $0.copy() as! ChartModel
            model.chartType = .column
            return model
        }
        
        return Group {
            ForEach(models) {
                ColumnView()
                    .environmentObject($0)
                    .environment(\.chartContext, ColumnChartContext())
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
