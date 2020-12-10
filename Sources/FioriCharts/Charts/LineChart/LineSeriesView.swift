import SwiftUI

struct LineSeriesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    let seriesIndex: Int
    /// true is for Area Chart, false is for Line Chart
    let fill: Bool
    
    init(seriesIndex: Int, fill: Bool = false) {
        self.seriesIndex = seriesIndex
        self.fill = fill
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        // calculate CGAffineTransform for layoutDirection
        let mirror = self.layoutDirection == .rightToLeft ? CGAffineTransform(a: -1, b: 0, c: 0, d: 1, tx: rect.size.width, ty: 0) : CGAffineTransform.identity
        
        let translateX: CGFloat
        let startPosition = self.chartContext.startPosition(self.model, plotViewSize: rect.size)
        let scaleX = self.chartContext.scaleX(self.model, plotViewSize: rect.size)
        let scaleY = self.chartContext.scaleY(self.model, plotViewSize: rect.size)
        
        let categoryIndexRange = self.chartContext.displayCategoryIndexes(self.model, rect: rect)
        
        let maxDataCount = self.model.numOfCategories()
        let startCategoryIndex, endCategoryIndex: Int
        if self.model.chartType == .combo {
            startCategoryIndex = categoryIndexRange.lowerBound
            endCategoryIndex = min(categoryIndexRange.upperBound + 1, maxDataCount - 1)
        } else {
            startCategoryIndex = min(categoryIndexRange.lowerBound + 1, categoryIndexRange.upperBound)
            endCategoryIndex = categoryIndexRange.upperBound
        }
        
        // calculate CGAffineTransform for layoutDirection
        if self.layoutDirection == .rightToLeft {
            translateX = -(1 - 1 / scaleX - startPosition.x) * scaleX * rect.size.width
        } else {
            translateX = -startPosition.x * scaleX * rect.size.width
        }
        let translateY = -startPosition.y * scaleY * rect.size.height
        
        let lineStrokeColor, lineFillColor: Color
        let lineFillGradient: LinearGradient
        if self.model.chartType == .stock {
            var isPriceGoingUp = true
            if let startPrice = ChartUtility.dimensionValue(model, seriesIndex: self.seriesIndex, categoryIndex: 0), let endPrice = ChartUtility.dimensionValue(model, seriesIndex: self.seriesIndex, categoryIndex: ChartUtility.lastValidDimIndex(model)) {
                if startPrice > endPrice {
                    isPriceGoingUp = false
                }
            }
            
            lineStrokeColor = isPriceGoingUp ? self.model.seriesAttributes[self.seriesIndex].palette.colors[0] : self.model.seriesAttributes[self.seriesIndex].palette.colors[1]
            lineFillGradient = LinearGradient(gradient: Gradient(colors: [lineStrokeColor.opacity(0.4), lineStrokeColor.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
        } else {
            lineFillColor = self.model.seriesAttributes[self.seriesIndex].palette.fillColor
            lineStrokeColor = self.model.seriesAttributes[self.seriesIndex].palette.colors[0]
            lineFillGradient = LinearGradient(gradient: Gradient(colors: [lineFillColor.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
        }
        
        return ZStack {
            if self.fill {
                LineChartSeriesFillShape(path: self.model.path, seriesIndex: self.seriesIndex, startIndex: startCategoryIndex, endIndex: endCategoryIndex)
                    .transform(mirror) // apply layoutDirection
                    .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                    .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                    .fill(lineFillGradient)
                    .frame(width: rect.size.width, height: rect.size.height)
                    .clipped()
            }
            
            LineChartSeriesLineShape(path: self.model.path, seriesIndex: self.seriesIndex, startIndex: startCategoryIndex, endIndex: endCategoryIndex)
                .transform(mirror) // apply layoutDirection
                .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                .stroke(lineStrokeColor,
                        lineWidth: self.model.seriesAttributes[self.seriesIndex].lineWidth)
                .frame(width: rect.size.width, height: rect.size.height)
                .clipped()
            
            if !self.model.seriesAttributes[self.seriesIndex].point.isHidden {
                PointsShape(model: self.model,
                            chartContext: self.chartContext,
                            seriesIndex: self.seriesIndex,
                            categoryIndexRange: categoryIndexRange,
                            layoutDirection: self.layoutDirection)
                    .fill(self.model.seriesAttributes[self.seriesIndex].point.strokeColor)
                    .frame(width: rect.size.width, height: rect.size.height)
                    .clipShape(Rectangle()
                        .size(width: rect.size.width + self.pointRadius(at: self.seriesIndex) * 2 + 5,
                              height: rect.size.height + self.pointRadius(at: self.seriesIndex) * 2 + 5)
                        .offset(x: -1 * self.pointRadius(at: self.seriesIndex),
                                y: -1 * self.pointRadius(at: self.seriesIndex)))
            }
        }
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = self.model.seriesAttributes[index].point
        
        return CGFloat(pointAttr.diameter / 2)
    }
}
