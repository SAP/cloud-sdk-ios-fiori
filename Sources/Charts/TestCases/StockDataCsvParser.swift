//
//  StockDataCsvParser.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/6/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation

class StockDataCsvParser {
    var data: [StockMicroChartModel.TradeInfo]
    
    init(fileName: String, dateFormat: String) {
        data = []
        
        let df = DateFormatter()
        df.dateFormat = dateFormat
        
        guard let csvData = getCsvAsStrinFromFile(fileName) else {return}
        csvData.enumerateLines { (line, _) in
            let cols = line.components(separatedBy: ",")
            if cols[0] != "Date" {
                var dateString = cols[0]
                var index = dateString.firstIndex(of: "\"")
                while index != nil {
                    dateString.remove(at: index!)
                    index = dateString.firstIndex(of: "\"")
                }
                
                let tmp = df.date(from: dateString)
                if let date = tmp {
                    let open = Float(cols[1]) ?? 0
                    let close = Float(cols[2]) ?? 0
                    let high = Float(cols[3]) ?? 0
                    let low = Float(cols[4]) ?? 0
                    let volumn = Float(cols[5]) ?? 0
                    let item = StockMicroChartModel.TradeInfo(date: date, open: open, close: close, high: high, low: low, volume: volumn)
                    self.data.append(item)
                }
            }
        }
    }
    
    func getCsvAsStrinFromFile(_ fn: String) -> String? {
        guard let fileURL = Bundle.main.url(forResource: fn, withExtension: ".csv") else {return nil}
        
        do {
            let csvData = try String(contentsOf: fileURL)
            return csvData
        } catch {
            return nil
        }
    }
}
