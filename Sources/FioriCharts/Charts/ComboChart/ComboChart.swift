import SwiftUI

struct ComboChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(model: model,
                    chartContext: ComboChartContext(),
                    chartView: ComboView(),
                    indicatorView: LineIndicatorView())
    }
}

class ComboChartContext: ColumnChartContext {
    override func columnWidth(_ model: ChartModel) -> CGFloat {
        let columnSeries = model.indexesOfColumnSeries.sorted()
        let columnSeriesCount = max(1, columnSeries.count)
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
        let columnWidth = clusterWidth / CGFloat(max(1, columnSeriesCount))
        
        return columnWidth
    }
    
    override func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotData]] = []
        let columnSeries = model.indexesOfColumnSeries.sorted()
        let columnSeriesCount = max(1, columnSeries.count)
        let maxDataCount = model.numOfCategories()
        let seriesCount = model.numOfSeries()
        
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
        let columnWidth = clusterWidth / CGFloat(max(1, columnSeriesCount))
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
                clusteredX += columnWidth * CGFloat(columnSeries.firstIndex(of: seriesIndex) ?? 0)
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
    
    override func plotPath(_ model: ChartModel) -> [[[Path]]] {
        if !model.path.isEmpty {
            return model.path
        }
        
        var result = [[[Path]]]()
        
        for seriesIndex in 0 ..< model.numOfSeries() {
            if model.indexesOfColumnSeries.contains(seriesIndex) {
                result.append(plotColumnPath(model, for: seriesIndex))
            } else {
                result.append(plotLinePath(model, for: seriesIndex))
            }
        }
    
        model.path = result
        
        return result
    }

    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let width = rect.size.width
        let pd = self.plotData(model)
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: width)
        
        let tmpScaleX = scaleX(model, plotViewSize: rect.size)
        let tmpScaleY = scaleY(model, plotViewSize: rect.size)
        let tmpStartPosition = startPosition(model, plotViewSize: rect.size)
        
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let unitWidth = max(columnXIncrement * tmpScaleX * rect.size.width, ChartViewLayout.minUnitWidth)
        let startPosX = tmpStartPosition.x * tmpScaleX * width
        let startIndex = Int((x + startPosX) / unitWidth)
        if startIndex >= maxDataCount || startIndex < 0 {
            return (-1, -1)
        }

        var foundSeriesIndex = -1
        var foundCategoryIndex = -1
        for plotCat in pd[startIndex] {
            if plotCat.isPlotRectData {
                let xMin = plotCat.rect.minX * tmpScaleX * width - startPosX
                let xMax = plotCat.rect.maxX * tmpScaleX * width - startPosX
                let yMax = (1.0 - plotCat.rect.minY - tmpStartPosition.y) * tmpScaleY * rect.size.height
                let yMin = (1.0 - plotCat.rect.maxY - tmpStartPosition.y) * tmpScaleY * rect.size.height
                
                if x >= xMin, x <= xMax, atPoint.y >= yMin, atPoint.y <= yMax {
                    foundSeriesIndex = plotCat.seriesIndex
                    foundCategoryIndex = plotCat.categoryIndex
                }
            } else { // it is a point
                let diameter = model.seriesAttributes[plotCat.seriesIndex].point.diameter
                let xMin = plotCat.pos.x * tmpScaleX * width - diameter - startPosX
                let xMax = plotCat.pos.x * tmpScaleX * width + diameter - startPosX
                
                let yMax = (1.0 - plotCat.pos.y - tmpStartPosition.y) * tmpScaleY * rect.size.height + diameter
                let yMin = (1.0 - plotCat.pos.y - tmpStartPosition.y) * tmpScaleY * rect.size.height - diameter
                
                if x >= xMin, x <= xMax, atPoint.y >= yMin, atPoint.y <= yMax {
                    foundSeriesIndex = plotCat.seriesIndex
                    foundCategoryIndex = plotCat.categoryIndex
                    
                    return (foundSeriesIndex, foundCategoryIndex)
                }
            }
        }
        
        return (foundSeriesIndex, foundCategoryIndex)
    }
    
    // range selection
    override func closestSelectedPlotItems(_ model: ChartModel, atPoints: [CGPoint], rect: CGRect, layoutDirection: LayoutDirection) -> [(Int, Int)] {
        if atPoints.count != 2 {
            return []
        }
        
        let width = rect.size.width
        let pd = self.plotData(model)
        let points = atPoints.map { (pt) -> CGPoint in
            let x = ChartUtility.xPos(pt.x,
                                      layoutDirection: layoutDirection,
                                      width: width)
            return CGPoint(x: x, y: pt.y)
        }.sorted { $0.x <= $1.x }
        
        var res: [(Int, Int)] = []
        
        let tmpScaleX = scaleX(model, plotViewSize: rect.size)
        let tmpStartPosition = startPosition(model, plotViewSize: rect.size)
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement * tmpScaleX * rect.size.width / (1.0 + ChartViewLayout.columnGapFraction)
        let startPosX = tmpStartPosition.x * tmpScaleX * width
        
        // both fingers locate between two clusters, nothing is selected
        if let maxX = points.last?.x, let minX = points.first?.x {
            if maxX - minX < clusterWidth {
                let startIndex = Int((maxX + startPosX) / (columnXIncrement * tmpScaleX * rect.size.width)).clamp(low: 0, high: maxDataCount - 1)
                if let plotCat = pd[startIndex].first {
                    let rightX = plotCat.rect.minX * tmpScaleX * width + clusterWidth - startPosX

                    if minX > rightX {
                        return [(-1, -1), (-1, -1)]
                    }
                }
            }
        }
        
        for (index, pt) in points.enumerated() {
            let startIndex = Int((pt.x + startPosX) / (columnXIncrement * tmpScaleX * rect.size.width)).clamp(low: 0, high: maxDataCount - 1)
            
            if let plotCat = pd[startIndex].first {
                let xMin = plotCat.rect.minX * tmpScaleX * width - startPosX
                let xMax = xMin + clusterWidth
                
                if index == 0 {
                    if pt.x > xMax {
                        res.append((plotCat.seriesIndex, min(plotCat.categoryIndex + 1, maxDataCount - 1)))
                    } else {
                        res.append((plotCat.seriesIndex, plotCat.categoryIndex))
                    }
                } else {
                    res.append((plotCat.seriesIndex, plotCat.categoryIndex))
                    return res
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
