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
    
    public func color(_ colorScheme: ColorScheme = .light) -> Color {
        if let hex = colors[colorScheme] {
            return Color(hex: hex)
        }
        
        return Color(hex: "FFFFFF")
    }
}

