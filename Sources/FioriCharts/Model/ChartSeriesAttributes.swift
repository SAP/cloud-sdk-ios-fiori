//
//  ChartSeriesAttributes.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/9/20.
//

import Foundation
import SwiftUI

/// Each series has its own ChartSeriesAttributes
public class ChartSeriesAttributes: ObservableObject, Identifiable, NSCopying {
    
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
    
    public init(palette: ChartSeriesPalette? = nil,
                lineWidth: Double = 1,
                point: ChartPointAttributes? = nil,
                firstLineCapDiameter: Double = 0,
                lastLineCapDiameter: Double = 0) {
        if let palette = palette {
            self._palette = Published(initialValue: palette)
        }
        else {
            self._palette = Published(initialValue: ChartSeriesPalette(colors: []))
        }
        
        self._lineWidth = Published(initialValue: lineWidth)
        
        if let point = point {
            self._point = Published(initialValue: point)
        } else {
            self._point = Published(initialValue: ChartPointAttributes())
        }
        
        self._firstLineCapDiameter = Published(initialValue: firstLineCapDiameter)
        self._lastLineCapDiameter = Published(initialValue: lastLineCapDiameter)
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return ChartSeriesAttributes(palette: (self.palette.copy() as! ChartSeriesPalette),
                                     lineWidth: self.lineWidth,
                                     point: (self.point.copy() as! ChartPointAttributes),
                                     firstLineCapDiameter: self.firstLineCapDiameter,
                                     lastLineCapDiameter: self.lastLineCapDiameter)
    }
}
