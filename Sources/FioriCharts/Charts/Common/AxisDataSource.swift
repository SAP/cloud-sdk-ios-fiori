//
//  AxisDataSource.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/18/20.
//

import Foundation
import SwiftUI

protocol AxisDataSource: class {
    func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle]
    
    func xAxisGridlines(_ model: ChartModel, rect: CGRect) -> [AxisTitle]
    
    func yAxisLabels(_ model: ChartModel, rect: CGRect, displayRange: ClosedRange<CGFloat>) -> [AxisTitle]
    
    func closestDataPoint(_ model: ChartModel, toPoint: CGPoint, rect: CGRect)
    
    func axisView(_ model: ChartModel, displayRange: ClosedRange<CGFloat>, formattedStringForValue value: Double) -> String
}

class DefaultAxisDataSource: AxisDataSource {
    func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        var ret: [AxisTitle] = []
        
        if abs(CGFloat(model.categoryAxis.baseline.width) - rect.size.height) < 1 {
            return ret
        }
        
        let count = ChartUtility.numOfDataItmes(model)
        let width = rect.size.width
        
        let startPosInFloat = CGFloat(model.startPos)
        let unitWidth: CGFloat = width * model.scale / CGFloat(count - 1)
        let startIndex = min(Int((startPosInFloat / unitWidth).rounded(.up)), count - 1)
        let endIndex = max(min(Int(((startPosInFloat + width) / unitWidth).rounded(.down)), count - 1), startIndex)
        
        let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)

        let labelsIndex = model.categoryAxis.labelLayoutStyle == .allOrNothing ? Array(startIndex ... endIndex) : (startIndex != endIndex ? [startIndex, endIndex] : [startIndex])
        
        for (index, i) in labelsIndex.enumerated() {
            var offset: CGFloat = 0
            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            if model.categoryAxis.labelLayoutStyle == .range {
                let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                if index == 0 {
                    offset = min(size.width, (rect.size.width - 2) / 2) / 2
                }
                else {
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
        let count = ChartUtility.numOfDataItmes(model)
        let width = rect.size.width
        
        let startPosInFloat = CGFloat(model.startPos)
        let unitWidth: CGFloat = width * model.scale / CGFloat(count - 1)
        let startIndex = Int((startPosInFloat / unitWidth).rounded(.up))
        let endIndex = min(Int(((startPosInFloat + width) / unitWidth).rounded(.down)), count - 1)
        
        let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)

        let labelsIndex = model.categoryAxis.labelLayoutStyle == .allOrNothing ? Array(startIndex ... endIndex) : [startIndex, endIndex]
        
        for i in labelsIndex {
            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            ret.append(AxisTitle(index: i,
                                 title: title,
                                 pos: CGPoint(x: rect.origin.x + startOffset + CGFloat(i - startIndex) * unitWidth, y: 0)))
        }
            
        return ret
    }
    
    func yAxisLabels(_ model: ChartModel, rect: CGRect, displayRange: ClosedRange<CGFloat>) -> [AxisTitle] {
        var minVal = displayRange.lowerBound
        var maxVal = displayRange.upperBound
        var startPos: CGFloat = 0
        
        let yAxisLabelsCount = max(1, model.numberOfGridlines)
        var stepValue = (maxVal - minVal) / CGFloat(yAxisLabelsCount)
        let unitHeight = rect.size.height / (maxVal - minVal)
        let valueType = model.valueType
        if valueType == .mixed && maxVal != (-minVal) {
            var count = Int(maxVal / stepValue + 0.6)
            if maxVal < (-minVal){
                count = Int((-minVal) / stepValue + 0.6)
            }
            
            stepValue = min(maxVal / CGFloat(count), (-minVal)/CGFloat(yAxisLabelsCount - count))
            maxVal = stepValue * CGFloat(count)
            minVal = -CGFloat(yAxisLabelsCount - count) * stepValue
            startPos = (displayRange.upperBound - maxVal) * unitHeight
        }
        let stepHeight = stepValue * unitHeight
        
        var yAxisLabels: [AxisTitle] = []
        for i in 0...yAxisLabelsCount {
            let val = maxVal - CGFloat(i) * (maxVal - minVal) / CGFloat(yAxisLabelsCount)
            let title = axisView(model, displayRange: displayRange, formattedStringForValue: Double(val))
            let size = title.boundingBoxSize(with: model.numericAxis.labels.fontSize)
            yAxisLabels.append(AxisTitle(index: i,
                                         value: val,
                                         title: title,
                                         pos: CGPoint(x: rect.size.width - CGFloat(model.numericAxis.baseline.width) - 1 - size.width / 2, y: rect.origin.y + startPos + CGFloat(i) * stepHeight)))
        }
        
        return yAxisLabels
    }
    
    func closestDataPoint(_ model: ChartModel, toPoint: CGPoint, rect: CGRect) {
        let width = rect.size.width
        
        let unitWidth: CGFloat = width * model.scale / CGFloat(ChartUtility.numOfDataItmes(model) - 1)
        let startIndex = Int((CGFloat(model.startPos) / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        let index: Int = Int((toPoint.x - startOffset) / unitWidth + 0.5) + startIndex
        
        var closestDataIndex = index.clamp(low: 0, high: ChartUtility.lastValidDimIndex(model))
        
        let xPos = rect.origin.x + startOffset + CGFloat(closestDataIndex - startIndex) * unitWidth
        if xPos - rect.origin.x - rect.size.width > 1 {
            closestDataIndex -= 1
        }
        
        model.selectedCategoryInRange = closestDataIndex ... closestDataIndex
    }
    
    func axisView(_ model: ChartModel, displayRange: ClosedRange<CGFloat>, formattedStringForValue value: Double) -> String {
        let step = (displayRange.upperBound - displayRange.lowerBound) / CGFloat(model.numberOfGridlines)
        let dataPrecision = step >= 1 ? "%.0f" : (step >= 0.1 ? "%.1f" : "%.2f")
        
        return String(format: dataPrecision, value)
    }
}
