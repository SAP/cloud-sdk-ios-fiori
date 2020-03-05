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
