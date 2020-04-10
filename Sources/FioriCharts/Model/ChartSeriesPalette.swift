//
//  ChartSeriesPalette.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 4/2/20.
//

import Foundation

public class ChartSeriesPalette: ObservableObject, Identifiable {
    
    public init(colors: [HexColor],
                labelColor: HexColor,
                positiveMaxColor: HexColor,
                positiveMinColor: HexColor,
                negativeMaxColor: HexColor,
                negativeMinColor: HexColor) {
        if colors.count > 0 {
            self._colors = Published(initialValue: colors)
        }
        else {
            self._colors = Published(initialValue: [Palette.hexColor(for: .primary1)])
        }
        
        self._labelColor = Published(initialValue: labelColor)
        self._positiveMaxColor = Published(initialValue: positiveMaxColor)
        self._positiveMinColor = Published(initialValue: positiveMinColor)
        self._negativeMaxColor = Published(initialValue: negativeMaxColor)
        self._negativeMinColor = Published(initialValue: negativeMinColor)
    }

    public convenience init(colors: [HexColor], labelColor: HexColor) {
        self.init(colors: colors, labelColor: labelColor, positiveMaxColor: labelColor, positiveMinColor: labelColor, negativeMaxColor: labelColor, negativeMinColor: labelColor)
    }
    
    public convenience init(colors: [HexColor]) {
        let color = colors.first ?? Palette.hexColor(for: .primary1)
        
        self.init(colors: colors, labelColor: color, positiveMaxColor: color, positiveMinColor: color, negativeMaxColor: color, negativeMinColor: color)
    }

    /// Primary color of the series. Used to render the series' lines.
    /// One color only for charts except stock requires multiple colors
    @Published public var colors: [HexColor]

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
