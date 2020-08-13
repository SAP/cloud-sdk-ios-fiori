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
    public init(lightColor: String? = nil, darkColor: String? = nil, elevatedLightColor: String? = nil, elevatedDarkColor: String? = nil) {
        self.colors = [.light: "000000FF", .dark: "FFFFFFFF", .elevatedLight: "000000FF", .elevatedDark: "FFFFFFFF"]
        
        if let color = lightColor {
            colors[.light] = color
            colors[.dark] = color
            colors[.elevatedLight] = color
            colors[.elevatedDark] = color
        }
        
        if let color = darkColor {
            colors.updateValue(color, forKey: .dark)
            colors.updateValue(color, forKey: .elevatedDark)
        }
        
        if let color = elevatedLightColor {
            colors.updateValue(color, forKey: .elevatedLight)
        }
        
        if let color = elevatedDarkColor {
            colors.updateValue(color, forKey: .elevatedDark)
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
    public func rgba(_ colorScheme: ColorScheme = .light, _ interfaceLevel: UIUserInterfaceLevel = .base) -> (r: Double, g: Double, b: Double, a: Double) {
        let hexString = hex(colorScheme, interfaceLevel)
        
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
    private func hex(_ colorScheme: ColorScheme = .light, _ interfaceLevel: UIUserInterfaceLevel = .base) -> String {
        let colorVariant: ColorVariant = colorScheme == .light ? .dark : .light
        
        switch (colorVariant, interfaceLevel) {
        case (_, .base):
            if let hex = colors[colorVariant] {
                return hex
            }
        case (.light, .elevated):
            if let hex = colors[.elevatedLight] {
                return hex
            }
        case (.dark, .elevated):
            if let hex = colors[.elevatedDark] {
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
            lhs.hex(.dark) == rhs.hex(.dark) && lhs.hex(.light, .elevated) == rhs.hex(.light, .elevated) && lhs.hex(.dark, .elevated) == rhs.hex(.dark, .elevated)
    }
}

extension HexColor: CustomStringConvertible {
    /// :nodoc:
    public var description: String {
        return """
                 {"HexColor": {"base light": "\(hex(.light))", "base dark": "\(hex(.dark))",
                               "elevated light": "\(hex(.light, .elevated))",
                               "elevated dark": "\(hex(.dark, .elevated))"}}
               """
    }
}
