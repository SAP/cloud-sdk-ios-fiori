//
//  BarPlotView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 8/3/20.
//

import SwiftUI

struct BarPlotView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.axisDataSource) var axisDataSource
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterHeight = columnXIncrement / (1.0 + ColumnGapFraction)
        let clusterSpace: CGFloat = rect.size.height * (1.0 - clusterHeight * CGFloat(maxDataCount)) * model.scale / CGFloat(max((maxDataCount - 1), 1))
        
        let endPosY = rect.size.height * model.scale - model.startPos.y
        let startPosY = endPosY - rect.size.height
        
        let pd = axisDataSource.plotData(model)
        let (startIndex, endIndex, startOffset, endOffset) = axisDataSource.displayCategoryIndexesAndOffsets(model, rect: rect)
        let curPlotData = (startIndex >= 0 && endIndex >= 0) ? Array(pd[startIndex...endIndex]) : pd
        var gapBeforeFirstCoumn: CGFloat = 0
        if let fs = curPlotData.first, let fl = fs.first {
            gapBeforeFirstCoumn = startOffset <= 0 ? 0 : abs(fl.rect.origin.y * model.scale * rect.size.height - startPosY)
        }
        let chartHeight = startOffset < 0 ? (rect.size.height - startOffset + endOffset) : (rect.size.height + endOffset)
        let chartPosY = startOffset < 0 ? (rect.size.height + startOffset + endOffset) / 2.0 : (rect.size.height + endOffset) / 2.0
    
        return VStack(alignment: .leading, spacing: 0) {
            if pd.isEmpty {
                NoDataView()
            } else {
                VStack(alignment: .leading, spacing: 0) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: gapBeforeFirstCoumn)
                    
                    VStack(alignment: .leading, spacing: clusterSpace) {
                        ForEach(curPlotData, id: \.self) { series in
                            BarPlotSeriesView(plotSeries: series,
                                              rect: rect,
                                              isSelectionView: false)
                                //.frame(width: rect.size.width)
                        }
                    }
                    
                    Spacer(minLength: 0)
                }.padding(0)
                .frame(width: rect.size.width, height: chartHeight)
                .position(x: rect.size.width / 2.0, y: chartPosY)
            }
        }
        .clipped()
    }
}

struct BarPlotView_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
            let model = $0
            model.chartType = .bar
            return model
        }
        let axisDataSource = BarAxisDataSource()
        
        return Group {
            ForEach(models) {
                BarPlotView()
                    .environmentObject($0)
                    .environment(\.axisDataSource, axisDataSource)
                    .frame(width: 220, height: 330, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
