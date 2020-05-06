//
//  ChartAxisAttributes.swift
//  AnyCodable
//
//  Created by Xu, Sheng on 3/4/20.
//

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
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return ChartAxisAttributes(axisId: self.axisId,
                                   baseline: (self.baseline.copy() as! ChartBaselineAttributes),
                                   gridlines: (self.gridlines.copy() as! ChartGridlineAttributes),
                                   labels: (self.labels.copy() as! ChartLabelAttributes),
                                   titleLabel: (self.titleLabel.copy() as! ChartLabelAttributes),
                                   title: self.title)
    }
    
    public var description: String {
        return """
{
    "ChartAxisAttributes": {
        "baseline": \(String(describing: baseline)),
        "gridlines": \(String(describing: gridlines)),
        "labels": \(String(describing: labels)),
        "titleLabel": \(String(describing: titleLabel)),
        "title": "\(String(describing: title))"
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
    public init(axisId: ChartAxisId? = nil, baseline: ChartBaselineAttributes? = nil, gridlines: ChartGridlineAttributes? = nil, labels: ChartLabelAttributes? = nil, titleLabel: ChartLabelAttributes? = nil, title: String? = nil, isZeroBased: Bool = true, abbreviatesLabels: Bool = true, isMagnitudedDisplayed: Bool = true, explicitMin: Double? = nil, explicitMax: Double? = nil, formatter: NumberFormatter?, abbreviatedFormatter: NumberFormatter?) {
        if let formatter = formatter {
            self._formatter = Published(initialValue: formatter)
        } else {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            self._formatter = Published(initialValue: formatter)
        }
        
        if let abbreviatedFormatter = abbreviatedFormatter {
            self._abbreviatedFormatter = Published(initialValue: abbreviatedFormatter)
        } else if let formatter = formatter {
            self._abbreviatedFormatter = Published(initialValue: formatter)
        } else {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            self._abbreviatedFormatter = Published(initialValue: formatter)
        }
        
        self._isZeroBased = Published(initialValue: isZeroBased)
        self._abbreviatesLabels = Published(initialValue: abbreviatesLabels)
        self._isMagnitudedDisplayed = Published(initialValue: isMagnitudedDisplayed)
        self._explicitMin = Published(initialValue: ChartUtility.cgfloatOptional(from: explicitMin))
        self._explicitMax = Published(initialValue: ChartUtility.cgfloatOptional(from: explicitMax))
        
        super.init(axisId: axisId, baseline: baseline, gridlines: gridlines, labels: labels, titleLabel: titleLabel, title: title)
    }
    
    public convenience init() {
        self.init(axisId: nil, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: false, abbreviatesLabels: true, isMagnitudedDisplayed: true, explicitMin: nil, explicitMax: nil, formatter: nil, abbreviatedFormatter: nil)
    }
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        
        let copy = ChartNumericAxisAttributes(axisId: axisId,
                                              baseline: (baseline.copy() as! ChartBaselineAttributes),
                                              gridlines: (gridlines.copy() as! ChartGridlineAttributes),
                                              labels: (labels.copy() as! ChartLabelAttributes),
                                              titleLabel: (titleLabel.copy() as! ChartLabelAttributes),
                                              title: title,
                                              isZeroBased: isZeroBased,
                                              abbreviatesLabels: abbreviatesLabels,
                                              isMagnitudedDisplayed: isMagnitudedDisplayed,
                                              explicitMin: ChartUtility.doubleOptional(from: explicitMin),
                                              explicitMax: ChartUtility.doubleOptional(from: explicitMax),
                                              formatter: formatter.copy() as? NumberFormatter,
                                              abbreviatedFormatter: abbreviatedFormatter.copy() as? NumberFormatter)
        
        return copy
    }
    
    func myCustomDesc(for nf: NumberFormatter) -> String {
        return """
{
    "NumberFormatter": {
        "numberStyle": \(nf.numberStyle.rawValue),
        "minimumFractionDigits": \(nf.minimumFractionDigits),
        "maximumFractionDigits": \(nf.maximumFractionDigits)
    }
}
"""
    }
    
    public override var description: String {
        return """
{
    "ChartNumericAxisAttributes": {
        "baseline": \(String(describing: baseline)),
        "gridlines": \(String(describing: gridlines)),
        "labels": \(String(describing: labels)),
        "titleLabel": \(String(describing: titleLabel)),
        "title": "\(String(describing: title))",
        "isZeroBased": \(isZeroBased),
        "abbreviatesLabels": \(abbreviatesLabels),
        "isMagnitudedDisplayed": \(isMagnitudedDisplayed),
        "explicitMin": "\(String(describing: explicitMin))",
        "explicitMax": "\(String(describing: explicitMax))",
        "formatter": \(myCustomDesc(for: formatter)),
        "abbreviatedFormatter": \(myCustomDesc(for: abbreviatedFormatter))
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
    
    public init(axisId: ChartAxisId? = nil, baseline: ChartBaselineAttributes? = nil, gridlines: ChartGridlineAttributes? = nil, labels: ChartLabelAttributes? = nil, titleLabel: ChartLabelAttributes? = nil, title: String? = nil, isZeroBased: Bool = true, abbreviatesLabels: Bool = true, isMagnitudedDisplayed: Bool = true, explicitMin: Double? = nil, explicitMax: Double? = nil, formatter: NumberFormatter?, abbreviatedFormatter: NumberFormatter?, labelLayoutStyle: ChartCategoryAxisLabelLayoutStyle) {
        self._labelLayoutStyle = Published(initialValue: labelLayoutStyle)
        
        super.init(axisId: axisId, baseline: baseline, gridlines: gridlines, labels: labels, titleLabel: titleLabel, title: title, isZeroBased: isZeroBased, abbreviatesLabels: abbreviatesLabels, isMagnitudedDisplayed: isMagnitudedDisplayed, explicitMin: explicitMin, explicitMax: explicitMax, formatter: formatter, abbreviatedFormatter: abbreviatedFormatter)
    }
    
    public convenience init(labelLayoutStyle: ChartCategoryAxisLabelLayoutStyle) {
        self.init(axisId: nil, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: false, abbreviatesLabels: true, isMagnitudedDisplayed: true, explicitMin: nil, explicitMax: nil, formatter: nil, abbreviatedFormatter: nil, labelLayoutStyle: labelLayoutStyle)
    }
    
    public convenience init() {
        self.init(labelLayoutStyle: .allOrNothing)
    }
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        let copy = ChartCategoryAxisAttributes(axisId: axisId,
                                               baseline: (baseline.copy() as! ChartBaselineAttributes),
                                               gridlines: (gridlines.copy() as! ChartGridlineAttributes),
                                               labels: (labels.copy() as! ChartLabelAttributes),
                                               titleLabel: (titleLabel.copy() as! ChartLabelAttributes),
                                               title: title,
                                               isZeroBased: isZeroBased,
                                               abbreviatesLabels: abbreviatesLabels,
                                               isMagnitudedDisplayed: isMagnitudedDisplayed,
                                               explicitMin: ChartUtility.doubleOptional(from: explicitMin),
                                               explicitMax: ChartUtility.doubleOptional(from: explicitMax),
                                               formatter: formatter.copy() as? NumberFormatter,
                                               abbreviatedFormatter: abbreviatedFormatter.copy() as? NumberFormatter,
                                               labelLayoutStyle: labelLayoutStyle)
        
        return copy
    }
    
    public override var description: String {
        return """
{
    "ChartCategoryAxisAttributes": {
        "baseline": \(String(describing: baseline)),
        "gridlines": \(String(describing: gridlines)),
        "labels": \(String(describing: labels)),
        "titleLabel": \(String(describing: titleLabel)),
        "title": "\(String(describing: title))",
        "isZeroBased": \(isZeroBased),
        "abbreviatesLabels": \(abbreviatesLabels),
        "isMagnitudedDisplayed": \(isMagnitudedDisplayed),
        "explicitMin": "\(String(describing: explicitMin))",
        "explicitMax": "\(String(describing: explicitMax))",
        "formatter": \(myCustomDesc(for: formatter)),
        "abbreviatedFormatter": \(myCustomDesc(for: abbreviatedFormatter)),
        "labelLayoutStyle": "\(String(describing: labelLayoutStyle))"
    }
}
"""
    }
    
    /// Defines the manner in which labels will be presented when they are provided by the data source, and not hidden.
    @Published public var labelLayoutStyle: ChartCategoryAxisLabelLayoutStyle
}

extension ChartAxisAttributes: Equatable {
    public static func == (lhs: ChartAxisAttributes, rhs: ChartAxisAttributes) -> Bool {
        return lhs.axisId == rhs.axisId &&
            lhs.baseline == rhs.baseline &&
            lhs.gridlines == rhs.gridlines &&
            lhs.labels == rhs.labels &&
            lhs.titleLabel == rhs.titleLabel &&
            lhs.title == rhs.title
    }
}

extension ChartNumericAxisAttributes {
    /// conform to Equatable
    public static func == (lhs: ChartNumericAxisAttributes, rhs: ChartNumericAxisAttributes) -> Bool {
        return lhs.axisId == rhs.axisId &&
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

extension ChartCategoryAxisAttributes {
    /// conform to Equatable
    public static func == (lhs: ChartCategoryAxisAttributes, rhs: ChartCategoryAxisAttributes) -> Bool {
        return lhs.axisId == rhs.axisId &&
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
