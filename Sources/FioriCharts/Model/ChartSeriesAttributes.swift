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
    @Published public var colors: [HexColor]
    
    /**
     Collection of palettes containing colors for all series.

     If the number of palettes is less than the number of series, then palettes will be recycled.
     */
    @Published public var palettes: [ChartSeriesPalette]
    
    /// Properties for the points rendered in all line series.
    @Published public var points: [ChartPointAttributes]
    
    /// Lines width for  series rendered as lines.
    @Published public var linesWidth: [Double]
    
    /// Diameter of line caps for first and last values in a line series.
    @Published public var firstLineCapDiameter: Double
    
    /// Diameter of line caps for first and last values in a line series.
    @Published public var lastLineCapDiameter: Double
    
    public let id = UUID()
    
    public init(colors: [HexColor], palettes: [ChartSeriesPalette]? = nil, linesWidth: [Double]?, points: [ChartPointAttributes]? = nil, firstLineCapDiameter: Double = 0, lastLineCapDiameter: Double = 0) {
        if colors.count > 0 {
            self.colors = colors
        } else {
            self.colors = [Palette.hexColor(for: .chart1)]
        }
        
        if let palettes = palettes {
            self.palettes = palettes
        } else {
            self.palettes = []
        }
        
        if let linesWidth = linesWidth {
            self.linesWidth = linesWidth
        } else {
            self.linesWidth = [1]
        }
        
        if let points = points {
            self.points = points
        } else {
            self.points = [ChartPointAttributes()]
        }
        
        self.firstLineCapDiameter = firstLineCapDiameter
        
        self.lastLineCapDiameter = lastLineCapDiameter
    }
}
