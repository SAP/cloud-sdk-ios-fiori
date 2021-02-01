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
                    
        var linearGradient: LinearGradient?
        var angularGradient: AngularGradient?
        var radialGradient: RadialGradient?
        var imagePaint: ImagePaint?
        var color: Color?
        var gradient: Any = 0
        if let tmpGradient = chartSeriesShapeStyle[seriesIndex] {
            gradient = tmpGradient
        }
        if let tmp = gradient as? LinearGradient {
            linearGradient = tmp
        } else if let tmp = gradient as? RadialGradient {
            radialGradient = tmp
        } else if let tmp = gradient as? AngularGradient {
            angularGradient = tmp
        } else if let tmp = gradient as? ImagePaint {
            imagePaint = tmp
        } else if let tmp = gradient as? Color {
            color = tmp
        }
        
        let lineWidth = model.seriesAttributes[seriesIndex].lineWidth
        let strokeLineShape = LineChartSeriesLineShape(path: model.path, seriesIndex: seriesIndex, startIndex: startIndex + 1, endIndex: endIndex)
            .transform(mirror) // apply layoutDirection
            .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
            .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
        
        return ZStack {
            // range fill
            LineChartSeriesFillShape(path: self.model.path, seriesIndex: seriesIndex, startIndex: startIndex + 1, endIndex: endIndex)
                .transform(mirror) // apply layoutDirection
                .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                .fill(lineFillColor)
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
                strokeLineShape.stroke(lineStrokeColor, lineWidth: lineWidth)
            }
            
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
