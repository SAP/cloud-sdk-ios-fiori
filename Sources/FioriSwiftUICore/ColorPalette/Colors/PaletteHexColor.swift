//
//  PaletteHexColor.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 9/3/20.
//

import Foundation
import SwiftUI

/// A struct for representing the color in hexadecimal.
@available(*, deprecated, message: "Please use `HexColor` instead")
public struct PaletteHexColor {
    /// String for representing the color.
    public let string: String
    /// Alpha value for the color.
    public let alpha: CGFloat
    
    /// :nodoc:
    public init(string: String, alpha: CGFloat? = 1.0) {
        self.string = string
        self.alpha = alpha ?? 1.0
    }
    
    /// Return the correct color in `UIColor`.
    public func color() -> UIColor {
        guard !string.isEmpty else { return UIColor.clear }
        let components = HexColor().rgba(string)
        return UIColor(red: CGFloat(components.r), green: CGFloat(components.g),
                       blue: CGFloat(components.b), alpha: CGFloat(components.a))
    }
}
