import SwiftUI

struct WaterfallView: View {
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
        // only check first series
        let width = rect.size.width
        let categoryIndexRange = self.chartContext.displayCategoryIndexes(self.model, rect: rect)
        let categoryIndices = Array(categoryIndexRange)
        
        // calculate CGAffineTransform for layoutDirection
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
            // columns
            ForEach(0 ..< categoryIndices.count, id: \.self) { index in
                ColumnSeriesView(seriesIndices: [0], categoryIndex: categoryIndices[index])
            }
            
            // connecting lines
            WaterfallChartConnectingLinesShape(path: model.path,
                                               seriesIndex: 0,
                                               startIndex: categoryIndexRange.lowerBound,
                                               endIndex: categoryIndexRange.upperBound)
                .transform(mirror) // apply layoutDirection
                .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                .stroke(Color.preferredColor(.secondaryFill), lineWidth: 1)
                .frame(width: rect.size.width, height: rect.size.height)
        }
        .frame(width: rect.size.width, height: rect.size.height)
        .clipped()
    }
}

struct WaterfallView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.waterfallModels) {
                WaterfallView()
                    .environmentObject($0)
                    .environment(\.chartContext, WaterfallChartContext())
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
