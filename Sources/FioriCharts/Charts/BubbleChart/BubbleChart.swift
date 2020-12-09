//
//  BubbleChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 7/13/20.
//

import SwiftUI

struct BubbleChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(model: model,
                    chartContext: BubbleChartContext(),
                    chartView: BubbleView(),
                    indicatorView: BubbleIndicatorView())
    }
}

class BubbleChartContext: DefaultChartContext {    
    override func xAxisLabels(_ model: ChartModel) -> [AxisTitle] {
        if let result = model.xAxisLabels[model.categoryAxis.labels.fontSize] {
            return result
        }
        
        if model.plotDataCache == nil {
            _ = plotData(model)
        }
        
        guard let ticks = model.categoryAxisTickValues else {
            return []
        }
        
        var ret: [AxisTitle] = []
        let tickCount = model.scaleX == 1.0 ? Int(ticks.tickCount) : max(Int(ticks.tickCount), 2)
        
        var tickValues: [CGFloat] = []
        var tickPositions: [CGFloat] = []
        let startPos = startPosition(model, plotViewSize: .zero)
        let startPosX = startPos.x * model.scaleX
        
        if model.scaleX == 1.0 {
            let tmpPositions = ticks.tickPositions.map {
                $0 * model.scaleX - startPosX
            }
            
            tickValues = ticks.tickValues.reversed()
            tickPositions = tmpPositions.reversed()
        } else {
            let range = ticks.plotRange / model.scaleX
            let plotMinimum = startPos.x * ticks.plotRange + ticks.plotMinimum
            let stepValue = range / CGFloat(max(1, tickCount - 1))
            
            for index in 0 ..< tickCount {
                let value = plotMinimum + CGFloat(index) * stepValue
                tickValues.append(value)
                
                let x = (value - ticks.plotMinimum) / ticks.plotRange
                tickPositions.append(x)
            }
        }
        
        for index in 0 ..< tickCount {
            let x = tickPositions[index]
            let value = tickValues[index]
        
            let nf = NumberFormatter()
            nf.numberStyle = .none
            nf.maximumFractionDigits = 0
            var title = nf.string(from: NSNumber(value: Float(value))) ?? ""
            
            // check the label format handler
            if let labelHandler = model.numericAxisLabelFormatHandler {
                if let titleFromApp = labelHandler(Double(value), .category) {
                    title = titleFromApp
                }
            }
            
            let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
            ret.append(AxisTitle(index: index,
                                 value: value,
                                 title: title,
                                 pos: CGPoint(x: x, y: 0),
                                 size: size))
        }

        model.xAxisLabels = [:]
        model.xAxisLabels[model.categoryAxis.labels.fontSize] = ret
        
        return ret
    }
    
    override func xAxisLabels(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: true, plotViewSize: plotViewSize)
    }

    override func xAxisGridlines(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: false, plotViewSize: plotViewSize)
    }
    
    override func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool, plotViewSize: CGSize) -> [AxisTitle] {
        let ret: [AxisTitle] = xAxisLabels(model)
        var result: [AxisTitle] = []
        let startPos = startPosition(model, plotViewSize: plotViewSize)
        var loopEnd = false
        for index in 0 ..< ret.count {
            var item = ret[index]
            var x = (item.pos.x - startPos.x) * model.scaleX * rect.size.width
            
            if model.categoryAxis.labelLayoutStyle == .range {
                if index == 0 {
                    if isLabel {
                        x = min(item.size.width, (rect.size.width - 2) / 2) / 2
                    }
                } else {
                    if let last = ret.last {
                        item = last
                    
                        if isLabel {
                            x = rect.size.width - min(item.size.width, (rect.size.width - 2) / 2) / 2
                        } else {
                            x = (item.pos.x - startPos.x) * model.scaleX * rect.size.width
                        }
                    }
                    loopEnd = true
                }
            }
            
            result.append(AxisTitle(index: index,
                                    value: item.value,
                                    title: item.title,
                                    pos: CGPoint(x: x, y: 0),
                                    size: item.size))
            
            // break the loop for labelLayoutStyle is .range
            if loopEnd {
                break
            }
        }
        
        return result
    }
    
    override func yAxisLabels(_ model: ChartModel, layoutDirection: LayoutDirection, secondary: Bool) -> [AxisTitle] {
        if let result = model.yAxisLabels[model.numericAxis.labels.fontSize] {
            return result
        }
        
        if model.plotDataCache == nil {
            _ = plotData(model)
        }
        
        let ticks = model.numericAxisTickValues
        let axis = model.numericAxis
        
        let yAxisLabelsCount: Int
        var tickValues: [CGFloat] = []
        var tickPositions: [CGFloat] = []
        
        let startPos = startPosition(model, plotViewSize: .zero)
        let startPosY = startPos.y
        
        if model.scaleX == 1.0 {
            yAxisLabelsCount = Int(ticks.tickCount)
            tickValues = ticks.tickValues
            tickPositions = ticks.tickPositions
        } else {
            yAxisLabelsCount = max(Int(ticks.tickCount), 2)
            let range = ticks.plotRange / model.scaleX
            let plotMaximum = ticks.plotMaximum - startPosY * ticks.plotRange
            let stepValue = range / CGFloat(max(1, yAxisLabelsCount - 1))
            for i in 0 ..< yAxisLabelsCount {
                let value = plotMaximum - CGFloat(i) * stepValue
                tickValues.append(value)
                tickPositions.append((value - ticks.plotMinimum)/ticks.plotRange)
            }
        }
        
        var yAxisLabels: [AxisTitle] = []
        for i in 0 ..< yAxisLabelsCount {
            let val = tickValues[i]
            
            let title = yAxisFormattedString(model, value: Double(val), secondary: false)
            let size = title.boundingBoxSize(with: axis.labels.fontSize)
            let x = axis.baseline.width / 2.0 - 3 - size.width / 2.0

            yAxisLabels.append(AxisTitle(index: i,
                                         value: val,
                                         title: title,
                                         pos: CGPoint(x: x, y: 1.0 - tickPositions[i]),
                                         size: size))
        }
        
        model.yAxisLabels = [:]
        model.yAxisLabels = [model.numericAxis.labels.fontSize: yAxisLabels]
        
        return yAxisLabels
    }
    
    override func yAxisLabels(_ model: ChartModel, layoutDirection: LayoutDirection = .leftToRight, secondary: Bool = false, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        let startPos = startPosition(model, plotViewSize: plotViewSize)
        let ret = yAxisLabels(model, layoutDirection: layoutDirection, secondary: secondary)
        var result: [AxisTitle] = []
        let axis = model.numericAxis
        for item in ret {
            let x = rect.size.width - axis.baseline.width / 2.0 - 3 - item.size.width / 2.0

            result.append(AxisTitle(index: item.index,
                                    value: item.value,
                                         title: item.title,
                                         pos: CGPoint(x: x, y: (item.pos.y - startPos.y) * model.scaleY * rect.size.height),
                                         size: item.size))
        }
        
        return result
    }
    
    //swiftlint:disable cyclomatic_complexity
    //swiftlint:disable function_body_length
    override func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotData]] = []
        let seriesCount = model.numOfSeries()
        let dataDimSize = model.data.first?.first?.values?.count ?? 0
        
        guard let xDataMinimumValue = model.xDataMinimumValue, let xDataMaximumValue = model.xDataMaximumValue, seriesCount > 0, dataDimSize >= 2 else {
            return result
        }
        
        if model.chartType == .bubble && (model.zDataMinimumValue == nil || model.zDataMaximumValue == nil || dataDimSize < 3) {
            return result
        }
        
        let zDataMinimumValue = model.zDataMinimumValue ?? 0
        let zDataMaximumValue = model.zDataMaximumValue ?? 0
        
        let dataRange: ClosedRange<CGFloat> = IndexSet(integersIn: 0 ..< seriesCount).reduce(model.ranges[0]) { (result, i) -> ClosedRange<CGFloat> in
            let seriesMin = min(result.lowerBound, model.ranges[i].lowerBound)
            let seriesMax = max(result.upperBound, model.ranges[i].upperBound)
            return seriesMin...seriesMax
        }
        
        var xScale: CGFloat
        var yScale: CGFloat
        var zScale: CGFloat = 1
        var zBaselineValue: CGFloat = 0
        
        var categoryAxisContext = ChartUtility.axisCreateTicks(model,
                                                               rangeStart: xDataMinimumValue,
                                                               rangeEnd: xDataMaximumValue,
                                                               desiredTickCount: UInt(model.numberOfGridlines),
                                                               looseLabels: true,
                                                               fudgeRange: true,
                                                               adjustToNiceValues: true)
        
        // cache it
        model.categoryAxisTickValues = categoryAxisContext
        
        var valueAxisContext = model.numericAxisTickValues
        
        // it is bubble
        if model.chartType == .bubble {
            let zRange = zDataMaximumValue == zDataMinimumValue ? 1 :  zDataMaximumValue - zDataMinimumValue
            let zBaselineWithinPlot: Bool = zDataMaximumValue > 0.0 && zDataMinimumValue < 0.0
            
            let zPlotMinimum = !zBaselineWithinPlot ? zDataMinimumValue - zRange * 0.66 : zDataMinimumValue
            let zPlotMaximum = !zBaselineWithinPlot ? zDataMaximumValue + zRange * 0.66 : zDataMaximumValue
            let zPlotRange = zPlotMaximum - zPlotMinimum

            if zPlotRange == 0 {
                zScale = 0
            } else {
                zScale = 1.0 / zPlotRange
            }
            
            zBaselineValue = zPlotMaximum < 0.0 ? zPlotMaximum : max(0.0, zPlotMinimum)
        }
        
        xScale = categoryAxisContext.dataScale
        yScale = valueAxisContext.dataScale
        
        let useAreaOfBubblesNotWidthOfBubbles = true
        var bubblePlotFrame = CGRect(x: 0, y: 0, width: 1, height: 1)
        var value: [CGFloat] = Array(repeating: 0, count: max(3, dataDimSize))
        
        // Loop through series
        for seriesIndex in 0 ..< seriesCount {
            let valueCount = model.numOfCategories(in: seriesIndex)
            var seriesPlotData: [ChartPlotData] = []
            
            if valueCount == 0 {
                continue
            }
            
            // Loop through data points
            for valueIndex in 0 ..< valueCount {
                //
                // Fetch value
                //
                let xDimIndex = dataDimSize == 2 ? 1 : 2
                value[0] = CGFloat(model.plotItemValue(at: seriesIndex, category: valueIndex, dimension: xDimIndex) ?? 0)
                value[1] = CGFloat(model.plotItemValue(at: seriesIndex, category: valueIndex, dimension: 0) ?? 0)
                // it is bubble
                if model.chartType == .bubble {
                    let bubbleSizeValue = CGFloat(model.plotItemValue(at: seriesIndex, category: valueIndex, dimension: 1) ?? 0)
                    if bubbleSizeValue > 0 {
                        value[2] = bubbleSizeValue
                    }
                }

                let x = xScale * (value[0] - xDataMinimumValue)
                let y = yScale * (value[1] - valueAxisContext.dataMinimum)

                var radius: CGFloat = 0.01
                if model.chartType == .bubble {
                    radius = value[2] <= 0 ? 0 : zScale * (abs(value[2]) - zBaselineValue) / 2

                    if useAreaOfBubblesNotWidthOfBubbles {
                        let tmpRadius = sqrt(radius * 2 / CGFloat.pi) / 2
                        radius = value[2] <= 0 ? 0 : tmpRadius
                    }
                }

                let ellipseData = ChartPlotEllipseData(seriesIndex: seriesIndex,
                                                           categoryIndex: valueIndex,
                                                           values: value,
                                                           x: x,
                                                           y: y,
                                                           radius: radius,
                                                           selected: false)
                
                seriesPlotData.append(ChartPlotData.ellipse(ellipse: ellipseData))
                bubblePlotFrame = bubblePlotFrame.union(ellipseData.rect)
            }
            
            result.append(seriesPlotData)
        }
        
        if CGRect(x: 0, y: 0, width: 1, height: 1).contains(bubblePlotFrame) {
            model.plotDataCache = result
            return result
        }

        //
        // X AXIS
        //
        var minOffsetX: CGFloat = 0
        var maxOffsetX: CGFloat = 0

        if bubblePlotFrame.minX < 0 {
            minOffsetX = (0 - bubblePlotFrame.minX) / 1.5
        }

        if bubblePlotFrame.maxX > 1 {
            maxOffsetX = (bubblePlotFrame.maxX - 1.0) / 1.5
        }
        
        var newMin = xDataMinimumValue - (xDataMaximumValue - xDataMinimumValue) * minOffsetX
        var newMax = xDataMaximumValue + (xDataMaximumValue - xDataMinimumValue) * maxOffsetX

        // update the values
        model.xDataMinimumValue = newMin
        model.xDataMaximumValue = newMax
        
        // If the baseline is at zero we aim to always show the baseline with a tick.
        var useLooseLabels = true
        let tmpValue = newMax < 0.0 ? newMax : max(0, newMin)
        if tmpValue == 0 {
            useLooseLabels = false
        }
        
        categoryAxisContext = ChartUtility.axisCreateTicks(model,
                                                           rangeStart: newMin,
                                                           rangeEnd: newMax,
                                                           desiredTickCount: UInt(model.numberOfGridlines),
                                                           looseLabels: useLooseLabels,
                                                           fudgeRange: true,
                                                           adjustToNiceValues: true)
        // cache it
        model.categoryAxisTickValues = categoryAxisContext

        //
        // Y AXIS
        //
        var minOffsetY: CGFloat = 0
        var maxOffsetY: CGFloat = 0

        if bubblePlotFrame.minY < 0 {
            minOffsetY = (0 - bubblePlotFrame.minY) / 1.5
        }

        if bubblePlotFrame.maxY > 1 {
            maxOffsetY = (bubblePlotFrame.maxY - 1.0) / 1.5
        }
        
        newMin = dataRange.lowerBound - valueAxisContext.dataRange * minOffsetY
        newMax = dataRange.upperBound + valueAxisContext.dataRange * maxOffsetY
        
        model.yDataMinimumValue = newMin
        model.yDataMaximumValue = newMax
        // clear the cache to reset it
        model.numericAxisTickValuesCache.removeAll()
        // retrieve it
        valueAxisContext = model.numericAxisTickValues
                
        // Reset the scales.
        xScale = categoryAxisContext.plotScale
        yScale = valueAxisContext.plotScale
        zScale *= max(max(minOffsetX, maxOffsetX), max(minOffsetY, maxOffsetY))

        // Loop through series
        for seriesIndex in 0 ..< seriesCount {
            let valueCount = model.numOfCategories(in: seriesIndex)
            
            if valueCount == 0 {
                continue
            }
            
            // Loop through data points
            for valueIndex in 0 ..< valueCount {
                let ellipse = result[seriesIndex][valueIndex].plotEclipseData ?? ChartPlotEllipseData(seriesIndex: seriesIndex, categoryIndex: valueIndex, values: [0, 0, 0], x: 0, y: 0, radius: 0.1)

                //
                // Make sure the value is legal
                //
                
                let x = xScale * (ellipse.values[0] - categoryAxisContext.plotMinimum)
                let y = yScale * (ellipse.values[1] - valueAxisContext.plotMinimum)

                var radius: CGFloat = 0.01
                if model.chartType == .bubble {
                    radius = ellipse.values[2] <= 0 ? 0 : zScale * (abs(ellipse.values[2]) - zBaselineValue) / 2

                    if useAreaOfBubblesNotWidthOfBubbles {
                        let tmpRadius = sqrt(radius * 2 / CGFloat.pi) / 2
                        radius = value[2] <= 0 ? 0 : tmpRadius
                    }
                }

                let ellipseData = ChartPlotEllipseData(seriesIndex: seriesIndex,
                                                       categoryIndex: valueIndex,
                                                       values: ellipse.values,
                                                       x: x,
                                                       y: y,
                                                       radius: radius,
                                                       selected: false)
                result[seriesIndex][valueIndex] = ChartPlotData.ellipse(ellipse: ellipseData)
            }
        }
        
        model.plotDataCache = result
        
        return result
    }
    
    override func snapChartToPoint(_ model: ChartModel, at x: CGFloat) -> CGFloat {
        return x
    }
    
    override func displayCategoryIndexes(_ model: ChartModel, rect: CGRect) -> ClosedRange<Int> {
        return 0...0
    }
    
    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        // reverse series order to select high series index first
        let pd = plotData(model).reversed()
        let startPos = startPosition(model, plotViewSize: rect.size)
        let startPosX = startPos.x * model.scaleX * rect.size.width
        let startPosY = startPos.y * model.scaleX * rect.size.height
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: rect.size.width)

        for series in pd {
            for plotCat in series {
                let radius = plotCat.rect.size.width * min(rect.size.width, rect.size.height) * model.scaleX / 2.0
                let xPos = plotCat.pos.x * model.scaleX * rect.size.width - startPosX
                let yPos = (1 - plotCat.pos.y) * model.scaleY * rect.size.height - startPosY
                
                let xMin = xPos - radius
                let xMax = xPos + radius
                let yMin = yPos - radius
                let yMax = yPos + radius
                
                if x >= xMin && x <= xMax && atPoint.y >= yMin && atPoint.y <= yMax {
                    return (plotCat.seriesIndex, plotCat.categoryIndex)
                }
            }
        }
        
        return (-1, -1)
    }
    
    override func closestSelectedPlotItems(_ model: ChartModel, atPoints: [CGPoint], rect: CGRect, layoutDirection: LayoutDirection) -> [(Int, Int)] {
        return []
    }
}

struct BubbleChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.bubbleModels) {
                BubbleChart(model: $0)
                    .frame(width: 330, height: 330, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
