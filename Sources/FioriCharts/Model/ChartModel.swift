//
//  FUIChartDataDirect.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 2/5/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

/// Enum for available selection modes.
public enum ChartSelectionMode {

    /// Selects a single value in the currently selected series and category indices.
    case single

    /// Selects one value in each series for the selected category index(es).
    case all
}

/// Enum for default category selection.
public enum ChartCategorySelectionMode {
    
    /// No default selection mode is defined. Any set selection will be used.
    case index
    
    /// First category of the selected series and dimension will be used.
    case first
    
    /// Last category of the selected series and dimension will be used.
    case last
}

/// Selection state for points and rects in the chart.
enum ChartSelectionState {
    case normal
    case selected
    case highlighted
    case disabled
}

/// value type for Numberic Axis
enum ChartValueType {
    case allPositive
    case allNegative
    case mixed
}

public typealias NumericAxisLabelFormatHandler = (Double, ChartAxisId) -> String?

public class ChartModel: ObservableObject, Identifiable, NSCopying {

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
    /// seires -> category -> dimension (either a single value or an array)
    @Published public var data: [[DimensionData<CGFloat?>]]

    @Published public var titlesForCategory: [[String?]]?
    
    @Published public var titlesForAxis: [ChartAxisId: String]?
    
    @Published public var labelsForDimension: [[DimensionData<String?>]]?
    
    /// app to provide this to format values from numeric axis
    public var numericAxisLabelFormatHandler: NumericAxisLabelFormatHandler?
    
    @Published public var backgroundColor: HexColor = Palette.hexColor(for: .background)
    
    @Published public var selectionEnabled: Bool = false
    @Published public var zoomEnabled: Bool = false
    
    /// enable or disable user interaction
    @Published public var userInteractionEnabled: Bool = false
    
    ///
    @Published public var snapToPoint: Bool = false
  
    /// seires attributes
    @Published public var seriesAttributes: [ChartSeriesAttributes]
    
    /// colors for any category in any series
    /// it is optional. this color overwrite the color from seriesAttributes
    /// format: [seriesIndex1:  [catrgoryIndex1: HexColor,  ..., catrgoryIndexN: HexColor], ... , seriesIndexN:  [catrgoryIndex1: HexColor,  ..., catrgoryIndexM: HexColor]]
    @Published public var colorsForCategory: [Int: [Int: HexColor]]
    
    @Published public var numberOfGridlines: Int = 2
    
    /**
     Provides attributes for the category axis.

     - For stock, clustered column, line, and combo charts this is the X axis.
     - For bar charts this is the Y axis.
     */
    @Published public var categoryAxis: ChartCategoryAxisAttributes
    
    /**
     Provides attributes for the primary numeric axis.

     - For stock, clustered column, line, and combo charts this is the Y axis.
     - For bar charts this is the X axis.
     */
    @Published public var numericAxis: ChartNumericAxisAttributes
    
    /**
     Provides attributes for the secondary numeric axis.
     
     - For clustered line, area and combo charts this is the secondary Y axis.
     */
    @Published public var secondaryNumericAxis: ChartNumericAxisAttributes
    
    /**
     Indicates indexes of column series for combo chart.
     - Given indexes of series will be treated as column and the rest series will be treated as line.
     */
    @Published public var indexesOfColumnSeries: IndexSet = IndexSet()
    
    /**
     Indicates total indexes for waterfall chart.
     - Given indexes will treat the corresponding categories as totals.
     - The corresponding category values in the provided data should correspond to the total sum of the preceding values.
     - If the corresponding category value is nil in the provided data, the chart will complete the sum of the total value, which can be retrieved through `plotItem(atSeries:category:)`.
     */
    public var indexesOfTotalsCategories: IndexSet = IndexSet()
    
    /**
     Indicates secondary value axis series indexes for line based charts.
     - The secondary value index works with .line, .area and .combo charts only.
     - Given series indexes will assign the corresponding series to the secondary value axis.
     */
    public var indexesOfSecondaryValueAxis: IndexSet = IndexSet()
    
    /// selection state
    /**
     Determines which plot items should be selected for a category.
     - single : Selects a single value in the currently selected series and category indices.
     - all : Selects one value in each series for the selected category index(es).
     */
    @Published public var selectionMode: ChartSelectionMode = .single
    
    /**
     Default category selection mode for the chart. Defines how the initial selection is handled. Only valid values are selected.
     Used in combination with: `select(category:)`, `select(categoriesInRange:)`, `select(series:)`, `select(dimension:)`.
     If no series is selected through `select(series:)`, the first series will be used.
     For Scatter and Bubble charts, if no dimension is defined through `select(dimension:)`, the Y axis dimension will be used.
     - `MCDefaultCategorySelectionIndex` This is the default behavior, where the given selection will be considered as the initial selection.
     - `MCDefaultCategorySelectionFirst` The first category will be considered as the default selection.
     - `MCDefaultCategorySelectionLast` The last gategory will be considered as the default selection.
    */
    @Published public var defaultCategorySelectionMode: ChartCategorySelectionMode = .index
    
    /// When false a state is allowed in which no series is selected/active.
    @Published public var selectionRequired: Bool = false
    
    @Published public var selectedSeriesIndex: Int?
    
    /**
     Selects a category range, including the lower and and upper bounds of the range. The resulting selection(s) depend on the current `selectionMode`.
     */
    @Published public var selectedCategoryInRange: ClosedRange<Int>?
    @Published public var selectedDimensionInRange: ClosedRange<Int>?
    
    // scale is not allowed to be less than 1.0
    @Published public var scale: CGFloat = 1.0
    @Published public var startPos: Int = 0
    
    //
    // Flag that indicates if we should adjust to nice values, or use the data
    // minimum and maximum to calculate the range.
    //
    // Chart scale is adjusted so that gridlines (ticks) fall on "nice" values. Explicit min/max overrides this.
    //
    // There is also a "loose label" variable as well, which allows labels to exceed the data range.
    // It is inconsistent when it comes to enabling it.
    //    • ellipse - yes
    //    • waterfall - yes
    //    • stacked column - no
    //    • line - no
    //    • column - no
    //    • combo - yes
    @Published public var adjustToNiceValues = true
    
    //
    // Flag that indicates wether the Y Axis should be adjusted to better fit the available space.
    // By default, all column based charts have this enabled and all line based don't.
    @Published public var fudgeYAxisRange = false
    
    var ranges: [ClosedRange<CGFloat>] {
        var result: [ClosedRange<CGFloat>] = []
        
        // go through series
        for i in 0 ..< data.count {
            let range: ClosedRange<CGFloat> = {
                var allValues: [CGFloat] = []
                
                // single value
                if let _ = data[i].first?.value {
                    allValues = data[i].compactMap { $0.value! }
                } else if let _ = data[i].first?.values {
                    allValues = data[i].compactMap { $0.values!.first! }
                }
                                    
                let min = allValues.min() ?? 0
                let max = allValues.max() ?? (min + 1)
    
                guard min != max else { return min...max+1 }
                return min...max
            }()
            result.append(range)
        }
        
        return result
    }
    
    struct DataElementsForAxisTickValues: Hashable {
        
        let noData: Bool
        /*
         * The min/max values in the data.
         */
        let dataMinimum: CGFloat
        let dataMaximum: CGFloat
        
        // only applicable for stock, otherwise it is 0 always
        let currentSeriesIndex: Int
        
        let numberOfGridlines: Int
        
        let adjustToNiceValues: Bool
        
        let fudgeYAxisRange: Bool
        
        let secondaryRange: Bool
    }
    
    // cache for AxisTickValues
    var numericAxisTickValuesCache = [DataElementsForAxisTickValues: AxisTickValues]()
    var numericAxisTickValues: AxisTickValues {
        let de = ChartUtility.calculateDataElementsForAxisTickValues(self, secondaryRange: false)
        
        if de.noData {
            return AxisTickValues(plotMinimum: 0, plotMaximum: 1, plotBaselineValue: 0, plotBaselinePosition: 0, tickMinimum: 0, tickMaximum: 1, dataMinimum: 0, dataMaximum: 1, plotRange: 1, tickRange: 1, dataRange: 1, plotScale: 1, tickScale: 1, dataScale: 1, tickStepSize: 1, tickValues: [0, 1], tickPositions: [0, 1], tickCount: 2)
        }
        else if let result = numericAxisTickValuesCache[de] {
            return result
        }
        else {
            let result = ChartUtility.calculateRangeProperties(self, dataElements: de, secondaryRange: false)
            if numericAxisTickValuesCache.count > 10 {
                numericAxisTickValuesCache.removeAll()
            }
            
            numericAxisTickValuesCache[de] = result
            
            return result
        }
    }
//    var secondaryNumericAxisTickValues: AxisTickValues
    
    var valueType: ChartValueType {
        let range: ClosedRange<CGFloat> = ranges.reduce(ranges[0]) { (result, next) -> ClosedRange<CGFloat> in
            return min(result.lowerBound, next.lowerBound) ... max(result.upperBound, next.upperBound)
        }
        
        if range.lowerBound >= 0 {
            return .allPositive
        } else if range.upperBound <= 0 {
            return .allNegative
        } else {
            return .mixed
        }
    }
    
    public let id = UUID()
    
    public init(chartType: ChartType,
                data: [[DimensionData<CGFloat?>]],
                titlesForCategory: [[String?]]?,
                colorsForCategory: [Int: [Int: HexColor]],
                titlesForAxis: [ChartAxisId: String]?,
                labelsForDimension: [[DimensionData<String?>]]?,
                backgroundColor: HexColor,
                selectedSeriesIndex: Int?,
                userInteractionEnabled: Bool,
                seriesAttributes: [ChartSeriesAttributes],
                categoryAxis: ChartCategoryAxisAttributes,
                numericAxis: ChartNumericAxisAttributes,
                secondaryNumericAxis: ChartNumericAxisAttributes) {
        self._chartType = Published(initialValue: chartType)
        self._data = Published(initialValue: data)
        self._titlesForCategory = Published(initialValue: titlesForCategory)
        self._colorsForCategory = Published(initialValue: colorsForCategory)
        self._titlesForAxis = Published(initialValue: titlesForAxis)
        self._labelsForDimension = Published(initialValue: labelsForDimension)
        self._backgroundColor = Published(initialValue: backgroundColor)
        self._selectedSeriesIndex = Published(initialValue: selectedSeriesIndex)
        self._userInteractionEnabled = Published(initialValue: userInteractionEnabled)
        self._seriesAttributes = Published(initialValue: seriesAttributes)
        self._categoryAxis = Published(initialValue: categoryAxis)
        self._numericAxis = Published(initialValue: numericAxis)
        self._secondaryNumericAxis = Published(initialValue: secondaryNumericAxis)
    }
    
    public init(chartType: ChartType,
                data: [[Double?]],
                titlesForCategory: [[String?]]? = nil,
                colorsForCategory: [Int: [Int: HexColor]]? = nil,
                titlesForAxis: [ChartAxisId: String]? = nil,
                labelsForDimension: [[String?]]? = nil,
                selectedSeriesIndex: Int? = nil,
                userInteractionEnabled: Bool = false,
                seriesAttributes: [ChartSeriesAttributes]? = nil,
                categoryAxis: ChartCategoryAxisAttributes? = nil,
                numericAxis: ChartNumericAxisAttributes? = nil,
                secondaryNumericAxis: ChartNumericAxisAttributes? = nil) {
        self._chartType = Published(initialValue: chartType)
        if let colorsForCategory = colorsForCategory {
            self._colorsForCategory = Published(initialValue: colorsForCategory)
        } else {
            self._colorsForCategory = Published(initialValue: [Int: [Int: HexColor]]())
        }
        
        self._titlesForAxis = Published(initialValue: titlesForAxis)
        self._selectedSeriesIndex = Published(initialValue: selectedSeriesIndex)
        self._userInteractionEnabled = Published(initialValue: userInteractionEnabled)
        
        var intradayIndex: [Int] = []
        if chartType != .stock {
            self._titlesForCategory = Published(initialValue: titlesForCategory)
        } else {
            if let titles = titlesForCategory {
                var modifiedTitlesForCategory: [[String?]] = []
                for (i, category) in titles.enumerated() {
                    if let modifiedTitles = ChartModel.preprocessIntradayDataForStock(category) {
                        intradayIndex.append(i)
                        modifiedTitlesForCategory.append(modifiedTitles)
                    } else {
                        modifiedTitlesForCategory.append(category)
                    }
                }
                
                self._titlesForCategory = Published(initialValue: modifiedTitlesForCategory)
            }
        }
    
        var tmpData: [[DimensionData<CGFloat?>]] = []
        for (i, c) in data.enumerated() {
            var s: [DimensionData<CGFloat?>] = []
            for (j, d) in c.enumerated() {
                if intradayIndex.contains(i) && j == c.count - 1 {
                    continue
                } else {
                    s.append(DimensionData.single(ChartUtility.cgfloatOptional(from: d)))
                }
            }
            tmpData.append(s)
        }
        self._data = Published(initialValue: tmpData)
        
        if let labels = labelsForDimension {
            var tmpLabels: [[DimensionData<String?>]] = []
            for c in labels {
                var s: [DimensionData<String?>] = []
                for d in c {
                    s.append(DimensionData.single(d))
                }
                tmpLabels.append(s)
            }
            self._labelsForDimension = Published(initialValue: tmpLabels)
        }
        
        if let categoryAxis = categoryAxis {
            self._categoryAxis = Published(initialValue: categoryAxis)
        } else {
            let axis = ChartCategoryAxisAttributes()
            if chartType != .stock {
                axis.gridlines.isHidden = true
            }
            self._categoryAxis = Published(initialValue: axis)
        }
        
        if let numericAxis = numericAxis {
            self._numericAxis = Published(initialValue: numericAxis)
        } else {
            let axis = ChartNumericAxisAttributes()
            if chartType == .stock {
                axis.isZeroBased = false
                axis.abbreviatesLabels = false
            }
            else {
                axis.baseline.isHidden = true
            }

            self._numericAxis = Published(initialValue: axis)
        }
        
        if let secondaryNumericAxis = secondaryNumericAxis {
            self._secondaryNumericAxis = Published(initialValue: secondaryNumericAxis)
        } else {
            let axis = ChartNumericAxisAttributes()
            if chartType != .stock {
                axis.baseline.isHidden = true
            }
            self._secondaryNumericAxis = Published(initialValue: axis)
        }
        
        if let seriesAttributes = seriesAttributes {
            if seriesAttributes.count == data.count {
                self._seriesAttributes = Published(initialValue: seriesAttributes)
            }
            else {
                var tmp = seriesAttributes
                for i in seriesAttributes.count ..< data.count {
                    tmp.append(seriesAttributes[i % seriesAttributes.count])
                }
                self._seriesAttributes = Published(initialValue: seriesAttributes)
            }
        } else {
            let sa = ChartModel.initChartSeriesAttributes(chartType: chartType, seriesCount: data.count)
            self._seriesAttributes = Published(initialValue: sa)
        }
    }
    
    public init(chartType: ChartType,
                data: [[[Double?]]],
                titlesForCategory: [[String?]]? = nil,
                colorsForCategory: [Int: [Int: HexColor]]? = nil,
                titlesForAxis: [ChartAxisId: String]? = nil,
                labelsForDimension: [[[String?]]]? = nil,
                selectedSeriesIndex: Int? = nil,
                userInteractionEnabled: Bool = false,
                seriesAttributes: [ChartSeriesAttributes]? = nil,
                categoryAxis: ChartCategoryAxisAttributes? = nil,
                numericAxis: ChartNumericAxisAttributes? = nil,
                secondaryNumericAxis: ChartNumericAxisAttributes? = nil) {
        self._chartType = Published(initialValue: chartType)
        if let colorsForCategory = colorsForCategory {
            self._colorsForCategory = Published(initialValue: colorsForCategory)
        } else {
            self._colorsForCategory = Published(initialValue: [Int: [Int: HexColor]]())
        }
        
        self._titlesForAxis = Published(initialValue: titlesForAxis)
        self._selectedSeriesIndex = Published(initialValue: selectedSeriesIndex)
        self._userInteractionEnabled = Published(initialValue: userInteractionEnabled)
        
        var intradayIndex: [Int] = []
        if chartType != .stock {
            self._titlesForCategory = Published(initialValue: titlesForCategory)
        } else {
            if let titles = titlesForCategory {
                var modifiedTitlesForCategory: [[String?]] = []
                for (i, category) in titles.enumerated() {
                    if let modifiedTitles = ChartModel.preprocessIntradayDataForStock(category) {
                        intradayIndex.append(i)
                        modifiedTitlesForCategory.append(modifiedTitles)
                    } else {
                        modifiedTitlesForCategory.append(category)
                    }
                }
                
                self._titlesForCategory = Published(initialValue: modifiedTitlesForCategory)
            }
        }
        
        var tmpData: [[DimensionData<CGFloat?>]] = []
        for (i, c) in data.enumerated() {
            var s: [DimensionData<CGFloat?>] = []
            for (j, d) in c.enumerated() {
                if intradayIndex.contains(i) && j == c.count - 1 {
                    continue
                } else {
                    let tmpD: [CGFloat?] = d.map { (v) in
                        ChartUtility.cgfloatOptional(from: v)
                    }
                    
                    s.append(DimensionData.array(tmpD))
                }
            }
            tmpData.append(s)
        }
        self._data = Published(initialValue: tmpData)
        
        if let labels = labelsForDimension {
            var tmpLabels: [[DimensionData<String?>]] = []
            for c in labels {
                var s: [DimensionData<String?>] = []
                for d in c {
                    s.append(DimensionData.array(d))
                }
                tmpLabels.append(s)
            }
            self._labelsForDimension = Published(initialValue: tmpLabels)
        }
        
        if let numericAxis = numericAxis {
            self._numericAxis = Published(initialValue: numericAxis)
        } else {
            let axis = ChartNumericAxisAttributes()
            if chartType == .stock {
                axis.isZeroBased = false
                axis.abbreviatesLabels = false
            }
            else {
                axis.baseline.isHidden = true
            }
            self._numericAxis = Published(initialValue: axis)
        }
        
        if let secondaryNumericAxis = secondaryNumericAxis {
            self._secondaryNumericAxis = Published(initialValue: secondaryNumericAxis)
        } else {
            self._secondaryNumericAxis = Published(initialValue: ChartNumericAxisAttributes())
        }
        
        if let categoryAxis = categoryAxis {
            self._categoryAxis = Published(initialValue: categoryAxis)
        } else {
            self._categoryAxis = Published(initialValue: ChartCategoryAxisAttributes())
        }
        
        if let seriesAttributes = seriesAttributes {
            if seriesAttributes.count == data.count {
                self._seriesAttributes = Published(initialValue: seriesAttributes)
            }
            else {
                var tmp = seriesAttributes
                for i in seriesAttributes.count ..< data.count {
                    tmp.append(seriesAttributes[i % seriesAttributes.count])
                }
                self._seriesAttributes = Published(initialValue: seriesAttributes)
            }
        } else {
            let sa = ChartModel.initChartSeriesAttributes(chartType: chartType, seriesCount: data.count)
            self._seriesAttributes = Published(initialValue: sa)
        }
    }
    
    static func initChartSeriesAttributes(chartType: ChartType, seriesCount: Int) -> [ChartSeriesAttributes] {
        switch chartType {
        case .stock:
            let count = max(1, seriesCount)
            let colors = [Palette.hexColor(for: .stockUpStroke), Palette.hexColor(for: .stockDownStroke), Palette.hexColor(for: .stockUpFill), Palette.hexColor(for: .stockDownFill), Palette.hexColor(for: .stockFillEndColor)]
            let palette = ChartSeriesPalette(colors: colors)
            let sa = ChartSeriesAttributes(palette: palette, lineWidth: 2, point: nil, firstLineCapDiameter: 0, lastLineCapDiameter: 0)
            return Array(repeating: sa, count: count)
            
        default:
            let colors = [Palette.hexColor(for: .chart1), Palette.hexColor(for: .chart2), Palette.hexColor(for: .chart3), Palette.hexColor(for: .chart4), Palette.hexColor(for: .chart5), Palette.hexColor(for: .chart6), Palette.hexColor(for: .chart7), Palette.hexColor(for: .chart8), Palette.hexColor(for: .chart9), Palette.hexColor(for: .chart10), Palette.hexColor(for: .chart11)]
            let count = min(colors.count, max(1, seriesCount))
            //var pointAttributes: [ChartPointAttributes] = []
            var result: [ChartSeriesAttributes] = []
            
            for i in 0 ..< count {
                let color = colors[i % colors.count]
                let pointAttr = ChartPointAttributes(isHidden: false, diameter: 6, strokeColor: color, gap: 2)
                let seriesPalette = ChartSeriesPalette(colors: [color])
                result.append(ChartSeriesAttributes(palette: seriesPalette, lineWidth: 2, point: pointAttr, firstLineCapDiameter: 0, lastLineCapDiameter: 0))
            }
            return result
        }
    }
    
    // interpolate time strings in categoryTitles if it is intraday mode and return modified titles
    static func preprocessIntradayDataForStock(_ categoryTitles: [String?]) -> [String?]? {
        let count = categoryTitles.count
        if count < 3 {
            return nil
        }
        
        if let c0 = categoryTitles[0],
        let c1 = categoryTitles[1],
        let c2 = categoryTitles[count - 2],
        let c3 = categoryTitles[count - 1],
        let startTime = ChartUtility.date(from: c0),
        let secondTime = ChartUtility.date(from: c1),
        let timeBeforeEndTime = ChartUtility.date(from: c2),
        let endTime = ChartUtility.date(from: c3) {
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd HH:mm:ss"
            var dataChanged = false
            
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
        if seriesIndex < data.count {
            return abs(T(value)) / T(ranges[seriesIndex].upperBound - ranges[seriesIndex].lowerBound)
        }
        else {
            return 0
        }
    }
    
    func normalizedValue<T: BinaryFloatingPoint>(for value: T) -> T {
        if data.count > 0 {
            var minValue = ranges.first!.lowerBound
            var maxValue = ranges.first!.upperBound
            for i in ranges {
                minValue = min(minValue, i.lowerBound)
                maxValue = max(maxValue, i.upperBound)
            }
            
            return abs(value) / T(maxValue - minValue)
        } else {
            return T(0)
        }
    }
    
    public var currentSeriesIndex: Int {
        if let current = selectedSeriesIndex {
            return current
        } else {
            return 0
        }
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = ChartModel(chartType: self.chartType,
                              data: self.data,
                              titlesForCategory: self.titlesForCategory,
                              colorsForCategory: self.colorsForCategory,
                              titlesForAxis: self.titlesForAxis,
                              labelsForDimension: self.labelsForDimension,
                              backgroundColor: self.backgroundColor,
                              selectedSeriesIndex: self.selectedSeriesIndex,
                              userInteractionEnabled: self.userInteractionEnabled,
                              seriesAttributes: self.seriesAttributes.map {
                                  let copy = $0.copy() as! ChartSeriesAttributes
                                  return copy
                              },
                              categoryAxis: self.categoryAxis.copy() as! ChartCategoryAxisAttributes,
                              numericAxis: self.numericAxis.copy() as! ChartNumericAxisAttributes,
                              secondaryNumericAxis: self.secondaryNumericAxis.copy() as! ChartNumericAxisAttributes)
        
        return copy
    }
}

extension ChartModel {
    func colorAt(seriesIndex: Int, categoryIndex: Int) -> HexColor {
        if let c = colorsForCategory[seriesIndex], let val = c[categoryIndex] {
            return val
        }
        
        let count = seriesAttributes.count
        if count > 0 {
            return seriesAttributes[categoryIndex%count].palette.colors[0]
        } else {
            return Palette.hexColor(for: .primary2)
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
                if let value = data[seriesIndex][i][dimensionIndex] {
                    let item = MicroChartDataItem(value: CGFloat(value),
                                                  displayValue: labelAt(seriesIndex: seriesIndex, categoryIndex: i, dimensionIndex: dimensionIndex),
                                                  label: titleAt(seriesIndex: seriesIndex, categoryIndex: i),
                                                  color: colorAt(seriesIndex: seriesIndex, categoryIndex: i))
                    res.append(item)
                }
            }
        }
        
        return res
    }
}
