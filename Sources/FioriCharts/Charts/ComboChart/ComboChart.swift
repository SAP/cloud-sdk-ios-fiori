//
//  ComboChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/30/20.
//

import SwiftUI

struct ComboChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(axisDataSource: ComboAxisDataSource(),
                    chartView: ComboView(),
                    indicatorView: ComboIndicatorView())
            .environmentObject(model)
    }
}

class ComboAxisDataSource: DefaultAxisDataSource {
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
                if x >= model.startPos.x {
                    startIndex = index
                }
            }
            
            if x < model.startPos.x + rect.size.width {
                endIndex = index
            }
        }
        
        let labelsIndex = model.categoryAxis.labelLayoutStyle == .allOrNothing ? Array(startIndex ... endIndex) : (startIndex != endIndex ? [startIndex, endIndex] : [startIndex])
        
        for (index, i) in labelsIndex.enumerated() {
            var x = rect.origin.x + (columnXIncrement * CGFloat(i) + clusterWidth / 2.0) * model.scale * rect.size.width - model.startPos.x
            
            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            if model.categoryAxis.labelLayoutStyle == .range && isLabel {
                let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                if index == 0 {
                    let tmpX = rect.origin.x + columnXIncrement * CGFloat(i) * model.scale * rect.size.width - model.startPos.x
                    x = max(0, tmpX) + min(size.width, (rect.size.width - 2) / 2) / 2
                } else {
                    let tmpX = rect.origin.x + (columnXIncrement * CGFloat(i) + clusterWidth) * model.scale * rect.size.width - model.startPos.x
                    x =  min(tmpX, rect.size.width) - min(size.width, (rect.size.width - 2) / 2) / 2
                }
            }
            
            ret.append(AxisTitle(index: i,
                                 title: title,
                                 pos: CGPoint(x: x, y: 0)))
        }
        
        return ret
    }
        
    override func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotData]] = []
        let columnSeries = model.indexesOfColumnSeries.sorted()
        let columnSeriesCount = max(1, columnSeries.count)
        let maxDataCount = model.numOfCategories(in: 0)
        let seriesCount = model.numOfSeries()
        
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        let columnWidth = clusterWidth / CGFloat(columnSeriesCount)
        let corruptDataHeight: CGFloat = 1.0 / 1000000
        
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
                let isSeconday = model.indexesOfSecondaryValueAxis.contains(seriesIndex)
                
                let tickValues = isSeconday ? model.secondaryNumericAxisTickValues : model.numericAxisTickValues
                let yScale = tickValues.plotScale
                let baselinePosition = tickValues.plotBaselinePosition
                let baselineValue = tickValues.plotBaselineValue
                
                clusteredX = columnXIncrement * CGFloat(categoryIndex)
                clusteredX += columnWidth * CGFloat((columnSeries.firstIndex(of: seriesIndex) ?? 0))
                var columnHeight = corruptDataHeight
                var clusteredY = baselinePosition
                var rawValue: CGFloat = 0
                //
                // Fetch value
                //
                let value = model.plotItemValue(at: seriesIndex, category: categoryIndex, dimension: 0)
                
                // it is a column series
                if columnSeries.contains(seriesIndex) {
                    if let val = value {
                        rawValue = CGFloat(val)
                        if val >= 0.0 {
                            columnHeight = yScale * (CGFloat(val) - baselineValue)
                        } else {
                            columnHeight = -yScale * (CGFloat(val) - baselineValue)
                            clusteredY = baselinePosition - columnHeight
                        }
                    }
                    
                    seriesResult.append(ChartPlotData.rect(rect: ChartPlotRectData(seriesIndex: seriesIndex,
                                                                                   categoryIndex: categoryIndex,
                                                                                   value: rawValue,
                                                                                   x: clusteredX,
                                                                                   y: clusteredY,
                                                                                   width: columnWidth,
                                                                                   height: columnHeight)))
                } else { // it is a line series
                    clusteredX = columnXIncrement * CGFloat(categoryIndex) + clusterWidth / 2.0
                    
                    if let val = value {
                        rawValue = CGFloat(val)
                        if val >= 0.0 {
                            columnHeight = yScale * (CGFloat(val) - baselineValue)
                            clusteredY = baselinePosition + columnHeight
                        } else {
                            columnHeight = -yScale * (CGFloat(val) - baselineValue)
                            clusteredY = baselinePosition - columnHeight
                        }
                    }
                    
                    seriesResult.append(ChartPlotData.point(point: ChartPlotPointData(seriesIndex: seriesIndex,
                                                                                   categoryIndex: categoryIndex,
                                                                                   value: rawValue,
                                                                                   x: clusteredX,
                                                                                   y: clusteredY)))
                }
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
        
        let startIndex = Int(model.startPos.x / unitWidth - 1).clamp(low: 0, high: maxDataCount - 1)
        let startOffset = columnXIncrement * CGFloat(startIndex) * model.scale * rect.size.width - model.startPos.x

        let endIndex = Int((model.startPos.x + rect.size.width) / unitWidth + 1).clamp(low: startIndex, high: maxDataCount - 1)
        let endOffset = columnXIncrement * CGFloat(endIndex) * model.scale * rect.size.width + clusterWidth - model.startPos.x - rect.size.width
        
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
        
        let startIndex = Int((x + model.startPos.x) / (columnXIncrement * model.scale * rect.size.width))
        if startIndex >= maxDataCount || startIndex < 0 {
            return (-1, -1)
        }

        var foundSeriesIndex = -1
        var foundCategoryIndex = -1
        for plotCat in pd[startIndex] {
            if plotCat.isPlotRectData {
                let xMin = plotCat.rect.minX * model.scale * width - model.startPos.x
                let xMax = plotCat.rect.maxX * model.scale * width - model.startPos.x
                let yMax = (1.0 - plotCat.rect.minY) * rect.size.height
                let yMin = (1.0 - plotCat.rect.maxY) * rect.size.height
                
                if x >= xMin && x <= xMax && atPoint.y >= yMin && atPoint.y <= yMax {
                    foundSeriesIndex = plotCat.seriesIndex
                    foundCategoryIndex = plotCat.categoryIndex
                }
            } else { // it is a point
                let diameter = model.seriesAttributes[plotCat.seriesIndex].point.diameter
                let xMin = plotCat.pos.x * model.scale * width - diameter - model.startPos.x
                let xMax = plotCat.pos.x * model.scale * width + diameter - model.startPos.x
                
                let yMax = (1.0 - plotCat.pos.y) * rect.size.height + diameter
                let yMin = (1.0 - plotCat.pos.y) * rect.size.height - diameter
                
                if x >= xMin && x <= xMax && atPoint.y >= yMin && atPoint.y <= yMax {
                    foundSeriesIndex = plotCat.seriesIndex
                    foundCategoryIndex = plotCat.categoryIndex
                    
                    return (foundSeriesIndex, foundCategoryIndex)
                }
            }
        }
        
        return (foundSeriesIndex, foundCategoryIndex)
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
                let startIndex = Int((maxX + model.startPos.x) / (columnXIncrement * model.scale * rect.size.width)).clamp(low: 0, high: maxDataCount - 1)
                if let plotCat = pd[startIndex].first {
                    let rightX = plotCat.rect.minX * model.scale * width + clusterWidth - model.startPos.x

                    if minX > rightX {
                        return [(-1, -1), (-1, -1)]
                    }
                }
            }
        }
        
        for (index, pt) in points.enumerated() {
            let startIndex = Int((pt.x + model.startPos.x) / (columnXIncrement * model.scale * rect.size.width)).clamp(low: 0, high: maxDataCount - 1)
            
            if let plotCat = pd[startIndex].first {
                let xMin = plotCat.rect.minX * model.scale * width - model.startPos.x
                let xMax = xMin + clusterWidth//plotCat.rect.maxX * model.scale * width - model.startPos.x
                
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

struct ComboChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.comboModels) {
                ComboChart(model: $0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
