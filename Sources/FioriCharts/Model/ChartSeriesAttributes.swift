//
//  ChartSeriesAttributes.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/9/20.
//

import Foundation
import SwiftUI

/// Each series has its own ChartSeriesAttributes
public class ChartSeriesAttributes: ObservableObject, Identifiable {

    /// palettes for current series
    @Published public var palette: ChartSeriesPalette
    
    /// Properties for the point rendered in current series.
    @Published public var point: ChartPointAttributes
    
    /// Line width for current series
    @Published public var lineWidth: Double
    
    /// Diameter of line caps for first value
    @Published public var firstLineCapDiameter: Double
    
    /// Diameter of line caps for last value
    @Published public var lastLineCapDiameter: Double
    
    public let id = UUID()
    
    public init(palette: ChartSeriesPalette? = nil, lineWidth: Double = 1, point: ChartPointAttributes? = nil, firstLineCapDiameter: Double = 0, lastLineCapDiameter: Double = 0) {
        //self.color = color
        
        if let palette = palette {
            self.palette = palette
        }
        else {
            self.palette = ChartSeriesPalette(colors: [])
        }
        
        self.lineWidth = lineWidth
        
        if let point = point {
            self.point = point
        } else {
            self.point = ChartPointAttributes()
        }
        
        self.firstLineCapDiameter = firstLineCapDiameter
        self.lastLineCapDiameter = lastLineCapDiameter
    }
}
