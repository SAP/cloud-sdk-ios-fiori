import SwiftUI

struct LineRangeIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    let seriesIndex: Int
    let startIndex: Int
    let endIndex: Int
    let displayRange: ClosedRange<CGFloat>
    let lineWidth: CGFloat
    let pointRadius: CGFloat
    let pointGap: CGFloat
    let lineFillColor: Color
    let lineStrokeColor: Color
    let pointStrokeColor: Color
    let size: CGSize
    
    var body: some View {
        let mirror = layoutDirection == .rightToLeft ? CGAffineTransform(a: -1, b: 0, c: 0, d: 1, tx: size.width, ty: 0) : CGAffineTransform.identity
        let translateX: CGFloat
        let startPosition = chartContext.startPosition(model, plotViewSize: size)
        let scaleX = chartContext.scaleX(model, plotViewSize: size)
        let scaleY = chartContext.scaleY(model, plotViewSize: size)
        
        // calculate CGAffineTransform for layoutDirection
        if layoutDirection == .rightToLeft {
            translateX = -(1 - 1 / scaleX - startPosition.x) * scaleX * size.width
        } else {
            translateX = -startPosition.x * scaleX * size.width
        }
        let translateY = -startPosition.y * scaleY * size.height
        
        return ZStack {
            // range fill
            LineChartSeriesFillShape(path: self.model.path, seriesIndex: seriesIndex, startIndex: startIndex + 1, endIndex: endIndex)
                .transform(mirror) // apply layoutDirection
                .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                .fill(lineFillColor)
                .opacity(0.4)
            
            // range stroke line
            LineChartSeriesLineShape(path: model.path, seriesIndex: seriesIndex, startIndex: startIndex + 1, endIndex: endIndex)
                .transform(mirror) // apply layoutDirection
                .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                .stroke(lineStrokeColor, lineWidth: lineWidth)
            
            if !self.model.seriesAttributes[seriesIndex].point.isHidden {
                PointsShape(model: model,
                            chartContext: chartContext,
                            seriesIndex: seriesIndex,
                            categoryIndexRange: startIndex ... endIndex,
                            layoutDirection: layoutDirection)
                    .fill(pointStrokeColor)
            }
        }
    }
}
