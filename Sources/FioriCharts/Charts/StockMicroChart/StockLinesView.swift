import SwiftUI

struct StockLinesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let width = rect.size.width
        // calculate CGAffineTransform for layoutDirection
        let mirror = self.layoutDirection == .rightToLeft ? CGAffineTransform(a: -1, b: 0, c: 0, d: 1, tx: width, ty: 0) : CGAffineTransform.identity

        let startPosition = self.chartContext.startPosition(self.model, plotViewSize: rect.size)
        let scaleX = self.chartContext.scaleX(self.model, plotViewSize: rect.size)
        let scaleY = self.chartContext.scaleY(self.model, plotViewSize: rect.size)
        let categoryIndexRange = self.chartContext.displayCategoryIndexes(self.model, rect: rect)

        // calculate CGAffineTransform for layoutDirection
        let translateX: CGFloat
        if self.layoutDirection == .rightToLeft {
            translateX = -(1 - 1 / scaleX - startPosition.x) * scaleX * width
        } else {
            translateX = -startPosition.x * scaleX * width
        }
        let translateY = -startPosition.y * scaleY * rect.size.height

        let seriesIndex = self.model.currentSeriesIndex
        var isPriceGoingUp = true
        if let startPrice = ChartUtility.dimensionValue(model, categoryIndex: 0), let endPrice = ChartUtility.dimensionValue(model, categoryIndex: ChartUtility.lastValidDimIndex(model)) {
            if startPrice > endPrice {
                isPriceGoingUp = false
            }
        }
        
        let strokeColor = isPriceGoingUp ? self.model.seriesAttributes[seriesIndex].palette.colors[0] : self.model.seriesAttributes[seriesIndex].palette.colors[1]
        let fillColor = LinearGradient(gradient: Gradient(colors: [strokeColor.opacity(0.4), strokeColor.opacity(0.0)]),
                                       startPoint: .top,
                                       endPoint: .bottom)
        
        return ZStack {
            LineChartSeriesFillShape(path: model.path, seriesIndex: seriesIndex, startIndex: min(categoryIndexRange.lowerBound + 1, categoryIndexRange.upperBound), endIndex: categoryIndexRange.upperBound)
                .transform(mirror) // apply layoutDirection
                .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                .fill(fillColor)
                .frame(width: rect.size.width, height: rect.size.height)
                .clipped()
            
            LineChartSeriesLineShape(path: model.path, seriesIndex: seriesIndex, startIndex: min(categoryIndexRange.lowerBound + 1, categoryIndexRange.upperBound), endIndex: categoryIndexRange.upperBound)
                .transform(mirror) // apply layoutDirection
                .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                .stroke(strokeColor,
                        lineWidth: self.model.seriesAttributes[seriesIndex].lineWidth)
                .frame(width: rect.size.width, height: rect.size.height)
                .clipped()
            
            if !self.model.seriesAttributes[seriesIndex].point.isHidden {
                PointsShape(model: self.model,
                            chartContext: self.chartContext,
                            seriesIndex: seriesIndex,
                            categoryIndexRange: categoryIndexRange,
                            layoutDirection: layoutDirection)
                    .fill(self.model.seriesAttributes[seriesIndex].point.strokeColor)
                    .frame(width: rect.size.width, height: rect.size.height)
                    .clipShape(Rectangle()
                        .size(width: width + self.pointRadius(at: seriesIndex) * 2 + 5, height: rect.size.height + self.pointRadius(at: seriesIndex) * 2 + 5)
                        .offset(x: -1 * self.pointRadius(at: seriesIndex), y: -1 * self.pointRadius(at: seriesIndex)))
            }
        }
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = self.model.seriesAttributes[index].point
        
        return pointAttr.isHidden ? 0 : CGFloat(pointAttr.diameter / 2)
    }
}

struct StockLinesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.stockModels) {
                StockLinesView()
                    .environmentObject($0)
            }
            .frame(width: 300, height: 200)
            .previewLayout(.sizeThatFits)
        }
    }
}
