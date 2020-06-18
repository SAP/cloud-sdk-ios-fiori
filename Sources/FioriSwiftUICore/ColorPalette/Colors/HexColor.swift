//
//  HexColor.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/14/20.
//

import Foundation
import SwiftUI

public struct HexColor: Hashable {
    /// :nodoc:
    var colors: [ColorVariant: String]
    
    /// Constructs a `HexColor` by defining a pair of hex colors to match `.light` and `.dark` background color scheme.
    ///
    /// - parameter lightColor: a hex color (RGB or RGBA) for `.dark` background color scheme, default is `000000`.
    /// - parameter darkColor: a hex color (RGB or RGBA) for `light` background color scheme, default is `FFFFFF`.
    public init(lightColor: String? = nil, darkColor: String? = nil) {
        self.colors = [.light: "000000FF", .dark: "FFFFFFFF"]
        
        if let color = lightColor {
            colors[.light] = color
            colors[.dark] = color
        }
        
        if let color = darkColor {
            colors.updateValue(color, forKey: .dark)
        }
    }
    
    /// Returns a `Color` that matches with the specified background color scheme from `HexColor`.
    ///
    /// - parameter colorScheme: specifies the background color scheme.  Defaults to `.light`.
    /// - Returns: `Color`
    public func color(_ colorScheme: ColorScheme = .light) -> Color {
        let (r, g, b, a) = rgba(colorScheme)
        return Color(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
    
    /// Returns a RGBA values tuple that matches with the specified background color scheme from `HexColor`.
    ///
    /// - parameter colorScheme: specifies the background color scheme.  Defaults to `.light`.
    /// - Returns: a tuple of RGBA values for corresponding `HexColor`.
    public func rgba(_ colorScheme: ColorScheme = .light) -> (r: Double, g: Double, b: Double, a: Double) {
        let hexString = hex(colorScheme)
        
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (r, g, b, a) = (int >> 16, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8: // RGBA (32-bit)
            (r, g, b, a) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b, a) = (0, 0, 0, 255)
        }
        
        return (
            r: Double(r) / 255,
            g: Double(g) / 255,
            b: Double(b) / 255,
            a: Double(a) / 255)
    }
    
    /// :nodoc:
    private func hex(_ colorScheme: ColorScheme = .light) -> String {
        let colorVariant: ColorVariant = colorScheme == .light ? .dark : .light
        
        if let hex = colors[colorVariant] {
            return hex
        }
        
        return "FFFFFFFF"
    }
}

extension HexColor: Equatable {
    /// :nodoc:
    public static func == (lhs: HexColor, rhs: HexColor) -> Bool {
        return lhs.hex(.light) == rhs.hex(.light) &&
            lhs.hex(.dark) == rhs.hex(.dark)
    }
}

extension HexColor: CustomStringConvertible {
    /// :nodoc:
    public var description: String {
        return """
                 {"HexColor": {"light": "\(hex(.light))", "dark": "\(hex(.dark))"}}
               """
    }
}

extension HexColor {
    /// Specifies a style and returns the corresponding `HexColor` from the latest version of preset color palette used by `ThemeManager`.
    ///
    /// - parameter forStyle: `ColorStyle` enum from the color palette.
    /// - Returns: `HexColor`
    public static func preferredHexColor(forStyle style: ColorStyle) -> HexColor {
        return ThemeManager.shared.hexColor(for: style)
    }
}
