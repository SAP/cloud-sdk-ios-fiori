//
//  ChartAxisId.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/22/20.
//  Copyright © 2020 sstadelman. All rights reserved.
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
