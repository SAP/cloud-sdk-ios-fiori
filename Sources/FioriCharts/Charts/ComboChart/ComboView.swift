//
//  ComboView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/30/20.
//

import SwiftUI

struct ComboView: View {
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
        
        let allIndexs = IndexSet(integersIn: 0 ..< model.numOfSeries())
        let lineIndexes =  model.indexesOfColumnSeries.symmetricDifference(allIndexs).sorted()
        let columnIndexes = model.indexesOfColumnSeries.sorted()
        
        let categoryIndexRange = chartContext.displayCategoryIndexes(model, rect: rect)
        let categoryIndices = Array(categoryIndexRange)
        let maxDataCount = model.numOfCategories()
        let lineStartIndex = categoryIndexRange.lowerBound//max(0, categoryIndexRange.lowerBound - 1)
        let lineEndIndex = min(categoryIndexRange.upperBound + 1, maxDataCount - 1)
        
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
            // column series view
            ForEach(0..<categoryIndices.count, id: \.self) { index in
                ColumnSeriesView(seriesIndices: columnIndexes, categoryIndex: categoryIndices[index])
            }.clipped()
            
            // line series view
            ForEach(0..<lineIndexes.count, id: \.self) { seriesIndex in
                ZStack {
                    LineChartSeriesLineShape(path: self.model.path, seriesIndex: lineIndexes[seriesIndex], startIndex: lineStartIndex, endIndex: lineEndIndex)
                        .transform(mirror)   // apply layoutDirection
                        .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                        .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                        .stroke(self.model.seriesAttributes[lineIndexes[seriesIndex]].palette.colors[0],
                                lineWidth: self.model.seriesAttributes[lineIndexes[seriesIndex]].lineWidth)
                        .frame(width: rect.size.width, height: rect.size.height)
                        .clipped()
                    
                    if !self.model.seriesAttributes[lineIndexes[seriesIndex]].point.isHidden {
                        PointsShape(model: self.model,
                                    chartContext: self.chartContext,
                                    seriesIndex: lineIndexes[seriesIndex],
                                    categoryIndexRange: categoryIndexRange,
                                    layoutDirection: self.layoutDirection)
                            .fill(self.model.seriesAttributes[lineIndexes[seriesIndex]].point.strokeColor)
                            .clipShape(Rectangle()
                                        .size(width: width + self.pointRadius(at: lineIndexes[seriesIndex]) * 2 + 5,
                                              height: rect.size.height + self.pointRadius(at: lineIndexes[seriesIndex]) * 2 + 5)
                                        .offset(x: -1 * self.pointRadius(at: lineIndexes[seriesIndex]),
                                                y: -1 * self.pointRadius(at: lineIndexes[seriesIndex])))
                    } else {
                        EmptyView()
                    }
                }
            }.opacity(self.model.selections != nil ? 0.25 : 1)
        }
        .frame(width: rect.size.width, height: rect.size.height)
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = model.seriesAttributes[index].point
        
        return CGFloat(pointAttr.diameter/2)
    }
}

struct ComboView_Previews: PreviewProvider {
    static var previews: some View {
        ComboView()
            .environmentObject(Tests.comboModels[0])
            .environment(\.chartContext, ComboChartContext())
            .frame(width: 300, height: 200)
    }
}
