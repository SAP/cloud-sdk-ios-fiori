//
//  FUIChartDataDirect.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 2/5/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// swiftlint:disable file_length

/**
A common data model for all charts. Chart properties can be initialized in init() or changed after init().

## Usage

```
let model = ChartModel(chartType: .line,
           data: [[nil, 220, nil, 250, 200, nil, 230],
                  [160, nil, 130, 170, nil, 190, 180]],
           titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]]
)

```
*/

public class ChartModel: ObservableObject, Identifiable, NSCopying {
    
    /// An internal data structure to hold a single piece of data or an array of data
    public enum DimensionData<T>: CustomStringConvertible, Equatable where T: Equatable {
        
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
        
        public var description: String {
            switch self {
            case .array(let vals):
                let valsStr = vals.map {
                    "\(String(describing: $0))"
                }
                
                return String(describing: valsStr)
                
            case .single(let val):
                return "\"\(String(describing: val))\""
            }
        }
        
        public static func == (lhs: ChartModel.DimensionData<T>, rhs: ChartModel.DimensionData<T>) -> Bool {
            switch lhs {
            case .array(let vals):
                return vals == rhs.values
                
            case .single(let val):
                return val == rhs.value
            }
        }
    }
    
    /// chart type
    @Published public var chartType: ChartType
    
    /// seires -> category -> dimension (either a single value or an array)
    @Published var data: [[DimensionData<CGFloat?>]]
    
    /// titles for category
    @Published var titlesForCategory: [[String?]]?
    
    /// labels for demension data
    @Published var labelsForDimension: [[DimensionData<String?>]]?
    
    @Published public var titlesForAxis: [ChartAxisId: String]?
    
    /// app to provide this to format values from numeric axis
    public var numericAxisLabelFormatHandler: NumericAxisLabelFormatHandler?
    
    /// enable or disable user interaction
    @Published public var userInteractionEnabled: Bool = false
    
//    @Published public var selectionEnabled: Bool = false
//    @Published public var zoomEnabled: Bool = false
    
    /// snap to point when dragging a chart
    @Published public var snapToPoint: Bool = false
    
    /// seires attributes
    @Published public var seriesAttributes: [ChartSeriesAttributes]
    
    /// colors for any category in any series
    /// it is optional. this color overwrite the color from seriesAttributes
    /// format: [seriesIndex1:  [catrgoryIndex1: HexColor,  ..., catrgoryIndexN: HexColor], ... , seriesIndexN:  [catrgoryIndex1: HexColor,  ..., catrgoryIndexM: HexColor]]
    @Published public var colorsForCategory: [Int: [Int: HexColor]]
    
    /// number of gridlines for numeric axis
    @Published public var numberOfGridlines: Int = 2 {
        didSet {
            if numberOfGridlines < 1 {
                numberOfGridlines = 1
            } else if numberOfGridlines > 20 {
                numberOfGridlines = 20
            }
        }
    }
    
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
    @Published public var indexesOfTotalsCategories: IndexSet = IndexSet()
    
    /**
     Indicates secondary value axis series indexes for line based charts.
     - The secondary value index works with .line, .area and .combo charts only.
     - Given series indexes will assign the corresponding series to the secondary value axis.
     */
    @Published public var indexesOfSecondaryValueAxis: IndexSet = IndexSet()
    
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
     - `index` This is the default behavior, where the given selection will be considered as the initial selection.
     - `first` The first category will be considered as the default selection.
     - `last` The last gategory will be considered as the default selection.
     */
    @Published public var defaultCategorySelectionMode: ChartCategorySelectionMode = .index
    
    /// When false a state is allowed in which no series is selected/active.
    @Published public var selectionRequired: Bool = false
    
    @Published public var selectedSeriesIndex: Int? {
        didSet {
            if chartType == .stock {
                if selectedSeriesIndex != nil {
                    scale = 1.0
                    startPos = 0
                }
            }
        }
    }
    
    /**
     Selects a category range, including the lower and and upper bounds of the range. The resulting selection(s) depend on the current `selectionMode`.
     */
    @Published public var selectedCategoryInRange: ClosedRange<Int>?
    @Published public var selectedDimensionInRange: ClosedRange<Int>?
    
    /**
     The currently selected plot items for the ChartView
     format: [seriesIndex0: ClosedRange<Int>,seriesIndex1:ClosedRange<Int>, ... ]
     */

    @Published public var selections: [ClosedRange<Int>]?
    
    /**
     a publisher to notify the changes of chart selections
     usage:
        var cancellableSet: Set<AnyCancellable> = []

        model.selectionDidChangePublisher
        .subscribe(on: RunLoop.main)
        .sink(receiveValue: { (selections) in
         if let selections = selections {
             if selections.count == 2 {
                 print("Selected series: \(selections[0]), selected categoies: \(selections[1])")
             }
         }
         else {
             print("No selections")
         }
        })
        .store(in: &cancellableSet)
     */
    lazy public private(set) var selectionDidChangePublisher: AnyPublisher<[ClosedRange<Int>]?, Never> = {
        $selections.eraseToAnyPublisher()
    }()
    
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
    
    /*
     Internal runtime properties
     */
    // scale is not allowed to be less than 1.0
    @Published var scale: CGFloat = 1.0
    @Published var startPos: Int = 0
    
    /// internal property for series data range
    var ranges: [ClosedRange<CGFloat>]
    
    /// internal property used to hash AxisTickValues
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
    
    /// cache for AxisTickValues
    var numericAxisTickValuesCache = [DataElementsForAxisTickValues: AxisTickValues]()
    
    /// axis tick values for primary numeirc axis
    var numericAxisTickValues: AxisTickValues {
        let de = ChartUtility.calculateDataElementsForAxisTickValues(self, secondaryRange: false)
        
        if de.noData {
            return AxisTickValues(plotMinimum: 0, plotMaximum: 1, plotBaselineValue: 0, plotBaselinePosition: 0, tickMinimum: 0, tickMaximum: 1, dataMinimum: 0, dataMaximum: 1, plotRange: 1, tickRange: 1, dataRange: 1, plotScale: 1, tickScale: 1, dataScale: 1, tickStepSize: 1, tickValues: [0, 1], tickPositions: [0, 1], tickCount: 2)
        } else if let result = numericAxisTickValuesCache[de] {
            return result
        } else {
            let result = ChartUtility.calculateRangeProperties(self, dataElements: de, secondaryRange: false)
            if numericAxisTickValuesCache.count > 10 {
                numericAxisTickValuesCache.removeAll()
            }
            
            numericAxisTickValuesCache[de] = result
            
            return result
        }
    }
    
    /// axis tick values for secondary numeirc axis
    var secondaryNumericAxisTickValues: AxisTickValues {
        let de = ChartUtility.calculateDataElementsForAxisTickValues(self, secondaryRange: true)
        
        if de.noData {
            return AxisTickValues(plotMinimum: 0, plotMaximum: 1, plotBaselineValue: 0, plotBaselinePosition: 0, tickMinimum: 0, tickMaximum: 1, dataMinimum: 0, dataMaximum: 1, plotRange: 1, tickRange: 1, dataRange: 1, plotScale: 1, tickScale: 1, dataScale: 1, tickStepSize: 1, tickValues: [0, 1], tickPositions: [0, 1], tickCount: 2)
        } else if let result = numericAxisTickValuesCache[de] {
            return result
        } else {
            let result = ChartUtility.calculateRangeProperties(self, dataElements: de, secondaryRange: true)
            if numericAxisTickValuesCache.count > 10 {
                numericAxisTickValuesCache.removeAll()
            }
            
            numericAxisTickValuesCache[de] = result
            
            return result
        }
    }
    
    var valueType: ChartValueType {
        let allIndexs = IndexSet(integersIn: 0 ..< data.count)
        let indexes = indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
        let seriesIndex = indexes.isEmpty ? allIndexs.sorted() : indexes
        
        if seriesIndex.isEmpty {
            return .allPositive
        }
        
        let range: ClosedRange<CGFloat> = seriesIndex.reduce(ranges[seriesIndex[0]]) { (result, next) -> ClosedRange<CGFloat> in
            return min(result.lowerBound, ranges[next].lowerBound) ... max(result.upperBound, ranges[next].upperBound)
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
                selectedSeriesIndex: Int?,
                userInteractionEnabled: Bool,
                seriesAttributes: [ChartSeriesAttributes],
                categoryAxis: ChartCategoryAxisAttributes,
                numericAxis: ChartNumericAxisAttributes,
                secondaryNumericAxis: ChartNumericAxisAttributes,
                indexesOfSecondaryValueAxis: IndexSet,
                indexesOfColumnSeries: IndexSet,
                indexesOfTotalsCategories: IndexSet) {
        self._chartType = Published(initialValue: chartType)
        self._data = Published(initialValue: data)
        self._titlesForCategory = Published(initialValue: titlesForCategory)
        self._colorsForCategory = Published(initialValue: colorsForCategory)
        self._titlesForAxis = Published(initialValue: titlesForAxis)
        self._labelsForDimension = Published(initialValue: labelsForDimension)
        self._selectedSeriesIndex = Published(initialValue: selectedSeriesIndex)
        self._userInteractionEnabled = Published(initialValue: userInteractionEnabled)
        self._seriesAttributes = Published(initialValue: seriesAttributes)
        self._categoryAxis = Published(initialValue: categoryAxis)
        self._numericAxis = Published(initialValue: numericAxis)
        self._secondaryNumericAxis = Published(initialValue: secondaryNumericAxis)
        self._indexesOfSecondaryValueAxis = Published(initialValue: indexesOfSecondaryValueAxis)
        self._indexesOfColumnSeries = Published(initialValue: indexesOfColumnSeries)
        self._indexesOfTotalsCategories = Published(initialValue: indexesOfTotalsCategories)
        
        var result: [ClosedRange<CGFloat>] = []
        // go through series
        for i in 0 ..< data.count {
            let range: ClosedRange<CGFloat> = {
                let allValues = data[i]
                    .compactMap { $0.first }
                    .compactMap { $0 }
                
                let min = allValues.min() ?? 0
                let max = allValues.max() ?? (min + 1)
                
                guard min != max else { return min...max+1 }
                return min...max
            }()
            result.append(range)
        }
        ranges = result
    }
    
    // swiftlint:disable cyclomatic_complexity
    // swiftlint:disable function_body_length
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
                secondaryNumericAxis: ChartNumericAxisAttributes? = nil,
                indexesOfSecondaryValueAxis: [Int]? = nil,
                indexesOfColumnSeries: [Int]? = nil,
                indexesOfTotalsCategories: [Int]? = nil) {
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
            axis.baseline.isHidden = true
            
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
            } else {
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
        
        if let indexesOfSecondaryValueAxis = indexesOfSecondaryValueAxis {
            var validIndexes: [Int] = []
            for seriesIndex in indexesOfSecondaryValueAxis {
                if seriesIndex >= 0 && seriesIndex < data.count {
                    validIndexes.append(seriesIndex)
                }
            }
            validIndexes.sort()
            self._indexesOfSecondaryValueAxis = Published(initialValue: IndexSet(validIndexes))
        }
        
        if let indexesOfColumnSeries = indexesOfColumnSeries {
            var validIndexes: [Int] = []
            for seriesIndex in indexesOfColumnSeries {
                if seriesIndex >= 0 && seriesIndex < data.count {
                    validIndexes.append(seriesIndex)
                }
            }
            validIndexes.sort()
            self._indexesOfColumnSeries = Published(initialValue: IndexSet(validIndexes))
        }
        
        if let indexesOfTotalsCategories = indexesOfTotalsCategories {
            var validIndexes: [Int] = []
            for seriesIndex in indexesOfTotalsCategories {
                if seriesIndex >= 0 && seriesIndex < data.count {
                    validIndexes.append(seriesIndex)
                }
            }
            validIndexes.sort()
            self._indexesOfTotalsCategories = Published(initialValue: IndexSet(validIndexes))
        }
        
        var result: [ClosedRange<CGFloat>] = []
        // go through series
        for i in 0 ..< data.count {
            let range: ClosedRange<CGFloat> = {
                let allValues: [CGFloat] = data[i]
                    .compactMap { $0 }
                    .map { CGFloat($0) }
                
                let min = allValues.min() ?? 0
                let max = allValues.max() ?? (min + 1)
                
                guard min != max else { return min...max+1 }
                return min...max
            }()
            result.append(range)
        }
        ranges = result
    }
    
    // swiftlint:disable function_body_length
    public init(chartType: ChartType,
                data3d: [[[Double?]]],
                titlesForCategory: [[String?]]? = nil,
                colorsForCategory: [Int: [Int: HexColor]]? = nil,
                titlesForAxis: [ChartAxisId: String]? = nil,
                labelsForDimension: [[[String?]]]? = nil,
                selectedSeriesIndex: Int? = nil,
                userInteractionEnabled: Bool = false,
                seriesAttributes: [ChartSeriesAttributes]? = nil,
                categoryAxis: ChartCategoryAxisAttributes? = nil,
                numericAxis: ChartNumericAxisAttributes? = nil,
                secondaryNumericAxis: ChartNumericAxisAttributes? = nil,
                indexesOfSecondaryValueAxis: [Int]? = nil,
                indexesOfColumnSeries: [Int]? = nil,
                indexesOfTotalsCategories: [Int]? = nil) {
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
        for (i, c) in data3d.enumerated() {
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
            } else {
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
            if seriesAttributes.count == data3d.count {
                self._seriesAttributes = Published(initialValue: seriesAttributes)
            } else {
                var tmp = seriesAttributes
                for i in seriesAttributes.count ..< data3d.count {
                    tmp.append(seriesAttributes[i % seriesAttributes.count])
                }
                self._seriesAttributes = Published(initialValue: seriesAttributes)
            }
        } else {
            let sa = ChartModel.initChartSeriesAttributes(chartType: chartType, seriesCount: data3d.count)
            self._seriesAttributes = Published(initialValue: sa)
        }
        
        if let indexesOfSecondaryValueAxis = indexesOfSecondaryValueAxis {
            var validIndexes: [Int] = []
            for seriesIndex in indexesOfSecondaryValueAxis {
                if seriesIndex >= 0 && seriesIndex < data3d.count {
                    validIndexes.append(seriesIndex)
                }
            }
            validIndexes.sort()
            self._indexesOfSecondaryValueAxis = Published(initialValue: IndexSet(validIndexes))
        }
        
        if let indexesOfColumnSeries = indexesOfColumnSeries {
            var validIndexes: [Int] = []
            for seriesIndex in indexesOfColumnSeries {
                if seriesIndex >= 0 && seriesIndex < data3d.count {
                    validIndexes.append(seriesIndex)
                }
            }
            validIndexes.sort()
            self._indexesOfColumnSeries = Published(initialValue: IndexSet(validIndexes))
        }
        
        if let indexesOfTotalsCategories = indexesOfTotalsCategories {
            var validIndexes: [Int] = []
            for seriesIndex in indexesOfTotalsCategories {
                if seriesIndex >= 0 && seriesIndex < data3d.count {
                    validIndexes.append(seriesIndex)
                }
            }
            validIndexes.sort()
            self._indexesOfTotalsCategories = Published(initialValue: IndexSet(validIndexes))
        }
        
        var result: [ClosedRange<CGFloat>] = []
        // go through series
        for i in 0 ..< data3d.count {
            let range: ClosedRange<CGFloat> = {
                let allValues: [CGFloat] = data3d[i]
                    .compactMap { $0.first }
                    .compactMap { $0 }
                    .map { CGFloat($0) }
                
                let min = allValues.min() ?? 0
                let max = allValues.max() ?? (min + 1)
                
                guard min != max else { return min...max+1 }
                return min...max
            }()
            result.append(range)
        }
        ranges = result
    }
    
    static func initChartSeriesAttributes(chartType: ChartType, seriesCount: Int) -> [ChartSeriesAttributes] {
        switch chartType {
        case .stock:
            let count = max(1, seriesCount)
            let colors = [Palette.hexColor(for: .stockUpStroke), Palette.hexColor(for: .stockDownStroke)]
            let palette = ChartSeriesPalette(colors: colors)
            let sa = ChartSeriesAttributes(palette: palette, lineWidth: 2, point: nil, firstLineCapDiameter: 0, lastLineCapDiameter: 0)
            sa.point.isHidden = true
            return Array(repeating: sa, count: count)
            
        default:
            let colors = [Palette.hexColor(for: .chart1), Palette.hexColor(for: .chart2), Palette.hexColor(for: .chart3), Palette.hexColor(for: .chart4), Palette.hexColor(for: .chart5), Palette.hexColor(for: .chart6), Palette.hexColor(for: .chart7), Palette.hexColor(for: .chart8), Palette.hexColor(for: .chart9), Palette.hexColor(for: .chart10), Palette.hexColor(for: .chart11)]
            let count = min(colors.count, max(1, seriesCount))
            //var pointAttributes: [ChartPointAttributes] = []
            var result: [ChartSeriesAttributes] = []
            
            for i in 0 ..< count {
                let color = colors[i % colors.count]
                let pointAttr = ChartPointAttributes(isHidden: false, diameter: 7, strokeColor: color, gap: 2)
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
        } else {
            return 0
        }
    }
    
    func normalizedValue<T: BinaryFloatingPoint>(for value: T) -> T {
        if data.isEmpty {
            return T(0)
        } else if let range = ranges.first {
            var minValue = range.lowerBound
            var maxValue = range.upperBound
            for i in ranges {
                minValue = min(minValue, i.lowerBound)
                maxValue = max(maxValue, i.upperBound)
            }
            
            let diff = abs(maxValue - minValue) <= 0.000001 ? 1 : (maxValue - minValue)
            return abs(value) / T(diff)
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
    
    // swiftlint:disable force_cast
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = ChartModel(chartType: self.chartType,
                              data: self.data,
                              titlesForCategory: self.titlesForCategory,
                              colorsForCategory: self.colorsForCategory,
                              titlesForAxis: self.titlesForAxis,
                              labelsForDimension: self.labelsForDimension,
                              selectedSeriesIndex: self.selectedSeriesIndex,
                              userInteractionEnabled: self.userInteractionEnabled,
                              seriesAttributes: self.seriesAttributes.map {
                                let copy = $0.copy() as! ChartSeriesAttributes
                                return copy
                              },
                              categoryAxis: self.categoryAxis.copy() as! ChartCategoryAxisAttributes,
                              numericAxis: self.numericAxis.copy() as! ChartNumericAxisAttributes,
                              secondaryNumericAxis: self.secondaryNumericAxis.copy() as! ChartNumericAxisAttributes,
                              indexesOfSecondaryValueAxis: self.indexesOfSecondaryValueAxis,
                              indexesOfColumnSeries: self.indexesOfColumnSeries,
                              indexesOfTotalsCategories: self.indexesOfTotalsCategories)
        
        return copy
    }
    
    /// number of series in the chart model
    public func numOfSeries() -> Int {
        return data.count
    }
    
    /// number of categories in the series
    public func numOfCategories(in seriesId: Int) -> Int {
        if seriesId >= data.count {
            return 0
        } else {
            return data[seriesId].count
        }
    }
}

extension ChartModel: Equatable {
    public static func == (lhs: ChartModel, rhs: ChartModel) -> Bool {
        return lhs.chartType == rhs.chartType &&
            lhs.data == rhs.data &&
            lhs.titlesForCategory == rhs.titlesForCategory &&
            lhs.colorsForCategory == rhs.colorsForCategory &&
            lhs.titlesForAxis == rhs.titlesForAxis &&
            lhs.labelsForDimension == rhs.labelsForDimension &&
            lhs.selectedSeriesIndex == rhs.selectedSeriesIndex &&
            lhs.userInteractionEnabled == rhs.userInteractionEnabled &&
            lhs.seriesAttributes == rhs.seriesAttributes &&
            lhs.categoryAxis == rhs.categoryAxis &&
            lhs.numericAxis == rhs.numericAxis &&
            lhs.secondaryNumericAxis == rhs.secondaryNumericAxis &&
            lhs.indexesOfSecondaryValueAxis == rhs.indexesOfSecondaryValueAxis &&
            lhs.indexesOfColumnSeries == rhs.indexesOfColumnSeries &&
            lhs.indexesOfTotalsCategories == rhs.indexesOfTotalsCategories
    }
}

extension ChartModel {
    func colorAt(seriesIndex: Int, categoryIndex: Int) -> HexColor {
        if let c = colorsForCategory[seriesIndex], let val = c[categoryIndex] {
            return val
        }
        
        if seriesAttributes.isEmpty {
            return Palette.hexColor(for: .primary2)
        } else {
            let count = seriesAttributes.count
            return seriesAttributes[categoryIndex%count].palette.colors[0]
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
        
        guard seriesIndex < data.count, !data[seriesIndex].isEmpty else {
            return res
        }
        
        for i in 0 ..< data[seriesIndex].count where data[seriesIndex][i].count > dimensionIndex {
            if let value = data[seriesIndex][i][dimensionIndex] {
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

extension ChartModel: CustomStringConvertible {
    public var description: String {
        let titlesForCategoryDesc: [[String]]
        if let tfc = titlesForCategory {
            titlesForCategoryDesc = tfc.map { (cat) -> [String] in
                cat.map { String(describing: $0) }
            }
        } else {
            titlesForCategoryDesc = [["\"nil\""]]
        }
        
        var titlesForAxisDesc: String
        if let tfa = titlesForAxis {
            titlesForAxisDesc = "{"
            var i = 0
            for (key, value) in tfa {
                titlesForAxisDesc.append("\"\(key.rawValue)\"")
                titlesForAxisDesc.append(": \"\(value)\"")
                if i < tfa.count - 1 {
                    titlesForAxisDesc.append(", ")
                }
                i += 1
            }
            titlesForAxisDesc.append("}")
        } else {
            titlesForAxisDesc = "\"nil\""
        }
        
        var colorsForCategoryDesc: String
        if colorsForCategory.isEmpty {
            colorsForCategoryDesc = "\"nil\""
        } else {
            colorsForCategoryDesc = "{"
            var i = 0
            for (key, cat) in colorsForCategory {
                //colorsForCategoryDesc.append("{")
                
                colorsForCategoryDesc.append("\"\(key)\": ")
                
                colorsForCategoryDesc.append("{")
                var j = 0
                for (index, color) in cat {
                    colorsForCategoryDesc.append("\"\(index)\": ")
                    colorsForCategoryDesc.append("\(String(describing: color))")
                    if j < cat.count - 1 {
                        colorsForCategoryDesc.append(", ")
                    }
                    j += 1
                }
                colorsForCategoryDesc.append("}")
                
                if i < colorsForCategory.count - 1 {
                    colorsForCategoryDesc.append(", ")
                }
                i += 1
            }
            colorsForCategoryDesc.append("}")
        }
        
        return """
{
    "ChartModel": {
        "chartType": "\(chartType.rawValue)",
        "data": \(String(describing: data)),
        "titlesForCategory": \(titlesForCategoryDesc),
        "colorsForCategory": \(colorsForCategoryDesc),
        "labelsForDimension": \(labelsForDimension == nil ? "\"nil\"": String(describing: labelsForDimension)),
        "titlesForAxis": \(titlesForAxisDesc),
        "numberOfGridlines": \(numberOfGridlines),
        "userInteractionEnabled": \(userInteractionEnabled),
        "snapToPoint": \(snapToPoint),
        "seriesAttributes": \(String(describing: seriesAttributes)),
        "categoryAxis": \(String(describing: categoryAxis)),
        "numericAxis": \(String(describing: numericAxis)),
        "secondaryNumericAxis": \(String(describing: secondaryNumericAxis)),
        "indexesOfSecondaryValueAxis": \(String(describing: indexesOfSecondaryValueAxis.sorted())),
        "indexesOfColumnSeries": \(String(describing: indexesOfColumnSeries.sorted())),
        "indexesOfTotalsCategories": \(String(describing: indexesOfTotalsCategories.sorted())),
        "selectionMode": "\(selectionMode.rawValue)",
        "defaultCategorySelectionMode": "\(defaultCategorySelectionMode.rawValue)",
        "selectionRequired": \(selectionRequired),
        "selectedSeriesIndex": "\(String(describing: selectedSeriesIndex))",
        "selectedCategoryInRange": "\(String(describing: selectedCategoryInRange))",
        "selectedDimensionInRange": "\(String(describing: selectedDimensionInRange))",
        "adjustToNiceValues": \(adjustToNiceValues),
        "fudgeYAxisRange": \(fudgeYAxisRange),
        "scale": \(String(describing: scale)),
        "startPos": \(String(describing: startPos)),
        "ranges": "\(String(describing: ranges))",
        "numericAxisTickValues": \(String(describing: numericAxisTickValues)),
        "secondaryNumericAxisTickValues": \(String(describing: secondaryNumericAxisTickValues))
    }
}
"""
    }
}

/// Enum for available selection modes.
public enum ChartSelectionMode: String {
    
    /// Selects a single value in the currently selected series and category indices.
    case single
    
    /// Selects one value in each series for the selected category index(es).
    case all
}

/// Enum for default category selection.
public enum ChartCategorySelectionMode: String {
    
    /// No default selection mode is defined. Any set selection will be used.
    case index
    
    /// First category of the selected series and dimension will be used.
    case first
    
    /// Last category of the selected series and dimension will be used.
    case last
}

/// Selection state for points and rects in the chart.
enum ChartSelectionState: String {
    case normal
    case selected
    case highlighted
    case disabled
}

/// value type for Numberic Axis
enum ChartValueType: String {
    case allPositive
    case allNegative
    case mixed
}

/// NumericAxis label format handler passed from app
public typealias NumericAxisLabelFormatHandler = (Double, ChartAxisId) -> String?
