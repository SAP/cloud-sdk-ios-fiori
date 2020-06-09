//
//  ColumnView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/3/20.
//

import SwiftUI

struct ColumnView: View {
    @ObservedObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    
    init(_ model: ChartModel) {
        self.model = model
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let tickValues = model.numericAxisTickValues
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        let clusterSpace: CGFloat = rect.size.width * (1.0 - clusterWidth * CGFloat(maxDataCount)) * model.scale / CGFloat(max((maxDataCount - 1), 1))

        let plotData = generateClusteredPlotData(in: rect)
        let (startIndex, endIndex, startOffset, endOffset) = displayCategoryIndexesAndOffsets(model, rect: rect, plotData: plotData)
        let curPlotData = (startIndex >= 0 && endIndex >= 0) ? Array(plotData[startIndex...endIndex]) : plotData
        var gapBeforeFirstCoumn: CGFloat = 0
        if let fs = curPlotData.first, let fl = fs.first {
            gapBeforeFirstCoumn = startOffset < 0 ? 0 : abs(fl.rect.origin.x * model.scale * rect.size.width - CGFloat(model.startPos))
        }
        let chartWidth = startOffset < 0 ? (rect.size.width - startOffset + endOffset) : (rect.size.width + endOffset)
        let chartPosX = startOffset < 0 ? (rect.size.width + startOffset + endOffset) / 2.0 : (rect.size.width + endOffset) / 2.0

        return VStack(alignment: .leading, spacing: 0) {
            if plotData.isEmpty {
                NoDataView()
            } else {
                // positive value columns and their value column lables
                HStack(alignment: .bottom, spacing: clusterSpace) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: gapBeforeFirstCoumn)
                    // positive values
                    if tickValues.plotMinimum >= 0 {
                        ForEach(curPlotData, id: \.self) { series in
                            HStack(alignment: .bottom, spacing: 0) {
                                ForEach(series, id: \.self) { item in
                                    Rectangle()
                                        .fill(self.model.seriesAttributes[item.seriesIndex].palette.fillColor.color(self.colorScheme))
                                        .frame(width: item.rect.size.width * rect.size.width * self.model.scale, height: item.rect.size.height * rect.size.height)
                                }
                            }
                        }
                    } else if tickValues.plotMaximum <= 0 { // negative values
                        ForEach(curPlotData, id: \.self) { series in
                            HStack(alignment: .bottom, spacing: 0) {
                                ForEach(series, id: \.self) { item in
                                    VStack(alignment: .center, spacing: 0) {
                                        Rectangle()
                                        .fill(self.model.seriesAttributes[item.seriesIndex].palette.fillColor.color(self.colorScheme))
                                        .frame(width: item.rect.size.width * rect.size.width * self.model.scale, height: item.rect.size.height * rect.size.height)
                                        Spacer(minLength: 0)
                                    }
                                }
                            }
                        }
                    } else { // mixed values
                        ForEach(curPlotData, id: \.self) { series in
                            HStack(alignment: .bottom, spacing: 0) {
                                ForEach(series, id: \.self) { item in
                                    VStack(spacing: 0) {
                                        // positive area
                                        VStack(spacing: 0) {
                                            Spacer(minLength: 0)
                                                Rectangle()
                                                    .fill(self.model.seriesAttributes[item.seriesIndex].palette.fillColor.color(self.colorScheme))
                                                    .frame(width: item.rect.size.width * rect.size.width * self.model.scale, height: self.columnHeight(from: item, isPositiveArea: true) * rect.size.height)
                                        }.frame(height: (1 - tickValues.plotBaselinePosition) * rect.size.height)
                                        
                                        // negative area
                                        VStack(spacing: 0) {
                                            Rectangle()
                                                .fill(self.model.seriesAttributes[item.seriesIndex].palette.fillColor.color(self.colorScheme))
                                                .frame(width: item.rect.size.width * rect.size.width * self.model.scale,
                                                       height: self.columnHeight(from: item, isPositiveArea: false) * rect.size.height)
                                            Spacer(minLength: 0)
                                        }.frame(height: tickValues.plotBaselinePosition * rect.size.height)
                                    }
                                }
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
    
    func displayCategoryIndexesAndOffsets(_ model: ChartModel, rect: CGRect, plotData: [[ChartPlotRectData]]) -> (startIndex: Int, endIndex: Int, startOffset: CGFloat, endOffset: CGFloat) {
        var startIndex = -1
        var endIndex = -1
        var startOffset: CGFloat = 0
        var endOffset: CGFloat = 0
        
        for plotSeries in plotData {
            if startIndex == -1 {
                if let first = plotSeries.first, let last = plotSeries.last {
                    let firstX = first.rect.origin.x * model.scale * rect.size.width
                    if (CGFloat(model.startPos) >= firstX && CGFloat(model.startPos) <= last.rect.maxX * model.scale * rect.size.width) || firstX >= CGFloat(model.startPos) {
                        startIndex = first.categoryIndex
                        startOffset = firstX - CGFloat(model.startPos)
                    }
                }
            }
            
            if let first = plotSeries.first, let last = plotSeries.last {
                if (CGFloat(model.startPos) + rect.size.width) >= first.rect.origin.x * model.scale * rect.size.width {
                    endIndex = first.categoryIndex
                    endOffset = last.rect.maxX * model.scale * rect.size.width - CGFloat(model.startPos) - rect.size.width
                }
            }
        }
        
        if startIndex > endIndex {
            endIndex = startIndex
        }
        
        return (startIndex, endIndex, startOffset, endOffset)
    }
    
    func columnHeight(from rectData: ChartPlotRectData, isPositiveArea: Bool) -> CGFloat {
        if (rectData.value >= 0 && isPositiveArea) || (rectData.value < 0 && !isPositiveArea) {
            return rectData.rect.size.height
        } else {
            return 0
        }
    }
    
    func generateClusteredPlotData(in rect: CGRect) -> [[ChartPlotRectData]] {
        var result: [[ChartPlotRectData]] = []
        let seriesCount = model.numOfSeries()
        let maxDataCount = model.numOfCategories(in: 0)
        
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        let columnWidth = clusterWidth / CGFloat(seriesCount)
        
        let tickValues = model.numericAxisTickValues
        let yScale = tickValues.plotScale
        let baselinePosition = tickValues.plotBaselinePosition
        let baselineValue = tickValues.plotBaselineValue
        let corruptDataHeight = yScale / 1000
        
        var clusteredX: CGFloat
        //
        // Loop through data points
        //
        for categoryIndex in 0 ..< maxDataCount {
            var seriesResult: [ChartPlotRectData] = []
            
            //
            // Loop through series
            //
            for seriesIndex in 0 ..< seriesCount {
                //
                // Calculate and define clustered column x positions.
                //
                clusteredX = columnXIncrement * CGFloat(categoryIndex)
                clusteredX += columnWidth * CGFloat(seriesIndex)
                var columnHeight = corruptDataHeight
                var clusteredY = baselinePosition
                var rawValue: CGFloat = 0
                //
                // Fetch value
                //
                let value = model.plotItemValue(at: seriesIndex, category: categoryIndex, dimension: 0)
                
                if let val = value {
                    rawValue = CGFloat(val)
                    if val >= 0.0 {
                        columnHeight = yScale * (CGFloat(val) - baselineValue)
                    } else {
                        columnHeight = -yScale * (CGFloat(val) - baselineValue)
                        clusteredY = baselinePosition - columnHeight
                    }
                }
                
                seriesResult.append(ChartPlotRectData(seriesIndex: seriesIndex,
                                                      categoryIndex: categoryIndex,
                                                      value: rawValue,
                                                      x: clusteredX,
                                                      y: clusteredY,
                                                      width: columnWidth,
                                                      height: columnHeight))
            }
            
            result.append(seriesResult)
        }
        
        return result
    }
}

// swiftlint:disable force_cast
struct ColumnView_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
            let model = $0.copy() as! ChartModel
            model.chartType = .column
            return model
        }
        
        return Group {
            ForEach(models) {
                ColumnView($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
