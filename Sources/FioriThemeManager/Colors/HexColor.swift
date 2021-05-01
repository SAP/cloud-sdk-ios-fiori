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
            self.colors[.light] = color
            self.colors[.dark] = color
            self.colors[.elevatedLight] = color
            self.colors[.elevatedDark] = color
            self.colors[.contrastLight] = color
            self.colors[.contrastDark] = color
        }
        
        if let color = darkColor {
            self.colors.updateValue(color, forKey: .dark)
            self.colors.updateValue(color, forKey: .elevatedDark)
            self.colors.updateValue(color, forKey: .contrastDark)
        }
        
        if let color = elevatedLightColor {
            self.colors.updateValue(color, forKey: .elevatedLight)
        }
        
        if let color = elevatedDarkColor {
            self.colors.updateValue(color, forKey: .elevatedDark)
        }
        
        if let color = contrastLightColor {
            self.colors.updateValue(color, forKey: .contrastLight)
            self.colors.updateValue(color, forKey: .contrastDark)
        }
        
        if let color = contrastDarkColor {
            self.colors.updateValue(color, forKey: .contrastDark)
        }
    }
    
    /// Returns a RGBA values tuple that matches with the specified hex color string.
    ///
    /// - parameters:
    ///     - hexString: specifies the hex color string.
    /// - Returns: a tuple of RGBA values for corresponding `HexColor`.
    public func rgba(_ hexString: String) -> (r: Double, g: Double, b: Double, a: Double) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (r, g, b, a) = (int >> 16, int >> 8 & 0xff, int & 0xff, 255)
        case 8: // RGBA (32-bit)
            (r, g, b, a) = (int >> 24, int >> 16 & 0xff, int >> 8 & 0xff, int & 0xff)
        default:
            (r, g, b, a) = (0, 0, 0, 255)
        }
        
        return (
            r: Double(r) / 255,
            g: Double(g) / 255,
            b: Double(b) / 255,
            a: Double(a) / 255
        )
    }
    
    /// Returns the string value that matches with the specified color variant from `HexColor`.
    ///
    /// - parameters:
    ///     - variant: specifies the color variant.
    /// - Returns: the string value for corresponding `HexColor` with specific color variant.
    public func hex(_ variant: ColorVariant) -> String {
        self.colors[variant] ?? "FFFFFFFF"
    }
    
    /// Returns the `ColorVariant` that matches with the specified combination of background color scheme, user interface level and display mode settings.
    ///
    /// - parameters:
    ///     - background: specifies the background color scheme, default is `.device`.
    ///     - interface: specifies the user interface level, default is `.device`.
    ///     - display: specifies the display mode, default is `.normal`.
    /// - Returns: the string value for corresponding `HexColor` with specific color variant.
    public func getVariant(traits collection: UITraitCollection, background scheme: BackgroundColorScheme? = .device, interface level: InterfaceLevel? = .device, display mode: ColorDisplayMode? = .normal) -> ColorVariant {
        var variant = ColorVariant.dark
        let isDarkInterfaceStyle = collection.userInterfaceStyle == .dark
        let style: UIUserInterfaceStyle = {
            switch (scheme ?? .device, isDarkInterfaceStyle) {
            case (.lightConstant, _), (.deviceInverse, true), (.device, false):
                return .light
            case (.darkConstant, _), (.deviceInverse, false), (.device, true):
                return .dark
            }
        }()
        let isElevatedInterfaceLevel = collection.userInterfaceLevel == .elevated
        let level: UIUserInterfaceLevel = {
            switch (level ?? .device, isElevatedInterfaceLevel) {
            case (.baseConstant, _), (.deviceInverse, true), (.device, false):
                return .base
            case (.elevatedConstant, _), (.deviceInverse, false), (.device, true):
                return .elevated
            }
        }()
        switch (style, level, mode) {
        case (.light, .base, .normal):
            variant = .dark
        case (.dark, .base, .normal):
            variant = .light
        case (.light, .elevated, .normal):
            variant = .elevatedDark
        case (.dark, .elevated, .normal):
            variant = .elevatedLight
        case (.light, _, .contrast):
            variant = .contrastDark
        case (.dark, _, .contrast):
            variant = .contrastLight
        default:
            break
        }
        return variant
    }
}

extension HexColor: Equatable {
    /// :nodoc:
    public static func == (lhs: HexColor, rhs: HexColor) -> Bool {
        lhs.hex(.light) == rhs.hex(.light) &&
            lhs.hex(.dark) == rhs.hex(.dark) && lhs.hex(.elevatedLight) == rhs.hex(.elevatedLight) && lhs.hex(.elevatedDark) == rhs.hex(.elevatedDark) && lhs.hex(.contrastLight) == rhs.hex(.contrastLight) && lhs.hex(.contrastDark) == rhs.hex(.contrastDark)
    }
}

extension HexColor: CustomStringConvertible {
    /// :nodoc:
    public var description: String {
        """
          {"HexColor": {"base light": "\(self.hex(.light))", "base dark": "\(self.hex(.dark))",
                        "elevated light": "\(self.hex(.elevatedLight))",
                        "elevated dark": "\(self.hex(.elevatedDark))",
                        "contrast light": "\(self.hex(.contrastLight))",
                        "contrast dark": "\(self.hex(.contrastDark))",
           }}
        """
    }
}
