//
//  StockUtility.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/8/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

class StockUtility {
    static func preprocessModel(_ model: ChartModel) -> ChartModel {
        model.displayEndIndex = StockUtility.calNumOfDataItmesInDayMode(model) - 1
        model.lastDisplayEndIndex = model.displayEndIndex
        
        if let ranges = model.ranges{
            for i in 0 ..< ranges.count {
                let range = ranges[i]
                
                let maxVal = range.upperBound + (range.upperBound - range.lowerBound) * 0.3
                var minVal = range.lowerBound - (range.upperBound - range.lowerBound) * 0.3
                
                if minVal < 0 {
                    minVal = 0
                }
                    
                model.ranges![i] = minVal...maxVal
            }
        }
        
        return model
    }
    
    static func isItADayModeAndNotClosed(_ model: ChartModel) -> Bool {
//        if let tr = model.timeRange, let _ = tr[model.selectedSeriesIndex!] {
//            return true
//        }
        
        return false
    }
    
    static func dimensionValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int, dimensionIndex: Int) -> Double? {
        if model.data.count < seriesIndex || model.data[seriesIndex].count < categoryIndex {
            return nil
        }
        
        if let value = model.data[seriesIndex][categoryIndex].value {
            return value
        }
        else if let values = model.data[seriesIndex][categoryIndex].values {
            if values.count > dimensionIndex {
                return values[dimensionIndex]
            }
        }
        
        return nil
    }
    
    static func dimensionValue(_ model: ChartModel, categoryIndex: Int) -> Double? {
        return dimensionValue(model, seriesIndex: model.selectedSeriesIndex!, categoryIndex: categoryIndex, dimensionIndex: 0)
    }
    
    static func categoryValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> String? {
        guard let categories = model.titlesForCategory else { return nil }
        
        if categories.count < seriesIndex || categories[seriesIndex].count < categoryIndex {
            return nil
        }
        
        return categories[seriesIndex][categoryIndex]
    }
    
    static func categoryValue(_ model: ChartModel, categoryIndex: Int) -> String? {
        return categoryValue(model, seriesIndex: model.selectedSeriesIndex!, categoryIndex: categoryIndex)
    }
    
    static func categoryValueInDate(_ model: ChartModel, categoryIndex: Int) -> Date? {
        guard let dateString = categoryValue(model, seriesIndex: model.selectedSeriesIndex!, categoryIndex: categoryIndex) else { return nil }
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return df.date(from: dateString)
    }
    
    static func calNumOfDataItemsInDayModePerHour(_ model: ChartModel) -> Int {
        guard let startTime = StockUtility.categoryValueInDate(model, categoryIndex: 0) else { return 0}
        guard let endTime = StockUtility.categoryValueInDate(model, categoryIndex: model.titlesForCategory!.first!.count - 1) else { return 0 }
        
        let duration = endTime.timeIntervalSince(startTime)
        
        // this means there is only one item of data (not allowed)
        if duration == 0 {
            return 390
        }
        else {
            return model.data[model.selectedSeriesIndex!].count * 3600 / Int(duration)
        }
    }
    
    static func calTimeIntervalInDayMode(_ model: ChartModel) -> TimeInterval {
        if isItADayModeAndNotClosed(model) {
            guard let startTime = StockUtility.categoryValueInDate(model, categoryIndex: 0) else { return 0}
            guard let endTime = StockUtility.categoryValueInDate(model, categoryIndex: model.titlesForCategory!.first!.count - 1) else { return 0 }
            
            return endTime.timeIntervalSince(startTime)
        }
        
        return 0
    }
    
    static func calNumOfDataItmesInDayMode(_ model: ChartModel) -> Int {
        if isItADayModeAndNotClosed(model) {
            let duration = calTimeIntervalInDayMode(model)
            let num = calNumOfDataItemsInDayModePerHour(model)
            
            let res = Int(duration * Double(num) / Double(3600))
            
            return res
        }
        
        let data = model.data[model.selectedSeriesIndex!]
        return data.count
    }
}
