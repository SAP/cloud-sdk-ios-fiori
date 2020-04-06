//
//  File.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/16/20.
//

import Foundation
import SwiftUI

public struct HexColor: Hashable {
    var colors: [ColorScheme: String]
    
    /*
     Constructs a HexColor from a lightColor and darkColor
     
     - parameter:
     - lightColor: a hex color (RGB or RGBA) for .light mode, default is "000000"
     - darkColor: a hex color (RGB or RGBA) for .dark mode, default is "FFFFFF"
     */
    public init(lightColor: String? = nil, darkColor: String? = nil) {
        self.colors = [.light: "000000", .dark: "FFFFFF"]
        
        if let color = lightColor {
            colors[.light] = color
        }
        
        if let color = darkColor {
            colors[.dark] = color
        }
    }
    
    public func color(_ colorScheme: ColorScheme = .light) -> Color {
        let (r, g, b, a) = rgba(colorScheme)
        
        return Color(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
    
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
            b:  Double(b) / 255,
            a: Double(a) / 255)
    }
    
    private func hex(_ colorScheme: ColorScheme = .light) -> String {
        if let hex = colors[colorScheme] {
            return hex
        }
        
        return "FFFFFF"
    }
}
