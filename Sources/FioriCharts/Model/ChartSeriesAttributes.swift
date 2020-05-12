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
    @Published public var lineWidth: CGFloat
    
    /// Diameter of line caps for first value
    @Published public var firstLineCapDiameter: CGFloat
    
    /// Diameter of line caps for last value
    @Published public var lastLineCapDiameter: CGFloat
    
    public let id = UUID()
    
    public init(palette: ChartSeriesPalette? = nil,
                lineWidth: Double = 1,
                point: ChartPointAttributes? = nil,
                firstLineCapDiameter: Double = 0,
                lastLineCapDiameter: Double = 0) {
        if let palette = palette {
            self._palette = Published(initialValue: palette)
        } else {
            self._palette = Published(initialValue: ChartSeriesPalette(colors: []))
        }
        
        self._lineWidth = Published(initialValue: CGFloat(lineWidth))
        
        if let point = point {
            self._point = Published(initialValue: point)
        } else {
            self._point = Published(initialValue: ChartPointAttributes())
        }
        
        self._firstLineCapDiameter = Published(initialValue: CGFloat(firstLineCapDiameter))
        self._lastLineCapDiameter = Published(initialValue: CGFloat(lastLineCapDiameter))
    }
    
    // swiftlint:disable force_cast
    public func copy(with zone: NSZone? = nil) -> Any {
        return ChartSeriesAttributes(palette: (self.palette.copy() as! ChartSeriesPalette),
                                     lineWidth: Double(self.lineWidth),
                                     point: (self.point.copy() as! ChartPointAttributes),
                                     firstLineCapDiameter: Double(self.firstLineCapDiameter),
                                     lastLineCapDiameter: Double(self.lastLineCapDiameter))
    }
}

extension ChartSeriesAttributes: Equatable {
    public static func == (lhs: ChartSeriesAttributes, rhs: ChartSeriesAttributes) -> Bool {
        return lhs.palette == rhs.palette &&
            lhs.lineWidth == rhs.lineWidth &&
            lhs.point == rhs.point &&
            lhs.firstLineCapDiameter == rhs.firstLineCapDiameter &&
            lhs.lastLineCapDiameter == rhs.lastLineCapDiameter
    }
}

extension ChartSeriesAttributes: CustomStringConvertible {
    public var description: String {
        let nf = NumberFormatter()
        nf.numberStyle = .none
        nf.maximumFractionDigits = 2
        
        return """
{
    "ChartSeriesAttributes": {
        "palette": \(String(describing: palette)),
        "point": \(String(describing: point)),
        "firstLineCapDiameter": \(nf.string(from: NSNumber(value: Double(firstLineCapDiameter))) ?? "nil"),
        "lastLineCapDiameter": \(nf.string(from: NSNumber(value: Double(lastLineCapDiameter))) ?? "nil")
    }
}
"""
    }
}
