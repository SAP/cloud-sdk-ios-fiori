import SwiftUI

struct ColumnSeriesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.chartSeriesShapeStyle) var chartSeriesShapeStyle
    @Environment(\.chartCategoryShapeStyle) var chartCategoryShapeStyle
    @Environment(\.layoutDirection) var layoutDirection
    @State private var animateScale: CGFloat = 1
    
    let seriesIndices: [Int]
    let categoryIndex: Int
    
    var body: some View {
        ZStack {
            ForEach(0 ..< self.seriesIndices.count, id: \.self) { index in
                ColumnCategoryView(seriesIndex: self.seriesIndices[index], categoryIndex: self.categoryIndex)
            }
        }
    }
}
