//
//  Color+Extension.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/17/20.
//

import Foundation
import SwiftUI
import UIKit

extension Color {
    /// Extension to `Color`, to return colors from the latest version of preset color palette used by `ThemeManager`.
    ///
    /// - parameter style: `ColorStyle` enum from the color palette.
    /// - parameter scheme: specifies whether the color should be used in front of a *light* background, or a *dark* background.  E.g. a "white" background is a "light" background.  A "dark blue" background is a "dark" background.  Defaults to `.device`.
    /// - Returns: a dynamic color provider wrapped in `Color`
    public static func preferredColor(_ style: ColorStyle, background scheme: BackgroundColorScheme? = .device) -> Color {
        return ThemeManager.shared.color(for: style, background: scheme)
    }
    
    public func resolvedColor(with scheme: ColorScheme) -> Color {
        let traits: UITraitCollection = scheme == .light ? .init(userInterfaceStyle: .light) : .init(userInterfaceStyle: .dark)
        return Color(self.uiColor().resolvedColor(with: traits))
    }
}

extension Color {
    public func uiColor() -> UIColor {
        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}
