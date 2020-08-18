//
//  HexColor.swift
//  FioriSwiftUICore
//
//  Created by Xu, Sheng on 6/14/20.
//

import Foundation
import SwiftUI
import UIKit

public struct HexColor: Hashable {
    /// :nodoc:
    var colors: [ColorVariant: String]
    
    /// Constructs a `HexColor` by defining a pair of hex colors to match `.light` and `.dark` background color scheme.
    ///
    /// - parameters:
    ///     - lightColor: a hex color (RGB or RGBA) for `dark` background color scheme, default is `000000`.
    ///     - darkColor: a hex color (RGB or RGBA) for `light` background color scheme, default is `FFFFFF`.
    ///     - elevatedLightColor: a hex color (RGB or RGBA) for `elevated` user interface in the `dark` background color scheme, default is `000000`.
    ///     - elevatedDarkColor: a hex color (RGB or RGBA) for `elevated` user interface in the `light` background color scheme, default is `FFFFFF`.
    ///     - contrastLightColor: a hex color (RGB or RGBA) for contrast user interface in the `light` background color scheme, default is `000000`.
    ///     - contrastDarkColor: a hex color (RGB or RGBA) for contrast user interface in the `light` background color scheme, default is `FFFFFF`.
    public init(lightColor: String? = nil, darkColor: String? = nil, elevatedLightColor: String? = nil, elevatedDarkColor: String? = nil, contrastLightColor: String? = nil, contrastDarkColor: String? = nil) {
        self.colors = [.light: "000000FF", .dark: "FFFFFFFF", .elevatedLight: "000000FF", .elevatedDark: "FFFFFFFF", .contrastLight: "000000FF", .contrastDark: "FFFFFFFF"]
        
        if let color = lightColor {
            colors[.light] = color
            colors[.dark] = color
            colors[.elevatedLight] = color
            colors[.elevatedDark] = color
            colors[.contrastLight] = color
            colors[.contrastDark] = color
        }
        
        if let color = darkColor {
            colors.updateValue(color, forKey: .dark)
            colors.updateValue(color, forKey: .elevatedDark)
            colors.updateValue(color, forKey: .contrastDark)
        }
        
        if let color = elevatedLightColor {
            colors.updateValue(color, forKey: .elevatedLight)
        }
        
        if let color = elevatedDarkColor {
            colors.updateValue(color, forKey: .elevatedDark)
        }
        
        if let color = contrastLightColor {
            colors.updateValue(color, forKey: .contrastLight)
            colors.updateValue(color, forKey: .contrastDark)
        }
        
        if let color = contrastDarkColor {
            colors.updateValue(color, forKey: .contrastDark)
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
    /// - parameters:
    ///     - colorScheme: specifies the background color scheme.  Defaults to `.light`.
    ///     - interfaceLevel: specifies the level of user interface.  Defaults to `.base`.
    /// - Returns: a tuple of RGBA values for corresponding `HexColor`.
    public func rgba(_ colorScheme: ColorScheme = .light, _ interfaceLevel: UIUserInterfaceLevel = .base, _ displayMode: ColorDisplayMode = .normal) -> (r: Double, g: Double, b: Double, a: Double) {
        let hexString = hex(colorScheme, interfaceLevel, displayMode)
        
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
    private func hex(_ colorScheme: ColorScheme = .light, _ interfaceLevel: UIUserInterfaceLevel = .base, _ displayMode: ColorDisplayMode = .normal) -> String {
        let colorVariant: ColorVariant = colorScheme == .light ? .dark : .light
        
        switch (colorVariant, interfaceLevel, displayMode) {
        case (_, .base, _):
            if let hex = colors[colorVariant] {
                return hex
            }
        case (.light, .elevated, _):
            if let hex = colors[.elevatedLight] {
                return hex
            }
        case (.dark, .elevated, _):
            if let hex = colors[.elevatedDark] {
                return hex
            }
        case (.light, _, .contrast):
            if let hex = colors[.contrastLight] {
                return hex
            }
        case (.dark, _, .contrast):
            if let hex = colors[.contrastDark] {
                return hex
            }
        default:
            return "FFFFFFFF"
        }
        
        return "FFFFFFFF"
    }
}

extension HexColor: Equatable {
    /// :nodoc:
    public static func == (lhs: HexColor, rhs: HexColor) -> Bool {
        return lhs.hex(.light) == rhs.hex(.light) &&
            lhs.hex(.dark) == rhs.hex(.dark) && lhs.hex(.light, .elevated) == rhs.hex(.light, .elevated) && lhs.hex(.dark, .elevated) == rhs.hex(.dark, .elevated) && lhs.hex(.light, .unspecified, .contrast) == rhs.hex(.light, .unspecified, .contrast) && lhs.hex(.dark, .unspecified, .contrast) == rhs.hex(.dark, .unspecified, .contrast)
    }
}

extension HexColor: CustomStringConvertible {
    /// :nodoc:
    public var description: String {
        return """
                 {"HexColor": {"base light": "\(hex(.light))", "base dark": "\(hex(.dark))",
                               "elevated light": "\(hex(.light, .elevated))",
                               "elevated dark": "\(hex(.dark, .elevated))",
                               "contrast light": "\(hex(.light, .unspecified, .contrast))",
                               "contrast dark": "\(hex(.dark, .unspecified, .contrast))",
                  }}
               """
    }
}
