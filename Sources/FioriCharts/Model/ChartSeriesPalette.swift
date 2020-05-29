//
//  ChartSeriesPalette.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 4/2/20.
//

import Foundation

public class ChartSeriesPalette: ObservableObject, Identifiable, NSCopying {
    
    public init(colors: [HexColor],
                fillColor: HexColor,
                labelColor: HexColor,
                positiveMaxColor: HexColor,
                positiveMinColor: HexColor,
                negativeMaxColor: HexColor,
                negativeMinColor: HexColor) {
        if colors.isEmpty {
            self._colors = Published(initialValue: [Palette.hexColor(for: .primary1)])
        } else {
            self._colors = Published(initialValue: colors)
        }
        
        self._fillColor = Published(initialValue: fillColor)
        self._labelColor = Published(initialValue: labelColor)
        self._positiveMaxColor = Published(initialValue: positiveMaxColor)
        self._positiveMinColor = Published(initialValue: positiveMinColor)
        self._negativeMaxColor = Published(initialValue: negativeMaxColor)
        self._negativeMinColor = Published(initialValue: negativeMinColor)
    }

    public convenience init(colors: [HexColor], labelColor: HexColor) {
        let color = colors.first ?? Palette.hexColor(for: .primary1)
        
        self.init(colors: colors, fillColor: color, labelColor: labelColor, positiveMaxColor: labelColor, positiveMinColor: labelColor, negativeMaxColor: labelColor, negativeMinColor: labelColor)
    }
    
    public convenience init(colors: [HexColor], fillColor: HexColor) {
        let color = colors.first ?? Palette.hexColor(for: .primary1)
        
        self.init(colors: colors, fillColor: fillColor, labelColor: color, positiveMaxColor: color, positiveMinColor: color, negativeMaxColor: color, negativeMinColor: color)
    }
    
    public convenience init(colors: [HexColor]) {
        let color = colors.first ?? Palette.hexColor(for: .primary1)
        
        self.init(colors: colors, fillColor: color, labelColor: color, positiveMaxColor: color, positiveMinColor: color, negativeMaxColor: color, negativeMinColor: color)
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return ChartSeriesPalette(colors: self.colors,
                                  fillColor: self.fillColor,
                                  labelColor: self.labelColor,
                                  positiveMaxColor: self.positiveMaxColor,
                                  positiveMinColor: self.positiveMinColor,
                                  negativeMaxColor: self.negativeMaxColor,
                                  negativeMinColor: self.negativeMinColor)
    }

    /// Primary color of the series. Used to render the series' lines.
    /// One color only for charts except stock requires multiple colors
    @Published public var colors: [HexColor]

    /// Color used to render fill area or range selection for the series.
    @Published public var fillColor: HexColor
    
    /// Color used to render labels for the series.
    @Published public var labelColor: HexColor

    /// Color of the maximum positive value (furthest from the zero baseline).
    @Published public var positiveMaxColor: HexColor

    /// Color of the minimum positive value (closest to the zero baseline).
    @Published public var positiveMinColor: HexColor

    /// Color of the maximum negative value (closest to the zero baseline).
    @Published public var negativeMaxColor: HexColor

    /// Color of the minimum positive value (furthest from the zero baseline).
    @Published public var negativeMinColor: HexColor
    
    public let id = UUID()
}

extension ChartSeriesPalette: Equatable {
    public static func == (lhs: ChartSeriesPalette, rhs: ChartSeriesPalette) -> Bool {
        return lhs.colors == rhs.colors &&
            lhs.fillColor == rhs.fillColor &&
            lhs.labelColor == rhs.labelColor &&
            lhs.positiveMaxColor == rhs.positiveMaxColor &&
            lhs.positiveMinColor == rhs.positiveMinColor &&
            lhs.negativeMaxColor == rhs.negativeMaxColor &&
            lhs.negativeMinColor == rhs.negativeMinColor
    }
}

extension ChartSeriesPalette: CustomStringConvertible {
    public var description: String {
        return """
{
    "ChartSeriesPalette": {
        "colors": \(String(describing: colors)),
        "fillColor": \(String(describing: fillColor)),
        "labelColor": \(String(describing: labelColor)),
        "positiveMaxColor": \(String(describing: positiveMaxColor)),
        "positiveMinColor": \(String(describing: positiveMinColor)),
        "negativeMaxColor": \(String(describing: negativeMaxColor)),
        "negativeMinColor": \(String(describing: negativeMinColor))
    }
}
"""
    }
}
