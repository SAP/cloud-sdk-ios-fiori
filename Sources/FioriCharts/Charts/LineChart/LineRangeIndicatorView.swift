import SwiftUI

// import FioriSwiftUICore

struct LineRangeIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.chartSeriesShapeStyle) var chartSeriesShapeStyle
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
    
    // swiftlint:disable force_unwrapping
    var body: some View {
        let mirror = self.layoutDirection == .rightToLeft ? CGAffineTransform(a: -1, b: 0, c: 0, d: 1, tx: self.size.width, ty: 0) : CGAffineTransform.identity
        let translateX: CGFloat
        let startPosition = self.chartContext.startPosition(self.model, plotViewSize: self.size)
        let scaleX = self.chartContext.scaleX(self.model, plotViewSize: self.size)
        let scaleY = self.chartContext.scaleY(self.model, plotViewSize: self.size)
        
        // calculate CGAffineTransform for layoutDirection
        if self.layoutDirection == .rightToLeft {
            translateX = -(1 - 1 / scaleX - startPosition.x) * scaleX * self.size.width
        } else {
            translateX = -startPosition.x * scaleX * self.size.width
        }
        let translateY = -startPosition.y * scaleY * self.size.height
                    
        var linearGradient: LinearGradient?
        var angularGradient: AngularGradient?
        var radialGradient: RadialGradient?
        var imagePaint: ImagePaint?
        var color: Color?

        if let gradient = chartSeriesShapeStyle[seriesIndex] {
            if let tmp = gradient.base as? LinearGradient {
                linearGradient = tmp
            } else if let tmp = gradient.base as? RadialGradient {
                radialGradient = tmp
            } else if let tmp = gradient.base as? AngularGradient {
                angularGradient = tmp
            } else if let tmp = gradient.base as? ImagePaint {
                imagePaint = tmp
            } else if let tmp = gradient.base as? Color {
                color = tmp
            }
        }
        
        let lineWidth = self.model.seriesAttributes[self.seriesIndex].lineWidth
        let strokeLineShape = LineChartSeriesLineShape(path: model.path, seriesIndex: self.seriesIndex, startIndex: self.startIndex + 1, endIndex: self.endIndex)
            .transform(mirror) // apply layoutDirection
            .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
            .transform(CGAffineTransform(translationX: translateX, y: translateY)) // apply pan
        
        return ZStack {
            // range fill
            LineChartSeriesFillShape(path: self.model.path, seriesIndex: self.seriesIndex, startIndex: self.startIndex + 1, endIndex: self.endIndex)
                .transform(mirror) // apply layoutDirection
                .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                .transform(CGAffineTransform(translationX: translateX, y: translateY)) // apply pan
                .fill(self.lineFillColor)
                .opacity(0.4)
            
            // range stroke line
            if linearGradient != nil {
                strokeLineShape.stroke(linearGradient!, lineWidth: lineWidth)
            } else if angularGradient != nil {
                strokeLineShape.stroke(angularGradient!, lineWidth: lineWidth)
            } else if radialGradient != nil {
                strokeLineShape.stroke(radialGradient!, lineWidth: lineWidth)
            } else if color != nil {
                strokeLineShape.stroke(color!, lineWidth: lineWidth)
            } else if imagePaint != nil {
                strokeLineShape.stroke(imagePaint!, lineWidth: lineWidth)
            } else {
                strokeLineShape.stroke(self.lineStrokeColor, lineWidth: lineWidth)
            }
            
            if !self.model.seriesAttributes[self.seriesIndex].point.isHidden {
                PointsShape(model: self.model,
                            chartContext: self.chartContext,
                            seriesIndex: self.seriesIndex,
                            categoryIndexRange: self.startIndex ... self.endIndex,
                            layoutDirection: self.layoutDirection)
                    .fill(self.pointStrokeColor)
            }
        }
    }
}
