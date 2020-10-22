//
//  SwiftUIView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/15/20.
//

import SwiftUI

struct StackedColumnChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(chartContext: StackedColumnChartContext(),
                    chartView: StackedColumnView(),
                    indicatorView: StackedColumnIndicatorView())
            .environmentObject(model)
    }
}

class StackedColumnChartContext: ColumnChartContext {    
    override func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotData]] = []
        let seriesCount = model.numOfSeries()
        let maxDataCount = model.numOfCategories()
        
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
                                      x: clusteredX,
                                      y: clusteredY,
                                      width: clusterWidth,
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
        let startPosX = model.startPos.x * model.scale * rect.size.width
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let unitWidth = max(columnXIncrement * model.scale * rect.size.width, 1)
        let clusterWidth = columnXIncrement * model.scale * rect.size.width / (1.0 + ColumnGapFraction)
        
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
        let startPosX = model.startPos.x * model.scale * width
        let pd = plotData(model)
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: width)
        
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        
        let startIndex = Int((x + startPosX) / (columnXIncrement * model.scale * rect.size.width))
        if startIndex >= maxDataCount || startIndex < 0 {
            return (-1, -1)
        }

        for plotCat in pd[startIndex] {
            let xMin = plotCat.rect.minX * model.scale * width - startPosX
            let xMax = plotCat.rect.maxX * model.scale * width - startPosX
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
        let startPosX = model.startPos.x * model.scale * width
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
                    let rightX = plotCat.rect.maxX * model.scale * width - startPosX
                    
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
                let xMax = plotCat.rect.maxX * model.scale * width - startPosX
                
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
                StackedColumnChart(model: $0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
