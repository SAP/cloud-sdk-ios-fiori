//
//  ChartSeriesAttributes.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/9/20.
//

import Foundation
import SwiftUI

public class ChartSeriesAttributes: ObservableObject, Identifiable {
    /**
     Colors used to render the series.

     Colors will be reused when fewer colors are provided than the number of series.

     ```
     let colorIndex = seriesIndex % colors.count
     ```
     */
    @Published public var colors: [Color]?
    
    /// Line width for all series rendered as lines.
    @Published public var lineWidth: Double = 1
    
    /// Properties for the points rendered in all line series.
    @Published public var points: ChartPointAttributes?
    
    /// Diameter of line caps for first and last values in a line series.
    @Published public var lineCapDiameters: (Double, Double)?
    
    public let id = UUID()
}
