import SwiftUI

struct BarChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(model: model,
                    chartContext: BarChartContext(),
                    chartView: ColumnView(),
                    indicatorView: EmptyView())
    }
}

class BarChartContext: ColumnChartContext {
    override func xAxisLabels(_ model: ChartModel) -> [AxisTitle] {
        if let result = model.yAxisLabels[model.numericAxis.labels.fontSize] {
            return result
        }
    
        let ticks = model.numericAxisTickValues
        let axis = model.numericAxis
        
        let xAxisLabelsCount = Int(ticks.tickCount)
        if xAxisLabelsCount < 1 {
            return []
        }
        
        var xAxisLabels: [AxisTitle] = []
        for i in 0 ... xAxisLabelsCount - 1 {
            let x = ticks.tickPositions[xAxisLabelsCount - 1 - i]
            let val = ticks.tickValues[xAxisLabelsCount - 1 - i]
            let title = yAxisFormattedString(model, value: Double(val), secondary: false)
            let size = title.boundingBoxSize(with: axis.labels.fontSize)
            
            xAxisLabels.append(AxisTitle(index: i,
                                         value: val,
                                         title: title,
                                         pos: CGPoint(x: x, y: 0),
                                         size: size))
        }
        
        model.yAxisLabels = [:]
        model.yAxisLabels = [model.numericAxis.labels.fontSize: xAxisLabels]
        
        return xAxisLabels
    }
    
    override func xAxisLabels(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        self.xAxisGridLineLabels(model, rect: rect, isLabel: true, plotViewSize: plotViewSize)
    }

    override func xAxisGridlines(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        self.xAxisGridLineLabels(model, rect: rect, isLabel: false, plotViewSize: plotViewSize)
    }
    
    override func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool, plotViewSize: CGSize) -> [AxisTitle] {
        let tmpLabels = self.xAxisLabels(model)
        let tmpScaleX = scaleX(model, plotViewSize: plotViewSize)
        let tmpStartPosition = startPosition(model, plotViewSize: plotViewSize)
        let startX = tmpStartPosition.x * tmpScaleX * rect.size.width
        let labels = tmpLabels.compactMap { (label) -> AxisTitle? in
            let x = label.pos.x * tmpScaleX * rect.size.width - startX
            if x >= 0, x <= rect.size.width + 0.1 {
                return label
            } else {
                return nil
            }
        }
        
        if model.categoryAxis.labelLayoutStyle == .range {
            var result: [AxisTitle] = []
            if labels.count >= 1 {
                var item = labels[0]
                var x = item.pos.x * tmpScaleX * rect.size.width - startX
                if isLabel {
                    let tmpX = x
                    x = max(0, tmpX) + min(item.size.width, (rect.size.width - 2) / 2) / 2
                }
                item.x(x)
                
                result.append(item)
                
                if labels.count >= 2, let last = labels.last {
                    var item = last
                    var x = item.pos.x * tmpScaleX * rect.size.width - startX
                    if isLabel {
                        let tmpX = x
                        x = min(tmpX, rect.size.width) - min(item.size.width, (rect.size.width - 2) / 2) / 2
                    }
                    item.x(x)
                    
                    result.append(item)
                }
            }
            
            return result
        } else {
            let result: [AxisTitle] = labels.map { item in
                var axisTitle = item
                axisTitle.x(item.pos.x * tmpScaleX * rect.size.width - startX)
                
                return axisTitle
            }
            
            return result
        }
    }
    
    override func yAxisLabels(_ model: ChartModel, layoutDirection: LayoutDirection, secondary: Bool) -> [AxisTitle] {
        if let result = model.xAxisLabels[model.categoryAxis.labels.fontSize] {
            return result
        }
        
        var yAxisLabels: [AxisTitle] = []
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterHeight = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
        let axis = model.categoryAxis
        
        for i in 0 ..< maxDataCount {
            let y = columnXIncrement * CGFloat(i) + clusterHeight / 2.0

            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            
            let size = title.boundingBoxSize(with: axis.labels.fontSize)
            yAxisLabels.append(AxisTitle(index: i,
                                         value: 0,
                                         title: title,
                                         pos: CGPoint(x: 0, y: y),
                                         size: size))
        }
        
        model.xAxisLabels = [:]
        model.xAxisLabels = [model.categoryAxis.labels.fontSize: yAxisLabels]
        
        return yAxisLabels
    }
    
    override func yAxisLabels(_ model: ChartModel, layoutDirection: LayoutDirection = .leftToRight, secondary: Bool = false, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        var res: [AxisTitle] = []
        
        let tmpScaleY = scaleY(model, plotViewSize: plotViewSize)
        let tmpStartPosition = startPosition(model, plotViewSize: plotViewSize)
        let startPosY = tmpStartPosition.y * tmpScaleY * rect.size.height
        let axis = model.categoryAxis
        let labels = self.yAxisLabels(model, layoutDirection: layoutDirection, secondary: secondary)
        
        for label in labels {
            let y = label.pos.y * tmpScaleY * rect.size.height - startPosY
            
            // check if it is in display range
//            if y >= 0 && y <= rect.size.height {
            let size = label.size
                
            var x = rect.size.width - size.width / 2.0 - axis.baseline.width / 2.0 - ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline
            x = max(rect.size.width / 2 - axis.baseline.width / 2.0 - ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline, x)
                
            res.append(AxisTitle(index: label.index,
                                 value: label.value,
                                 title: label.title,
                                 pos: CGPoint(x: x, y: y),
                                 size: size))
//            }
        }
        
        return res
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
    
    override func displayCategoryIndexes(_ model: ChartModel, rect: CGRect) -> ClosedRange<Int> {
        let maxDataCount = model.numOfCategories()
        let tmpScaleY = scaleY(model, plotViewSize: rect.size)
        let tmpStartPosition = startPosition(model, plotViewSize: rect.size)
        let startPosY = tmpStartPosition.y * tmpScaleY * rect.size.height
        let endPosY = startPosY + rect.size.height
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let unitHeight = max(columnXIncrement * tmpScaleY * rect.size.height, ChartViewLayout.minUnitWidth)
        let clusterHeight = columnXIncrement * tmpScaleY * rect.size.height / (1.0 + ChartViewLayout.columnGapFraction)
        
        var startIndex = Int(startPosY / unitHeight).clamp(low: 0, high: maxDataCount - 1)
        let startOffset = unitHeight * CGFloat(startIndex) - startPosY
        
        if abs(startOffset) >= clusterHeight, startIndex < maxDataCount - 1 {
            startIndex += 1
        }
        
        let endIndex = Int(endPosY / unitHeight).clamp(low: startIndex, high: maxDataCount - 1)
        
        return startIndex ... endIndex
    }
    
    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let height = rect.size.height
        
        let pd = self.plotData(model)
        let y = atPoint.y
        
        let maxDataCount = model.numOfCategories()
        
        let tmpScaleY = scaleY(model, plotViewSize: rect.size)
        let tmpStartPosition = startPosition(model, plotViewSize: rect.size)
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let unitHeight = max(columnXIncrement * tmpScaleY * rect.size.height, ChartViewLayout.minUnitWidth)
        let startPosY = tmpStartPosition.y * tmpScaleY * rect.size.height
        let startIndex = Int((startPosY + atPoint.y) / unitHeight).clamp(low: 0, high: maxDataCount - 1)
        
        if startIndex >= maxDataCount || startIndex < 0 {
            return (-1, -1)
        }

        for plotCat in pd[startIndex] {
            let yMin = plotCat.rect.minY * tmpScaleY * height - startPosY
            let yMax = plotCat.rect.maxY * tmpScaleY * height - startPosY
                
            if y >= yMin, y <= yMax {
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
        let tmpScaleY = scaleY(model, plotViewSize: rect.size)
        let tmpStartPosition = startPosition(model, plotViewSize: rect.size)
        let startPosY = tmpStartPosition.y * tmpScaleY * rect.size.height
        
        let pd = self.plotData(model)
        let points = atPoints.sorted { $0.y <= $1.y }
        
        var res: [(Int, Int)] = []
        
        let maxDataCount = model.numOfCategories()
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let unitHeight = max(columnXIncrement * tmpScaleY * rect.size.height, ChartViewLayout.minUnitWidth)
        let clusterHeight = columnXIncrement * tmpScaleY * rect.size.height / (1.0 + ChartViewLayout.columnGapFraction)
        
        // both fingers locate between two clusters, nothing is selected
        if let maxY = points.last?.y, let minY = points.first?.y {
            if maxY - minY < clusterHeight {
                let startIndex = Int((maxY + startPosY) / unitHeight).clamp(low: 0, high: maxDataCount - 1)
                if let plotCat = pd[startIndex].first {
                    let downY = plotCat.rect.minY * tmpScaleY * height + clusterHeight - startPosY
                    
                    if minY > downY {
                        return [(-1, -1), (-1, -1)]
                    }
                }
            }
        }
        
        for (index, pt) in points.enumerated() {
            let startIndex = Int((pt.y + startPosY) / unitHeight).clamp(low: 0, high: maxDataCount - 1)
            
            if let plotCat = pd[startIndex].first {
                let yMin = plotCat.rect.minY * tmpScaleY * height - startPosY
                let yMax = yMin + clusterHeight
                
                if index == 0 {
                    if (pt.y < yMin && pt.y < 0) || (pt.y >= yMin && pt.y <= yMax) {
                        res.append((plotCat.seriesIndex, plotCat.categoryIndex))
                    } else if pt.y > yMax {
                        res.append((plotCat.seriesIndex, min(plotCat.categoryIndex + 1, maxDataCount - 1)))
                    }
                } else {
                    if pt.y >= yMin, pt.y <= yMax {
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

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
            let model = $0
            model.chartType = .bar
            return model
        }
        
        return Group {
            ForEach(models) {
                BarChart(model: $0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
