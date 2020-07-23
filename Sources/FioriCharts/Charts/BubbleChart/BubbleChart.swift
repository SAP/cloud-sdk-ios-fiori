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
        XYAxisChart(axisDataSource: BubbleAxisDataSource(),
                    chartView: BubbleView(),
                    indicatorView: BubbleIndicatorView())
            .environmentObject(model)
    }
}

class BubbleAxisDataSource: DefaultAxisDataSource {
    override func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: true)
    }

    override func xAxisGridlines(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: false)
    }
    
    func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool) -> [AxisTitle] {
        if model.plotDataCache == nil {
            let _ = plotData(model)
        }
        
        guard let ticks = model.categoryAxisTickValues else {
            return []
        }
        
        var ret: [AxisTitle] = []
        let tickCount = model.categoryAxis.labelLayoutStyle == .range ? 2 : (model.scale == 1.0 ? Int(ticks.tickCount) : max(Int(ticks.tickCount), 2))
        var tickValues: [CGFloat] = []
        var tickPositions: [CGFloat] = []
        
        if model.scale == 1.0 {
            let tmpPositions = ticks.tickPositions.map {
                rect.origin.x + $0 * rect.size.width * model.scale - model.startPos.x
            }
            
            if model.categoryAxis.labelLayoutStyle == .range {
                tickValues.append(ticks.tickValues.last ?? 0)
                tickPositions.append(tmpPositions.last ?? 0)
                
                tickValues.append(ticks.tickValues.first ?? 1)
                tickPositions.append(ticks.tickPositions.first ?? 1)
            } else {
                tickValues = ticks.tickValues.reversed()
                tickPositions = tmpPositions.reversed()
            }
        } else {
            let range = ticks.plotRange / model.scale
            let plotMinimum = model.startPos.x * ticks.plotRange / (model.scale * rect.size.width) + ticks.plotMinimum
            let stepValue = range / CGFloat(max(1, tickCount - 1))
            
            for index in 0 ..< tickCount {
                let x = rect.origin.x + rect.size.width * CGFloat(index) / CGFloat(max(1, tickCount - 1))
                tickPositions.append(x)
                let value = plotMinimum + CGFloat(index) * stepValue
                tickValues.append(value)
            }
        }
        
        for index in 0 ..< tickCount {
            var x = tickPositions[index]
            let value = tickValues[index]
        
            let nf = NumberFormatter()
            nf.numberStyle = .decimal
            nf.maximumFractionDigits = 0
            
            let title = nf.string(from: NSNumber(value: Float(value))) ?? ""
            if model.categoryAxis.labelLayoutStyle == .range && isLabel {
                let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                if index == 0 {
                    x = min(size.width, (rect.size.width - 2) / 2) / 2
                } else {
                    x = rect.size.width - min(size.width, (rect.size.width - 2) / 2) / 2
                }
            }
            
            ret.append(AxisTitle(index: index,
                                 title: title,
                                 pos: CGPoint(x: x, y: 0)))
        }
        
        return ret
    }
    
    override func yAxisLabels(_ model: ChartModel, rect: CGRect, layoutDirection: LayoutDirection = .leftToRight, secondary: Bool = false) -> [AxisTitle] {
        let ticks = model.numericAxisTickValues
        let axis = model.numericAxis
        
        let yAxisLabelsCount: Int
        var tickValues: [CGFloat] = []
        var tickPositions: [CGFloat] = []
        
        if model.scale == 1.0 {
            yAxisLabelsCount = Int(ticks.tickCount)
            tickValues = ticks.tickValues
            tickPositions = ticks.tickPositions
        } else {
            yAxisLabelsCount = max(Int(ticks.tickCount), 2)
            let range = ticks.plotRange / model.scale
            let plotMinimum = model.startPos.y * ticks.plotRange / (model.scale * rect.size.height) + ticks.plotMinimum
            let plotMaximum = plotMinimum + range
            let stepValue = range / CGFloat(max(1, yAxisLabelsCount - 1))
            let stepPosition = 1.0 / CGFloat(max(1, yAxisLabelsCount - 1))
            for i in 0 ..< yAxisLabelsCount {
                tickValues.append(plotMaximum - CGFloat(i) * stepValue)
                tickPositions.append(1.0 - CGFloat(i) * stepPosition)
            }
        }
        
        let height = rect.size.height
        
        var yAxisLabels: [AxisTitle] = []
        for i in 0 ..< yAxisLabelsCount {
            let val = tickValues[i]
            
            let title = yAxisFormattedString(model, value: Double(val), secondary: secondary)
            let size = title.boundingBoxSize(with: axis.labels.fontSize)
            let x: CGFloat
            if secondary {
                x = axis.baseline.width / 2.0 + 3 + size.width / 2.0

            } else {
                x = rect.size.width - axis.baseline.width / 2.0 - 3 - size.width / 2.0
            }

            yAxisLabels.append(AxisTitle(index: i,
                                         value: val,
                                         title: title,
                                         pos: CGPoint(x: x, y: rect.origin.y + height * (1.0 - tickPositions[i]))))
        }
        
        return yAxisLabels
    }
    
    override func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotData]] = []
        let seriesCount = model.numOfSeries()
        let dataDimSize = model.data.first?.first?.values?.count ?? 0
        
        guard let xDataMinimumValue = model.xDataMinimumValue, let xDataMaximumValue = model.xDataMaximumValue, let zDataMinimumValue = model.zDataMinimumValue, let zDataMaximumValue = model.zDataMaximumValue, seriesCount > 0, dataDimSize >= 2 else {
            return result
        }
        
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
        if dataDimSize >= 3 {
            let zRange = zDataMaximumValue == zDataMinimumValue ? 1 :  zDataMaximumValue - zDataMinimumValue
            let zBaselineWithinPlot: Bool = zDataMaximumValue > 0.0 && zDataMinimumValue < 0.0
            
            let zPlotMinimum = !zBaselineWithinPlot ? zDataMinimumValue - zRange * 0.66 : zDataMinimumValue
            let zPlotMaximum = !zBaselineWithinPlot ? zDataMaximumValue + zRange * 0.66 : zDataMaximumValue;
            let zPlotRange = zPlotMaximum - zPlotMinimum;

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
        var value: [CGFloat] = Array(repeating: 0, count: 3)
        
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
                if dataDimSize >= 3 {
                    let bubbleSizeValue = CGFloat(model.plotItemValue(at: seriesIndex, category: valueIndex, dimension: 1) ?? 0)
                    if bubbleSizeValue > 0 {
                        value[2] = bubbleSizeValue
                    }
                }

                let x = xScale * (value[0] - xDataMinimumValue)
                let y = yScale * (value[1] - valueAxisContext.dataMinimum)

                var radius: CGFloat = 0.01
                if dataDimSize >= 3 {
                    radius = value[2] <= 0 ? 0 : zScale * (abs(value[2]) - zBaselineValue) / 2

                    if (useAreaOfBubblesNotWidthOfBubbles)
                    {
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
        if (tmpValue == 0)
        {
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

        newMin = dataRange.lowerBound - (dataRange.upperBound - dataRange.lowerBound) * minOffsetY
        newMax = dataRange.upperBound + (dataRange.upperBound - dataRange.lowerBound) * maxOffsetY

        if model.numericAxis.allowLooseLabels {
            useLooseLabels = true
            
            let valueAxisBaselineValue = newMax < 0.0 ? newMax : max(0.0, newMin)
            
            // If the baseline is at zero we aim to always show the baseline with a tick.
            if valueAxisBaselineValue == 0.0{
                useLooseLabels = false
            }
            
            model.numericAxis.allowLooseLabels = useLooseLabels
        }
        
        valueAxisContext = ChartUtility.axisCreateTicks(model,
                                                        rangeStart: newMin,
                                                        rangeEnd: newMax,
                                                        desiredTickCount: UInt(model.numberOfGridlines),
                                                        looseLabels: model.numericAxis.allowLooseLabels,
                                                        fudgeRange: model.numericAxis.fudgeAxisRange,
                                                        adjustToNiceValues: model.numericAxis.adjustToNiceValues)
        
        let de = ChartUtility.calculateDataElementsForAxisTickValues(model, secondaryRange: false)
        model.numericAxisTickValuesCache[de] = valueAxisContext
        print("bubble chart: update numericAxisTickValuesCache, count = \(model.numericAxisTickValuesCache.count)")
        
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
                let ellipse = result[seriesIndex][valueIndex].plotEclipseData!

                //
                // Make sure the value is legal
                //
                
                let x = xScale * (ellipse.values[0] - categoryAxisContext.plotMinimum)
                let y = yScale * (ellipse.values[1] - valueAxisContext.plotMinimum)

                var radius: CGFloat = 0.01
                if dataDimSize >= 3 {
                    radius = ellipse.values[2] <= 0 ? 0 : zScale * (abs(ellipse.values[2]) - zBaselineValue) / 2

                    if (useAreaOfBubblesNotWidthOfBubbles)
                    {
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
        
//        for cc in result {
//            for item in cc {
//                print("\(item.seriesIndex), \(item.categoryIndex): \(item.rect)")
//            }
//        }
        return result
    }
    
    override func snapChartToPoint(_ model: ChartModel, at x: CGFloat, in rect: CGRect) -> CGFloat {
        return x
    }
    
    override func displayCategoryIndexesAndOffsets(_ model: ChartModel, rect: CGRect) -> (startIndex: Int, endIndex: Int, startOffset: CGFloat, endOffset: CGFloat) {
        return (0, 0, 0, 0)
    }
    
    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let pd = plotData(model)
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: rect.size.width)

        for series in pd {
            for plotCat in series {
                let radius = plotCat.rect.size.width * min(rect.size.width, rect.size.height) * model.scale / 2.0
                let xPos = plotCat.pos.x * model.scale * rect.size.width - model.startPos.x
                let yPos = (1 - plotCat.pos.y * model.scale) * rect.size.height + model.startPos.y
                
                let xMin = xPos - radius
                let xMax = xPos + radius
                let yMin = yPos - radius
                let yMax = yPos + radius
                
                if x >= xMin && x <= xMax && atPoint.y >= yMin && atPoint.y <= yMax{
                    return (plotCat.seriesIndex, plotCat.categoryIndex)
                }
            }
        }
        
        return (-1, -1)
    }
    
    // range selection
    // swiftlint:disable cyclomatic_complexity
    override func closestSelectedPlotItems(_ model: ChartModel, atPoints: [CGPoint], rect: CGRect, layoutDirection: LayoutDirection) -> [(Int, Int)] {
        return []
    }
}

//struct BubbleChart_Previews: PreviewProvider {
//    static var previews: some View {
//        BubbleChart()
//    }
//}
