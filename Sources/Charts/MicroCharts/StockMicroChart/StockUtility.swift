//
//  StockUtility.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/8/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation

class StockUtility {
    static func isItADayModeAndNotClosed(_ model: StockMicroChartModel) -> Bool {
        if let tr = model.timeRange, let _ = tr[model.curMode] {
            return true
        }
        
        return false
    }
    
    static func calNumOfDataItemsInDayModePerHour(_ model: StockMicroChartModel) -> Int {
        let startTime = model.data[model.curMode].first!.date
        let endTime = model.data[model.curMode].last!.date
        
        let duration = endTime.timeIntervalSince(startTime)
        
        // this means there is only one item of data (not allowed)
        if duration == 0 {
            return 390
        }
        else {
            return model.data[model.curMode].count * 3600 / Int(duration)
        }
    }
    
    static func calTimeIntervalInDayMode(_ model: StockMicroChartModel) -> TimeInterval {
        if isItADayModeAndNotClosed(model) {
            let tr = model.timeRange![model.curMode]!
        
            let startTime = model.data[model.curMode].first!.date
            
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            let endHourString = df.string(from: startTime) + " " + tr
            df.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let endHourDate = df.date(from: endHourString)
            if let endDate = endHourDate {
                return endDate.timeIntervalSince(startTime)
            }
        }
        
        return 0
    }
    
    static func calNumOfDataItmesInDayMode(_ model: StockMicroChartModel) -> Int {
        if isItADayModeAndNotClosed(model) {
            let duration = calTimeIntervalInDayMode(model)
            let num = calNumOfDataItemsInDayModePerHour(model)
            
            let res = Int(duration * Double(num) / Double(3600))
            
            return res
        }
        
        let data = model.data[model.curMode]
        return data.count
    }
}
