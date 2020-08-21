//
//  ChartType.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/22/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation

/// Available chart types. Use this enum to define chart type to present.
public enum ChartType: String {

    /// Line Chart
    case line

    /// Clustered Column Chart
    case column

    /// Combo Chart. The first series will be displayed as columns, and each additional series as a line.
    case combo

    /// Bar Chart
    case bar
    
    /// Stacked Column Chart
    case stackedColumn
    
    /// Waterfall Chart
    case waterfall
    
    /// Area Chart
    case area
    
    /// Scatter Chart
    case scatter
    
    /// Bubble Chart
    case bubble
    
    /// Micro Chart Area
    case micro_area
    
    /// Micro Chart Bullet
    case micro_bullet
    
    /// Micro Chart Column
    case micro_column
    
    /// Micro Chart Harvey Ball
    case micro_harvey_ball
    
    /// Micro Chart Radial
    case micro_radial
    
    /// Stock market
    case stock
    
    /// donut chart
    case donut
    
    /// Stacked Bar Chart
    case stackedBar
}
