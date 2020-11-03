//
//  ComboLinesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 7/1/20.
//

import SwiftUI

struct ComboLinesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        ZStack {
            self.makeLinesBody(in: rect, secondary: false)
            
            self.makeLinesBody(in: rect, secondary: true)
        }
    }
    
    func makeLinesBody(in rect: CGRect, secondary: Bool) -> some View {
        let displayRange = ChartUtility.displayRange(model, secondary: secondary)
        let (startIndex, endIndex, startOffset, endOffset) = chartContext.displayCategoryIndexesAndOffsets(model, rect: rect)
        
        if startIndex > endIndex {
            return AnyView(EmptyView())
        }
        
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        var lineIndexes =  model.indexesOfColumnSeries.symmetricDifference(allIndexs)
        
        let axisIndexes = secondary ? model.indexesOfSecondaryValueAxis : model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs)
        
        lineIndexes.formIntersection(axisIndexes)
        
        let indexes: [Int] = lineIndexes.sorted()
        
        if indexes.isEmpty {
            return AnyView(EmptyView())
        }
        
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement * model.scale * rect.size.width / (1.0 + ColumnGapFraction)
        
        let lineStartOffset = startOffset + clusterWidth / 2.0
        let lineEndOffset = endOffset - clusterWidth / 2.0
        
        return AnyView(ZStack {
            ForEach(indexes, id: \.self) { i in
                ZStack {
                    LinesShape(model: self.model,
                               seriesIndex: i,
                               categoryIndexRange: startIndex ... endIndex,
                               displayRange: displayRange,
                               layoutDirection: self.layoutDirection,
                               startOffset: lineStartOffset,
                               endOffset: lineEndOffset)
                        .stroke(self.model.seriesAttributes[i].palette.colors[0],
                                lineWidth: self.model.seriesAttributes[i].lineWidth)
                        .frame(width: rect.size.width, height: rect.size.height)
                        .clipped()
                    
                    PointsShape(model: self.model,
                                seriesIndex: i,
                                categoryIndexRange: startIndex ... endIndex,
                                displayRange: displayRange,
                                layoutDirection: self.layoutDirection,
                                radius: self.pointRadius(at: i),
                                gap: self.model.seriesAttributes[i].point.gap,
                                startOffset: lineStartOffset,
                                endOffset: lineEndOffset)
                        .fill(self.model.seriesAttributes[i].point.strokeColor)
                }
            }
        })
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = model.seriesAttributes[index].point
        
        return pointAttr.isHidden ? 0 : CGFloat(pointAttr.diameter/2)
    }
}

struct ComboLinesView_Previews: PreviewProvider {
    static var previews: some View {
        let chartContext = ComboChartContext()
        
        return ComboLinesView()
            .environmentObject(Tests.comboModels[0])
            .environment(\.chartContext, chartContext)
            .frame(width: 300, height: 200)
    }
}
