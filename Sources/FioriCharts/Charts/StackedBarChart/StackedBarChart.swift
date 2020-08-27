//
//  StackedBarChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 8/18/20.
//

import SwiftUI

struct StackedBarChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(axisDataSource: StackedBarAxisDataSource(),
                    chartView: StackedBarPlotView(),
                    indicatorView: StackedBarIndicatorView())
            .environmentObject(model)
    }
}

class StackedBarAxisDataSource: DefaultAxisDataSource {
    override func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: true)
    }
    
    override func xAxisGridlines(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: false)
    }
    
    func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool) -> [AxisTitle] {
        let ticks = model.numericAxisTickValues
        let axis = model.numericAxis
        
        let xAxisLabelsCount = Int(ticks.tickCount)
        if xAxisLabelsCount < 1 {
            return []
        }
        
        var xAxisLabels: [AxisTitle] = []
        let labelsIndex = model.categoryAxis.labelLayoutStyle == .allOrNothing ? Array(0 ... xAxisLabelsCount - 1) : (xAxisLabelsCount == 1 ? [0] : [0, xAxisLabelsCount - 1])
        
        for (index, i) in labelsIndex.enumerated() {
            var x = rect.size.width * ticks.tickPositions[xAxisLabelsCount - 1 - i]
            let val = ticks.tickValues[xAxisLabelsCount - 1 - i]
            let title = yAxisFormattedString(model, value: Double(val), secondary: false)
            
            if model.categoryAxis.labelLayoutStyle == .range && isLabel {
                let size = title.boundingBoxSize(with: axis.labels.fontSize)
                let tmpX = x
                if index == 0 {
                    x = max(0, tmpX) + min(size.width, (rect.size.width - 2) / 2) / 2
                } else {
                    x =  min(tmpX, rect.size.width) - min(size.width, (rect.size.width - 2) / 2) / 2
                }
            }
            
            xAxisLabels.append(AxisTitle(index: i,
                                         value: val,
                                         title: title,
                                         pos: CGPoint(x: x, y: 0)))
        }
        
        return xAxisLabels
    }
    
    override func yAxisLabels(_ model: ChartModel, rect: CGRect, layoutDirection: LayoutDirection = .leftToRight, secondary: Bool = false) -> [AxisTitle] {
        var yAxisLabels: [AxisTitle] = []
        let maxDataCount = model.numOfCategories(in: 0)
        
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterHeight = columnXIncrement / (1.0 + ColumnGapFraction)
        let endPosY = rect.size.height * model.scale - model.startPos.y
        let startPosY = endPosY - rect.size.height
        let (startIndex, endIndex, _, _) = displayCategoryIndexesAndOffsets(model, rect: rect)
        let labelsIndex = startIndex != endIndex ? Array(startIndex ... endIndex) : [startIndex]
        let axis = model.numericAxis
        
        for i in labelsIndex {
            let y = rect.origin.y + (columnXIncrement * CGFloat(i) + clusterHeight / 2.0) * model.scale * rect.size.height - startPosY
            
            // check if it is in display range
            if y >= 0 && y <= rect.size.height {
                let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
                
                let size = title.boundingBoxSize(with: axis.labels.fontSize)
                let x = rect.size.width - axis.baseline.width / 2.0 - 3 - size.width / 2.0
                
                yAxisLabels.append(AxisTitle(index: i,
                                             value: 0,
                                             title: title,
                                             pos: CGPoint(x: x, y: y)))
            }
        }
        
        return yAxisLabels
    }
    
    override func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotData]] = []
        let seriesCount = model.numOfSeries()
        let maxDataCount = model.numOfCategories(in: 0)
        
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        let columnWidth = clusterWidth
        
        let tickValues = model.numericAxisTickValues
        let yScale = tickValues.plotScale
        let baselinePosition = tickValues.plotBaselinePosition
        let baselineValue = tickValues.plotBaselineValue
        let corruptDataHeight = yScale / 1000
        
        var positiveStackHeights = Array(repeating: CGFloat(0), count: maxDataCount)
        var negativeStackHeights = Array(repeating: CGFloat(0), count: maxDataCount)
        
        var clusteredX: CGFloat
        //
        // Loop through data points
        //
        for categoryIndex in 0 ..< maxDataCount {
            var seriesResult: [ChartPlotData] = []
            
            //
            // Loop through series
            //
            for seriesIndex in 0 ..< seriesCount {
                //
                // Calculate and define clustered column x positions.
                //
                clusteredX = columnXIncrement * CGFloat(categoryIndex)
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
                        clusteredY = baselinePosition + positiveStackHeights[categoryIndex]
                        positiveStackHeights[categoryIndex] += columnHeight
                    } else {
                        columnHeight = -yScale * (CGFloat(val) - baselineValue)
                        clusteredY = baselinePosition - negativeStackHeights[categoryIndex] - columnHeight
                        negativeStackHeights[categoryIndex] += columnHeight
                    }
                }
                
                seriesResult.append(ChartPlotData.rect(rect:
                    ChartPlotRectData(seriesIndex: seriesIndex,
                                      categoryIndex: categoryIndex,
                                      value: rawValue,
                                      x: clusteredY,
                                      y: clusteredX,
                                      width: columnHeight,
                                      height: columnWidth)))
            }
            
            result.append(seriesResult)
        }
        
        model.plotDataCache = result
        
        return result
    }
    
    override func snapChartToPoint(_ model: ChartModel, at x: CGFloat, in rect: CGRect) -> CGFloat {
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let unitHeight = max(columnXIncrement * model.scale * rect.size.height, 1)
        let clusterHeight = columnXIncrement * model.scale * rect.size.height / (1.0 + ColumnGapFraction)
        
        let endPosY = rect.size.height * model.scale - x
        let startPosY = endPosY - rect.size.height + unitHeight - clusterHeight
        let maxIndex = maxDataCount + 1 - Int(rect.size.height / unitHeight).clamp(low: 0, high: maxDataCount - 1)
        let startIndex = Int(startPosY / unitHeight).clamp(low: 0, high: maxDataCount - 1).clamp(low: 0, high: maxIndex)
        
        for i in (0 ... startIndex).reversed() {
            let y = rect.size.height * (model.scale - 1) - CGFloat(i) * unitHeight
            
            if y >= 0 {
                return y
            }
        }
        
        return 0
    }
    
    override func displayCategoryIndexesAndOffsets(_ model: ChartModel, rect: CGRect) -> (startIndex: Int, endIndex: Int, startOffset: CGFloat, endOffset: CGFloat) {
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let unitHeight = max(columnXIncrement * model.scale * rect.size.height, 1)
        let clusterHeight = columnXIncrement * model.scale * rect.size.height / (1.0 + ColumnGapFraction)
        
        let endPosY = rect.size.height * model.scale - model.startPos.y
        let startPosY = endPosY - rect.size.height
        var startIndex = Int(startPosY / unitHeight).clamp(low: 0, high: maxDataCount - 1)
        var startOffset = unitHeight * CGFloat(startIndex) - startPosY
        
        if abs(startOffset) >= clusterHeight {
            startIndex += 1
            startOffset = unitHeight * CGFloat(startIndex) - startPosY
        }
        
        let endIndex = Int(endPosY / unitHeight).clamp(low: startIndex, high: maxDataCount - 1)
        let endOffset = unitHeight * CGFloat(endIndex) + clusterHeight - (rect.size.height * model.scale - model.startPos.y)
        
        return (startIndex, endIndex, startOffset, endOffset)
    }
    
    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let height = rect.size.height
        let pd = plotData(model)
        let y = atPoint.y
        
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let unitHeight = max(columnXIncrement * model.scale * rect.size.height, 1)
        
        let endPosY = rect.size.height * model.scale - model.startPos.y
        let startPosY = endPosY - rect.size.height
        let startIndex = Int((atPoint.y + startPosY) / unitHeight)
        if startIndex >= maxDataCount || startIndex < 0 {
            return (-1, -1)
        }
        
        for plotCat in pd[startIndex] {
            let xMin = plotCat.rect.minX * rect.size.width
            let xMax = plotCat.rect.maxX * rect.size.width
            
            let yMin = plotCat.rect.minY * model.scale * height - startPosY
            let yMax = plotCat.rect.maxY * model.scale * height - startPosY
            
            if atPoint.x >= xMin && atPoint.x <= xMax && y >= yMin && y <= yMax {
                return (plotCat.seriesIndex, plotCat.categoryIndex)
            }
        }
        
        return (-1, -1)
    }
    
    // range selection
    // swiftlint:disable cyclomatic_complexity
    override func closestSelectedPlotItems(_ model: ChartModel, atPoints: [CGPoint], rect: CGRect, layoutDirection: LayoutDirection) -> [(Int, Int)] {
        if atPoints.count != 2 {
            return []
        }
        
        let height = rect.size.height
        let pd = plotData(model)
        let points = atPoints.sorted { $0.y <= $1.y }
        
        var res: [(Int, Int)] = []
        
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let unitHeight = max(columnXIncrement * model.scale * rect.size.height, 1)
        let clusterHeight = columnXIncrement * model.scale * rect.size.height / (1.0 + ColumnGapFraction)
        let endPosY = rect.size.height * model.scale - model.startPos.y
        let startPosY = endPosY - rect.size.height
        
        // both fingers locate between two clusters, nothing is selected
        if let maxY = points.last?.y, let minY = points.first?.y {
            if maxY - minY < clusterHeight {
                let startIndex = Int((maxY + startPosY) / unitHeight).clamp(low: 0, high: maxDataCount - 1)
                if let plotCat = pd[startIndex].first {
                    let downY = plotCat.rect.minY * model.scale * height + clusterHeight - startPosY
                    
                    if minY > downY {
                        return [(-1, -1), (-1, -1)]
                    }
                }
            }
        }
        
        for (index, pt) in points.enumerated() {
            let startIndex = Int((pt.y + startPosY) / unitHeight).clamp(low: 0, high: maxDataCount - 1)
            
            if let plotCat = pd[startIndex].first {
                let yMin = plotCat.rect.minY * model.scale * height - startPosY
                let yMax = yMin + clusterHeight
                
                if index == 0 {
                    if (pt.y < yMin && pt.y < 0) || (pt.y >= yMin && pt.y <= yMax) {
                        res.append((plotCat.seriesIndex, plotCat.categoryIndex))
                    } else if pt.y > yMax {
                        res.append((plotCat.seriesIndex, min(plotCat.categoryIndex + 1, maxDataCount - 1)))
                    }
                } else {
                    if pt.y >= yMin && pt.y <= yMax {
                        res.append((plotCat.seriesIndex, plotCat.categoryIndex))
                        return res
                    } else if pt.y >= yMax {
                        res.append((plotCat.seriesIndex, plotCat.categoryIndex))
                        return res
                    }
                }
            }
        }
        
        return res
    }
}

struct StackedBarChart_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
           let model = $0
           model.chartType = .stackedBar
           return model
        }
        
        return Group {
            ForEach(models) {
                StackedBarChart(model: $0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
