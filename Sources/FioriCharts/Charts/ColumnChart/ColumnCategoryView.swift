import SwiftUI

struct ColumnCategoryView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.chartSeriesShapeStyle) var chartSeriesShapeStyle
    @Environment(\.chartCategoryShapeStyle) var chartCategoryShapeStyle
    @Environment(\.layoutDirection) var layoutDirection
    @State private var animateScale: CGFloat = 1
    
    let seriesIndex: Int
    let categoryIndex: Int
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    // swiftlint:disable force_unwrapping
    func makeBody(in rect: CGRect) -> some View {
        let mirror = self.layoutDirection == .rightToLeft ? CGAffineTransform(a: -1, b: 0, c: 0, d: 1, tx: rect.size.width, ty: 0) : CGAffineTransform.identity
        
        let startPosition = self.chartContext.startPosition(self.model, plotViewSize: rect.size)
        let scaleX = self.chartContext.scaleX(self.model, plotViewSize: rect.size)
        let scaleY = self.chartContext.scaleY(self.model, plotViewSize: rect.size)
        
        let translateX: CGFloat
        if self.layoutDirection == .rightToLeft {
            translateX = -(1 - 1 / scaleX - startPosition.x) * scaleX * rect.size.width
        } else {
            translateX = -startPosition.x * scaleX * rect.size.width
        }
        let translateY = -startPosition.y * scaleY * rect.size.height
        
        var selected = false
        if let tmpSelections = model.selections {
            selected = tmpSelections[self.seriesIndex]?.contains(self.categoryIndex) ?? false
        } else {
            selected = true
        }
        
        var useLocalUserSpace = false
        var linearGradient: LinearGradient?
        var angularGradient: AngularGradient?
        var radialGradient: RadialGradient?
        var imagePaint: ImagePaint?
        var color: Color?
        var tmpGradient: AnyShapeStyle?
        if let seriesGradient = chartCategoryShapeStyle[seriesIndex], let tmpG = seriesGradient[categoryIndex] {
            tmpGradient = tmpG
            useLocalUserSpace = true
        } else if let tmpG = chartSeriesShapeStyle[seriesIndex] {
            tmpGradient = tmpG
        }
        
        if let gradient = tmpGradient {
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
        
        let fillColor = self.model.colorAt(seriesIndex: self.seriesIndex, categoryIndex: self.categoryIndex)
        let pd = self.chartContext.plotData(self.model)
        var columnRect: CGRect = .zero
        if pd.count > self.categoryIndex, pd[self.categoryIndex].count > self.seriesIndex {
            let pdr = pd[categoryIndex][seriesIndex]
            
            if self.model.chartType == .bar || self.model.chartType == .stackedBar {
                columnRect = pdr.rect
            } else {
                columnRect = CGRect(origin: CGPoint(x: pdr.rect.origin.x, y: 1 - pdr.rect.origin.y - pdr.rect.size.height), size: pdr.rect.size)
            }
        }
            
        return ZStack {
            if linearGradient != nil {
                if useLocalUserSpace {
                    Rectangle()
                        .fill(linearGradient!)
                        .transformEffect(CGAffineTransform(scaleX: columnRect.size.width, y: columnRect.size.height))
                        .transformEffect(CGAffineTransform(translationX: columnRect.origin.x * rect.size.width, y: columnRect.origin.y * rect.size.height))
                        .transformEffect(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                        .transformEffect(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                        .transformEffect(mirror) // apply layoutDirection
                } else {
                    Rectangle()
                        .transform(CGAffineTransform(scaleX: columnRect.size.width, y: columnRect.size.height))
                        .transform(CGAffineTransform(translationX: columnRect.origin.x * rect.size.width, y: columnRect.origin.y * rect.size.height))
                        .fill(linearGradient!)
                        .transformEffect(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                        .transformEffect(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                        .transformEffect(mirror) // apply layoutDirection
                }
            } else if angularGradient != nil {
                if useLocalUserSpace {
                    Rectangle()
                        .fill(angularGradient!)
                        .transformEffect(CGAffineTransform(scaleX: columnRect.size.width, y: columnRect.size.height))
                        .transformEffect(CGAffineTransform(translationX: columnRect.origin.x * rect.size.width, y: columnRect.origin.y * rect.size.height))
                        .transformEffect(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                        .transformEffect(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                        .transformEffect(mirror) // apply layoutDirection
                } else {
                    Rectangle()
                        .transform(CGAffineTransform(scaleX: columnRect.size.width, y: columnRect.size.height))
                        .transform(CGAffineTransform(translationX: columnRect.origin.x * rect.size.width, y: columnRect.origin.y * rect.size.height))
                        .fill(angularGradient!)
                        .transformEffect(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                        .transformEffect(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                        .transformEffect(mirror) // apply layoutDirection
                }
                
            } else if radialGradient != nil {
                if useLocalUserSpace {
                    Rectangle()
                        .fill(radialGradient!)
                        .transformEffect(CGAffineTransform(scaleX: columnRect.size.width, y: columnRect.size.height))
                        .transformEffect(CGAffineTransform(translationX: columnRect.origin.x * rect.size.width, y: columnRect.origin.y * rect.size.height))
                        .transformEffect(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                        .transformEffect(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                        .transformEffect(mirror) // apply layoutDirection
                } else {
                    Rectangle()
                        .transform(CGAffineTransform(scaleX: columnRect.size.width, y: columnRect.size.height))
                        .transform(CGAffineTransform(translationX: columnRect.origin.x * rect.size.width, y: columnRect.origin.y * rect.size.height))
                        .fill(radialGradient!)
                        .transformEffect(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                        .transformEffect(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                        .transformEffect(mirror) // apply layoutDirection
                }
            } else if color != nil {
                Rectangle()
                    .transform(CGAffineTransform(scaleX: columnRect.size.width, y: columnRect.size.height))
                    .transform(CGAffineTransform(translationX: columnRect.origin.x * rect.size.width, y: columnRect.origin.y * rect.size.height))
                    .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                    .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                    .transform(mirror) // apply layoutDirection
                    .fill(color!)
            } else if imagePaint != nil {
                Rectangle()
                    .transform(CGAffineTransform(scaleX: columnRect.size.width, y: columnRect.size.height))
                    .transform(CGAffineTransform(translationX: columnRect.origin.x * rect.size.width, y: columnRect.origin.y * rect.size.height))
                    .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                    .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                    .transform(mirror) // apply layoutDirection
                    .fill(imagePaint!)
            } else {
                Rectangle()
                    .transform(CGAffineTransform(scaleX: columnRect.size.width, y: columnRect.size.height))
                    .transform(CGAffineTransform(translationX: columnRect.origin.x * rect.size.width, y: columnRect.origin.y * rect.size.height))
                    .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                    .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                    .transform(mirror) // apply layoutDirection
                    .fill(fillColor)
            }
        }
        .opacity(selected ? 1 : 0.4)
    }
}
