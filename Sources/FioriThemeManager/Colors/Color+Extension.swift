import Foundation
import SwiftUI
import UIKit

public extension Color {
    /// Extension to `Color`, to return colors from the latest version of preset color palette used by `ThemeManager`.
    ///
    /// - parameters:
    ///     - style: `ColorStyle` enum from the color palette.
    ///     - scheme: specifies whether the color should be used in front of a *light* background, or a *dark* background.  E.g. a "white" background is a "light" background.  A "dark blue" background is a "dark" background.  Defaults to `.device`.
    ///     - level: specifies whether the color sould be used in the *base* or *elevated* level of the interface. E.g. alerts and popovers will be assigned with the *elevated* interface level. Defaults to `.device`.
    /// - Returns: a dynamic color provider wrapped in `Color`
    static func preferredColor(_ style: ColorStyle, background scheme: BackgroundColorScheme? = .device, interface level: InterfaceLevel? = .device, display mode: ColorDisplayMode? = .device) -> Color {
        ThemeManager.shared.color(for: style, background: scheme, interface: level, display: mode)
    }
    
    /// Extension to `Color`, to resolve a static form of `Color` from the wrapped dynamic color provider.
    ///
    /// - parameters:
    ///     - scheme: specifies whether the color should be used in front of a *light* background, or a *dark* background. Defaults to `.light`.
    ///     - level: specifies whether the color sould be used in the *base* or *elevated* level of the interface. Defaults to `.base`.
    /// - Returns: a static form of `Color`resolved from the dynamic color provider.
    func resolvedColor(with scheme: ColorScheme? = .light, in level: UIUserInterfaceLevel? = .base) -> Color {
        let style: UITraitCollection = scheme == .light ? .init(userInterfaceStyle: .light) : .init(userInterfaceStyle: .dark)
        let level: UITraitCollection = .init(userInterfaceLevel: level ?? .base)
        return Color(self.uiColor().resolvedColor(with: .init(traitsFrom: [style, level])))
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

extension Color {
    // Returns a dynamic color.
    static func preferredUIColor(_ style: ColorStyle, background scheme: BackgroundColorScheme? = .device, interface level: InterfaceLevel? = .device, display mode: ColorDisplayMode? = .device) -> UIColor {
        ThemeManager.shared.uiColor(for: style, background: scheme, interface: level, display: mode)
    }
}

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xff0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00ff00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000ff) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xff000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00ff0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000ff00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000ff) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, opacity: a)
    }
    
    func toHex() -> String? {
        let uic = UIColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        if a != Float(1.0) {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}
