//
//  SwiftUIView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/15/20.
//

import SwiftUI

struct StackedColumnChart: View {
    @ObservedObject var model: ChartModel

    public init(_ chartModel: ChartModel) {
        self.model = chartModel
    }
    
    var body: some View {
        XYAxisChart(model,
                    axisDataSource: StackedColumnAxisDataSource(),
                    chartView: StackedColumnView(model),
                    indicatorView: StackedColumnIndicatorView(model))
    }
}

class StackedColumnAxisDataSource: DefaultAxisDataSource {
    override func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: true)
    }

    override func xAxisGridlines(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: false)
    }
    
    func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool) -> [AxisTitle] {
        var ret: [AxisTitle] = []
        let maxDataCount = model.numOfCategories(in: 0)
        var startIndex = -1
        var endIndex = maxDataCount - 1
        
        if endIndex < 0 {
            return ret
        }
    
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        
        for index in 0...endIndex {
            let x = rect.origin.x + (columnXIncrement * CGFloat(index) + clusterWidth / 2.0) * model.scale * rect.size.width
            if startIndex == -1 {
                if x >= CGFloat(model.startPos) {
                    startIndex = index
                }
            }
            
            if x < CGFloat(model.startPos) + rect.size.width {
                endIndex = index
            }
        }
        
        let labelsIndex = model.categoryAxis.labelLayoutStyle == .allOrNothing ? Array(startIndex ... endIndex) : (startIndex != endIndex ? [startIndex, endIndex] : [startIndex])
        
        for (index, i) in labelsIndex.enumerated() {
            var x = rect.origin.x + (columnXIncrement * CGFloat(i) + clusterWidth / 2.0) * model.scale * rect.size.width - CGFloat(model.startPos)
            
            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            if model.categoryAxis.labelLayoutStyle == .range && isLabel {
                let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                if index == 0 {
                    let tmpX = rect.origin.x + columnXIncrement * CGFloat(i) * model.scale * rect.size.width - CGFloat(model.startPos)
                    x = max(0, tmpX) + min(size.width, (rect.size.width - 2) / 2) / 2
                } else {
                    let tmpX = rect.origin.x + (columnXIncrement * CGFloat(i) + clusterWidth) * model.scale * rect.size.width - CGFloat(model.startPos)
                    x =  min(tmpX, rect.size.width) - min(size.width, (rect.size.width - 2) / 2) / 2
                }
            }
            
            ret.append(AxisTitle(index: i,
                                 title: title,
                                 pos: CGPoint(x: x, y: 0)))
        }
        
        return ret
    }
    
    override func plotData(_ model: ChartModel) -> [[ChartPlotRectData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotRectData]] = []
        let seriesCount = model.numOfSeries()
        let maxDataCount = model.numOfCategories(in: 0)
        
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        
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
            var seriesResult: [ChartPlotRectData] = []
            
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
                
                seriesResult.append(ChartPlotRectData(seriesIndex: seriesIndex,
                                                      categoryIndex: categoryIndex,
                                                      value: rawValue,
                                                      x: clusteredX,
                                                      y: clusteredY,
                                                      width: clusterWidth,
                                                      height: columnHeight))
            }
            
            result.append(seriesResult)
        }
        
        model.plotDataCache = result
        
        return result
    }
    
    override func snapChartToPoint(_ model: ChartModel, at x: CGFloat, in rect: CGRect) -> CGFloat {
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let unitWidth = columnXIncrement * model.scale * rect.size.width
        let categoryIndex = Int(x / unitWidth + 0.5)
        let clusteredX = columnXIncrement * CGFloat(categoryIndex) * model.scale * rect.size.width
        
        return clusteredX
    }
    
    override func displayCategoryIndexesAndOffsets(_ model: ChartModel, rect: CGRect) -> (startIndex: Int, endIndex: Int, startOffset: CGFloat, endOffset: CGFloat) {
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let unitWidth = columnXIncrement * model.scale * rect.size.width
        let clusterWidth = columnXIncrement * model.scale * rect.size.width / (1.0 + ColumnGapFraction)
        
        let startIndex = Int(CGFloat(model.startPos) / unitWidth).clamp(low: 0, high: maxDataCount - 1)
        let startOffset = columnXIncrement * CGFloat(startIndex) * model.scale * rect.size.width - CGFloat(model.startPos)
        
        let endIndex = Int((CGFloat(model.startPos) + rect.size.width) / unitWidth).clamp(low: startIndex, high: maxDataCount - 1)
        let endOffset = columnXIncrement * CGFloat(endIndex) * model.scale * rect.size.width + clusterWidth - CGFloat(model.startPos) - rect.size.width
        
        return (startIndex, endIndex, startOffset, endOffset)
    }
    
    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let width = rect.size.width
        let pd = plotData(model)
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: width)
        
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        
        let startIndex = Int((x + CGFloat(model.startPos)) / (columnXIncrement * model.scale * rect.size.width))
        if startIndex >= maxDataCount || startIndex < 0 {
            return (-1, -1)
        }

        for plotCat in pd[startIndex] {
            let xMin = plotCat.rect.minX * model.scale * width - CGFloat(model.startPos)
            let xMax = plotCat.rect.maxX * model.scale * width - CGFloat(model.startPos)
            let yMax = (1.0 - plotCat.rect.minY) * rect.size.height
            let yMin = (1.0 - plotCat.rect.maxY) * rect.size.height
            
            if x >= xMin && x <= xMax && atPoint.y >= yMin && atPoint.y <= yMax {
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
        
        let width = rect.size.width
        let pd = plotData(model)
        let points = atPoints.map { (pt) -> CGPoint in
            let x = ChartUtility.xPos(pt.x,
                                      layoutDirection: layoutDirection,
                                      width: width)
            return CGPoint(x: x, y: pt.y)
        }.sorted { $0.x <= $1.x }
        
        var res: [(Int, Int)] = []
        
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement * model.scale * rect.size.width / (1.0 + ColumnGapFraction)

        // both fingers locate between two clusters, nothing is selected
        if let maxX = points.last?.x, let minX = points.first?.x {
            if maxX - minX < clusterWidth {
                let startIndex = Int((maxX + CGFloat(model.startPos)) / (columnXIncrement * model.scale * rect.size.width)).clamp(low: 0, high: maxDataCount - 1)
                if let plotCat = pd[startIndex].first {
                    let rightX = plotCat.rect.maxX * model.scale * width - CGFloat(model.startPos)
                    
                    if minX > rightX {
                        return [(-1, -1), (-1, -1)]
                    }
                }
            }
        }
        
        for (index, pt) in points.enumerated() {
            let startIndex = Int((pt.x + CGFloat(model.startPos)) / (columnXIncrement * model.scale * rect.size.width)).clamp(low: 0, high: maxDataCount - 1)
            
            if let plotCat = pd[startIndex].first {
                let xMin = plotCat.rect.minX * model.scale * width - CGFloat(model.startPos)
                let xMax = plotCat.rect.maxX * model.scale * width - CGFloat(model.startPos)
                
                if index == 0 {
                    if (pt.x < xMin && pt.x < 0) || (pt.x >= xMin && pt.x <= xMax) {
                        res.append((plotCat.seriesIndex, plotCat.categoryIndex))
                    } else if pt.x > xMax {
                        res.append((plotCat.seriesIndex, min(plotCat.categoryIndex + 1, maxDataCount - 1)))
                    }
                } else {
                    if pt.x >= xMin && pt.x <= xMax {
                        res.append((plotCat.seriesIndex, plotCat.categoryIndex))
                        return res
                    } else if pt.x >= xMax {
                        res.append((plotCat.seriesIndex, plotCat.categoryIndex))
                        return res
                    }
                }
            }
        }
        
        return res
    }
}

// swiftlint:disable force_cast
struct StackedColumnChart_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
           let model = $0.copy() as! ChartModel
            model.chartType = .stackedColumn
           return model
        }
        
        return Group {
            ForEach(models) {
                StackedColumnChart($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
