//
//  WaterfallIndicatorView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/23/20.
//

import SwiftUI

struct WaterfallIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.chartContext) var chartContext
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let maxDataCount = model.numOfCategories(in: 0)
        let startPosX = model.startPos.x * model.scale * rect.size.width
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        let clusterSpace: CGFloat = rect.size.width * (1.0 - clusterWidth * CGFloat(maxDataCount)) * model.scale / CGFloat(max((maxDataCount - 1), 1))

        let pd = chartContext.plotData(model)
        let (startIndex, endIndex, startOffset, endOffset) = chartContext.displayCategoryIndexesAndOffsets(model, rect: rect)
        let curPlotData = (startIndex >= 0 && endIndex >= 0) ? Array(pd[startIndex...endIndex]) : pd
        var gapBeforeFirstCoumn: CGFloat = 0
        if let fs = curPlotData.first, let fl = fs.first {
            gapBeforeFirstCoumn = startOffset <= 0 ? 0 : abs(fl.rect.origin.x * model.scale * rect.size.width - startPosX)
        }
        let chartWidth = startOffset < 0 ? (rect.size.width - startOffset + endOffset) : (rect.size.width + endOffset)
        let chartPosX = startOffset < 0 ? (rect.size.width + startOffset + endOffset) / 2.0 : (rect.size.width + endOffset) / 2.0
        
        var displayPlotData: [[ChartPlotData]] = []
        
        for pdSeries in curPlotData {
            var ss: [ChartPlotData] = []
            for pdCategory in pdSeries {
                if let selections = model.selections, let catSelections = selections[pdCategory.seriesIndex], catSelections.contains(pdCategory.categoryIndex) {
                    ss.append(pdCategory.changeSelected(selected: true))
                } else {
                    ss.append(pdCategory)
                }
            }
            displayPlotData.append(ss)
        }
           
        return VStack(alignment: .leading, spacing: 0) {
            if pd.isEmpty {
                EmptyView()
            } else {
                HStack(alignment: .bottom, spacing: 0) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: gapBeforeFirstCoumn)
                    
                    ForEach(displayPlotData, id: \.self) { series in
                        HStack(alignment: .bottom, spacing: 0) {
                            WaterfallSeriesView(plotSeries: series,
                                                rect: rect,
                                                isSelectionView: true)
                            
                            if series.first?.categoryIndex != self.model.numOfCategories(in: 0) - 1 {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: clusterSpace, height: 1)
                            }
                        }
                    }
                    
                    Spacer(minLength: 0)
                }
                .frame(width: chartWidth)
                .position(x: chartPosX, y: rect.size.height / 2.0)
            }
        }.clipped()
    }
}

struct WaterfallIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        let chartContext = WaterfallChartContext()
        
        return WaterfallIndicatorView()
            .environmentObject(Tests.waterfallModels[0])
            .environment(\.chartContext, chartContext)
            .frame(width: 300, height: 200)
            
    }
}
