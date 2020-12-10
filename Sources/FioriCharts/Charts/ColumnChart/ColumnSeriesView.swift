import SwiftUI

struct ColumnSeriesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    @State private var animateScale: CGFloat = 1
    
    let seriesIndices: [Int]
    let categoryIndex: Int
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let width = rect.size.width
        let mirror = self.layoutDirection == .rightToLeft ? CGAffineTransform(a: -1, b: 0, c: 0, d: 1, tx: width, ty: 0) : CGAffineTransform.identity
        
        let translateX: CGFloat
        let startPosition = self.chartContext.startPosition(self.model, plotViewSize: rect.size)
        let scaleX = self.chartContext.scaleX(self.model, plotViewSize: rect.size)
        let scaleY = self.chartContext.scaleY(self.model, plotViewSize: rect.size)
        
        if self.layoutDirection == .rightToLeft {
            translateX = -(1 - 1 / scaleX - startPosition.x) * scaleX * width
        } else {
            translateX = -startPosition.x * scaleX * width
        }
        let translateY = -startPosition.y * scaleY * rect.size.height
        
        return ZStack {
            ForEach(0 ..< seriesIndices.count, id: \.self) { index in
                ColumnChartCategoryShape(chartType: self.model.chartType,
                                         plotBaselinePosition: self.model.numericAxisTickValues.plotBaselinePosition,
                                         path: self.model.path,
                                         seriesIndex: seriesIndices[index],
                                         categoryIndex: self.categoryIndex,
                                         animateScale: self.animateScale)
                    .transform(mirror) // apply layoutDirection
                    .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                    .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                    .fill(self.model.columnColor(seriesIndex: seriesIndices[index], categoryIndex: self.categoryIndex))
            }
        }
    }
}
