//
//  WaterfallView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/23/20.
//

import SwiftUI

struct WaterfallView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    @State private var animateScale: CGFloat = 0
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        // only check first series
        let maxDataCount = model.numOfCategories(in: 0)
        let width = rect.size.width
        let categoryIndexRange = chartContext.displayCategoryIndexes(model, rect: rect)
        
        // calculate CGAffineTransform for layoutDirection
        let mirror = layoutDirection == .rightToLeft ? CGAffineTransform(a: -1, b: 0, c: 0, d: 1, tx: width, ty: 0) : CGAffineTransform.identity

        let translateX: CGFloat
        let startPosition = chartContext.startPosition(model, plotViewSize: rect.size)
        let scaleX = chartContext.scaleX(model, plotViewSize: rect.size)
        let scaleY = chartContext.scaleY(model, plotViewSize: rect.size)
        
        if layoutDirection == .rightToLeft {
            translateX = -(1 - 1 / scaleX - startPosition.x) * scaleX * width
        } else {
            translateX = -startPosition.x * scaleX * width
        }
        let translateY = -startPosition.y * scaleY * rect.size.height
        
        return ZStack {
            ForEach(0 ..< maxDataCount, id: \.self) { categoryIndex in
                Group {
                    if categoryIndexRange.contains(categoryIndex) {
                        ColumnChartCategoryShape(chartType: self.model.chartType, plotBaselinePosition: self.model.numericAxisTickValues.plotBaselinePosition, path: self.model.path, seriesIndex: 0, categoryIndex: categoryIndex, animateScale: self.animateScale)
                            .transform(mirror)   // apply layoutDirection
                            .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                            .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                            .fill(self.model.columnColor(seriesIndex: 0, categoryIndex: categoryIndex))
                    } else {
                        EmptyView()
                    }
                }
            }
            
            WaterfallChartConnectingLinesShape(path: model.path, seriesIndex: 0, startIndex: categoryIndexRange.lowerBound, endIndex: categoryIndexRange.upperBound)
                .transform(mirror)   // apply layoutDirection
                .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                .stroke(Color.preferredColor(.primary4), lineWidth: 1)
                .frame(width: rect.size.width, height: rect.size.height)
        }
        .frame(width: rect.size.width, height: rect.size.height)
        .clipped()
        .onAppear {
            self.animateScale = 1
        }
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
