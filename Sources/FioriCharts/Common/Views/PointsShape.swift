import SwiftUI

struct PointsShape: Shape {
    let model: ChartModel
    let chartContext: ChartContext
    let seriesIndex: Int
    let categoryIndexRange: ClosedRange<Int>
    let layoutDirection: LayoutDirection
    
    public init(model: ChartModel, chartContext: ChartContext, seriesIndex: Int, categoryIndexRange: ClosedRange<Int>, layoutDirection: LayoutDirection = .leftToRight) {
        self.model = model
        self.chartContext = chartContext
        self.seriesIndex = seriesIndex
        self.categoryIndexRange = categoryIndexRange
        self.layoutDirection = layoutDirection
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        if self.seriesIndex < 0 || self.seriesIndex >= self.model.numOfSeries() || self.categoryIndexRange.upperBound < 0 {
            return path
        }
        
        let maxDataCount = self.model.numOfCategories()
        let stepWidth: CGFloat
        let offsetX: CGFloat
        if self.model.chartType == .combo {
            let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
            let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
            stepWidth = columnXIncrement
            offsetX = clusterWidth / 2.0
        } else {
            stepWidth = max(1 / CGFloat(max(maxDataCount - 1, 1)), ChartViewLayout.minUnitWidth)
            offsetX = 0
        }
        
        let secondary = self.model.indexesOfSecondaryValueAxis.contains(self.seriesIndex)
        let displayRange = ChartUtility.displayRange(self.model, secondary: secondary)
        
        let pointAttr = self.model.seriesAttributes[self.seriesIndex].point
        let radius = CGFloat(pointAttr.diameter / 2)
        /// Allowed gap between dots before they run into eachother and are hidden.
        let gap = CGFloat(pointAttr.gap)
        
        let tmpScaleX = self.chartContext.scaleX(self.model, plotViewSize: rect.size)
        let tmpScaleY = self.chartContext.scaleY(self.model, plotViewSize: rect.size)
        let tmpStartPosition = self.chartContext.startPosition(self.model, plotViewSize: rect.size)
        let startPosX = tmpStartPosition.x * tmpScaleX * rect.size.width
        let startPosY = tmpStartPosition.y * tmpScaleY * rect.size.height
        
        var lastPoint = CGPoint(x: -2 * radius - gap, y: 0)
        let range: CGFloat = abs(displayRange.upperBound - displayRange.lowerBound) <= 0.000001 ? 1 : displayRange.upperBound - displayRange.lowerBound
        
        for i in 0 ..< self.categoryIndexRange.count {
            let dataVal = ChartUtility.dimensionValue(self.model, seriesIndex: self.seriesIndex, categoryIndex: i + self.categoryIndexRange.lowerBound, dimensionIndex: 0)
            
            if let tmpVal = dataVal { // cur point is not nil
                let val = (1 - (tmpVal - displayRange.lowerBound) / range) * tmpScaleY * rect.size.height - startPosY
                let x = (stepWidth * CGFloat(i + self.categoryIndexRange.lowerBound) + offsetX) * tmpScaleX * rect.size.width - startPosX
                let p = CGPoint(x: ChartUtility.xPos(x, layoutDirection: self.layoutDirection, width: rect.size.width), y: val)

                if p.x >= -1, p.x <= rect.size.width + 1, self.distance(p1: lastPoint, p2: p) >= (2 * radius + gap) {
                    path.move(to: p)
                    path.addRelativeArc(center: p, radius: radius, startAngle: Angle(degrees: 0), delta: Angle(degrees: 360))
                    lastPoint = p
                }
            }
        }
        
        return path
    }
    
    func distance(p1: CGPoint, p2: CGPoint) -> CGFloat {
        CGFloat(sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y)))
    }
}
