//
//  ColumnChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/3/20.
//

import SwiftUI

let ColumnGapFraction: CGFloat = 0.333333

struct ColumnChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(chartContext: ColumnChartContext(),
                    chartView: ColumnView(),
                    indicatorView: ColumnIndicatorView())
            .environmentObject(model)
    }
}

class ColumnChartContext: DefaultChartContext {
    override func xAxisLabels(_ model: ChartModel) -> [AxisTitle] {
        if let result = model.xAxisLabels[model.categoryAxis.labels.fontSize] {
            return result
        }
        
        var ret: [AxisTitle] = []
        let maxDataCount = model.numOfCategories()
        var startIndex = -1
        var endIndex = maxDataCount - 1
        
        if maxDataCount < 1 {
            return ret
        }
    
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        let startPosX = model.startPos.x * model.scale
        for index in 0...endIndex {
            let x = (columnXIncrement * CGFloat(index) + clusterWidth / 2.0) * model.scale
            if startIndex == -1 {
                if x >= startPosX {
                    startIndex = index
                }
            }

            if x < startPosX + 1 {
                endIndex = index
            }
        }
        
        for i in startIndex ... endIndex {
            let x = (columnXIncrement * CGFloat(i) + clusterWidth / 2.0) * model.scale // - startPosX
            
            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
            
            ret.append(AxisTitle(index: i,
                                 title: title,
                                 pos: CGPoint(x: x, y: 0),
                                 size: size))
        }
        
        model.xAxisLabels = [:]
        model.xAxisLabels = [model.categoryAxis.labels.fontSize: ret]
        
        return ret
    }
    
    override func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: true)
    }

    override func xAxisGridlines(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: false)
    }
    
    override func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool) -> [AxisTitle] {
        let maxDataCount = model.numOfCategories()
        
        if maxDataCount < 1 {
            return []
        }
    
        /// get xAxisLabels in relative position
        let ret: [AxisTitle] = xAxisLabels(model)
        
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        let startPosX = model.startPos.x * model.scale * rect.size.width
        
        if model.categoryAxis.labelLayoutStyle == .range {
            var result: [AxisTitle] = []
            if ret.count >= 1 {
                var item = ret[0]
                var x = item.pos.x * rect.size.width - startPosX
                if isLabel {
                    let tmpX = (item.pos.x - clusterWidth / 2.0) * rect.size.width - startPosX
                    x = max(0, tmpX) + min(item.size.width, (rect.size.width - 2) / 2) / 2
                }
                item.x(x)
                
                result.append(item)
                
                if ret.count >= 2, let last = ret.last {
                    var item = last
                    var x = item.pos.x * rect.size.width - startPosX
                    if isLabel {
                        let tmpX = (item.pos.x + clusterWidth / 2.0) * rect.size.width - startPosX
                        x =  min(tmpX, rect.size.width) - min(item.size.width, (rect.size.width - 2) / 2) / 2
                    }
                    item.x(x)
                    
                    result.append(item)
                }
            }
            
            return result
        } else {
            let result: [AxisTitle] = ret.map { item in
                var axisTitle = item
                axisTitle.x(item.pos.x * rect.size.width - startPosX)
                
                return axisTitle
            }

            return result
        }
    }
    
    override func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotData]] = []
        let seriesCount = model.numOfSeries()
        let maxDataCount = model.numOfCategories()
        
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
            var seriesResult: [ChartPlotData] = []
            
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
                
                seriesResult.append(ChartPlotData.rect(rect: ChartPlotRectData(seriesIndex: seriesIndex,
                                                      categoryIndex: categoryIndex,
                                                      value: rawValue,
                                                      x: clusteredX,
                                                      y: clusteredY,
                                                      width: columnWidth,
                                                      height: columnHeight)))
            }
            
            result.append(seriesResult)
        }
        
        model.plotDataCache = result
        
        return result
    }
    
    override func snapChartToPoint(_ model: ChartModel, at x: CGFloat, in rect: CGRect) -> CGFloat {
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let unitWidth = max(columnXIncrement * model.scale * rect.size.width, 1)
        let categoryIndex = Int(x / unitWidth + 0.5)
        let clusteredX = columnXIncrement * CGFloat(categoryIndex) * model.scale * rect.size.width
        
        return clusteredX
    }
    
    override func displayCategoryIndexesAndOffsets(_ model: ChartModel, rect: CGRect) -> (startIndex: Int, endIndex: Int, startOffset: CGFloat, endOffset: CGFloat) {
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let unitWidth = max(columnXIncrement * model.scale * rect.size.width, 1)
        let clusterWidth = columnXIncrement * model.scale * rect.size.width / (1.0 + ColumnGapFraction)
        let startPosX = model.startPos.x * model.scale * rect.size.width
        var startIndex = Int(startPosX / unitWidth).clamp(low: 0, high: maxDataCount - 1)
        var startOffset = unitWidth * CGFloat(startIndex) - startPosX
        if abs(startOffset) >= clusterWidth && startIndex < maxDataCount - 1 {
            startIndex += 1
            startOffset = unitWidth * CGFloat(startIndex) - startPosX
        }
        
        let endIndex = Int((startPosX + rect.size.width) / unitWidth).clamp(low: startIndex, high: maxDataCount - 1)
        let endOffset = columnXIncrement * CGFloat(endIndex) * model.scale * rect.size.width + clusterWidth - startPosX - rect.size.width
        
        return (startIndex, endIndex, startOffset, endOffset)
    }
    
    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let width = rect.size.width
        let pd = plotData(model)
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: width)
        
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let startPosX = model.startPos.x * model.scale * width
        let startIndex = Int((x + startPosX) / (columnXIncrement * model.scale * rect.size.width))
        if startIndex >= maxDataCount || startIndex < 0 {
            return (-1, -1)
        }

        for plotCat in pd[startIndex] {
            let xMin = plotCat.rect.minX * model.scale * width - startPosX
            let xMax = plotCat.rect.maxX * model.scale * width - startPosX
            
            if x >= xMin && x <= xMax {
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
        let startPosX = model.startPos.x * model.scale * rect.size.width
        let pd = plotData(model)
        let points = atPoints.map { (pt) -> CGPoint in
            let x = ChartUtility.xPos(pt.x,
                                      layoutDirection: layoutDirection,
                                      width: width)
            return CGPoint(x: x, y: pt.y)
        }.sorted { $0.x <= $1.x }
        
        var res: [(Int, Int)] = []
        
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement * model.scale * rect.size.width / (1.0 + ColumnGapFraction)

        // both fingers locate between two clusters, nothing is selected
        if let maxX = points.last?.x, let minX = points.first?.x {
            if maxX - minX < clusterWidth {
                let startIndex = Int((maxX + startPosX) / (columnXIncrement * model.scale * rect.size.width)).clamp(low: 0, high: maxDataCount - 1)
                if let plotCat = pd[startIndex].first {
                    let rightX = plotCat.rect.minX * model.scale * width + clusterWidth - startPosX

                    if minX > rightX {
                        return [(-1, -1), (-1, -1)]
                    }
                }
            }
        }
        
        for (index, pt) in points.enumerated() {
            let startIndex = Int((pt.x + startPosX) / (columnXIncrement * model.scale * rect.size.width)).clamp(low: 0, high: maxDataCount - 1)
            
            if let plotCat = pd[startIndex].first {
                let xMin = plotCat.rect.minX * model.scale * width - startPosX
                let xMax = xMin + clusterWidth//plotCat.rect.maxX * model.scale * width - startPosX
                
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
struct ColumnChart_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
           let model = $0.copy() as! ChartModel
           model.chartType = .column
           return model
        }
        
        return Group {
            ForEach(models) {
                ColumnChart(model: $0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
