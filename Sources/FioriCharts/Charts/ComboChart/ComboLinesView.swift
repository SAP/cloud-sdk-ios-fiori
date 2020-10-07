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
        var noData = false
        let (startIndex, endIndex, startOffset, endOffset) = chartContext.displayCategoryIndexesAndOffsets(model, rect: rect)
        
        if startIndex > endIndex {
            noData = true
        }
        
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        var lineIndexes =  model.indexesOfColumnSeries.symmetricDifference(allIndexs)
        
        let axisIndexes = secondary ? model.indexesOfSecondaryValueAxis : model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs)
        
        lineIndexes.formIntersection(axisIndexes)
        
        let indexes: [Int] = lineIndexes.sorted()
        
        if indexes.isEmpty {
            noData = true
        }
        
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement * model.scale * rect.size.width / (1.0 + ColumnGapFraction)
        
        let lineStartOffset = startOffset + clusterWidth / 2.0
        let lineEndOffset = endOffset - clusterWidth / 2.0
        
        var data = [Int: [CGFloat?]]()
        if !noData {
            for i in indexes {
                let category = model.data[i]
                var s: [CGFloat?] = []
                for i in startIndex...endIndex {
                    if let val = category[i].first {
                        s.append(val)
                    }
                }
                data[i] = s
            }
        }
        //let baselinePosition = ChartUtility.xAxisBaselinePosition(model)
        
        return ZStack {
            ForEach(indexes, id: \.self) { i in
                ZStack {
                    LinesShape(points: data[i] ?? [],
                               displayRange: displayRange,
                               layoutDirection: self.layoutDirection,
                               startOffset: lineStartOffset,
                               endOffset: lineEndOffset)
                        .stroke(self.model.seriesAttributes[i].palette.colors[0],
                                lineWidth: self.model.seriesAttributes[i].lineWidth)
                        .frame(width: rect.size.width, height: rect.size.height)
                        .clipped()
                    
                    PointsShape(points: data[i] ?? [],
                                displayRange: displayRange,
                                layoutDirection: self.layoutDirection,
                                radius: self.pointRadius(at: i),
                                gap: self.model.seriesAttributes[i].point.gap,
                                startOffset: lineStartOffset,
                                endOffset: lineEndOffset)
                        .fill(self.model.seriesAttributes[i].point.strokeColor)
                }
            }
        }
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
