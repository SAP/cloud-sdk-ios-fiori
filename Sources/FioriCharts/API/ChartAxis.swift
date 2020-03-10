//
//  ChartAxis.swift
//  AnyCodable
//
//  Created by Xu, Sheng on 3/4/20.
//

import Foundation

/**
 Identifiers for different axes presented by the chart.

 These are provided as a convenient way to reference axes by their position and orientation.

 The type of axis will vary depending on the type of chart presented. As an example, for scatter, bubble, and bar charts the `x` axis is a numeric axis; but for all other chart types the `x` axis is the category axis.
 */
public enum ChartAxisId {

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

public class ChartAxis: ObservableObject, Identifiable {
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
    @Published var title: String?
    
    public let id = UUID()
    
    
    public init(axisId: ChartAxisId? = nil, baseline: ChartBaselineAttributes? = nil, gridlines: ChartGridlineAttributes? = nil, labels: ChartLabelAttributes? = nil, titleLabel: ChartLabelAttributes? = nil, title: String? = nil) {
        self.axisId = axisId
        
        if let baselineAttributes = baseline {
            self.baseline = baselineAttributes
        }
        else {
            self.baseline = ChartBaselineAttributes()
        }
        
        if let gridlinesAttributes = gridlines {
            self.gridlines = gridlinesAttributes
        }
        else {
            self.gridlines = ChartGridlineAttributes()
        }
        
        if let labelsAttributes = labels {
            self.labels = labelsAttributes
        }
        else {
            self.labels = ChartLabelAttributes()
        }
        
        if let titleLabelsAttributes = titleLabel {
            self.titleLabel = titleLabelsAttributes
        }
        else {
            self.titleLabel = ChartLabelAttributes()
        }
        
        self.title = title
    }
}

/**
 ChartNumericAxis contains properties of axes for ranges of floating point values.
 
 The position and orientation of a numeric axis depends on the chart type. For example:
 - Bar charts display the numeric axis as the X axis.
 - Line, column, and combo charts display the numeric axis as the Y axis.
 */
public class ChartNumericAxis : ChartAxis {
    
    public convenience init() {
        self.init(axisId: nil, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: false, abbreviatesLabels: true, explicitMin: nil, explicitMax: nil, formatter: nil, abbreviatedFormatter: nil)
    }
    
    public init(axisId: ChartAxisId? = nil, baseline: ChartBaselineAttributes? = nil, gridlines: ChartGridlineAttributes? = nil, labels: ChartLabelAttributes? = nil, titleLabel: ChartLabelAttributes? = nil, title: String? = nil, isZeroBased: Bool = true, abbreviatesLabels: Bool = true, explicitMin: Double? = nil, explicitMax: Double? = nil, formatter: NumberFormatter?, abbreviatedFormatter: NumberFormatter?) {
        if let formatter = formatter {
            self.formatter = formatter
        }
        else {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            self.formatter = formatter
        }
        
        if let abbreviatedFormatter = abbreviatedFormatter {
            self.abbreviatedFormatter = abbreviatedFormatter
        }
        else {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            self.abbreviatedFormatter = formatter
        }
        
        self.isZeroBased = true
        self.abbreviatesLabels = abbreviatesLabels
        self.explicitMin = explicitMin
        self.explicitMax = explicitMax
        
        super.init(axisId: axisId, baseline: baseline, gridlines: gridlines, labels: labels, titleLabel: titleLabel, title: title)
    }
    
    /**
     Indicates whether the baseline starts at zero or the minimum value in the data set.
     
     Applicable only to data sets with all positive, or all negative values, otherwise the baseline is always zero.
     
     Default is true.
     */
    @Published public var isZeroBased: Bool = true
    
    
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
    @Published public var abbreviatesLabels: Bool = true
    
    
    /// True if the value's magnitude is included in abbreviated labels. For example, the "k" in "1.23k".
    @Published public var isMagnitudedDisplayed: Bool = true
    
    
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
    @Published public var explicitMin: Double?
    
    
    /**
     Allows you to specify the maximum value for the axis, overriding the maximum value applied by the chart.
     `explicitMin` and `explicitMax` override the data min and max range values presented in the `ChartNumericAxis`.
     If the data minimum and maximum values are 0 and 100, the `ChartNumericAxis` will present the range between 0 and 100.
     By setting `explicitMin` and `explicitMax` to -20 and 120, would have the `ChartNumericAxis` display a new range between -20 and 120.
     
     Normally `explicitMin` and `explicitMax` are used when multiple charts share a context and should have the same axis ranges. Like in a trellis situation.
     
     Default is nil.
     */
    @Published public var explicitMax: Double?
}

/**
 Defines the policy used to determine which labels are presented along the horizontal category axis.
 */
public enum ChartCategoryAxisLabelLayoutStyle {
    
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
}

/**
 ChartCategoryAxis contains properties of the axes for categorical collections of values.
 
 All chart types have at most a single category axis.
 
 The position and orientation of the category axis depends on the chart type. For example:
 - Bar charts display the category axis as the Y axis.
 - Line, column, and combo charts display the category axis as the X axis.
 */
public class ChartCategoryAxis : ChartNumericAxis {
    
    public convenience init() {
        self.init(labelLayoutStyle: .allOrNothing)
    }
    
    public init(labelLayoutStyle: ChartCategoryAxisLabelLayoutStyle) {
        self.labelLayoutStyle = labelLayoutStyle
        
        super.init(axisId: nil, baseline: nil, gridlines: nil, labels: nil, titleLabel: nil, title: nil, isZeroBased: false, abbreviatesLabels: true, explicitMin: nil, explicitMax: nil, formatter: nil, abbreviatedFormatter: nil)
    }
    
    
    /// Defines the manner in which labels will be presented when they are provided by the data source, and not hidden.
    @Published public var labelLayoutStyle: ChartCategoryAxisLabelLayoutStyle
    
    //    var layout: ChartAxisLabelLayout
}
