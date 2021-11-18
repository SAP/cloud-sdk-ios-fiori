import FioriThemeManager
import Foundation
import SwiftUI

public class ChartSeriesPalette: ObservableObject, Identifiable, NSCopying {
    public init(colors: [Color],
                fillColor: Color? = nil,
                labelColor: Color,
                positiveMaxColor: Color,
                positiveMinColor: Color,
                negativeMaxColor: Color,
                negativeMinColor: Color)
    {
        if colors.isEmpty {
            self._colors = Published(initialValue: [.preferredColor(.primaryLabel)])
        } else {
            self._colors = Published(initialValue: colors)
        }
        
        self.__fillColor = Published(initialValue: fillColor)
        self._labelColor = Published(initialValue: labelColor)
        self._positiveMaxColor = Published(initialValue: positiveMaxColor)
        self._positiveMinColor = Published(initialValue: positiveMinColor)
        self._negativeMaxColor = Published(initialValue: negativeMaxColor)
        self._negativeMinColor = Published(initialValue: negativeMinColor)
    }

    public convenience init(colors: [Color], labelColor: Color) {
        self.init(colors: colors, fillColor: nil, labelColor: labelColor, positiveMaxColor: labelColor, positiveMinColor: labelColor, negativeMaxColor: labelColor, negativeMinColor: labelColor)
    }
    
    public convenience init(colors: [Color], fillColor: Color) {
        let color = colors.first ?? .preferredColor(.primaryLabel)
        
        self.init(colors: colors, fillColor: fillColor, labelColor: color, positiveMaxColor: color, positiveMinColor: color, negativeMaxColor: color, negativeMinColor: color)
    }
    
    public convenience init(colors: [Color]) {
        let color = colors.first ?? .preferredColor(.primaryLabel)
        
        self.init(colors: colors, fillColor: nil, labelColor: color, positiveMaxColor: color, positiveMinColor: color, negativeMaxColor: color, negativeMinColor: color)
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        ChartSeriesPalette(colors: self.colors,
                           fillColor: self._fillColor,
                           labelColor: self.labelColor,
                           positiveMaxColor: self.positiveMaxColor,
                           positiveMinColor: self.positiveMinColor,
                           negativeMaxColor: self.negativeMaxColor,
                           negativeMinColor: self.negativeMinColor)
    }

    /// Primary color of the series. Used to render the series' lines.
    /// One color only for charts except stock requires multiple colors
    @Published public var colors: [Color]

    @Published var _fillColor: Color?
    
    /// Color used to render fill area or range selection for the series.
    public var fillColor: Color {
        get {
            if let color = _fillColor {
                return color
            } else {
                if let color = colors.first {
                    return color
                } else {
                    return .preferredColor(.primaryLabel)
                }
            }
        }
        
        set {
            self._fillColor = newValue
        }
    }
    
    /// Color used to render labels for the series.
    @Published public var labelColor: Color

    /// Color of the maximum positive value (furthest from the zero baseline).
    @Published public var positiveMaxColor: Color

    /// Color of the minimum positive value (closest to the zero baseline).
    @Published public var positiveMinColor: Color

    /// Color of the maximum negative value (closest to the zero baseline).
    @Published public var negativeMaxColor: Color

    /// Color of the minimum positive value (furthest from the zero baseline).
    @Published public var negativeMinColor: Color
    
    public let id = UUID()
}

extension ChartSeriesPalette: Equatable {
    public static func == (lhs: ChartSeriesPalette, rhs: ChartSeriesPalette) -> Bool {
        lhs.colors == rhs.colors &&
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
        """
        {
            "ChartSeriesPalette": {
                "colors": \(String(describing: self.colors)),
                "fillColor": \(String(describing: self._fillColor)),
                "labelColor": \(String(describing: self.labelColor)),
                "positiveMaxColor": \(String(describing: self.positiveMaxColor)),
                "positiveMinColor": \(String(describing: self.positiveMinColor)),
                "negativeMaxColor": \(String(describing: self.negativeMaxColor)),
                "negativeMinColor": \(String(describing: self.negativeMinColor))
            }
        }
        """
    }
}
