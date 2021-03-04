import SwiftUI

struct StackedBarChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(model: model,
                    chartContext: StackedBarChartContext(),
                    chartView: ColumnView(),
                    indicatorView: EmptyView())
    }
}

class StackedBarChartContext: BarChartContext {
    override func columnWidth(_ model: ChartModel) -> CGFloat {
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
        
        return clusterWidth
    }
    
    override func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotData]] = []
        let seriesCount = model.numOfSeries()
        let maxDataCount = model.numOfCategories()
        
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
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
    
    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let height = rect.size.height
        let tmpScaleX = scaleX(model, plotViewSize: rect.size)
        let tmpScaleY = scaleY(model, plotViewSize: rect.size)
        let tmpStartPosition = startPosition(model, plotViewSize: rect.size)
        let startPosX = tmpStartPosition.x * tmpScaleX * rect.size.width
        let startPosY = tmpStartPosition.y * tmpScaleY * rect.size.height
        let pd = self.plotData(model)
        
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let unitHeight = max(columnXIncrement * tmpScaleY * rect.size.height, ChartViewLayout.minUnitWidth)
        let startIndex = Int((atPoint.y + startPosY) / unitHeight).clamp(low: 0, high: maxDataCount - 1)
        
        for plotCat in pd[startIndex] {
            let xMin = plotCat.rect.minX * tmpScaleX * rect.size.width - startPosX
            let xMax = plotCat.rect.maxX * tmpScaleX * rect.size.width - startPosX
            
            let yMin = plotCat.rect.minY * tmpScaleY * height - startPosY
            let yMax = plotCat.rect.maxY * tmpScaleY * height - startPosY
            
            if atPoint.x >= xMin, atPoint.x <= xMax, atPoint.y >= yMin, atPoint.y <= yMax {
                return (plotCat.seriesIndex, plotCat.categoryIndex)
            }
        }
        
        return (-1, -1)
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
