//
//  ChartUtility.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/8/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

class ChartUtility {
    static func numOfDataItmes(_ model: ChartModel) -> Int {
        if let titles = model.titlesForCategory {
            return titles[model.currentSeriesIndex].count
        }
        
        return model.data[model.currentSeriesIndex].count
    }
    
    static func displayRange(_ model: ChartModel) -> ClosedRange<CGFloat> {
        // calculate display range
        var minVal: CGFloat = CGFloat(Int.max)
        var maxVal: CGFloat = CGFloat(Int.min)
        if model.chartType == .stock {
            minVal = CGFloat(model.ranges?[model.currentSeriesIndex].lowerBound ?? 0)
            maxVal = CGFloat(model.ranges?[model.currentSeriesIndex].upperBound ?? 1)
        } else {
            if let ranges = model.ranges {
                for range in ranges {
                    minVal = min(CGFloat(range.lowerBound), minVal)
                    maxVal = max(CGFloat(range.upperBound), maxVal)
                }
            }
        }
        
        var displayMinVal: CGFloat = minVal - (maxVal - minVal) * 0.2
        var displayMaxVal: CGFloat = maxVal + (maxVal - minVal) * 0.2
        
        if abs(displayMaxVal) > 10 {
            displayMaxVal = ChartUtility.roundToGoodNumber(val: displayMaxVal)
        }
        
        if abs(displayMinVal) > 10 {
            displayMinVal = ChartUtility.roundToGoodNumber(val: displayMinVal)
        }
        
        let valueType = model.valueType
        if valueType == .allPositive && (model.numericAxis.isZeroBased || displayMinVal < 0) {
            displayMinVal = 0
        } else if valueType == .allNegative && (model.numericAxis.isZeroBased || displayMaxVal > 0) {
            displayMaxVal = 0
        }
        
        if let tmp = model.numericAxis.explicitMin {
            displayMinVal = CGFloat(tmp)
        }
        
        if let tmp = model.numericAxis.explicitMax {
            displayMaxVal = CGFloat(tmp)
        }
        
        return displayMinVal...displayMaxVal
    }
    
    static func roundToGoodNumber(val: CGFloat) -> CGFloat {
        let negative: CGFloat = val > 0 ? 1 : -1
        var factor: CGFloat = 1
        var coefficient = negative * val
        while coefficient >= 10 {
            coefficient /= 10
            factor *= 10
        }
        
        if CGFloat(Int(coefficient + 0.5)) > coefficient {
            coefficient = CGFloat(Int(coefficient + 0.5))
        } else if CGFloat(Int(coefficient + 0.9)) > coefficient {
            coefficient = CGFloat(Int(coefficient + 0.9)) - 0.5
        } else {
            coefficient = CGFloat(Int(coefficient))
        }
        
        return negative * coefficient * factor
    }
    
    static func lastValidDimIndex(_ model: ChartModel) -> Int {
        return model.data[model.currentSeriesIndex].count - 1
    }
    
    static func isIntraDay(_ model: ChartModel) -> Bool {
        let countA = model.titlesForCategory?[model.currentSeriesIndex].count ?? 0
        let countB = ChartUtility.lastValidDimIndex(model) + 1
        
        return countA != countB
    }
    
    static func dimensionValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int, dimensionIndex: Int) -> Double? {
        if model.data.count < seriesIndex || model.data[seriesIndex].count < categoryIndex {
            return nil
        }
        
        if let value = model.data[seriesIndex][categoryIndex].value {
            return value
        } else if let values = model.data[seriesIndex][categoryIndex].values {
            if values.count > dimensionIndex {
                return values[dimensionIndex]
            }
        }
        
        return nil
    }
    
    static func dimensionValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> Double? {
        return dimensionValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex, dimensionIndex: 0)
    }
    
    static func dimensionValue(_ model: ChartModel, categoryIndex: Int) -> Double? {
        return dimensionValue(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex, dimensionIndex: 0)
    }
    
    static func categoryValue(_ model: ChartModel, categoryIndex: Int) -> String? {
        return categoryValue(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex)
    }
    
    static func categoryValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> String? {
        guard let categories = model.titlesForCategory else { return nil }
        
        if seriesIndex < 0 || seriesIndex >= categories.count || categoryIndex < 0 || categoryIndex >= categories[seriesIndex].count {
            return nil
        }
        
        return categories[seriesIndex][categoryIndex]
    }
    
    static func xPos(_ pos: CGFloat, layoutDirection: LayoutDirection, width: CGFloat) -> CGFloat {
        if layoutDirection == .rightToLeft {
            return (width - pos)
        } else {
            return pos
        }
    }
    
    /*
     Stock chart functions only
     */
    static func categoryValueInDate(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> Date? {
        guard let dateString = categoryValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex) else { return nil }
        
        return date(from: dateString)
    }
    
    static func categoryValueInDate(_ model: ChartModel, categoryIndex: Int) -> Date? {
        return categoryValueInDate(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex)
    }
    
    static func date(from s: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return df.date(from: s)
    }
}
