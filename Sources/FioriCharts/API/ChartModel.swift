//
//  FUIChartDataDirect.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 2/5/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

public struct ChartLabelAttribute {
    /// Size of the label font in points.
    var fontSize: Double
    
    /// fontWeight is currently fixed at `regular`
    var fontWeight: Double
    
    /// Text color for the label.
    var color: Color
    
    /// True when the associated label(s) should be hidden.
    var isHidden: Bool

    /// Specifies how far from the axis labels should be rendered.
    var offset: Double
}

public struct ChartLineAttribute {

    /// Width of the line in points.
    var width: Double

    /// Color of the line.
    var color: UIColor

    /// Dash pattern for the line. Specifies the length of painted segments, and the gap between them.
    var dashPattern: (length: Int, gap: Int)?

    /// Indicates whether the lines should be displayed or not.
    var isHidden: Bool
}

public struct ChartBarAtrribute {
    /// Color of the line.
    var color: UIColor
    
    /// todo: border line/color
}

public struct ChartPlotItemAtrribute {
    var bar: ChartBarAtrribute
    var label: ChartLabelAttribute
}

public struct ChartAxisAttribute {
    
    /// Properties of the axis title label.
    var titleLabel: ChartLabelAttribute
    
    /// Properties for the axis gridline labels.
    var labels: ChartLabelAttribute
    
    /// Properties for the axis gridlines.
    var gridlines: ChartLineAttribute
    
    /**
    Properties for the axis baseline, which is typically usually 0.
    - Only numeric axes have a baseline.
    */
    var baseline: ChartLineAttribute
}

public class ChartModel: ObservableObject, Identifiable {

    ///
    public enum DimensionData<T> {
        case single(T)
        case array([T])
        
        var value: T? {
            switch self {
            case .single(let val):
                return val
            default:
                return nil
            }
        }
        
        var values: [T]? {
            switch self {
            case .array(let vals):
                return vals
            default:
                return nil
            }
        }
        
        var count: Int {
            switch self {
            case .array(let vals):
                return vals.count
            default:
                return 1
            }
        }
        
        var first: T? {
            switch self {
            case .array(let vals):
                return vals.first
            case .single(let val):
                return val
            }
        }
        
        subscript(index: Int) -> T {
            switch self {
            case .array(let vals):
                return vals[index]
                
            case .single(let val):
                return val
            }
        }
    }
    
    /// data
    @Published public var chartType: ChartType
    /// seires -> category -> dimension
    @Published public var data: [[DimensionData<Double>]]
    @Published public var titlesForCategory: [[String]]?
    @Published public var titlesForAxis: [String]?
    @Published public var labelsForDimension: [[DimensionData<String>]]?
    
    /// to be removed
    @Published public var colorsForCategory: [[Color]]?
    
    /// styles
    @Published public var plotAttributes:[[ChartPlotItemAtrribute]]?
    @Published public var axesAttributes:[[ChartAxisAttribute]]?
    @Published public var numOfGridLines: [Int] = [3,3]
    
    ///
    @Published public var userInteractionEnabled: Bool = true
    
    ///
    @Published public var panChartToDataPointOnly = false
  
    /// selection state
    @Published var selectedSeriesIndex: Int?
    @Published var selectedCategoryIndex: Int?
    @Published var selectedDimensionIndex: Int?
    
    /**
     Provides attributes for the primary numeric axis.

     - For stock, clustered column, line, and combo charts this is the Y axis.
     - For bar charts this is the X axis.
     */
    @Published public var numericAxis: ChartNumericAxis
    
    /**
     Provides attributes for the secondary numeric axis.
     
     - For clustered line, area and combo charts this is the secondary Y axis.
     */
    @Published public var secondaryNumericAxis: ChartNumericAxis

    /**
     Provides attributes for the category axis.

     - For stock, clustered column, line, and combo charts this is the X axis.
     - For bar charts this is the Y axis.
     */
    @Published public var categoryAxis: ChartCategoryAxis
    
    var ranges: [ClosedRange<Double>]?
    
    public let id = UUID()
    
    public init(chartType: ChartType, data: [[Double]], titlesForCategory: [[String]]? = nil, colorsForCategory: [[Color]]? = nil, titlesForAxis: [String]? = nil, labelsForDimension: [[String]]? = nil, selectedSeriesIndex: Int? = nil, userInteractionEnabled: Bool = true, numericAxis: ChartNumericAxis? = nil, secondaryNumericAxis: ChartNumericAxis? = nil, categoryAxis: ChartCategoryAxis? = nil) {
        self.chartType = chartType
        self.colorsForCategory = colorsForCategory
        self.titlesForAxis = titlesForAxis
        self.selectedSeriesIndex = selectedSeriesIndex
        self.userInteractionEnabled = userInteractionEnabled
        
        var intradayIndex: [Int] = []
        if chartType != .stock {
            self.titlesForCategory = titlesForCategory
        }
        else {
            if let titles = titlesForCategory {
                var modifiedTitlesForCategory: [[String]] = []
                for (i, category) in titles.enumerated() {
                    if let modifiedTitles = ChartModel.preprocessIntradayDataForStock(category) {
                        intradayIndex.append(i)
                        modifiedTitlesForCategory.append(modifiedTitles)
                    }
                    else {
                        modifiedTitlesForCategory.append(category)
                    }
                }
                
                self.titlesForCategory = modifiedTitlesForCategory
            }
        }
    
        var tmpData: [[DimensionData<Double>]] = []
        for (i, c) in data.enumerated() {
            var series: [DimensionData<Double>] = []
            for (j, d) in c.enumerated() {
                if intradayIndex.contains(i) && j == c.count - 1 {
                    continue
                }
                else {
                    series.append(DimensionData.single(d))
                }
            }
            tmpData.append(series)
        }
        self.data = tmpData
        
        if let labels = labelsForDimension {
            var tmpLabels: [[DimensionData<String>]] = []
            for c in labels {
                var series: [DimensionData<String>] = []
                for d in c {
                    series.append(DimensionData.single(d))
                }
                tmpLabels.append(series)
            }
            self.labelsForDimension = tmpLabels
        }
        
        if let numericAxis = numericAxis {
            self.numericAxis = numericAxis
        }
        else {
            self.numericAxis = ChartNumericAxis()
        }
        
        if let secondaryNumericAxis = secondaryNumericAxis {
            self.secondaryNumericAxis = secondaryNumericAxis
        }
        else {
            self.secondaryNumericAxis = ChartNumericAxis()
        }
        
        if let categoryAxis = categoryAxis {
            self.categoryAxis = categoryAxis
        }
        else {
            self.categoryAxis = ChartCategoryAxis()
        }
        
        initialize()
    }
    
    public init(chartType: ChartType, data: [[[Double]]], titlesForCategory: [[String]]? = nil, colorsForCategory: [[Color]]? = nil, titlesForAxis: [String]? = nil, labelsForDimension: [[[String]]]? = nil, selectedSeriesIndex: Int? = nil, userInteractionEnabled: Bool = true, numericAxis: ChartNumericAxis? = nil, secondaryNumericAxis: ChartNumericAxis? = nil, categoryAxis: ChartCategoryAxis? = nil) {
        self.chartType = chartType
        self.colorsForCategory = colorsForCategory
        self.titlesForAxis = titlesForAxis
        self.selectedSeriesIndex = selectedSeriesIndex
        self.userInteractionEnabled = userInteractionEnabled
        
        var intradayIndex: [Int] = []
        if chartType != .stock {
            self.titlesForCategory = titlesForCategory
        }
        else {
            if let titles = titlesForCategory {
                var modifiedTitlesForCategory: [[String]] = []
                for (i, category) in titles.enumerated() {
                    if let modifiedTitles = ChartModel.preprocessIntradayDataForStock(category) {
                        intradayIndex.append(i)
                        modifiedTitlesForCategory.append(modifiedTitles)
                    }
                    else {
                        modifiedTitlesForCategory.append(category)
                    }
                }
                
                self.titlesForCategory = modifiedTitlesForCategory
            }
        }
        
        var tmpData: [[DimensionData<Double>]] = []
        for (i, c) in data.enumerated() {
            var series: [DimensionData<Double>] = []
            for (j, d) in c.enumerated() {
                if intradayIndex.contains(i) && j == c.count - 1 {
                    continue
                }
                else {
                    series.append(DimensionData.array(d))
                }
            }
            tmpData.append(series)
        }
        self.data = tmpData
        
        if let labels = labelsForDimension {
            var tmpLabels: [[DimensionData<String>]] = []
            for c in labels {
                var series: [DimensionData<String>] = []
                for d in c {
                    series.append(DimensionData.array(d))
                }
                tmpLabels.append(series)
            }
            self.labelsForDimension = tmpLabels
        }
        
        if let numericAxis = numericAxis {
            self.numericAxis = numericAxis
        }
        else {
            self.numericAxis = ChartNumericAxis()
        }
        
        if let secondaryNumericAxis = secondaryNumericAxis {
            self.secondaryNumericAxis = secondaryNumericAxis
        }
        else {
            self.secondaryNumericAxis = ChartNumericAxis()
        }
        
        if let categoryAxis = categoryAxis {
            self.categoryAxis = categoryAxis
        }
        else {
            self.categoryAxis = ChartCategoryAxis()
        }
        
        initialize()
    }
    
    func initialize() {
        // check if there is data
        if let _ = data.first?.first {
            self.ranges = []
            
            // go through series
            for i in 0 ..< data.count {
                let range: ClosedRange<Double> = {
                    var allValues: [Double] = []
                    
                    if let _ = data[i].first?.value {
                        allValues = data[i].map { $0.value! }
                    }
                    else if let _ = data[i].first?.values {
                        allValues = data[i].map({$0.values!.first!})
                    }
                                        
                    let min = allValues.min() ?? 0
                    let max = allValues.max() ?? 1
                    
                    var minVal = min
                    var maxVal = max
                    if self.chartType == .stock {
                        maxVal = max + (max - min) * 0.3
                        minVal = min - (max - min) * 0.3
                        
                        if minVal < 0 {
                            minVal = 0
                        }
                    }
                    
                    guard minVal != maxVal else { return 0...maxVal }
                    return minVal...maxVal
                }()
                self.ranges?.append(range)
            }
        }
    }
    
    // interpolate time strings in categoryTitles if it is intraday mode and return modified titles
    static func preprocessIntradayDataForStock(_ categoryTitles: [String]) -> [String]? {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var dataChanged = false
        
        let count = categoryTitles.count
        if count >= 3,
            let startTime = StockUtility.date(from: categoryTitles[0]),
            let secondTime = StockUtility.date(from: categoryTitles[1]),
            let timeBeforeEndTime = StockUtility.date(from: categoryTitles[count - 2]),
            let endTime = StockUtility.date(from: categoryTitles[count - 1]) {
            
            let startTimeInterval = secondTime.timeIntervalSince(startTime)
            var endTimeInterval = endTime.timeIntervalSince(timeBeforeEndTime)
            var j: Int = count - 1
            var insertedTime = timeBeforeEndTime
            var modifiedCategoryTitles = categoryTitles
            
            // indicates this is intraday
            while endTimeInterval > startTimeInterval {
                let time = insertedTime.advanced(by: startTimeInterval)
                let timeString = df.string(from: time)
                modifiedCategoryTitles.insert(timeString, at: j)
                j += 1
                insertedTime = time
                endTimeInterval -= startTimeInterval
                dataChanged = true
            }
            
            if dataChanged {
                return modifiedCategoryTitles
            }
        }
        
        return nil
    }
    
    func normalizedValue<T: BinaryFloatingPoint>(for value: T, seriesIndex: Int) -> T {
        if let range = ranges {
            return abs(T(value)) / T(range[seriesIndex].upperBound - range[seriesIndex].lowerBound)
        }
        else {
            return 0
        }
    }
    
    func normalizedValue<T: BinaryFloatingPoint>(for value: T) -> T {
        if let range = ranges {
            var minValue = range.first!.lowerBound
            var maxValue = range.first!.upperBound
            for i in range {
                minValue = min(minValue, i.lowerBound)
                maxValue = max(maxValue, i.upperBound)
            }
            
            return abs(value) / T(maxValue - minValue)
        }
        else {
            return T(0)
        }
    }
    
    var currentSeriesIndex: Int {
        if let current = selectedSeriesIndex {
            return current
        }
        else {
            return 0
        }
    }
    
    var currentCategoryIndex: Int {
        if let current = selectedCategoryIndex {
            return current
        }
        else {
            return 0
        }
    }
    
    var currentDimensionIndex: Int {
        if let current = selectedDimensionIndex {
            return current
        }
        else {
            return 0
        }
    }
}


extension ChartModel {
    func colorAt(seriesIndex: Int, categoryIndex: Int) -> Color {
        guard let tmp = colorsForCategory, seriesIndex < tmp.count else {
            return Color.black
        }
            
        let colors = tmp[seriesIndex]
        if categoryIndex >= colors.count {
            return colors.last!
        }
        else {
            return colors[categoryIndex]
        }
    }
    
    func labelAt(seriesIndex: Int, categoryIndex: Int, dimensionIndex: Int) -> String? {
        guard let tmp = labelsForDimension, seriesIndex < tmp.count, categoryIndex < tmp[seriesIndex].count, dimensionIndex < tmp[seriesIndex][categoryIndex].count else {
            return nil
        }
        
        return tmp[seriesIndex][categoryIndex][dimensionIndex]
    }
    
    func titleAt(seriesIndex: Int, categoryIndex: Int) -> String? {
        guard let tmp = titlesForCategory, seriesIndex < tmp.count, categoryIndex < tmp[seriesIndex].count else {
            return nil
        }
        
        return tmp[seriesIndex][categoryIndex]
    }
    
    func dataItemsIn(seriesIndex: Int, dimensionIndex: Int = 0) -> [MicroChartDataItem] {
        var res: [MicroChartDataItem] = []
        
        guard seriesIndex < data.count, data[seriesIndex].count > 0 else {
            return res
        }
        
        for i in 0 ..< data[seriesIndex].count {
            if data[seriesIndex][i].count > dimensionIndex {
                let value = data[seriesIndex][i][dimensionIndex]
                
                let item = MicroChartDataItem(value: CGFloat(value),
                                              displayValue: labelAt(seriesIndex: seriesIndex, categoryIndex: i, dimensionIndex: dimensionIndex),
                                              label: titleAt(seriesIndex: seriesIndex, categoryIndex: i),
                                              color: colorAt(seriesIndex: seriesIndex, categoryIndex: i))
                res.append(item)
            }
        }
        
        return res
    }
}

