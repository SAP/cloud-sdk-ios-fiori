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
    @Published public var colors: [String]
    
    /// Line width for all series rendered as lines.
    @Published public var lineWidth: Double = 1
    
    /// Properties for the points rendered in all line series.
    @Published public var points: ChartPointAttributes
    
    /// Diameter of line caps for first and last values in a line series.
    @Published public var firstLineCapDiameter: Double
    
    /// Diameter of line caps for first and last values in a line series.
    @Published public var lastLineCapDiameter: Double
    
    public let id = UUID()
    
    public init(colors: [String], lineWidth: Double = 1, points: ChartPointAttributes? = nil, firstLineCapDiameter: Double = 0, lastLineCapDiameter: Double = 0) {
        if colors.count > 0 {
            self.colors = colors
        }
        else {
            self.colors = ["5899DA"]
        }
        
        self.lineWidth = lineWidth
        
        if let points = points {
            self.points = points
        }
        else {
            self.points = ChartPointAttributes()
        }
        
        self.firstLineCapDiameter = firstLineCapDiameter
        
        self.lastLineCapDiameter = lastLineCapDiameter
    }
}
