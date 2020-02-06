//
//  StockMicroChartModel.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/18/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI


public class StockMicroChartModel: ObservableObject, Identifiable {
    
    // Date,Open,Close,High,Low,Volume
    // "2020-01-06 09:30:00",16.65,16.52,16.65,16.52,395565
    public struct TradeInfo: Identifiable {
        let date: Date
        let open: Float
        let close: Float
        let high: Float
        let low: Float
        let volume: Float
        
        public var id: Date {
            return date
        }
    }
    
    public let id = UUID()
    
    @Published var name: String
    @Published var priceUnit: String
    @Published var modes: [String]
    @Published var data: [[TradeInfo]]
    // this is for one 1 day view only when stock market trading is not closed. The close time need to be provided as a string like "16:00:00".
    @Published var timeRange:[Int: String]?
    @Published var curMode = 0
    
    @Published var displayStartIndex:Int = 0
    @Published var lastDisplayStartIndex = 0
    @Published var displayEndIndex:Int = 0
    @Published var lastDisplayEndIndex:Int = 0
    
    var ranges: [ClosedRange<CGFloat>]
    
    public init(name: String, priceUnit: String, modes:[String], data: [[TradeInfo]], timeRange:[Int: String]? = nil, curMode: Int = 0) {
        self.name = name
        self.priceUnit = priceUnit
        self.modes = modes
        self.data = data
        self.timeRange = timeRange
        self.curMode = curMode
        self.ranges = []
        
        // protection
        if data.count <= curMode {
            self.curMode = 0
        }
        self.displayEndIndex = data[curMode].count - 1
        self.lastDisplayEndIndex = self.displayEndIndex
        
        for mode in self.data {
            let range: ClosedRange<CGFloat> = {
                guard mode.count > 0 else {return 0...0}
                
                let min = mode.reduce(mode.first!, { x, y in
                    if x.close <= y.close {
                        return x
                    }
                    else {
                        return y
                    }
                })
                
                let max = mode.reduce(mode.first!, { x, y in
                    if x.close >= y.close {
                        return x
                    }
                    else {
                        return y
                    }
                })
                
                let maxVal = max.close + (max.close - min.close) * 0.3
                var minVal = min.close - (max.close - min.close) * 0.3
                if minVal < 0 {
                    minVal = 0
                }
        
                return CGFloat(minVal)...CGFloat(maxVal)
            }()
            
            self.ranges.append(range)
        }
    }
}

