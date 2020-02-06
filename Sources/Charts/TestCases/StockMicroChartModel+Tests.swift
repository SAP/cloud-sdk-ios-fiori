//
//  File.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/18/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation

extension StockMicroChartModel {
    /*static let day: [(Int64, Float)] = [(1577975400, 168), (1577977200, 162), (1577979000, 160), (1577980800, 165),
                                        (1577982600, 166), (1577984400, 172), (1577986200, 170), (1577988000, 176),
                                        (1577989800, 171), (1577991600, 176), (1577993400, 174), (1577995200, 172),
                                        (1577997000, 169), (1577998800, 171)]
    
    static let week: [(Int64, Float)] = [(1577975400, 150), (1577975400, 152), (1577975400, 157), (1577975400, 165), (1577975400, 166), (1577975400, 172), (1577975400, 160), (1577975400, 156), (1577975400, 151), (1577975400, 156), (1577975400, 164), (1577975400, 172), (1577975400, 159), (1577975400, 156.89)]
    
    static let month: [(Int64, Float)] = [(1577975400, 138), (1577975400, 132), (1577975400, 127), (1577975400, 145), (1577975400, 156), (1577975400, 172), (1577975400, 150), (1577975400, 176), (1577975400, 161), (1577975400, 166), (1577975400, 154), (1577975400, 172), (1577975400, 169), (1577975400, 166.89)]
    
    static let quarter: [(Int64, Float)] = [(1577975400, 118), (1577975400, 122), (1577975400, 127), (1577975400, 135), (1577975400, 146), (1577975400, 142), (1577975400, 130), (1577975400, 146), (1577975400, 151), (1577975400, 146), (1577975400, 154), (1577975400, 162), (1577975400, 169), (1577975400, 166.89)]
    
    static let ytd: [(Int64, Float)] = [(1577975400, 108), (1577975400, 112), (1577975400, 124), (1577975400, 138), (1577975400, 146), (1577975400, 142), (1577975400, 130), (1577975400, 146), (1577975400, 151), (1577975400, 146), (1577975400, 164), (1577975400, 162), (1577975400, 169), (1577975400, 166.89)]
    
    static let year: [(Int64, Float)] = [(1577975400, 128), (1577975400, 122), (1577975400, 127), (1577975400, 135), (1577975400, 146), (1577975400, 142), (1577975400, 130), (1577975400, 146), (1577975400, 151), (1577975400, 126), (1577975400, 154), (1577975400, 162), (1577975400, 169), (1577975400, 166.89)]
    
    static let fiveyear: [(Int64, Float)] = [(1577975400, 138), (1577975400, 112), (1577975400, 127), (1577975400, 139), (1577975400, 146), (1577975400, 142), (1577975400, 130), (1577975400, 146), (1577975400, 151), (1577975400, 136), (1577975400, 154), (1577975400, 162), (1577975400, 149), (1577975400, 176.89)]
    */
    static let day = StockDataCsvParser(fileName: "worldtradingdata-intraday-SNAP_2020_01_06", dateFormat: "yyyy-MM-dd HH:mm:ss").data
    
    static let day2 = StockDataCsvParser(fileName: "worldtradingdata-intraday-SNAP_2020_01_06_Complete", dateFormat: "yyyy-MM-dd HH:mm:ss").data
    
    static let week = StockDataCsvParser(fileName: "worldtradingdata-intraday-SNAP_2020_01_06_Week", dateFormat: "yyyy-MM-dd HH:mm:ss").data
    
    static let month = StockDataCsvParser(fileName: "worldtradingdata-history-SNAP_month", dateFormat: "yyyy-MM-dd").data
    
    static let quarter = StockDataCsvParser(fileName: "worldtradingdata-history-SNAP_quarter", dateFormat: "yyyy-MM-dd").data
    
    static let year = StockDataCsvParser(fileName: "worldtradingdata-history-SNAP_year", dateFormat: "yyyy-MM-dd").data
    
    static let threeyear = StockDataCsvParser(fileName: "worldtradingdata-history-SNAP_history", dateFormat: "yyyy-MM-dd").data
    
    static let test1 = StockMicroChartModel(name: "SNAP", priceUnit: "in USD", modes: ["1D", "1W", "1M", "1Q", "1Y"], data: [day, week, month, quarter, year], timeRange: [0: "16:00:00"])
    
    static let test2 = StockMicroChartModel(name: "SNAP", priceUnit: "in USD", modes: ["1D", "1W", "1M", "1Q", "1Y", "3Y"], data: [day2, week, month, quarter, year, threeyear], curMode: 1)
    
    static let test3 = StockMicroChartModel(name: "AMD", priceUnit: "in EUR", modes: [], data: [])
    
    
    public static let allCases = [test1, test2]
}
