//
//  ChartLineAttributes.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/4/20.
//

import Foundation
import SwiftUI

/// Gridline properties for an Axis.
public class ChartGridlineAttributes: ObservableObject, Identifiable, NSCopying {
    public init(width: Double = 1,
                color: HexColor = Palette.hexColor(for: .primary3),
                dashPatternLength: Double = 1,
                dashPatternGap: Double = 3,
                isHidden: Bool = false) {
        self._width = Published(initialValue: CGFloat(width))
        self._color = Published(initialValue: color)
        self._dashPatternLength = Published(initialValue: CGFloat(dashPatternLength))
        self._dashPatternGap = Published(initialValue: CGFloat(dashPatternGap))
        self._isHidden = Published(initialValue: isHidden)
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        return ChartGridlineAttributes(width: Double(self.width),
                                       color: self.color,
                                       dashPatternLength: Double(self.dashPatternLength),
                                       dashPatternGap: Double(self.dashPatternGap),
                                       isHidden: self.isHidden)
    }
    
    @Published public var width: CGFloat

    @Published public var color: HexColor

    @Published public var dashPatternLength: CGFloat
    @Published public var dashPatternGap: CGFloat
    
    @Published public var isHidden: Bool
    
    public let id = UUID()
}

// Baseline properties for an Axis.
public class ChartBaselineAttributes: ChartGridlineAttributes {

    public init(width: Double = 2,
                color: HexColor = Palette.hexColor(for: .primary3),
                dashPatternLength: Double = 1,
                dashPatternGap: Double = 0,
                isHidden: Bool = false,
                value: Double? = nil,
                position: Double? = nil) {
        self._value = Published(initialValue: ChartUtility.cgfloatOptional(from: value))
        self._position = Published(initialValue: ChartUtility.cgfloatOptional(from: position))
        
        super.init(width: width, color: color, dashPatternLength: dashPatternLength, dashPatternGap: dashPatternGap, isHidden: isHidden)
    }
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        return ChartBaselineAttributes(width: Double(self.width),
                                       color: self.color,
                                       dashPatternLength: Double(self.dashPatternLength),
                                       dashPatternGap: Double(self.dashPatternGap),
                                       isHidden: self.isHidden,
                                       value: ChartUtility.doubleOptional(from: self.value),
                                       position: ChartUtility.doubleOptional(from: self.position))
    }

    /// Baseline value or nil if no data has been assigned to the Chart.
    @Published public var value: CGFloat?

    /// Baseline position or nil if no data has been assigned to the Chart.
    @Published public var position: CGFloat?
}
