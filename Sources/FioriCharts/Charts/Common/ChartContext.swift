import Combine
import Foundation
import SwiftUI

protocol ChartContext: AnyObject {
    func scaleX(_ model: ChartModel, plotViewSize: CGSize) -> CGFloat
    
    func scaleY(_ model: ChartModel, plotViewSize: CGSize) -> CGFloat
    
    func startPosition(_ model: ChartModel, plotViewSize: CGSize) -> CGPoint
    
    func centerPosition(_ model: ChartModel, plotViewSize: CGSize) -> CGPoint
    
    func readableScale(_ model: ChartModel, plotViewSize: CGSize) -> CGFloat
    
    func columnWidth(_ model: ChartModel) -> CGFloat
    
    func xAxisLabels(_ model: ChartModel) -> [AxisTitle]
    
    func xAxisLabels(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle]
    
    func xAxisGridlines(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle]
    
    func yAxisFormattedString(_ model: ChartModel, value: Double, secondary: Bool) -> String
    
    func yAxisLabels(_ model: ChartModel, layoutDirection: LayoutDirection, secondary: Bool) -> [AxisTitle]
    
    func yAxisLabels(_ model: ChartModel, layoutDirection: LayoutDirection, secondary: Bool, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle]
    
    func plotData(_ model: ChartModel) -> [[ChartPlotData]]
    
    func plotPath(_ model: ChartModel) -> [[[Path]]]
    
    func snapChartToPoint(_ model: ChartModel, at x: CGFloat) -> CGFloat
    
    func displayCategoryIndexes(_ model: ChartModel, rect: CGRect) -> ClosedRange<Int>
      
    // single selection
    func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int)
    
    // range selection
    func closestSelectedPlotItems(_ model: ChartModel, atPoints: [CGPoint], rect: CGRect, layoutDirection: LayoutDirection) -> [(Int, Int)]
}

class DefaultChartContext: ChartContext {
    /// top left position
    func startPosition(_ model: ChartModel, plotViewSize: CGSize) -> CGPoint {
        let pos = self.centerPosition(model, plotViewSize: plotViewSize)
        let tmpScaleX = self.scaleX(model, plotViewSize: plotViewSize)
        let tmpScaleY = self.scaleY(model, plotViewSize: plotViewSize)
        
        let x = min(1 - 0.5 / tmpScaleX, max(0, pos.x - 0.5 / tmpScaleX))
        let y = min(1 - 0.5 / tmpScaleY, max(0, pos.y - 0.5 / tmpScaleY))

        return CGPoint(x: x, y: y)
    }
    
    func centerPosition(_ model: ChartModel, plotViewSize: CGSize) -> CGPoint {
        if let pos = model.centerPosition {
            // check if it is valid for different size of views
            let tmpScaleX = self.scaleX(model, plotViewSize: plotViewSize)
            let tmpScaleY = self.scaleY(model, plotViewSize: plotViewSize)
            
            let x = max(0.5 / tmpScaleX, min(1 - 0.5 / tmpScaleX, pos.x))
            let y = max(0.5 / tmpScaleY, min(1 - 0.5 / tmpScaleY, pos.y))

            return CGPoint(x: x, y: y)
        } else {
            let x = 0.5 / self.scaleX(model, plotViewSize: plotViewSize)
            let y = 0.5 / self.scaleY(model, plotViewSize: plotViewSize)
            return CGPoint(x: x, y: y)
        }
    }
    
    func scaleX(_ model: ChartModel, plotViewSize: CGSize) -> CGFloat {
        if !model.readableScaleEnabled || model.chartType == .bar || model.chartType == .stackedBar || model.chartType == .bubble || model.chartType == .scatter {
            return model.scaleX
        }
        
        let rs = self.readableScale(model, plotViewSize: plotViewSize)
        
        return model.scaleX * rs
    }
    
    func scaleY(_ model: ChartModel, plotViewSize: CGSize) -> CGFloat {
        if !model.readableScaleEnabled || !(model.chartType == .bar || model.chartType == .stackedBar) {
            return model.scaleY
        }
        
        let rs = self.readableScale(model, plotViewSize: plotViewSize)
        
        return model.scaleY * rs
    }
    
    func readableScale(_ model: ChartModel, plotViewSize: CGSize) -> CGFloat {
        if model.chartType == .bubble || model.chartType == .scatter {
            return 1
        }
        
        let width = model.chartType == .bar || model.chartType == .stackedBar ? plotViewSize.height : plotViewSize.width
        
        if model.readableScaleEnabled, width > 0 {
            let dataWidth = self.columnWidth(model) * width
            if dataWidth < ChartViewLayout.minDataWidth {
                let ratio = ChartViewLayout.minDataWidth / dataWidth
                return ratio
            }
        }
            
        return 1
    }
    
    func columnWidth(_ model: ChartModel) -> CGFloat {
        let count = model.numOfCategories()
        let unitWidth: CGFloat = max(1 / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
        
        return unitWidth
    }
    
    func xAxisLabels(_ model: ChartModel) -> [AxisTitle] {
        if let result = model.xAxisLabels[model.categoryAxis.labels.fontSize] {
            return result
        }
        
        var ret: [AxisTitle] = []
        
        let count = model.numOfCategories()
        let width: CGFloat = 1
        let unitWidth: CGFloat = max(width / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
        
        for i in 0 ..< count {
            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
            
            ret.append(AxisTitle(index: i,
                                 title: title,
                                 pos: CGPoint(x: CGFloat(i) * unitWidth, y: 0),
                                 size: size))
        }
        
        model.xAxisLabels = [:]
        model.xAxisLabels = [model.categoryAxis.labels.fontSize: ret]
        
        return ret
    }
    
    func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool, plotViewSize: CGSize) -> [AxisTitle] {
        if abs(CGFloat(model.categoryAxis.baseline.width) - rect.size.height) < 1 {
            return []
        }
        
        /// get xAxisLabels in relative position
        let ret: [AxisTitle] = self.xAxisLabels(model)
        
        let maxDataCount = model.numOfCategories()
        let width = rect.size.width
        
        let tmpScaleX = self.scaleX(model, plotViewSize: plotViewSize)
        let tmpStartPosition = self.startPosition(model, plotViewSize: plotViewSize)
        let startPosX = tmpStartPosition.x * tmpScaleX * width
        let unitWidth: CGFloat = max(width * tmpScaleX / CGFloat(max(maxDataCount - 1, 1)), ChartViewLayout.minUnitWidth)
        let startIndex = Int((startPosX / unitWidth).rounded(.up)).clamp(low: 0, high: maxDataCount - 1)
        let endIndex = Int((startPosX + rect.size.width) / unitWidth).clamp(low: startIndex, high: maxDataCount - 1)
        let catIndexRange = startIndex ... endIndex
        
        if model.categoryAxis.labelLayoutStyle == .range {
            var result: [AxisTitle] = []

            if catIndexRange.count >= 1 {
                var item = ret[catIndexRange.lowerBound]
                let offset = isLabel ? min(item.size.width, (rect.size.width - 2) / 2) / 2 : 0
                let x = item.pos.x * tmpScaleX * rect.size.width - startPosX + offset
                item.x(x)
                
                result.append(item)
            
                if catIndexRange.count >= 2 {
                    var item = ret[catIndexRange.upperBound]
                    let x = item.pos.x * tmpScaleX * rect.size.width - startPosX - offset
                    item.x(x)
                    
                    result.append(item)
                }
            }
            
            return result
        } else {
            var result = [AxisTitle]()

            if catIndexRange.lowerBound >= 0, catIndexRange.upperBound < ret.count {
                for index in catIndexRange {
                    let x = ret[index].pos.x * tmpScaleX * rect.size.width - startPosX
                    if x > -1, x <= rect.size.width + 1 {
                        var axisTitle = ret[index]
                        axisTitle.x(x)
                        
                        result.append(axisTitle)
                    }
                }
            }

            return result
        }
    }
    
    func xAxisLabels(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        self.xAxisGridLineLabels(model, rect: rect, isLabel: true, plotViewSize: plotViewSize)
    }
    
    func xAxisGridlines(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        self.xAxisGridLineLabels(model, rect: rect, isLabel: false, plotViewSize: plotViewSize)
    }
    
    private func numberMagnitude(from value: Double) -> (magnitude: String, divisor: Double) {
        var divisorValue: Double = 1
        var stringValue = " "
        let d = abs(value)
        
        if d < 1e3 { // we can represent up to 999 directly
            divisorValue = 1
        } else if d < 1e6 { // 999k
            stringValue = "K"
            divisorValue = 1e3
        } else if d < 1e9 { // 999m
            stringValue = "M"
            divisorValue = 1e6
        } else if d < 1e12 { // 999b
            stringValue = "B"
            divisorValue = 1e9
        } else if d < 1e15 { // 999t
            stringValue = "T"
            divisorValue = 1e12
        } else if d < 1e18 { // 999q
            stringValue = "Q"
            divisorValue = 1e15
        } else { // higher than 999 quadrillion we don't care
            stringValue = "Z"
            divisorValue = 1e18
        }
        
        return (stringValue, divisorValue)
    }
    
    private func numberFormatter(for value: Double, divisor: Double, abbreviatedFormatter: NumberFormatter) -> NumberFormatter {
        let value = abs(value)
        
        let nf = abbreviatedFormatter
        
        // 100+
        if value >= 100 {
            nf.maximumFractionDigits = 0
        }
        
        // 10 -> 100
        if value < 100, value >= 10 {
            var numberOfFractionDigits = nf.maximumFractionDigits
            if numberOfFractionDigits > 1 || divisor > 1 {
                numberOfFractionDigits = 1
            }
            
            nf.maximumFractionDigits = numberOfFractionDigits
        }
        
        // 0.001 -> 10
        if value < 10, value > 0.001 {
            var numberOfFractionDigits = nf.maximumFractionDigits
            if numberOfFractionDigits > 2 || divisor > 1 {
                numberOfFractionDigits = 2
            }
            
            nf.maximumFractionDigits = numberOfFractionDigits
        }
        
        // Scientific
        if value != 0, value < 0.001 || value >= 1e18 {
            nf.numberStyle = .scientific
            nf.positiveFormat = "#E0"
            nf.negativeFormat = "#E0"
            nf.exponentSymbol = "e"
            nf.maximumFractionDigits = 2
        }
        
        return nf
    }
    
    private func abbreviatedString(for num: Double, useSuffix: Bool, abbreviatedFormatter: NumberFormatter) -> String {
        var aNum = abs(num)
        var multiplier: Double = 100.0
        
        if abbreviatedFormatter.numberStyle == .percent {
            if let multi = abbreviatedFormatter.multiplier {
                multiplier = multi.doubleValue
            }
            aNum *= multiplier
        }
        
        /*
         Find the magnitude for the value. The suffix is a " " by default because Joel originally implemented it this way for the medium charts. Probably just to guarantee the these strings were always the same length?
         */
        let (magnitude, divisor) = self.numberMagnitude(from: aNum)
        aNum /= divisor
        
        /*
         Fetch the correct formatter for the value.
         */
        let formatter = self.numberFormatter(for: aNum, divisor: divisor, abbreviatedFormatter: abbreviatedFormatter)
        
        /*
         Undo the application of fabs.
         */
        let sign = num < 0.0 ? -1.0 : 1.0
        aNum *= sign
        
        /*
         Apply the magnitude suffix.
         */
        var formattedString = ""
        let suffix = useSuffix ? magnitude : ""
        if abbreviatedFormatter.numberStyle == .percent {
            aNum /= multiplier
            formattedString = formatter.string(from: NSNumber(value: aNum)) ?? " "
            
            /*
             We want 1k% not 1%k.
             */
            if magnitude != " " {
                let percent = formatter.percentSymbol ?? "%"
                let index = formattedString.lastIndex(of: percent.first ?? "%") ?? formattedString.endIndex
                let tmp = formattedString[..<index]
                formattedString = "\(tmp)\(suffix)\(percent)"
            }
        } else {
            let valueString = formatter.string(from: NSNumber(value: aNum)) ?? ""
            if let positiveSuffix = formatter.positiveSuffix, useSuffix {
                if let index = valueString.lastIndex(of: positiveSuffix.first ?? "+") {
                    /*
                     We want 1k+ not 1+k.
                     */
                    let tmp = formattedString[..<index]
                    formattedString = "\(tmp)\(suffix)\(positiveSuffix)"
                } else {
                    formattedString = "\(valueString)\(suffix)\(positiveSuffix)"
                }
            } else {
                formattedString = "\(valueString)\(suffix)"
            }
        }
        
        return formattedString
    }
    
    func yAxisLabels(_ model: ChartModel, layoutDirection: LayoutDirection = .leftToRight, secondary: Bool = false) -> [AxisTitle] {
        if secondary {
            if model.indexesOfSecondaryValueAxis.isEmpty {
                return []
            }
            
            if let result = model.secondaryYAxisLabels[model.secondaryNumericAxis.labels.fontSize] {
                return result
            }
        } else {
            if let result = model.yAxisLabels[model.numericAxis.labels.fontSize] {
                return result
            }
        }

        let ticks = secondary ? model.secondaryNumericAxisTickValues : model.numericAxisTickValues
        let axis = secondary ? model.secondaryNumericAxis : model.numericAxis
        
        let yAxisLabelsCount = Int(ticks.tickCount)
        
        var yAxisLabels: [AxisTitle] = []
        for i in 0 ..< yAxisLabelsCount {
            let val = ticks.tickValues[i]
            let title = self.yAxisFormattedString(model, value: Double(val), secondary: secondary)
            let size = title.boundingBoxSize(with: axis.labels.fontSize)

            yAxisLabels.append(AxisTitle(index: i,
                                         value: val,
                                         title: title,
                                         pos: .zero,
                                         size: size))
        }
        
        if secondary {
            model.secondaryYAxisLabels = [:]
            model.secondaryYAxisLabels = [model.secondaryNumericAxis.labels.fontSize: yAxisLabels]
        } else {
            model.yAxisLabels = [:]
            model.yAxisLabels = [model.numericAxis.labels.fontSize: yAxisLabels]
        }
        
        return yAxisLabels
    }
    
    func yAxisLabels(_ model: ChartModel, layoutDirection: LayoutDirection = .leftToRight, secondary: Bool = false, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        let res = self.yAxisLabels(model, layoutDirection: layoutDirection, secondary: secondary)
        if res.isEmpty {
            return []
        }
        
        let ticks = secondary ? model.secondaryNumericAxisTickValues : model.numericAxisTickValues
        let axis = secondary ? model.secondaryNumericAxis : model.numericAxis
        let height = rect.size.height
        
        var maxPointRadius: CGFloat = 0
        if model.chartType == .line || model.chartType == .area {
            let maxPointDiameter = model.seriesAttributes.reduce(0) { (result, seriesAttribute) -> CGFloat in
                max(seriesAttribute.point.diameter, result)
            }

            maxPointRadius = maxPointDiameter / 2 + ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth
        }
        
        let tmpScaleY = self.scaleY(model, plotViewSize: plotViewSize)
        let startPositionY = self.startPosition(model, plotViewSize: plotViewSize).y * tmpScaleY * rect.size.height
        var result = [AxisTitle]()
        for item in res {
            let size = item.size
            
            var x: CGFloat
            if secondary {
                x = size.width / 2.0 + max(axis.baseline.width / 2.0, maxPointRadius) + ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline
                x = min(rect.size.width / 2 + max(axis.baseline.width / 2.0, maxPointRadius) + ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline, x)
            } else {
                x = rect.size.width - size.width / 2.0 - max(axis.baseline.width / 2.0, maxPointRadius) - ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline
                x = max(rect.size.width / 2 - max(axis.baseline.width / 2.0, maxPointRadius) - ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline, x)
            }
            let y = height * (1.0 - ticks.tickPositions[item.index]) * tmpScaleY - startPositionY
            if y >= 0, y <= height {
                result.append(AxisTitle(index: item.index,
                                        value: item.value,
                                        title: item.title,
                                        pos: CGPoint(x: x, y: y),
                                        size: size))
            }
        }

        return result
    }
    
    func yAxisFormattedString(_ model: ChartModel, value: Double, secondary: Bool) -> String {
        if let labelHandler = model.numericAxisLabelFormatHandler {
            let axisId = secondary ? ChartAxisId.dual : ChartAxisId.y
            if let res = labelHandler(value, axisId) {
                return res
            }
        }
        
        let axis = secondary ? model.secondaryNumericAxis : model.numericAxis
        
        if axis.abbreviatesLabels {
            return self.abbreviatedString(for: value, useSuffix: axis.isMagnitudedDisplayed, abbreviatedFormatter: axis.abbreviatedFormatter)
        } else {
            return axis.formatter.string(from: NSNumber(value: value)) ?? " "
        }
    }
    
    func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        []
    }
    
    func plotLinePath(_ model: ChartModel, for seriesIndex: Int) -> [[Path]] {
        var seriesPath = [[Path]]()
        let secondary = model.indexesOfSecondaryValueAxis.contains(seriesIndex) ? true : false
        let displayRange = ChartUtility.displayRange(model, secondary: secondary)
        let baselinePosition = ChartUtility.xAxisBaselinePosition(model)
        let maxDataCount = model.chartType == .stock ? model.numOfCategories(in: seriesIndex) : model.numOfCategories()
        let rect = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
        
        let stepWidth: CGFloat
        let offsetX: CGFloat
        if model.chartType == .combo {
            let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
            let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
            stepWidth = columnXIncrement
            offsetX = clusterWidth / 2.0
        } else {
            stepWidth = rect.size.width / CGFloat(max(maxDataCount - 1, 1))
            offsetX = 0
        }
        
        var prevPt: CGPoint?
        let fillOrigY: CGFloat = rect.size.height * (1.0 - baselinePosition)
        
        for i in 0 ..< maxDataCount {
            var strokePath = Path()
            var fillPath = Path()
            
            let dataVal = ChartUtility.dimensionValue(model, seriesIndex: seriesIndex, categoryIndex: i, dimensionIndex: 0)
            if let tmpVal = dataVal { // cur point is not nil
                let val = displayRange.upperBound == displayRange.lowerBound ? 0 : (rect.size.height - (tmpVal - displayRange.lowerBound) * rect.size.height / (displayRange.upperBound - displayRange.lowerBound))
                let x = (stepWidth * CGFloat(i) + offsetX) * rect.size.width
                let p2 = CGPoint(x: x, y: val)
                
                // prev point is not nil
                if let p1 = prevPt {
                    strokePath.move(to: p1)
                    strokePath.addLine(to: p2)
                    strokePath.closeSubpath()
                    
                    fillPath.move(to: p1)
                    fillPath.addLine(to: p2)
                    fillPath.addLine(to: CGPoint(x: p2.x, y: fillOrigY))
                    fillPath.addLine(to: CGPoint(x: p1.x, y: fillOrigY))
                    fillPath.closeSubpath()
                }
                
                prevPt = p2
            } else { // cur point is nil
                prevPt = nil
            }
            
            seriesPath.append([strokePath, fillPath])
        }
        
        return seriesPath
    }
    
    func plotColumnPath(_ model: ChartModel, for seriesIndex: Int) -> [[Path]] {
        let seriesCount = model.numOfSeries()
        
        if seriesIndex < 0 || seriesIndex >= seriesCount {
            return [[Path()]]
        }
        
        let pd = self.plotData(model)
        let maxDataCount = model.numOfCategories()
        var seriesPath = [[Path]]()
        
        for categoryIndex in 0 ..< maxDataCount {
            let pdr = pd[categoryIndex][seriesIndex]
            
            let rect: CGRect
            if model.chartType == .column || model.chartType == .stackedColumn || model.chartType == .combo || model.chartType == .waterfall {
                if model.chartType == .combo, !model.indexesOfColumnSeries.contains(seriesIndex) {
                    rect = .zero
                } else {
                    rect = CGRect(origin: CGPoint(x: pdr.rect.origin.x, y: 1 - pdr.rect.origin.y - pdr.rect.size.height), size: pdr.rect.size)
                }
            } else if model.chartType == .bar || model.chartType == .stackedBar {
                rect = pdr.rect
            } else {
                rect = .zero
            }
            
            var path = Path()
            path.addRect(rect)
            path.closeSubpath()
            
            seriesPath.append([path])
        }
        
        return seriesPath
    }
    
    func plotPath(_ model: ChartModel) -> [[[Path]]] {
        [[[Path]]]()
    }
    
    func snapChartToPoint(_ model: ChartModel, at x: CGFloat) -> CGFloat {
        let maxDataCount = model.numOfCategories()
        let unitWidth: CGFloat = max(1 / CGFloat(max(maxDataCount - 1, 1)), ChartViewLayout.minUnitWidth)
        let categoryIndex = Int(x / unitWidth + 0.5).clamp(low: 0, high: maxDataCount)
        let clusteredX = unitWidth * CGFloat(categoryIndex)
        
        return clusteredX
    }
    
    func displayCategoryIndexes(_ model: ChartModel, rect: CGRect) -> ClosedRange<Int> {
        let width = rect.size.width
        let tmpScaleX = self.scaleX(model, plotViewSize: rect.size)
        let tmpStartPosition = self.startPosition(model, plotViewSize: rect.size)
        let maxDataCount = model.numOfCategories()
        
        let startPosX = tmpStartPosition.x * tmpScaleX * width
        let unitWidth: CGFloat = max(width * tmpScaleX / CGFloat(max(maxDataCount - 1, 1)), ChartViewLayout.minUnitWidth)
        let startIndex = Int(startPosX / unitWidth).clamp(low: 0, high: maxDataCount - 1)
        let endIndex = Int(((startPosX + width) / unitWidth).rounded(.up)).clamp(low: startIndex, high: maxDataCount - 1)
        
        return startIndex ... endIndex
    }
    
    func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let width = rect.size.width
        
        let tmpScaleX = self.scaleX(model, plotViewSize: rect.size)
        let tmpScaleY = self.scaleY(model, plotViewSize: rect.size)
        let tmpStartPosition = self.startPosition(model, plotViewSize: rect.size)
        let startPosX = tmpStartPosition.x * tmpScaleX * rect.size.width
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: width)
        let point = CGPoint(x: x, y: atPoint.y)
        let count = model.numOfCategories()
        let unitWidth: CGFloat = max(width * tmpScaleX / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
        let startIndex = Int((startPosX / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - startPosX.truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        let index = Int((point.x - startOffset) / unitWidth + 0.5) + startIndex
        
        var closestDataIndex = index.clamp(low: 0, high: count - 1)
        
        let xPos = rect.origin.x + startOffset + CGFloat(closestDataIndex - startIndex) * unitWidth
        if xPos - rect.origin.x - rect.size.width > 1 {
            closestDataIndex -= 1
        }
        
        var curSeriesIndex = model.currentSeriesIndex
        if model.selectionMode == .single, model.chartType != .stock {
            var minYDistance = CGFloat(Int.max)
            
            for seriesIndex in 0 ... max(model.data.count - 1, 0) {
                if let tmpY = plotItemYPosition(model, seriesIndex: seriesIndex, categoryIndex: closestDataIndex) {
                    let y = (tmpY - tmpStartPosition.y) * tmpScaleY * rect.size.height
                    if abs(y - point.y) < minYDistance {
                        curSeriesIndex = seriesIndex
                        minYDistance = abs(y - point.y)
                    }
                }
            }
        }
        
        return (curSeriesIndex, closestDataIndex)
    }
    
    // range selection
    func closestSelectedPlotItems(_ model: ChartModel, atPoints: [CGPoint], rect: CGRect, layoutDirection: LayoutDirection) -> [(Int, Int)] {
        if let p0 = atPoints.first, let p1 = atPoints.last {
            let firstItem = self.closestSelectedPlotItem(model, atPoint: p0, rect: rect, layoutDirection: layoutDirection)
            let lastItem = self.closestSelectedPlotItem(model, atPoint: p1, rect: rect, layoutDirection: layoutDirection)
            let items = [firstItem, lastItem].sorted { $0.1 <= $1.1 }
            
            return items
        }
        
        return []
    }

    func plotItemYPosition(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> CGFloat? {
        let secondary = model.indexesOfSecondaryValueAxis.contains(seriesIndex)
        let range = ChartUtility.displayRange(model, secondary: secondary)
    
        if let value = ChartUtility.dimensionValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex) {
            let y = 1 - (CGFloat(value) - range.lowerBound) / (range.upperBound - range.lowerBound)
            
            return y
        }
        
        return nil
    }
}
