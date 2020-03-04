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
        // process intra data
        if let titles = model.titlesForCategory {
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd HH:mm:ss"
            var modifiedTitles: [[String]] = []
            var dataChanged = false
            
            for (i, category) in titles.enumerated() {
                let count = category.count
                var seriesTitles: [String] = category
                
                if count >= 3,
                    let startTime = StockUtility.categoryValueInDate(model, seriesIndex: i, categoryIndex: 0),
                    let secondTime = StockUtility.categoryValueInDate(model, seriesIndex: i, categoryIndex: 1),
                    let timeBeforeEndTime = StockUtility.categoryValueInDate(model, seriesIndex: i, categoryIndex: count - 2),
                    let endTime = StockUtility.categoryValueInDate(model, seriesIndex: i, categoryIndex: count - 1) {
                    
                    let startTimeInterval = secondTime.timeIntervalSince(startTime)
                    var endTimeInterval = endTime.timeIntervalSince(timeBeforeEndTime)
                    var j: Int = count - 1
                    var insertedTime = timeBeforeEndTime
                    var titlesChanged = false
                    // indicates this is intraday
                    while endTimeInterval > startTimeInterval {
                        let time = insertedTime.advanced(by: startTimeInterval)
                        let timeString = df.string(from: time)
                        seriesTitles.insert(timeString, at: j)
                        j += 1
                        insertedTime = time
                        endTimeInterval -= startTimeInterval
                        titlesChanged = true
                        dataChanged = true
                    }
                    if titlesChanged {
                        model.data[i].removeLast()
                    }
                }
                
                modifiedTitles.append(seriesTitles)
            }
            
            if dataChanged {
                model.titlesForCategory = modifiedTitles
            }
        }
        
        var ranges: [ClosedRange<Double>] = []
        // go through series
        for i in 0 ..< model.data.count {
            let range: ClosedRange<Double> = {
                var allValues: [Double] = []
                
                if let _ = model.data[i].first?.value {
                    allValues = model.data[i].map { $0.value! }
                }
                else if let _ = model.data[i].first?.values {
                    allValues = model.data[i].map({$0.values!.first!})
                }
                                    
                let min = allValues.min() ?? 0
                let max = allValues.max() ?? 1
                
                let maxVal = max + (max - min) * 0.3
                var minVal = min - (max - min) * 0.3
                
                if minVal < 0 {
                    minVal = 0
                }
                
                guard minVal != maxVal else { return 0...maxVal }
                return minVal...maxVal
            }()
            ranges.append(range)
        }
        
        model.ranges = ranges
               
        return model
    }
    
    static func lastValidDimIndex(_ model: ChartModel) -> Int {
        return model.data[model.currentSeriesIndex].count - 1
    }
    
    static func isIntraDay(_ model: ChartModel) -> Bool {
        let countA = model.titlesForCategory?[model.currentSeriesIndex].count ?? 0
        let countB = StockUtility.lastValidDimIndex(model) + 1
        
        return countA != countB
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
        return dimensionValue(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex, dimensionIndex: 0)
    }
    
    static func categoryValue(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> String? {
        guard let categories = model.titlesForCategory else { return nil }
        
        if categories.count < seriesIndex || categories[seriesIndex].count < categoryIndex {
            return nil
        }
        
        return categories[seriesIndex][categoryIndex]
    }
    
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
    
    static func categoryValue(_ model: ChartModel, categoryIndex: Int) -> String? {
        return categoryValue(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex)
    }
    
    static func numOfDataItmes(_ model: ChartModel) -> Int {
        if let titles = model.titlesForCategory {
            return titles[model.currentSeriesIndex].count
        }
        
        return model.data[model.currentSeriesIndex].count
    }
}
