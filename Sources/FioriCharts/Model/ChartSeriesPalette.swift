//
//  ChartSeriesPalette.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 4/2/20.
//

import Foundation

public class ChartSeriesPalette: ObservableObject, Identifiable {
    
    public init(color: HexColor, labelColor: HexColor, positiveMaxColor: HexColor, positiveMinColor: HexColor, negativeMaxColor: HexColor, negativeMinColor: HexColor) {
        self.color = color
        self.labelColor = labelColor
        self.positiveMaxColor = positiveMaxColor
        self.positiveMinColor = positiveMinColor
        self.negativeMaxColor = negativeMaxColor
        self.negativeMinColor = negativeMinColor
    }

    public convenience init(color: HexColor, labelColor: HexColor) {
        self.init(color: color, labelColor: labelColor, positiveMaxColor: labelColor, positiveMinColor: labelColor, negativeMaxColor: labelColor, negativeMinColor: labelColor)
    }
    
    public convenience init(color: HexColor) {
        self.init(color: color, labelColor: color, positiveMaxColor: color, positiveMinColor: color, negativeMaxColor: color, negativeMinColor: color)
    }

    /// Primary color of the series. Used to render the series' lines.
    @Published public var color: HexColor

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
