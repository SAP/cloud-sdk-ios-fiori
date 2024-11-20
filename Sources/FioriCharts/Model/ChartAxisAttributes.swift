import Combine
import Foundation
import SwiftUI

/**
 Identifiers for different axes presented by the chart.
 
 These are provided as a convenient way to reference axes by their position and orientation.
 
 The type of axis will vary depending on the type of chart presented. As an example, for scatter, bubble, and bar charts the `x` axis is a numeric axis; but for all other chart types the `x` axis is the category axis.
 */
public enum ChartAxisId: String {
    /// X axis. Normally the category or horizontal axis.
    case x
    /// Y axis. Normally the value or vertical axis.
    case y
    /// :nodoc:
    case radius
    /// :nodoc:
    case dual
    /// Category or X axis.
    case category
}

/**
 * Axis context struct.
 */
struct AxisTickValues {
    /*
     * The actual plottable min/max.
     * This is the smallest value between tick min and data min, and the biggest
     * value between tick max and data max.
     */
    let plotMinimum: CGFloat
    let plotMaximum: CGFloat

    /*
     * Indicate the value and position of the origin of a chart.
     * If the y axis zero value is visible in the plottable area, zero is the
     * baseline. Otherwise it will be the closest visible value to the y axis
     * zero value... the origin.
     */
    let plotBaselineValue: CGFloat
    let plotBaselinePosition: CGFloat
    
    /*
     * The min/max represented by the tick marks.
     */
    let tickMinimum: CGFloat
    let tickMaximum: CGFloat
    
    /*
     * The min/max values in the data.
     */
    let dataMinimum: CGFloat
    let dataMaximum: CGFloat
    
    /*
     * The range between plot min and plot max.
     */
    let plotRange: CGFloat
    
    /*
     * The range between tick min and tick max.
     */
    let tickRange: CGFloat
    
    /*
     * The range between data min and data max.
     */
    let dataRange: CGFloat
    
    /*
     * The range between plot min and plot max.
     */
    let plotScale: CGFloat
    
    /*
     * The range between tick min and tick max.
     */
    let tickScale: CGFloat
    
    /*
     * The range between data min and data max.
     */
    let dataScale: CGFloat
    
    /*
     *  The size of the tick distance from one tick mark to another.
     */
    let tickStepSize: CGFloat
    
    /*
     *  Array of tick values that are to be represented.
     */
    let tickValues: [CGFloat]
    
    /*
     *  Array of tick values that are to be represented.
     */
    let tickPositions: [CGFloat]
    
    /*
     *  Amount of ticks that are to be represented.
     */
    let tickCount: UInt
    
    init(plotMinimum: CGFloat, plotMaximum: CGFloat, plotBaselineValue: CGFloat, plotBaselinePosition: CGFloat, tickMinimum: CGFloat, tickMaximum: CGFloat, dataMinimum: CGFloat, dataMaximum: CGFloat, plotRange: CGFloat, tickRange: CGFloat, dataRange: CGFloat, plotScale: CGFloat, tickScale: CGFloat, dataScale: CGFloat, tickStepSize: CGFloat, tickValues: [CGFloat], tickPositions: [CGFloat], tickCount: UInt) {
        self.plotMinimum = plotMinimum
        self.plotMaximum = plotMaximum
        self.plotBaselineValue = plotBaselineValue
        self.plotBaselinePosition = plotBaselinePosition
        self.tickMinimum = tickMinimum
        self.tickMaximum = tickMaximum
        self.dataMinimum = dataMinimum
        self.dataMaximum = dataMaximum
        self.plotRange = plotRange
        self.tickRange = tickRange
        self.dataRange = dataRange
        self.plotScale = plotScale
        self.tickScale = tickScale
        self.dataScale = dataScale
        self.tickStepSize = tickStepSize
        self.tickValues = tickValues
        self.tickPositions = tickPositions
        self.tickCount = tickCount
    }
    
    init() {
        self.init(plotMinimum: 0, plotMaximum: 1, plotBaselineValue: 0, plotBaselinePosition: 0, tickMinimum: 0, tickMaximum: 1, dataMinimum: 0, dataMaximum: 1, plotRange: 1, tickRange: 1, dataRange: 1, plotScale: 1, tickScale: 1, dataScale: 1, tickStepSize: 1, tickValues: [0, 1], tickPositions: [0, 1], tickCount: 2)
    }
}

extension AxisTickValues: CustomStringConvertible {
    var description: String {
        let nf = NumberFormatter()
        nf.numberStyle = .none
        nf.maximumFractionDigits = 2
        
        return """
        {
            "AxisTickValues": {
                "plotMinimum": \(nf.string(from: NSNumber(value: Double(self.plotMinimum))) ?? ""),
                "plotMaximum": \(nf.string(from: NSNumber(value: Double(self.plotMaximum))) ?? ""),
                "plotBaselineValue": \(nf.string(from: NSNumber(value: Double(self.plotBaselineValue))) ?? ""),
                "plotBaselinePosition": \(nf.string(from: NSNumber(value: Double(self.plotBaselinePosition))) ?? ""),
                "tickMinimum": \(nf.string(from: NSNumber(value: Double(self.tickMinimum))) ?? ""),
                "tickMaximum": \(nf.string(from: NSNumber(value: Double(self.tickMaximum))) ?? ""),
                "dataMinimum": \(nf.string(from: NSNumber(value: Double(self.dataMinimum))) ?? ""),
                "dataMaximum": \(nf.string(from: NSNumber(value: Double(self.dataMaximum))) ?? ""),
                "plotRange": \(nf.string(from: NSNumber(value: Double(self.plotRange))) ?? ""),
                "tickRange": \(nf.string(from: NSNumber(value: Double(self.tickRange))) ?? ""),
                "dataRange": \(nf.string(from: NSNumber(value: Double(self.dataRange))) ?? ""),
                "plotScale": \(nf.string(from: NSNumber(value: Double(self.plotScale))) ?? ""),
                "tickScale": \(nf.string(from: NSNumber(value: Double(self.tickScale))) ?? ""),
                "dataScale": \(nf.string(from: NSNumber(value: Double(self.dataScale))) ?? ""),
                "tickStepSize": \(nf.string(from: NSNumber(value: Double(self.tickStepSize))) ?? ""),
                "tickValues": \(String(describing: self.tickValues)),
                "tickPositions": \(String(describing: self.tickPositions)),
                "tickCount": \(String(describing: self.tickCount))
            }
        }
        """
    }
}

public class ChartAxisAttributes: ObservableObject, Identifiable, NSCopying, CustomStringConvertible {
    /// Provides an identifier that associates the axis with a position and orientation in the chart.
    @Published public var axisId: ChartAxisId?
    
    /**
     Properties for the axis baseline, which is typically usually 0.
     - Only numeric axes have a baseline.
     */
    @Published public var baseline: ChartBaselineAttributes
    
    /// Properties for the axis gridlines.
    @Published public var gridlines: ChartGridlineAttributes
    
    /// Properties for the axis gridline labels.
    @Published public var labels: ChartLabelAttributes
    
    /// Properties of the axis title label.
    @Published public var titleLabel: ChartLabelAttributes
    
    /// Title of the axis.
    @Published public var title: String?
    
    public let id = UUID()
    
    public init(axisId: ChartAxisId? = nil, baseline: ChartBaselineAttributes? = nil, gridlines: ChartGridlineAttributes? = nil, labels: ChartLabelAttributes? = nil, titleLabel: ChartLabelAttributes? = nil, title: String? = nil) {
        self._axisId = Published(initialValue: axisId)
        
        if let baselineAttributes = baseline {
            self._baseline = Published(initialValue: baselineAttributes)
        } else {
            let bl = ChartBaselineAttributes()
            self._baseline = Published(initialValue: bl)
        }
        
        if let gridlinesAttributes = gridlines {
            self._gridlines = Published(initialValue: gridlinesAttributes)
        } else {
            self._gridlines = Published(initialValue: ChartGridlineAttributes())
        }
        
        if let labelsAttributes = labels {
            self._labels = Published(initialValue: labelsAttributes)
        } else {
            self._labels = Published(initialValue: ChartLabelAttributes())
        }
        
        if let titleLabelsAttributes = titleLabel {
            self._titleLabel = Published(initialValue: titleLabelsAttributes)
        } else {
            self._titleLabel = Published(initialValue: ChartLabelAttributes())
        }
        
        self._title = Published(initialValue: title)
    }
    
    // swiftlint:disable force_cast
    public func copy(with zone: NSZone? = nil) -> Any {
        ChartAxisAttributes(axisId: self.axisId,
                            baseline: self.baseline.copy() as? ChartBaselineAttributes,
                            gridlines: self.gridlines.copy() as? ChartGridlineAttributes,
                            labels: self.labels.copy() as? ChartLabelAttributes,
                            titleLabel: self.titleLabel.copy() as? ChartLabelAttributes,
                            title: self.title)
    }
    
    public var description: String {
        """
        {
            "ChartAxisAttributes": {
                "baseline": \(String(describing: self.baseline)),
                "gridlines": \(String(describing: self.gridlines)),
                "labels": \(String(describing: self.labels)),
                "titleLabel": \(String(describing: self.titleLabel)),
                "title": "\(String(describing: self.title))"
            }
        }
        """
    }
}

/**
 ChartNumericAxis contains properties of axes for ranges of floating point values.
 
 The position and orientation of a numeric axis depends on the chart type. For example:
 - Bar charts display the numeric axis as the X axis.
 - Line, column, and combo charts display the numeric axis as the Y axis.
 */
public class ChartNumericAxisAttributes: ChartAxisAttributes {
    public init(axisId: ChartAxisId? = nil,
                baseline: ChartBaselineAttributes? = nil,
                gridlines: ChartGridlineAttributes? = nil,
                labels: ChartLabelAttributes? = nil,
                titleLabel: ChartLabelAttributes? = nil,
                title: String? = nil,
                isZeroBased: Bool = true,
                allowLooseLabels: Bool = false,
                fudgeAxisRange: Bool = false,
                adjustToNiceValues: Bool = true,
                abbreviatesLabels: Bool = false,
                isMagnitudedDisplayed: Bool = true,
                explicitMin: Double? = nil,
                explicitMax: Double? = nil,
                formatter: NumberFormatter?,
                abbreviatedFormatter: NumberFormatter?)
    {
        if let formatter {
            self._formatter = Published(initialValue: formatter)
        } else {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            self._formatter = Published(initialValue: formatter)
        }
        
        if let abbreviatedFormatter {
            self._abbreviatedFormatter = Published(initialValue: abbreviatedFormatter)
        } else if let formatter {
            self._abbreviatedFormatter = Published(initialValue: formatter)
        } else {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            self._abbreviatedFormatter = Published(initialValue: formatter)
        }
        
        self._isZeroBased = Published(initialValue: isZeroBased)
        self._allowLooseLabels = Published(initialValue: allowLooseLabels)
        self._fudgeAxisRange = Published(initialValue: fudgeAxisRange)
        self._adjustToNiceValues = Published(initialValue: adjustToNiceValues)
        self._abbreviatesLabels = Published(initialValue: abbreviatesLabels)
        self._isMagnitudedDisplayed = Published(initialValue: isMagnitudedDisplayed)
        self._explicitMin = Published(initialValue: ChartUtility.cgfloatOptional(from: explicitMin))
        self._explicitMax = Published(initialValue: ChartUtility.cgfloatOptional(from: explicitMax))
        
        super.init(axisId: axisId, baseline: baseline, gridlines: gridlines, labels: labels, titleLabel: titleLabel, title: title)
    }
    
    public convenience init() {
        self.init(axisId: nil, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: true, allowLooseLabels: false, fudgeAxisRange: false, adjustToNiceValues: true, abbreviatesLabels: false, isMagnitudedDisplayed: true, explicitMin: nil, explicitMax: nil, formatter: nil, abbreviatedFormatter: nil)
    }
    
    // swiftlint:disable force_cast
    override public func copy(with zone: NSZone? = nil) -> Any {
        let copy = ChartNumericAxisAttributes(axisId: axisId,
                                              baseline: baseline.copy() as? ChartBaselineAttributes,
                                              gridlines: gridlines.copy() as? ChartGridlineAttributes,
                                              labels: labels.copy() as? ChartLabelAttributes,
                                              titleLabel: titleLabel.copy() as? ChartLabelAttributes,
                                              title: title,
                                              isZeroBased: self.isZeroBased,
                                              allowLooseLabels: self.allowLooseLabels,
                                              fudgeAxisRange: self.fudgeAxisRange,
                                              adjustToNiceValues: self.adjustToNiceValues,
                                              abbreviatesLabels: self.abbreviatesLabels,
                                              isMagnitudedDisplayed: self.isMagnitudedDisplayed,
                                              explicitMin: ChartUtility.doubleOptional(from: self.explicitMin),
                                              explicitMax: ChartUtility.doubleOptional(from: self.explicitMax),
                                              formatter: self.formatter.copy() as? NumberFormatter,
                                              abbreviatedFormatter: self.abbreviatedFormatter.copy() as? NumberFormatter)
        
        return copy
    }
    
    func myCustomDesc(for nf: NumberFormatter) -> String {
        """
        {
            "NumberFormatter": {
                "numberStyle": \(nf.numberStyle.rawValue),
                "minimumFractionDigits": \(nf.minimumFractionDigits),
                "maximumFractionDigits": \(nf.maximumFractionDigits)
            }
        }
        """
    }
    
    override public var description: String {
        """
        {
            "ChartNumericAxisAttributes": {
                "baseline": \(String(describing: baseline)),
                "gridlines": \(String(describing: gridlines)),
                "labels": \(String(describing: labels)),
                "titleLabel": \(String(describing: titleLabel)),
                "title": "\(String(describing: title))",
                "isZeroBased": \(self.isZeroBased),
                "allowLooseLabels": \(self.allowLooseLabels),
                "fudgeYAxisRange": \(self.fudgeAxisRange),
                "adjustToNiceValues": \(self.adjustToNiceValues),
                "abbreviatesLabels": \(self.abbreviatesLabels),
                "isMagnitudedDisplayed": \(self.isMagnitudedDisplayed),
                "explicitMin": "\(String(describing: self.explicitMin))",
                "explicitMax": "\(String(describing: self.explicitMax))",
                "formatter": \(self.myCustomDesc(for: self.formatter)),
                "abbreviatedFormatter": \(self.myCustomDesc(for: self.abbreviatedFormatter))
            }
        }
        """
    }
    
    /**
     Indicates whether the baseline starts at zero or the minimum value in the data set.
     
     Applicable only to data sets with all positive, or all negative values, otherwise the baseline is always zero.
     
     Default is true.
     */
    @Published public var isZeroBased: Bool
    
    /***
      Allows labels to exceed the data range.
      It is inconsistent when it comes to enabling it.
         • ellipse - yes
         • waterfall - yes
         • stacked column - no
         • line - no
         • column - no
         • combo - yes
     */
    @Published var allowLooseLabels = false
    
    /***
      Flag that indicates whether the Y Axis should be adjusted to better fit the available space.
      By default, all column based charts have this enabled and all line based don't.
     */
    @Published var fudgeAxisRange = false
    
    /***
      Flag that indicates if we should adjust to nice values, or use the data
      minimum and maximum to calculate the range.
    
      Chart scale is adjusted so that gridlines (ticks) fall on "nice" values. Explicit min/max overrides this.
     */
    @Published var adjustToNiceValues = true
    
    /**
     Formatter used for the axis gridline labels.
     Defines the formatting for both extended and abbreviated states set through `ChartNumericAxis.abbreviatesLabels`.
     
     Defaults to a localized decimal formatter.
     */
    @Published public var formatter: NumberFormatter
    
    /**
     True if values will be abbreviated. For example, "1,234,567.89" to "1.23k". Default is true.
     The `ChartNumericAxis.formatter` defines the formatting for both extended and abbreviated states.
     */
    @Published public var abbreviatesLabels: Bool
    
    /// True if the value's magnitude is included in abbreviated labels. For example, the "k" in "1.23k".
    @Published public var isMagnitudedDisplayed: Bool
    
    @Published public var abbreviatedFormatter: NumberFormatter
    
    //    override func labelForValue(_ value: Double) -> String? {
    //
    //        return nil
    //    }
    
    /**
     Allows you to specify the minimum value for the axis, overriding the minimum value applied by the chart.
     `explicitMin` and `explicitMax` override the data min and max range values presented in the `ChartNumericAxis`.
     If the data minimum and maximum values are 0 and 100, the `ChartNumericAxis` will present the range between 0 and 100.
     By setting `explicitMin` and `explicitMax` to -20 and 120, would have the `ChartNumericAxis` display a new range between -20 and 120.
     
     Normally `explicitMin` and `explicitMax` are used when multiple charts share a context and should have the same axis ranges. Like in a trellis situation.
     
     Default is nil.
     */
    @Published public var explicitMin: CGFloat?
    
    /**
     Allows you to specify the maximum value for the axis, overriding the maximum value applied by the chart.
     `explicitMin` and `explicitMax` override the data min and max range values presented in the `ChartNumericAxis`.
     If the data minimum and maximum values are 0 and 100, the `ChartNumericAxis` will present the range between 0 and 100.
     By setting `explicitMin` and `explicitMax` to -20 and 120, would have the `ChartNumericAxis` display a new range between -20 and 120.
     
     Normally `explicitMin` and `explicitMax` are used when multiple charts share a context and should have the same axis ranges. Like in a trellis situation.
     
     Default is nil.
     */
    @Published public var explicitMax: CGFloat?
}

/**
 Defines the policy used to determine which labels are presented along the horizontal category axis.
 */
public enum ChartCategoryAxisLabelLayoutStyle: CustomStringConvertible {
    /**
     The `allOrNothing` layout style will display all labels, or no labels when they cannot be presented without overlapping.
     
     - Labels may be truncated to fit.
     - A minimum gap between each label is enforced.
     - All labels are center aligned beneath their respective point, column, cluster, etc.
     
     This is the default layout mode.
     */
    case allOrNothing
    
    /**
     The `range` layout style is intended for time series, or numeric ranges where horizontal space is limited.
     
     Only labels for the first and last category members will be displayed.
     - The first label is aligned to the left edge of the axis.
     - The last label is aligned to the right edge of the axis.
     */
    case range
    
    public var description: String {
        switch self {
        case .allOrNothing:
            return "allOrNothing"
        case .range:
            return "range"
        }
    }
}

/**
 ChartCategoryAxis contains properties of the axes for categorical collections of values.
 
 All chart types have at most a single category axis.
 
 The position and orientation of the category axis depends on the chart type. For example:
 - Bar charts display the category axis as the Y axis.
 - Line, column, and combo charts display the category axis as the X axis.
 */
public class ChartCategoryAxisAttributes: ChartNumericAxisAttributes {
    public init(axisId: ChartAxisId? = nil,
                baseline: ChartBaselineAttributes? = nil,
                gridlines: ChartGridlineAttributes? = nil,
                labels: ChartLabelAttributes? = nil,
                titleLabel: ChartLabelAttributes? = nil,
                title: String? = nil,
                isZeroBased: Bool = true,
                allowLooseLabels: Bool = false,
                fudgeAxisRange: Bool = false,
                adjustToNiceValues: Bool = true,
                abbreviatesLabels: Bool = true,
                isMagnitudedDisplayed: Bool = true,
                explicitMin: Double? = nil,
                explicitMax: Double? = nil,
                formatter: NumberFormatter?,
                abbreviatedFormatter: NumberFormatter?,
                labelLayoutStyle: ChartCategoryAxisLabelLayoutStyle)
    {
        self._labelLayoutStyle = Published(initialValue: labelLayoutStyle)
        
        super.init(axisId: axisId, baseline: baseline, gridlines: gridlines, labels: labels, titleLabel: titleLabel, title: title, isZeroBased: isZeroBased, allowLooseLabels: allowLooseLabels, fudgeAxisRange: fudgeAxisRange, adjustToNiceValues: adjustToNiceValues, abbreviatesLabels: abbreviatesLabels, isMagnitudedDisplayed: isMagnitudedDisplayed, explicitMin: explicitMin, explicitMax: explicitMax, formatter: formatter, abbreviatedFormatter: abbreviatedFormatter)
    }
    
    public convenience init(labelLayoutStyle: ChartCategoryAxisLabelLayoutStyle) {
        self.init(axisId: nil, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: false, allowLooseLabels: false, fudgeAxisRange: false, adjustToNiceValues: true, abbreviatesLabels: true, isMagnitudedDisplayed: true, explicitMin: nil, explicitMax: nil, formatter: nil, abbreviatedFormatter: nil, labelLayoutStyle: labelLayoutStyle)
    }
    
    public convenience init() {
        self.init(labelLayoutStyle: .allOrNothing)
    }
    
    // swiftlint:disable force_cast
    override public func copy(with zone: NSZone? = nil) -> Any {
        let copy = ChartCategoryAxisAttributes(axisId: axisId,
                                               baseline: baseline.copy() as? ChartBaselineAttributes,
                                               gridlines: gridlines.copy() as? ChartGridlineAttributes,
                                               labels: labels.copy() as? ChartLabelAttributes,
                                               titleLabel: titleLabel.copy() as? ChartLabelAttributes,
                                               title: title,
                                               isZeroBased: isZeroBased,
                                               allowLooseLabels: allowLooseLabels,
                                               fudgeAxisRange: fudgeAxisRange,
                                               adjustToNiceValues: adjustToNiceValues,
                                               abbreviatesLabels: abbreviatesLabels,
                                               isMagnitudedDisplayed: isMagnitudedDisplayed,
                                               explicitMin: ChartUtility.doubleOptional(from: explicitMin),
                                               explicitMax: ChartUtility.doubleOptional(from: explicitMax),
                                               formatter: formatter.copy() as? NumberFormatter,
                                               abbreviatedFormatter: abbreviatedFormatter.copy() as? NumberFormatter,
                                               labelLayoutStyle: self.labelLayoutStyle)
        
        return copy
    }
    
    override public var description: String {
        """
        {
            "ChartCategoryAxisAttributes": {
                "baseline": \(String(describing: baseline)),
                "gridlines": \(String(describing: gridlines)),
                "labels": \(String(describing: labels)),
                "titleLabel": \(String(describing: titleLabel)),
                "title": "\(String(describing: title))",
                "isZeroBased": \(isZeroBased),
                "allowLooseLabels": \(allowLooseLabels),
                "fudgeYAxisRange": \(fudgeAxisRange),
                "adjustToNiceValues": \(adjustToNiceValues),
                "abbreviatesLabels": \(abbreviatesLabels),
                "isMagnitudedDisplayed": \(isMagnitudedDisplayed),
                "explicitMin": "\(String(describing: explicitMin))",
                "explicitMax": "\(String(describing: explicitMax))",
                "formatter": \(myCustomDesc(for: formatter)),
                "abbreviatedFormatter": \(myCustomDesc(for: abbreviatedFormatter)),
                "labelLayoutStyle": "\(String(describing: self.labelLayoutStyle))"
            }
        }
        """
    }
    
    /// Defines the manner in which labels will be presented when they are provided by the data source, and not hidden.
    @Published public var labelLayoutStyle: ChartCategoryAxisLabelLayoutStyle
}

extension ChartAxisAttributes: Equatable {
    public static func == (lhs: ChartAxisAttributes, rhs: ChartAxisAttributes) -> Bool {
        lhs.axisId == rhs.axisId &&
            lhs.baseline == rhs.baseline &&
            lhs.gridlines == rhs.gridlines &&
            lhs.labels == rhs.labels &&
            lhs.titleLabel == rhs.titleLabel &&
            lhs.title == rhs.title
    }
}

public extension ChartNumericAxisAttributes {
    /// conform to Equatable
    static func == (lhs: ChartNumericAxisAttributes, rhs: ChartNumericAxisAttributes) -> Bool {
        lhs.axisId == rhs.axisId &&
            lhs.baseline == rhs.baseline &&
            lhs.gridlines == rhs.gridlines &&
            lhs.labels == rhs.labels &&
            lhs.titleLabel == rhs.titleLabel &&
            lhs.title == rhs.title &&
            lhs.isZeroBased == rhs.isZeroBased &&
            lhs.abbreviatesLabels == rhs.abbreviatesLabels &&
            lhs.isMagnitudedDisplayed == rhs.isMagnitudedDisplayed &&
            lhs.explicitMin == rhs.explicitMin &&
            lhs.explicitMax == rhs.explicitMax // &&
//            lhs.formatter == rhs.formatter &&
//            lhs.abbreviatedFormatter == rhs.abbreviatedFormatter
    }
}

public extension ChartCategoryAxisAttributes {
    /// conform to Equatable
    static func == (lhs: ChartCategoryAxisAttributes, rhs: ChartCategoryAxisAttributes) -> Bool {
        lhs.axisId == rhs.axisId &&
            lhs.baseline == rhs.baseline &&
            lhs.gridlines == rhs.gridlines &&
            lhs.labels == rhs.labels &&
            lhs.titleLabel == rhs.titleLabel &&
            lhs.title == rhs.title &&
            lhs.isZeroBased == rhs.isZeroBased &&
            lhs.abbreviatesLabels == rhs.abbreviatesLabels &&
            lhs.isMagnitudedDisplayed == rhs.isMagnitudedDisplayed &&
            lhs.explicitMin == rhs.explicitMin &&
            lhs.explicitMax == rhs.explicitMax &&
//            lhs.formatter == rhs.formatter &&
//            lhs.abbreviatedFormatter == rhs.abbreviatedFormatter &&
            lhs.labelLayoutStyle == rhs.labelLayoutStyle
    }
}
