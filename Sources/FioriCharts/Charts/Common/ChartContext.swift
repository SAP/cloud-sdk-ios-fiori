//
//  ChartContext.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/18/20.
//

import Foundation
import SwiftUI

protocol ChartContext: class {
    var isEnoughSpaceToShowXAxisLables: Bool { get set }
    
    func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle]
    
    func xAxisGridlines(_ model: ChartModel, rect: CGRect) -> [AxisTitle]
    
    func yAxisFormattedString(_ model: ChartModel, value: Double, secondary: Bool) -> String
    
    func yAxisLabels(_ model: ChartModel, rect: CGRect, layoutDirection: LayoutDirection, secondary: Bool) -> [AxisTitle]
    
    func plotData(_ model: ChartModel) -> [[ChartPlotData]]
    
    func snapChartToPoint(_ model: ChartModel, at x: CGFloat, in rect: CGRect) -> CGFloat
    
    func displayCategoryIndexesAndOffsets(_ model: ChartModel, rect: CGRect) -> (startIndex: Int, endIndex: Int, startOffset: CGFloat, endOffset: CGFloat)
    
    // single selection
    func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int)
    
    // range selection
    func closestSelectedPlotItems(_ model: ChartModel, atPoints: [CGPoint], rect: CGRect, layoutDirection: LayoutDirection) -> [(Int, Int)]
}

class DefaultChartContext: ChartContext {
    var isEnoughSpaceToShowXAxisLables: Bool = true
    
    func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        var ret: [AxisTitle] = []
        
        if abs(CGFloat(model.categoryAxis.baseline.width) - rect.size.height) < 1 {
            return ret
        }
        
        let count = ChartUtility.numOfDataItems(model)
        let width = rect.size.width
        let startPosX = model.startPos.x * model.scale * width
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(count - 1, 1)), 1)
        let startIndex = min(Int((startPosX / unitWidth).rounded(.up)), count - 1)
        let endIndex = max(min(Int(((startPosX + width) / unitWidth).rounded(.down)), count - 1), startIndex)
        
        let startOffset: CGFloat = (unitWidth - startPosX.truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        
        let labelsIndex = model.categoryAxis.labelLayoutStyle == .allOrNothing ? Array(startIndex ... endIndex) : (startIndex != endIndex ? [startIndex, endIndex] : [startIndex])
        
        for (index, i) in labelsIndex.enumerated() {
            var offset: CGFloat = 0
            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            if model.categoryAxis.labelLayoutStyle == .range {
                let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                if index == 0 {
                    offset = min(size.width, (rect.size.width - 2) / 2) / 2
                } else {
                    offset = -min(size.width, (rect.size.width - 2) / 2) / 2
                }
            }
            
            ret.append(AxisTitle(index: i,
                                 title: title,
                                 pos: CGPoint(x: rect.origin.x + startOffset + offset + CGFloat(i - startIndex) * unitWidth, y: 0)))
        }
        
        return ret
    }
    
    func xAxisGridlines(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        var ret: [AxisTitle] = []
        let count = ChartUtility.numOfDataItems(model)
        let width = rect.size.width
        let startPosX = model.startPos.x * model.scale * width
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(count - 1, 1)), 1)
        let startIndex = min(Int((startPosX / unitWidth).rounded(.up)), count - 1)
        let endIndex = min(max(Int(((startPosX + width) / unitWidth).rounded(.down)), startIndex), count - 1)
        
        let startOffset: CGFloat = (unitWidth - startPosX.truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        
        let labelsIndex = model.categoryAxis.labelLayoutStyle == .allOrNothing ? Array(startIndex ... endIndex) :
            ((startIndex != endIndex) ? [startIndex, endIndex] : [startIndex])
        
        for i in labelsIndex {
            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            ret.append(AxisTitle(index: i,
                                 title: title,
                                 pos: CGPoint(x: rect.origin.x + startOffset + CGFloat(i - startIndex) * unitWidth, y: 0)))
        }
        
        return ret
    }
    
    private func numberMagnitude(from value: Double) -> (magnitude: String, divisor: Double) {
        var divisorValue: Double = 1
        var stringValue = " "
        let d = abs(value)
        
        if d < 1e3 {   // we can represent up to 999 directly
            divisorValue = 1
        } else if d < 1e6 {   // 999k
            stringValue = "K"
            divisorValue = 1e3
        } else if d < 1e9 {    // 999m
            stringValue = "M"
            divisorValue = 1e6
        } else if d < 1e12 {   // 999b
            stringValue = "B"
            divisorValue = 1e9
        } else if d < 1e15 {   // 999t
            stringValue = "T"
            divisorValue = 1e12
        } else if d < 1e18 {   // 999q
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
        if 100 > value && value >= 10 {
            var numberOfFractionDigits = nf.maximumFractionDigits
            if numberOfFractionDigits > 1 || divisor > 1 {
                numberOfFractionDigits = 1
            }
            
            nf.maximumFractionDigits = numberOfFractionDigits
        }
        
        // 0.001 -> 10
        if 10 > value && value > 0.001 {
            var numberOfFractionDigits = nf.maximumFractionDigits
            if numberOfFractionDigits > 2 || divisor > 1 {
                numberOfFractionDigits = 2
            }
            
            nf.maximumFractionDigits = numberOfFractionDigits
        }
        
        // Scientific
        if 0 != value && (value < 0.001 || value >= 1E18) {
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
        let (magnitude, divisor) = numberMagnitude(from: aNum)
        aNum /= divisor
        
        /*
         Fetch the correct formatter for the value.
         */
        let formatter = numberFormatter(for: aNum, divisor: divisor, abbreviatedFormatter: abbreviatedFormatter)
        
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
    
    func yAxisLabels(_ model: ChartModel, rect: CGRect, layoutDirection: LayoutDirection = .leftToRight, secondary: Bool = false) -> [AxisTitle] {
        let ticks = secondary ? model.secondaryNumericAxisTickValues : model.numericAxisTickValues
        let axis = secondary ? model.secondaryNumericAxis : model.numericAxis
        
        let yAxisLabelsCount = Int(ticks.tickCount)
        let height = rect.size.height
        
        var maxPointRadius: CGFloat = 0
        if model.chartType == .line || model.chartType == .area {
            let maxPointDiameter = model.seriesAttributes.reduce(0) { (result, seriesAttribute) -> CGFloat in
                return max(seriesAttribute.point.diameter, result)
            }

            maxPointRadius = maxPointDiameter / 2 + ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth
        }
        
        var yAxisLabels: [AxisTitle] = []
        for i in 0 ..< yAxisLabelsCount {
            let val = ticks.tickValues[i]
            let title = yAxisFormattedString(model, value: Double(val), secondary: secondary)
            let size = title.boundingBoxSize(with: axis.labels.fontSize)
            var x: CGFloat
            if secondary {
                x = size.width / 2.0 + max(axis.baseline.width / 2.0, maxPointRadius) + ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline
                x = min(rect.size.width / 2 + max(axis.baseline.width / 2.0, maxPointRadius) + ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline, x)
            } else {
                x = rect.size.width - size.width / 2.0 - max(axis.baseline.width / 2.0, maxPointRadius) - ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline
                x = max(rect.size.width / 2 - max(axis.baseline.width / 2.0, maxPointRadius) - ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline, x)
            }

            yAxisLabels.append(AxisTitle(index: i,
                                         value: val,
                                         title: title,
                                         pos: CGPoint(x: x, y: rect.origin.y + height * (1.0 - ticks.tickPositions[i]))))
        }
        
        return yAxisLabels
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
            return abbreviatedString(for: value, useSuffix: axis.isMagnitudedDisplayed, abbreviatedFormatter: axis.abbreviatedFormatter)
        } else {
            return axis.formatter.string(from: NSNumber(value: value)) ?? " "
        }
    }
    
    func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        return []
    }
    
    func snapChartToPoint(_ model: ChartModel, at x: CGFloat, in rect: CGRect) -> CGFloat {
        let unitWidth: CGFloat = max(model.scale * rect.size.width / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1)), 1)
        let categoryIndex = Int(x / unitWidth)
        let x = CGFloat(categoryIndex) * unitWidth
        
        return x
    }
    
    func displayCategoryIndexesAndOffsets(_ model: ChartModel, rect: CGRect) -> (startIndex: Int, endIndex: Int, startOffset: CGFloat, endOffset: CGFloat) {
        let width = rect.size.width
        let startPosX = model.startPos.x * model.scale * width
        let maxDataCount = model.numOfCategories(in: 0)
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(maxDataCount - 1, 1)), 1)
        let startIndex = Int(startPosX / unitWidth).clamp(low: 0, high: maxDataCount - 1)
        
        var endIndex = Int(((startPosX + width) / unitWidth).rounded(.up)).clamp(low: 0, high: maxDataCount - 1)
        let startOffset: CGFloat = -startPosX.truncatingRemainder(dividingBy: unitWidth)
        
        let endOffset: CGFloat = (CGFloat(endIndex) * unitWidth - startPosX - width).truncatingRemainder(dividingBy: unitWidth)
        
        if endIndex > ChartUtility.lastValidDimIndex(model) {
            endIndex = ChartUtility.lastValidDimIndex(model)
        }
        
        return (startIndex, endIndex, startOffset, endOffset)
    }
    
    func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let width = rect.size.width
        let startPosX = model.startPos.x * model.scale * width
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: width)
        let point = CGPoint(x: x, y: atPoint.y)
        
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1)), 1)
        let startIndex = Int((startPosX / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - startPosX.truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        let index: Int = Int((point.x - startOffset) / unitWidth + 0.5) + startIndex
        
        var closestDataIndex = index.clamp(low: 0, high: ChartUtility.lastValidDimIndex(model))
        
        let xPos = rect.origin.x + startOffset + CGFloat(closestDataIndex - startIndex) * unitWidth
        if xPos - rect.origin.x - rect.size.width > 1 {
            closestDataIndex -= 1
        }
        
        var curSeriesIndex = model.currentSeriesIndex
        if model.selectionMode == .single {
            var minYDistance = CGFloat(Int.max)
            if model.selectionMode == .single && model.chartType != .stock {
                for seriesIndex in 0 ... max(model.data.count - 1, 0) {
                    if let y = ChartUtility.plotItemYPosition(model, seriesIndex: seriesIndex, categoryIndex: closestDataIndex, rect: rect) {
                        if abs(y - point.y) < minYDistance {
                            curSeriesIndex = seriesIndex
                            minYDistance = abs(y - point.y)
                        }
                    }
                }
            }
        }
        
        return (curSeriesIndex, closestDataIndex)
    }
    
    // range selection
    func closestSelectedPlotItems(_ model: ChartModel, atPoints: [CGPoint], rect: CGRect, layoutDirection: LayoutDirection) -> [(Int, Int)] {
        if let p0 = atPoints.first, let p1 = atPoints.last {
            let firstItem = closestSelectedPlotItem(model, atPoint: p0, rect: rect, layoutDirection: layoutDirection)
            let lastItem = closestSelectedPlotItem(model, atPoint: p1, rect: rect, layoutDirection: layoutDirection)
            let items = [firstItem, lastItem].sorted { $0.1 <= $1.1 }
            
            return items
        }
        
        return []
    }

}
