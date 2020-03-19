//
//  AxisDataSource.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/18/20.
//

import Foundation
import SwiftUI

protocol AxisDataSource: class {
    func xAxisTitles(_ model: ChartModel, rect: CGRect) -> [AxisTitle]
    func yAxisTitles(_ model: ChartModel, rect: CGRect, displayRange: ClosedRange<CGFloat>) -> [AxisTitle]
    
    func axisView(_ model: ChartModel, displayRange: ClosedRange<CGFloat>, formattedStringForValue value: Double) -> String
}

class DefaultAxisDataSource: AxisDataSource {
    func xAxisTitles(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        var ret: [AxisTitle] = []
        
        if let titlesForCategory = model.titlesForCategory {
            if model.currentSeriesIndex < titlesForCategory.count {
                let count = titlesForCategory[model.currentSeriesIndex].count
                if count > 1 {
                    let stepWidth = rect.size.width / CGFloat(count - 1)
                    for i in 0 ..< count {
                        ret.append(AxisTitle(index: i, title: titlesForCategory[model.currentSeriesIndex][i], pos: rect.origin.x + CGFloat(i) * stepWidth))
                    }
                }
            }
        }
        
        return ret
    }
    
    func yAxisTitles(_ model: ChartModel, rect: CGRect, displayRange: ClosedRange<CGFloat>) -> [AxisTitle] {
        let minVal = displayRange.lowerBound
        let maxVal = displayRange.upperBound
        
        let yAxisLabelsCount = max(1, model.numberOfGridlines)
        let stepHeight = rect.size.height / CGFloat(yAxisLabelsCount)
        
        var yAxisLabels: [AxisTitle] = [AxisTitle(index: 0, title: axisView(model, displayRange: displayRange, formattedStringForValue: Double(maxVal)), pos: rect.origin.y)]
        
        if yAxisLabelsCount > 1 {
            for i in 1..<yAxisLabelsCount {
                let val = maxVal - CGFloat(i) * (maxVal - minVal) / CGFloat(yAxisLabelsCount + 1)
                yAxisLabels.append(AxisTitle(index: i, title: axisView(model, displayRange: displayRange, formattedStringForValue: Double(val)), pos: rect.origin.y + CGFloat(i) * stepHeight))
            }
        }
        
        return yAxisLabels
    }
    
    func axisView(_ model: ChartModel, displayRange: ClosedRange<CGFloat>, formattedStringForValue value: Double) -> String {
        let step = (displayRange.upperBound - displayRange.lowerBound) / CGFloat(model.numberOfGridlines)
        let dataPrecision = step >= 1 ? "%.0f" : (step >= 0.1 ? "%.1f" : "%.2f")
        
        return String(format: dataPrecision, value)
    }
}
