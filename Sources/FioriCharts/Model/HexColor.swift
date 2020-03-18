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
        if let hex = colors[colorScheme] {
            return Color(hex: hex)
        }
        
        return Color(hex: "FFFFFF")
    }
}

