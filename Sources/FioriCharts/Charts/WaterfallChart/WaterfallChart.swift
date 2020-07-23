//
//  WaterfallChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/23/20.
//

import SwiftUI

struct WaterfallChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(axisDataSource: WaterfallAxisDataSource(),
                    chartView: WaterfallView(),
                    indicatorView: WaterfallIndicatorView())
            .environmentObject(model)
    }
}

class WaterfallAxisDataSource: StackedColumnAxisDataSource {
    override func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotData]] = []
        let maxDataCount = model.numOfCategories(in: 0)
        
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        
        let tickValues = model.numericAxisTickValues
        let yScale = tickValues.plotScale
        let baselinePosition = tickValues.plotBaselinePosition
        let baselineValue = tickValues.plotBaselineValue
        let corruptDataHeight = yScale / 10000000
        
        var clusteredX: CGFloat
        var subTotal: CGFloat = 0.0
        var origin = baselinePosition
        //
        // Loop through data points
        //
        for categoryIndex in 0 ..< maxDataCount {
            //
            // Calculate and define clustered column x positions.
            //
            clusteredX = columnXIncrement * CGFloat(categoryIndex)
            let isSubTotal = categoryIndex == 0 ? true : model.indexesOfTotalsCategories.contains(categoryIndex)
            var columnHeight = corruptDataHeight
            var clusteredY = baselinePosition
            var rawValue: CGFloat = 0
            
            //
            // Fetch value
            //
            let value = model.plotItemValue(at: 0, category: categoryIndex, dimension: 0)
            
            if isSubTotal {
                //
                // If the total index indicates it should be presented as a total column and the value is not provided, use calculated total.
                //
                if let val = value {
                    rawValue = CGFloat(val)
                } else {
                    rawValue = subTotal
                }
            } else {
                if let val = value {
                    rawValue = CGFloat(val)
                } else {
                    rawValue = 0
                }
                
                subTotal += rawValue
            }
            
            if rawValue >= 0 {
                columnHeight = yScale * ((rawValue < baselineValue || !isSubTotal) ? rawValue : (rawValue - baselineValue))
                clusteredY = isSubTotal ? baselinePosition : origin
                origin = clusteredY + columnHeight
            } else {
                columnHeight = -yScale * ((rawValue > baselineValue || !isSubTotal) ? rawValue : (rawValue - baselineValue))
                clusteredY = isSubTotal ? baselinePosition - columnHeight : origin - columnHeight
                origin = clusteredY
            }
            
            let rectData = ChartPlotData.rect(rect: ChartPlotRectData(seriesIndex: 0,
                                                                      categoryIndex: categoryIndex,
                                                                      value: rawValue,
                                                                      x: clusteredX,
                                                                      y: clusteredY,
                                                                      width: clusterWidth,
                                                                      height: columnHeight))
            
            result.append([rectData])
        }
        
        model.plotDataCache = result
        
        return result
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
        
        for plotCat in pd[startIndex] {
            let xMin = plotCat.rect.minX * model.scale * width - model.startPos.x
            let xMax = plotCat.rect.maxX * model.scale * width - model.startPos.x
            
            if x >= xMin && x <= xMax {
                return (plotCat.seriesIndex, plotCat.categoryIndex)
            }
        }
        
        return (-1, -1)
    }
}

struct WaterfallChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.waterfallModels) {
                WaterfallChart(model: $0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
