//
//  ChartModel.swift
//
//  Created by Xu, Sheng on 2/5/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import FioriSwiftUICore

// swiftlint:disable file_length
// swiftlint:disable type_body_length

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
    @Published public var chartType: ChartType {
        didSet {
            if chartType != .line || chartType != .area || chartType != .combo {
                _indexesOfSecondaryValueAxis = IndexSet()
            }
            
            if chartType == .waterfall {
                updateRange()
            }
            
            if chartType == .donut {
                selectionMode = .multiple
            }
            
            // invalidate the plotDataCache
            plotDataCache = nil
            numericAxisTickValuesCache.removeAll()
            secondaryNumericAxisTickValuesCache.removeAll()
            categoryAxisTickValues = nil
            scale = 1.0
            startPos = .zero
            //selections = nil
        }
    }
    
    /// seires -> category -> dimension (either a single value or an array)
    @Published var data: [[DimensionData<CGFloat?>]]
    
    /// seires attributes
    @Published private var _seriesAttributes = [ChartSeriesAttributes]()
    
    /// seires attributes
    public var seriesAttributes: [ChartSeriesAttributes] {
        get {
            return _seriesAttributes
        }
        
        set {
            // allow more number of ChartSeriesAttributes than number of data
            if newValue.count >= data.count {
                _seriesAttributes = newValue
            } else if newValue.isEmpty {
                let sa = ChartModel.initChartSeriesAttributes(chartType: chartType, seriesCount: data.count)
                _seriesAttributes = sa
            } else {
                var tmp = newValue
                let count = newValue.count
                for i in count ..< data.count {
                    tmp.append(newValue[i % count])
                }
                _seriesAttributes = tmp
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
    
    /// colors for any category in any series
    /// it is optional. this color overwrite the color from seriesAttributes
    /// format: [seriesIndex1:  [catrgoryIndex1: Color,  ..., catrgoryIndexN: Color], ... , seriesIndexN:  [catrgoryIndex1: Color,  ..., catrgoryIndexM: Color]]
    @Published public var colorsForCategory: [Int: [Int: Color]] = [Int: [Int: Color]]()

    /// titles for category
    @Published var titlesForCategory: [[String?]]?
    
    /// labels for demension data
    @Published var labelsForDimension: [[DimensionData<String?>]]?
    
    /// titles for Axis
    @Published public var titlesForAxis: [ChartAxisId: String]?
    
    /// app to provide this to format values for labels of numeric axis
    public var numericAxisLabelFormatHandler: NumericAxisLabelFormatHandler?
    
    /// enable or disable user interaction
    @Published public var userInteractionEnabled: Bool = false
    
//    @Published public var selectionEnabled: Bool = false
//    @Published public var zoomEnabled: Bool = false
    
    /// snap to point when dragging a chart
    @Published public var snapToPoint: Bool = false
    
    /// number of gridlines for numeric axis    
    @PublishedConstrainedValue(1...20) public var numberOfGridlines: Int = 3
    
    /// the position of X Axis labels, .fixedBottom or .dynamic
    @Published public var xAxisLabelsPosition: XAxisLabelsPosition = .fixedBottom

    @Published private var _indexOfStockSeries: Int = 0
    
    /// current selected index of stock chart if there are multiple
    public var indexOfStockSeries: Int {
        get {
            return _indexOfStockSeries
        }
        set {
            if chartType == .stock {
                let num = numOfSeries()
                let allIndexs = num > 0 ? IndexSet(integersIn: 0 ..< num): IndexSet(integer: 0)
                
                // check if it is valid index
                if allIndexs.contains(newValue) {
                    _indexOfStockSeries = newValue
                    
                    scale = 1.0
                    startPos = .zero
                    if selections != nil {
                        selections = nil
                    }
                    xAxisLabels = [:]
                    yAxisLabels = [:]
                    secondaryYAxisLabels = [:]
                }
            }
        }
    }
    
    /**
     Indicates indexes of column series for combo chart.
     - Given indexes of series will be treated as column and the rest series will be treated as line.
     */
    @Published private var _indexesOfColumnSeries: IndexSet = IndexSet()
    public var indexesOfColumnSeries: IndexSet {
        get {
            return _indexesOfColumnSeries
        }
        set {
            if chartType == .combo {
                let num = numOfSeries()
                let allIndexs = num > 0 ? IndexSet(integersIn: 0 ..< num): IndexSet(integer: 0)
                let validIndex = newValue.intersection(allIndexs)
                _indexesOfColumnSeries = validIndex
            } else {
                _indexesOfColumnSeries = IndexSet()
            }
            
            // invalidate the plotDataCache
            plotDataCache = nil
        }
    }
    
    /**
     Indicates total indexes for waterfall chart.
     - Given indexes will treat the corresponding categories as totals.
     - The corresponding category values in the provided data should correspond to the total sum of the preceding values.
     - If the corresponding category value is nil in the provided data, the chart will complete the sum of the total value, which can be retrieved through `plotItem(atSeries:category:)`.
     */
    @Published private var _indexesOfTotalsCategories: IndexSet = IndexSet()
    public var indexesOfTotalsCategories: IndexSet {
        get {
            return _indexesOfTotalsCategories
        }
        set {
            if chartType == .waterfall {
                let num = numOfCategories(in: 0)
                let allIndexs = num > 0 ? IndexSet(integersIn: 0 ..< num): IndexSet(integer: 0)
                let validIndex = newValue.intersection(allIndexs)
                _indexesOfTotalsCategories = validIndex
            } else {
                _indexesOfTotalsCategories = IndexSet()
            }
            
            // invalidate the plotDataCache
            updateRange()
            plotDataCache = nil
            numericAxisTickValuesCache.removeAll()
            secondaryNumericAxisTickValuesCache.removeAll()
        }
    }
    
    @Published private var _indexesOfSecondaryValueAxis: IndexSet = IndexSet()
    /**
     Indicates secondary value axis series indexes for line based charts.
     - The secondary value index works with .line, .area and .combo charts only.
     - Given series indexes will assign the corresponding series to the secondary value axis.
     */
    public var indexesOfSecondaryValueAxis: IndexSet {
        get {
            return _indexesOfSecondaryValueAxis
        }
        set {
            if chartType == .line || chartType == .area || chartType == .combo {
                let num = numOfSeries()
                let allIndexs = num > 0 ? IndexSet(integersIn: 0 ..< num): IndexSet(integer: 0)
                let validIndex = newValue.intersection(allIndexs)
                _indexesOfSecondaryValueAxis = validIndex
                
                yAxisLabels = [:]
                secondaryYAxisLabels = [:]
            } else {
                _indexesOfSecondaryValueAxis = IndexSet()
            }
            
            // invalidate the plotDataCache
            plotDataCache = nil
            numericAxisTickValuesCache.removeAll()
            secondaryNumericAxisTickValuesCache.removeAll()
        }
    }
    
    @Published private var _selectionMode: ChartSelectionMode = .single {
        didSet {
            selections = nil
        }
    }

    /// selection state
    /**
     Determines which plot items should be selected for a category.
     - single : Selects a single value in the currently selected series and category indices.
     - all : Selects one value in each series for the selected category index(es).
     */
    public var selectionMode: ChartSelectionMode {
        get {
            return _selectionMode
        }
        
        set {
            // Note: Following workarounds for older swift compiler will be removed after Xcode 12 GA.
            if chartType == .donut || (chartType != .donut && newValue != .multiple) {
                #if swift(>=5.3)
                _selectionMode = newValue
                #else
                __selectionMode = Published(initialValue: newValue)
                #endif
            }
            
            #if swift(<5.3)
            selections = nil
            #endif
        }
    }
    
    /// When false a state is allowed in which no series is selected/active.
    @Published public var selectionRequired: Bool = false
    
    /**
     Internal stored property for the selection state
     format: [first is selected series range, second is selected category range]
     */
    @Published private var _selections: [Int: [Int]]? = nil
    
    /**
     Set / get current selection state for the chart view
     nil means no selection
     format: [seriesIndex: [categoryIndex]]?,
     selectin mode: single, single selection: [0: [0]]
     selectin mode: single, range selection: [0: [0,1,2,3,4,5,6]]
     selectin mode: all, [0: [0], 1: [0]]
     multiple seletion for donut: [0: [0], 2: [0], 4: [0]]
    */
    public var selections: [Int: [Int]]? {
        get {
            return _selections
        }
        set {
            if let values = newValue {
                
                let validSeriesSet: Set<Int>
                if data.isEmpty {
                    validSeriesSet = Set<Int>()
                } else {
                    if chartType == .stock {
                        validSeriesSet = Set([indexOfStockSeries])
                    } else {
                        validSeriesSet = Set(0 ..< data.count)
                    }
                }
                
                for (seriesIndex, catIndices) in values {
                    // check if seriesIndex is valid
                    if !validSeriesSet.contains(seriesIndex) {
                        return
                    }
                    
                    let validCategorySet = data[seriesIndex].isEmpty ? Set<Int>() : Set(0 ..< data[seriesIndex].count)
                    let categorySet = Set(catIndices)
                    
                    if catIndices.count != categorySet.count || !categorySet.isSubset(of: validCategorySet) {
                        return
                    }
                }
                
                _selections = values
            } else {
                _selections = nil
            }
        }
    }
    
    /**
     a publisher to notify the changes of chart selections
     usage:
        var cancellableSet: Set<AnyCancellable> = []

        model.selectionDidChangePublisher
        .subscribe(on: RunLoop.main)
        .sink(receiveValue: { (selections) in
         if let selections = selections {
             for (seriesIndex, catIndices) in selections {
                 print("Selected series: \(seriesIndex), selected categoies: \(catIndices)")
             }
         }
         else {
             print("No selections")
         }
        })
        .store(in: &cancellableSet)
     */
    lazy public private(set) var selectionDidChangePublisher: AnyPublisher<[Int: [Int]]?, Never> = {
        $_selections.eraseToAnyPublisher()
    }()
    
    /*
     Internal runtime properties
     */
    /// scale is not allowed to be less than 1.0
    @Published var scale: CGFloat = 1.0
    
    /// chart's bottom left position when panned or zoomed
    @Published var startPos: CGPoint = .zero
    
    /// internal property for series data range
    var ranges: [ClosedRange<CGFloat>] = []
    
    /// Minimum value for category axis values used bubble/scatter chart only
    var xDataMinimumValue: CGFloat?
    
    /// Maximum value for category axis values used bubble/scatter chart only
    var xDataMaximumValue: CGFloat?
    
    /// Minimum value for z axis values used bubble/scatter chart only
    var zDataMaximumValue: CGFloat?
    
    /// Maximum value for z axis values used bubble/scatter chart only
    var zDataMinimumValue: CGFloat?
    
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
        
        let allowLooseLabels: Bool
        
        let fudgeYAxisRange: Bool
        
        let adjustToNiceValues: Bool
        
        let secondaryRange: Bool
    }
    
    // need to invalidate it if the data has been changed
    var plotDataCache: [[ChartPlotData]]? = nil
    
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
            if numericAxisTickValuesCache.count >= 1 {
                numericAxisTickValuesCache.removeAll()
            }
            
            numericAxisTickValuesCache[de] = result
            yAxisLabels = [:]
            scale = 1
            startPos = .zero
            plotDataCache = nil
            
            return result
        }
    }
    
    /// cache for AxisTickValues
    var secondaryNumericAxisTickValuesCache = [DataElementsForAxisTickValues: AxisTickValues]()
    /// axis tick values for secondary numeirc axis
    var secondaryNumericAxisTickValues: AxisTickValues {
        let de = ChartUtility.calculateDataElementsForAxisTickValues(self, secondaryRange: true)
        
        if de.noData {
            return AxisTickValues(plotMinimum: 0, plotMaximum: 1, plotBaselineValue: 0, plotBaselinePosition: 0, tickMinimum: 0, tickMaximum: 1, dataMinimum: 0, dataMaximum: 1, plotRange: 1, tickRange: 1, dataRange: 1, plotScale: 1, tickScale: 1, dataScale: 1, tickStepSize: 1, tickValues: [0, 1], tickPositions: [0, 1], tickCount: 2)
        } else if let result = secondaryNumericAxisTickValuesCache[de] {
            return result
        } else {
            let result = ChartUtility.calculateRangeProperties(self, dataElements: de, secondaryRange: true)
            if secondaryNumericAxisTickValuesCache.count > 1 {
                secondaryNumericAxisTickValuesCache.removeAll()
            }
            
            secondaryNumericAxisTickValuesCache[de] = result
            secondaryYAxisLabels = [:]
            return result
        }
    }
    
    /// axis tick values for category axis, only bubble/scatter uses this
    var categoryAxisTickValues: AxisTickValues?
    
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
    
    var currentSeriesIndex: Int {
        if chartType == .stock {
            return indexOfStockSeries
        }

        return 0
    }
    
    /// Cached xAxisLabels
    // dict: font size : [AxisTitle]
    var xAxisLabels: [CGFloat: [AxisTitle]] = [:]
    
    /// Cached yAxisLabels
    var yAxisLabels: [CGFloat: [AxisTitle]] = [:]
    
    /// Cached secondary yAxisLabels
    var secondaryYAxisLabels: [CGFloat: [AxisTitle]] = [:]
    
    public let id = UUID()
    
    private init(chartType: ChartType,
                 data: [[DimensionData<CGFloat?>]],
                 titlesForCategory: [[String?]]? = nil,
                 colorsForCategory: [Int: [Int: Color]]? = nil,
                 titlesForAxis: [ChartAxisId: String]? = nil,
                 labelsForDimension: [[DimensionData<String?>]]? = nil,
                 numberOfGridlines: Int = 3,
                 selectionRequired: Bool = false,
                 selectionMode: ChartSelectionMode = .single,
                 selections: [Int: [Int]]?,
                 userInteractionEnabled: Bool = false,
                 snapToPoint: Bool = false,
                 seriesAttributes: [ChartSeriesAttributes]? = nil,
                 categoryAxis: ChartCategoryAxisAttributes? = nil,
                 numericAxis: ChartNumericAxisAttributes? = nil,
                 secondaryNumericAxis: ChartNumericAxisAttributes? = nil,
                 xAxisLabelsPosition: XAxisLabelsPosition = .fixedBottom,
                 indexOfStockSeries: Int = 0,
                 indexesOfSecondaryValueAxis: [Int]? = nil,
                 indexesOfColumnSeries: [Int]? = nil,
                 indexesOfTotalsCategories: [Int]? = nil,
                 numericAxisLabelFormatHandler: NumericAxisLabelFormatHandler? = nil) {
        self._chartType = Published(initialValue: chartType)
        self._data = Published(initialValue: data)
        self._titlesForCategory = Published(initialValue: titlesForCategory)
        if let colorsForCategory = colorsForCategory {
            self._colorsForCategory = Published(initialValue: colorsForCategory)
        } else {
            self._colorsForCategory = Published(initialValue: [Int: [Int: Color]]())
        }
        self._titlesForAxis = Published(initialValue: titlesForAxis)
        self._labelsForDimension = Published(initialValue: labelsForDimension)
        self._numberOfGridlines = PublishedConstrainedValue(wrappedValue: numberOfGridlines, 1...20)
        self._selectionRequired = Published(initialValue: selectionRequired)
        self._userInteractionEnabled = Published(initialValue: userInteractionEnabled)
        self._snapToPoint = Published(initialValue: snapToPoint)
        
        if let categoryAxis = categoryAxis {
            self._categoryAxis = Published(initialValue: categoryAxis)
        } else {
            let axis = ChartModel.defaultCategoryAxisAttributes(chartType: chartType)
            self._categoryAxis = Published(initialValue: axis)
        }
        
        if let numericAxis = numericAxis {
            self._numericAxis = Published(initialValue: numericAxis)
        } else {
            let axis = ChartModel.defaultNumericAixsAttributes(chartType: chartType)
            
            self._numericAxis = Published(initialValue: axis)
        }
        
        if let secondaryNumericAxis = secondaryNumericAxis {
            self._secondaryNumericAxis = Published(initialValue: secondaryNumericAxis)
        } else {
            let axis = ChartModel.defaultNumericAixsAttributes(chartType: chartType)
            
            self._secondaryNumericAxis = Published(initialValue: axis)
        }
        
        self._xAxisLabelsPosition = Published(initialValue: xAxisLabelsPosition)
        
        self.selectionMode = selectionMode
        if chartType == .donut {
            self.selectionMode = .multiple
        }
        
        self.selections = selections
        
        self.indexOfStockSeries = indexOfStockSeries
        if let indexesOfColumnSeries = indexesOfColumnSeries {
            self.indexesOfColumnSeries = IndexSet(indexesOfColumnSeries)
        }
        
        if let indexesOfTotalsCategories = indexesOfTotalsCategories {
            self.indexesOfTotalsCategories = IndexSet(indexesOfTotalsCategories)
        }
        
        if let isva = indexesOfSecondaryValueAxis {
            self.indexesOfSecondaryValueAxis = IndexSet(isva)
        }
        
        if let nalfh = numericAxisLabelFormatHandler {
            self.numericAxisLabelFormatHandler = nalfh
        }
        
        if let seriesAttributes = seriesAttributes {
            self.seriesAttributes = seriesAttributes
        } else {
            self.seriesAttributes = []
        }
        
        updateXZRange()
        updateRange()
    }
    
    /**
     Initializes and returns a newly allocated ChartModel for most of chart types. The data should contain only two dimension array of double values.
     
     - Parameters:
        - chartType: chart type
        - data: two dimension array of double values.
        - titlesForCategory: labels for x axis
        - colorsForCategory: colors for any category in any series. it is optional. this color overwrite the color from seriesAttributes.
        - titlesForAxis: titles for category and numeric Axis
        - labelsForDimension: labels for demension data
        - numberOfGridlines: number of gridlines for numeric axis
        - selectionRequired: when false a state is allowed in which no series is selected/active.
        - selectionMode: determines which plot items should be selected for a category. It could be single, all, multiple
        - selections: preselected categories or seires for the chart view. For example it could be [0: [0,1,2,3,4,5,6]], [0: [0], 1: [0]]
        - userInteractionEnabled: enable or disable user interaction
        - snapToPoint: snap to point when dragging a chart
        - seriesAttributes: seires attributes
        - categoryAxis: attributes for the category axis.
        - numericAxis: attributes for the primary numeric axis.
        - secondaryNumericAxis: attributes for the secondary numeric axis.
        - xAxisLabelsPosition: the position of X Axis labels, .fixedBottom or .dynamic
        - indexOfStockSeries: current selected index of stock chart if there are multiple
        - indexesOfSecondaryValueAxis: indicates secondary value axis series indexes for line based charts (.line, .area and .combo).
        - indexesOfColumnSeries: indicates indexes of column series for combo chart.
        - indexesOfTotalsCategories: indicates total indexes for waterfall chart.
        - numericAxisLabelFormatHandler: format values for labels of numeric axis
     */
    public convenience init(chartType: ChartType,
                            data: [[Double?]],
                            titlesForCategory: [[String?]]? = nil,
                            colorsForCategory: [Int: [Int: Color]]? = nil,
                            titlesForAxis: [ChartAxisId: String]? = nil,
                            labelsForDimension: [[String?]]? = nil,
                            numberOfGridlines: Int = 3,
                            selectionRequired: Bool = false,
                            selectionMode: ChartSelectionMode = .single,
                            selections: [Int: [Int]]? = nil,
                            userInteractionEnabled: Bool = false,
                            snapToPoint: Bool = false,
                            seriesAttributes: [ChartSeriesAttributes]? = nil,
                            categoryAxis: ChartCategoryAxisAttributes? = nil,
                            numericAxis: ChartNumericAxisAttributes? = nil,
                            secondaryNumericAxis: ChartNumericAxisAttributes? = nil,
                            xAxisLabelsPosition: XAxisLabelsPosition = .fixedBottom,
                            indexOfStockSeries: Int = 0,
                            indexesOfSecondaryValueAxis: [Int]? = nil,
                            indexesOfColumnSeries: [Int]? = nil,
                            indexesOfTotalsCategories: [Int]? = nil,
                            numericAxisLabelFormatHandler: NumericAxisLabelFormatHandler? = nil) {
        var tmpTitlesForCategory = titlesForCategory
        var intradayIndex: [Int] = []
        if chartType == .stock {
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
                tmpTitlesForCategory = modifiedTitlesForCategory
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

        var tmpLabelsForDimension: [[DimensionData<String?>]]?
        if let labels = labelsForDimension {
            var tmpLabels: [[DimensionData<String?>]] = []
            for c in labels {
                var s: [DimensionData<String?>] = []
                for d in c {
                    s.append(DimensionData.single(d))
                }
                tmpLabels.append(s)
            }
            
            tmpLabelsForDimension = tmpLabels
        }
        
        self.init(chartType: chartType,
                  data: tmpData,
                  titlesForCategory: tmpTitlesForCategory,
                  colorsForCategory: colorsForCategory,
                  titlesForAxis: titlesForAxis,
                  labelsForDimension: tmpLabelsForDimension,
                  numberOfGridlines: numberOfGridlines,
                  selectionRequired: selectionRequired,
                  selectionMode: selectionMode,
                  selections: selections,
                  userInteractionEnabled: userInteractionEnabled,
                  snapToPoint: snapToPoint,
                  seriesAttributes: seriesAttributes,
                  categoryAxis: categoryAxis,
                  numericAxis: numericAxis,
                  secondaryNumericAxis: secondaryNumericAxis,
                  xAxisLabelsPosition: xAxisLabelsPosition,
                  indexOfStockSeries: indexOfStockSeries,
                  indexesOfSecondaryValueAxis: indexesOfSecondaryValueAxis,
                  indexesOfColumnSeries: indexesOfColumnSeries,
                  indexesOfTotalsCategories: indexesOfTotalsCategories,
                  numericAxisLabelFormatHandler: numericAxisLabelFormatHandler)
    }
    
    /**
     Initializes and returns a newly allocated ChartModel for bubble or stock charts. The data should only contain 3 dimension array of double values.
     
     - Parameters:
        - chartType: chart type
        - data3d: three dimension array of double values.
        - titlesForCategory: labels for x axis
        - colorsForCategory: colors for any category in any series. it is optional. this color overwrite the color from seriesAttributes.
        - titlesForAxis: titles for category and numeric Axis
        - labelsForDimension: labels for demension data
        - numberOfGridlines: number of gridlines for numeric axis
        - selectionRequired: when false a state is allowed in which no series is selected/active.
        - selectionMode: determines which plot items should be selected for a category. It could be single, all, multiple
        - selections: preselected categories or seires for the chart view. For example it could be [0: [0,1,2,3,4,5,6]], [0: [0], 1: [0]]
        - userInteractionEnabled: enable or disable user interaction
        - snapToPoint: snap to point when dragging a chart
        - seriesAttributes: seires attributes
        - categoryAxis: attributes for the category axis.
        - numericAxis: attributes for the primary numeric axis.
        - secondaryNumericAxis: attributes for the secondary numeric axis.
        - xAxisLabelsPosition: the position of X Axis labels, .fixedBottom or .dynamic
        - indexOfStockSeries: current selected index of stock chart if there are multiple
        - indexesOfSecondaryValueAxis: indicates secondary value axis series indexes for line based charts (.line, .area and .combo).
        - indexesOfColumnSeries: indicates indexes of column series for combo chart.
        - indexesOfTotalsCategories: indicates total indexes for waterfall chart.
        - numericAxisLabelFormatHandler: format values for labels of numeric axis
     */
    //swiftlint:disable function_body_length
    //swiftlint:disable cyclomatic_complexity
    public convenience init(chartType: ChartType,
                            data3d: [[[Double?]]],
                            titlesForCategory: [[String?]]? = nil,
                            colorsForCategory: [Int: [Int: Color]]? = nil,
                            titlesForAxis: [ChartAxisId: String]? = nil,
                            labelsForDimension: [[[String?]]]? = nil,
                            numberOfGridlines: Int = 3,
                            selectionRequired: Bool = false,
                            selectionMode: ChartSelectionMode = .single,
                            selections: [Int: [Int]]? = nil,
                            userInteractionEnabled: Bool = false,
                            snapToPoint: Bool = false,
                            seriesAttributes: [ChartSeriesAttributes]? = nil,
                            categoryAxis: ChartCategoryAxisAttributes? = nil,
                            numericAxis: ChartNumericAxisAttributes? = nil,
                            secondaryNumericAxis: ChartNumericAxisAttributes? = nil,
                            xAxisLabelsPosition: XAxisLabelsPosition = .fixedBottom,
                            indexOfStockSeries: Int = 0,
                            indexesOfSecondaryValueAxis: [Int]? = nil,
                            indexesOfColumnSeries: [Int]? = nil,
                            indexesOfTotalsCategories: [Int]? = nil,
                            numericAxisLabelFormatHandler: NumericAxisLabelFormatHandler? = nil) {
        var tmpTitlesForCategory = titlesForCategory
        var intradayIndex: [Int] = []
        if chartType == .stock {
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
                
                tmpTitlesForCategory = modifiedTitlesForCategory
            }
        } else if chartType == .bubble ||  chartType == .scatter {
            var modifiedTitlesForCategory: [[String?]] = []
            
            for c in data3d {
                var titles: [String?] = Array(repeating: nil, count: c.count)
                
                for (j, d) in c.enumerated() {
                    // check x value
                    if let firstValue = d.first {
                        if let value = firstValue {
                            titles[j] = String(value)
                        }
                    }
                }
                
                modifiedTitlesForCategory.append(titles)
            }
            
            tmpTitlesForCategory = modifiedTitlesForCategory
        }
        
        var tmpData: [[DimensionData<CGFloat?>]] = []
        for (i, c) in data3d.enumerated() {
            var s: [DimensionData<CGFloat?>] = []
            for (j, d) in c.enumerated() {
                if intradayIndex.contains(i) && j == c.count - 1 {
                    continue
                } else {
                    if chartType == .bubble {
                        // change the data order from x y z to y z x
                        if d.count == 3 {
                            let dimX = d[0]
                            var dimYZX = d.dropFirst()
                            dimYZX.append(dimX)
                            let tmpD: [CGFloat?] = dimYZX.map { (v) in
                                ChartUtility.cgfloatOptional(from: v)
                            }
                            
                            s.append(DimensionData.array(tmpD))
                        }
                    } else if chartType == .scatter {
                        // change the data order from x y to y x
                        if d.count == 2 {
                            let dimX = d[0]
                            var dimYX = d.dropFirst()
                            dimYX.append(dimX)
                            let tmpD: [CGFloat?] = dimYX.map { (v) in
                                ChartUtility.cgfloatOptional(from: v)
                            }
                            
                            s.append(DimensionData.array(tmpD))
                        }
                    } else {
                        let tmpD: [CGFloat?] = d.map { (v) in
                            ChartUtility.cgfloatOptional(from: v)
                        }
                        
                        s.append(DimensionData.array(tmpD))
                    }
                }
            }
            tmpData.append(s)
        }

        var tmpLabelsForDimension: [[DimensionData<String?>]]?
        if let labels = labelsForDimension {
            var tmpLabels: [[DimensionData<String?>]] = []
            for c in labels {
                var s: [DimensionData<String?>] = []
                for d in c {
                    s.append(DimensionData.array(d))
                }
                tmpLabels.append(s)
            }
            
            tmpLabelsForDimension =  tmpLabels
        }
        
        self.init(chartType: chartType,
                  data: tmpData,
                  titlesForCategory: tmpTitlesForCategory,
                  colorsForCategory: colorsForCategory,
                  titlesForAxis: titlesForAxis,
                  labelsForDimension: tmpLabelsForDimension,
                  numberOfGridlines: numberOfGridlines,
                  selectionRequired: selectionRequired,
                  selectionMode: selectionMode,
                  selections: selections,
                  userInteractionEnabled: userInteractionEnabled,
                  snapToPoint: snapToPoint,
                  seriesAttributes: seriesAttributes,
                  categoryAxis: categoryAxis,
                  numericAxis: numericAxis,
                  secondaryNumericAxis: secondaryNumericAxis,
                  xAxisLabelsPosition: xAxisLabelsPosition,
                  indexOfStockSeries: indexOfStockSeries,
                  indexesOfSecondaryValueAxis: indexesOfSecondaryValueAxis,
                  indexesOfColumnSeries: indexesOfColumnSeries,
                  indexesOfTotalsCategories: indexesOfTotalsCategories,
                  numericAxisLabelFormatHandler: numericAxisLabelFormatHandler)
    }
    
    // swiftlint:disable force_cast
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = ChartModel(chartType: self.chartType,
                              data: self.data,
                              titlesForCategory: self.titlesForCategory,
                              colorsForCategory: self.colorsForCategory,
                              titlesForAxis: self.titlesForAxis,
                              labelsForDimension: self.labelsForDimension,
                              numberOfGridlines: self.numberOfGridlines,
                              selectionRequired: self.selectionRequired,
                              selectionMode: self.selectionMode,
                              selections: self.selections,
                              userInteractionEnabled: self.userInteractionEnabled,
                              snapToPoint: self.snapToPoint,
                              seriesAttributes: self.seriesAttributes.map {
                                let copy = $0.copy() as! ChartSeriesAttributes
                                return copy
                              },
                              categoryAxis: (self.categoryAxis.copy() as! ChartCategoryAxisAttributes),
                              numericAxis: (self.numericAxis.copy() as! ChartNumericAxisAttributes),
                              secondaryNumericAxis: (self.secondaryNumericAxis.copy() as! ChartNumericAxisAttributes),
                              xAxisLabelsPosition: self.xAxisLabelsPosition,
                              indexOfStockSeries: self.indexOfStockSeries,
                              indexesOfSecondaryValueAxis: self.indexesOfSecondaryValueAxis.sorted(),
                              indexesOfColumnSeries: self.indexesOfColumnSeries.sorted(),
                              indexesOfTotalsCategories: self.indexesOfTotalsCategories.sorted(),
                              numericAxisLabelFormatHandler: self.numericAxisLabelFormatHandler)
        
        return copy
    }
    
    private func updateXZRange() {
        if chartType == .bubble || chartType == .scatter {
            var tmpCatMin: CGFloat?
            var tmpCatMax: CGFloat?
            
            var tmpZMin: CGFloat?
            var tmpZMax: CGFloat?
            
            // the data order is y z x
            for c in data {
                for d in c {
                    // check x value
                    if let value = chartType == .bubble ? d[2]: d[1] {
                        if let tmpMin = tmpCatMin {
                            tmpCatMin = min(tmpMin, CGFloat(value))
                        } else {
                            tmpCatMin = CGFloat(value)
                        }
                        
                        if let tmpMax = tmpCatMax {
                            tmpCatMax = max(tmpMax, CGFloat(value))
                        } else {
                            tmpCatMax = CGFloat(value)
                        }
                    }
                    
                    // check z value
                    if chartType == .bubble {
                        if let value = d[1] {
                            if let tmpMin = tmpZMin {
                                tmpZMin = min(tmpMin, CGFloat(value))
                            } else {
                                tmpZMin = CGFloat(value)
                            }
                            
                            if let tmpMax = tmpZMax {
                                tmpZMax = max(tmpMax, CGFloat(value))
                            } else {
                                tmpZMax = CGFloat(value)
                            }
                        }
                    }
                }
            }
        
            self.xDataMinimumValue = tmpCatMin
            self.xDataMaximumValue = tmpCatMax
            self.zDataMinimumValue = tmpZMin
            self.zDataMaximumValue = tmpZMax
            
        }
    }
    
    private func updateRange() {
        var result: [ClosedRange<CGFloat>] = []
        // go through series
        for i in 0 ..< data.count {
            let range: ClosedRange<CGFloat> = {
                if chartType == .waterfall {
                    let firstValue = plotItemValue(at: 0, category: 0, dimension: 0)
                    var dmin: CGFloat = 0
                    if let fv = firstValue {
                        dmin = CGFloat(fv)
                    }
                    var dmax: CGFloat = dmin
                    var subTotal: CGFloat = 0
                    
                    for index in 0 ..< numOfCategories(in: 0) {
                        let isSubTotal = index == 0 ? true : indexesOfTotalsCategories.contains(index)
                        let value = plotItemValue(at: 0, category: index, dimension: 0) ?? 0
                        let curValue: CGFloat = isSubTotal ? CGFloat(value) : subTotal + CGFloat(value)
                    
                        dmin = min(dmin, curValue)
                        dmax = max(dmax, curValue)
                        subTotal = curValue
                    }
                    
                    return dmin ... dmax
                    
                } else {
                    let allValues = data[i]
                        .compactMap { $0.first }
                        .compactMap { $0 }
                    
                    let dmin = allValues.min() ?? 0
                    let dmax = allValues.max() ?? (dmin + 1)
                    
                    guard dmin != dmax else { return dmin ... dmax + 1 }
                    return dmin ... dmax
                }
            }()
            result.append(range)
        }
        ranges = result
    }
    
    /// number of series in the chart model
    public func numOfSeries() -> Int {
        return data.count
    }
    
    /// number of categories for charts except stock, bubble and scatter
    public func numOfCategories() -> Int {
        let counts = data.map { series in
            series.count
        }
        
        let maxCount = counts.max() ?? 0
        let maxTitles = titlesForCategory?.first?.count ?? 0
        
        return max(0, max(maxTitles, maxCount))
    }
    
    /// number of categories in the series
    public func numOfCategories(in seriesId: Int) -> Int {
        if seriesId >= data.count {
            return 0
        } else {
            return data[seriesId].count
        }
    }
    
    /// Returns plot item value  for given indexes of series, category and dimension.
    public func plotItemValue(at series: Int, category: Int, dimension: Int) -> Double? {
        if series < 0 || series >= data.count || data[series].isEmpty || category < 0 || category >= data[series].count {
            return nil
        }
                
        switch data[series][category] {
        case .single(let val):
            if dimension == 0 {
                if let realVal = val {
                    return Double(realVal)
                }
            }
                
            return nil
        case .array(let vals):
            if dimension >= 0 && dimension < vals.count {
                if let realVal = vals[dimension] {
                    return Double(realVal)
                }
            }
                
            return nil
        }
    }
    
    // Returns the category title at specified index of series and category
    public func categoryTitles(at series: Int, category: Int) -> String? {
        if let titles = titlesForCategory {
            if series < 0 || series >= titles.count || titles[series].isEmpty || category < 0 || category >= titles[series].count {
                return nil
            }
            
            return titles[series][category]
        }
        
        return nil
    }
    
    /**
            internal functions
     */
    static func initChartSeriesAttributes(chartType: ChartType, seriesCount: Int) -> [ChartSeriesAttributes] {
        if seriesCount < 1 {
            return [ChartSeriesAttributes]()
        }
        
        switch chartType {
        case .stock:
            let count = max(1, seriesCount)
            let colors: [Color] = [.preferredColor(.stockUpStroke), .preferredColor(.stockDownStroke)]
            let palette = ChartSeriesPalette(colors: colors)
            let sa = ChartSeriesAttributes(palette: palette, lineWidth: 2, point: nil, firstLineCapDiameter: 0, lastLineCapDiameter: 0)
            sa.point.isHidden = true
            return Array(repeating: sa, count: count)
            
        default:
            let colors: [Color] = [.preferredColor(.chart1), .preferredColor(.chart2), .preferredColor(.chart3), .preferredColor(.chart4), .preferredColor(.chart5), .preferredColor(.chart6), .preferredColor(.chart7), .preferredColor(.chart8), .preferredColor(.chart9), .preferredColor(.chart10), .preferredColor(.chart11)]
            let count = max(1, seriesCount)
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
    
    static func defaultCategoryAxisAttributes(chartType: ChartType) -> ChartCategoryAxisAttributes {
        let axis = ChartCategoryAxisAttributes()
        if chartType == .stock {
            axis.gridlines.isHidden = false
        } else if chartType == .bar || chartType == .stackedBar {
            axis.gridlines.isHidden = false
            axis.baseline.isHidden = true
        } else {
            axis.gridlines.isHidden = true
        }
        
        return axis
    }
    
    static func defaultNumericAixsAttributes(chartType: ChartType) -> ChartNumericAxisAttributes {
        let axis = ChartNumericAxisAttributes()
        if chartType == .stock {
            axis.isZeroBased = false
            axis.abbreviatesLabels = false
        }
        
        if chartType == .stock || chartType == .bubble || chartType == .scatter {
            axis.baseline.isHidden = false
        } else {
            axis.baseline.isHidden = true
        }
            
        if chartType == .line || chartType == .area || chartType == .stock || chartType == .combo {
            axis.allowLooseLabels = false
        } else {
            axis.allowLooseLabels = true
        }
        
        if chartType == .bubble || chartType == .scatter || chartType == .stackedColumn || chartType == .waterfall || chartType == .combo {
            axis.fudgeAxisRange = true
        } else {
            axis.allowLooseLabels = false
        }
        
        return axis
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
}

extension ChartModel: Equatable {
    public static func == (lhs: ChartModel, rhs: ChartModel) -> Bool {
        return lhs.chartType == rhs.chartType &&
            lhs.data == rhs.data &&
            lhs.titlesForCategory == rhs.titlesForCategory &&
            lhs.colorsForCategory == rhs.colorsForCategory &&
            lhs.titlesForAxis == rhs.titlesForAxis &&
            lhs.labelsForDimension == rhs.labelsForDimension &&
            lhs.indexOfStockSeries == rhs.indexOfStockSeries &&
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
    func colorAt(seriesIndex: Int, categoryIndex: Int) -> Color {
        if let c = colorsForCategory[seriesIndex], let val = c[categoryIndex] {
            return val
        }
        
        if !seriesAttributes.isEmpty {
            let count = seriesAttributes.count
            if let color = seriesAttributes[seriesIndex % count].palette.colors.first {
                return color
            }
        }
        
        return .preferredColor(.primary2)
    }
    
    func fillColorAt(seriesIndex: Int, categoryIndex: Int) -> Color {
        if !seriesAttributes.isEmpty {
            let count = seriesAttributes.count
            if let color = seriesAttributes[seriesIndex % count].palette._fillColor {
                return color
            } else { // use primary color
                return colorAt(seriesIndex: seriesIndex, categoryIndex: categoryIndex)
            }
        }
        
        return .preferredColor(.primary2)
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
        "xAxisLabelsPosition": \(String(describing: xAxisLabelsPosition)),
        "indexesOfSecondaryValueAxis": \(String(describing: indexesOfSecondaryValueAxis.sorted())),
        "indexesOfColumnSeries": \(String(describing: indexesOfColumnSeries.sorted())),
        "indexesOfTotalsCategories": \(String(describing: indexesOfTotalsCategories.sorted())),
        "selectionMode": "\(selectionMode.rawValue)",
        "selections": "\(String(describing: selections))",
        "selectionRequired": \(selectionRequired),
        "indexOfStockSeries": "\(String(describing: indexOfStockSeries))",
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

/**
 * X Axis Labels Position
 */
public enum XAxisLabelsPosition: String {
    /// X Axis Labels positions itself differenttly based on chart type and ChartValueType
    case `dynamic`
    
    /// X Axis Labels always positions at bottom
    case fixedBottom
}

/// Enum for available selection modes.
public enum ChartSelectionMode: String {
    
    /// Only a range of category indices in one series selection is allowd
    case single
    
    /// Only one category index of all sereis selection is allowed
    case all
    
    /// Any combination of category indices in any series selection is allowed
    case multiple
}

/// value type for Numberic Axis
enum ChartValueType: String {
    case allPositive
    case allNegative
    case mixed
}

/// NumericAxis label format handler passed from app
public typealias NumericAxisLabelFormatHandler = (Double, ChartAxisId) -> String?
