import SwiftUI

struct ColumnChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(model: model,
                    chartContext: ColumnChartContext(),
                    chartView: ColumnView(),
                    indicatorView: EmptyView())
    }
}

class ColumnChartContext: DefaultChartContext {
    override func columnWidth(_ model: ChartModel) -> CGFloat {
        let seriesCount = model.numOfSeries()
        let maxDataCount = model.numOfCategories()
        
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
        let columnWidth = clusterWidth / CGFloat(max(1, seriesCount))
        
        return columnWidth
    }
    
    override func xAxisLabels(_ model: ChartModel) -> [AxisTitle] {
        if let result = model.xAxisLabels[model.categoryAxis.labels.fontSize] {
            return result
        }
        
        var ret: [AxisTitle] = []
        let maxDataCount = model.numOfCategories()

        if maxDataCount < 1 {
            return ret
        }
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
        
        for i in 0 ..< maxDataCount {
            let x = (columnXIncrement * CGFloat(i) + clusterWidth / 2.0)
            
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
    
    override func xAxisLabels(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        self.xAxisGridLineLabels(model, rect: rect, isLabel: true, plotViewSize: plotViewSize)
    }

    override func xAxisGridlines(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        self.xAxisGridLineLabels(model, rect: rect, isLabel: false, plotViewSize: plotViewSize)
    }
    
    // swiftlint:disable cyclomatic_complexity
    override func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool, plotViewSize: CGSize) -> [AxisTitle] {
        let maxDataCount = model.numOfCategories()
        
        if maxDataCount < 1 {
            return []
        }
    
        /// get xAxisLabels in relative position
        let ret: [AxisTitle] = self.xAxisLabels(model)
        
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
        let tmpScaleX = scaleX(model, plotViewSize: plotViewSize)
        let tmpStartPosition = startPosition(model, plotViewSize: plotViewSize)
        let startPosX = tmpStartPosition.x * tmpScaleX * rect.size.width
        let unitWidth = max(columnXIncrement * tmpScaleX * rect.size.width, ChartViewLayout.minUnitWidth)
        var startIndex = Int(startPosX / unitWidth).clamp(low: 0, high: maxDataCount - 1)
        if model.categoryAxis.labelLayoutStyle == .range {
            if tmpStartPosition.x > CGFloat(startIndex) * columnXIncrement + clusterWidth {
                startIndex += 1
            }
        } else {
            if tmpStartPosition.x > CGFloat(startIndex) * columnXIncrement + clusterWidth / 2 {
                startIndex += 1
            }
        }
        
        if startIndex >= maxDataCount {
            return []
        }
        
        let endIndex = Int((startPosX + rect.size.width) / unitWidth).clamp(low: startIndex, high: maxDataCount - 1)
        let catIndexRange = startIndex ... endIndex
        
        if model.categoryAxis.labelLayoutStyle == .range {
            var result: [AxisTitle] = []
            if catIndexRange.count >= 1 {
                var item = ret[catIndexRange.lowerBound]
                var x = item.pos.x * tmpScaleX * rect.size.width - startPosX
                if isLabel {
                    let tmpX = (item.pos.x - clusterWidth / 2.0) * tmpScaleX * rect.size.width - startPosX
                    x = max(0, tmpX) + min(item.size.width, (rect.size.width - 2) / 2) / 2
                }
                item.x(x)
                
                result.append(item)
                
                if catIndexRange.count >= 2 {
                    var item = ret[catIndexRange.upperBound]
                    var x = item.pos.x * tmpScaleX * rect.size.width - startPosX
                    if isLabel {
                        let tmpX = (item.pos.x + clusterWidth / 2.0) * tmpScaleX * rect.size.width - startPosX
                        x = min(tmpX, rect.size.width) - min(item.size.width, (rect.size.width - 2) / 2) / 2
                    }
                    item.x(x)
                    
                    result.append(item)
                }
            }
            
            return result
        } else {
            var result = [AxisTitle]()

            for label in ret {
                let x = label.pos.x * tmpScaleX * rect.size.width - startPosX
                var axisTitle = label
                axisTitle.x(x)
                
                result.append(axisTitle)
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
        
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
        let columnWidth = clusterWidth / CGFloat(max(1, seriesCount))
        
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
    
    override func plotPath(_ model: ChartModel) -> [[[Path]]] {
        if !model.path.isEmpty {
            return model.path
        }
    
        var result = [[[Path]]]()
        let seriesCount = model.numOfSeries()
        
        for seriesIndex in 0 ..< seriesCount {
            let seriesPath = plotColumnPath(model, for: seriesIndex)
            
            result.append(seriesPath)
        }

        model.path = result
        
        return result
    }
    
    override func snapChartToPoint(_ model: ChartModel, at x: CGFloat) -> CGFloat {
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let unitWidth = max(columnXIncrement, ChartViewLayout.minUnitWidth)
        let categoryIndex = Int(x / unitWidth + 0.5).clamp(low: 0, high: maxDataCount)
        let clusteredX = columnXIncrement * CGFloat(categoryIndex)
        
        return clusteredX
    }
    
    override func displayCategoryIndexes(_ model: ChartModel, rect: CGRect) -> ClosedRange<Int> {
        let tmpScaleX = scaleX(model, plotViewSize: rect.size)
        let tmpStartPosition = startPosition(model, plotViewSize: rect.size)
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let unitWidth = max(columnXIncrement * tmpScaleX * rect.size.width, ChartViewLayout.minUnitWidth)
        let clusterWidth = columnXIncrement * tmpScaleX * rect.size.width / (1.0 + ChartViewLayout.columnGapFraction)
        let startPosX = tmpStartPosition.x * tmpScaleX * rect.size.width
        var startIndex = Int(startPosX / unitWidth).clamp(low: 0, high: maxDataCount - 1)
        let startOffset = unitWidth * CGFloat(startIndex) - startPosX
        if abs(startOffset) >= clusterWidth, startIndex < maxDataCount - 1 {
            startIndex += 1
        }
        
        let endIndex = Int((startPosX + rect.size.width) / unitWidth).clamp(low: startIndex, high: maxDataCount - 1)
        
        return startIndex ... endIndex
    }
    
    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let width = rect.size.width
        let pd = self.plotData(model)
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: width)
        let tmpScaleX = scaleX(model, plotViewSize: rect.size)
        let tmpStartPosition = startPosition(model, plotViewSize: rect.size)
        
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let unitWidth = max(columnXIncrement * tmpScaleX * rect.size.width, ChartViewLayout.minUnitWidth)
        let startPosX = tmpStartPosition.x * tmpScaleX * width
        let startIndex = Int((x + startPosX) / unitWidth)
        if startIndex >= maxDataCount || startIndex < 0 {
            return (-1, -1)
        }

        for plotCat in pd[startIndex] {
            let xMin = plotCat.rect.minX * tmpScaleX * width - startPosX
            let xMax = plotCat.rect.maxX * tmpScaleX * width - startPosX
            
            if x >= xMin, x <= xMax {
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
        let tmpScaleX = scaleX(model, plotViewSize: rect.size)
        let tmpStartPosition = startPosition(model, plotViewSize: rect.size)
        
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement * tmpScaleX * rect.size.width / (1.0 + ChartViewLayout.columnGapFraction)
        let unitWidth = max(columnXIncrement * tmpScaleX * rect.size.width, ChartViewLayout.minUnitWidth)
        let startPosX = tmpStartPosition.x * tmpScaleX * width

        let pd = self.plotData(model)
        let points = atPoints.map { (pt) -> CGPoint in
            let x = ChartUtility.xPos(pt.x,
                                      layoutDirection: layoutDirection,
                                      width: width)
            return CGPoint(x: x, y: pt.y)
        }.sorted { $0.x <= $1.x }
        
        var res: [(Int, Int)] = []

        // both fingers locate between two clusters, nothing is selected
        if let maxX = points.last?.x, let minX = points.first?.x {
            if maxX - minX < clusterWidth {
                let startIndex = Int((maxX + startPosX) / unitWidth).clamp(low: 0, high: maxDataCount - 1)
                if let plotCat = pd[startIndex].first {
                    let rightX = plotCat.rect.minX * tmpScaleX * width + clusterWidth - startPosX

                    if minX > rightX {
                        return [(-1, -1), (-1, -1)]
                    }
                }
            }
        }
        
        for (index, pt) in points.enumerated() {
            let startIndex = Int((pt.x + startPosX) / unitWidth).clamp(low: 0, high: maxDataCount - 1)
            
            if let plotCat = pd[startIndex].first {
                let xMin = plotCat.rect.minX * tmpScaleX * width - startPosX
                let xMax = xMin + clusterWidth // plotCat.rect.maxX * tmpScaleX * width - startPosX
                
                if index == 0 {
                    if (pt.x < xMin && pt.x < 0) || (pt.x >= xMin && pt.x <= xMax) {
                        res.append((plotCat.seriesIndex, plotCat.categoryIndex))
                    } else if pt.x > xMax {
                        res.append((plotCat.seriesIndex, min(plotCat.categoryIndex + 1, maxDataCount - 1)))
                    }
                } else {
                    if pt.x >= xMin, pt.x <= xMax {
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
