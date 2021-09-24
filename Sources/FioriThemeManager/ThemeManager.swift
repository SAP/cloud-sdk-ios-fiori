import Foundation
import SwiftUI
import UIKit

public class ThemeManager {
    /// Singleton instance shared by all application components.
    public static let shared = ThemeManager()
    
    private init() {}
    
    /// Method to allow selecting a specific version of the palette.  Defaults to `latest`.
    ///
    /// - Parameter version: Major version of the color palette.
    public func setPaletteVersion(_ version: PaletteVersion) {
        if self.palette != version.rawValue {
            self.palette = version.rawValue
        }
    }
    
    /// Method to allow supplying a complete custom palette implementation.
    /// - note: It is more typical to use `setColor(...)`, or `setHexColor(...)` to override specific palette values than to provide a full implementation.
    ///
    /// - Parameter palette: Complete palette implementation. Should include definitions for all consumed `ColorStyle` types.
    public func setPalette(_ palette: Palette) {
        self.palette = palette
    }
    
    /// Accessor to current palette.
    /// - note: It is unusual to need to read from the palette directly; generally, use the `UIColor.preferredFioriColor(...)` API.
    public private(set) var palette: Palette = PaletteVersion.latest.rawValue
    
    /// :nodoc:
    internal func hexColor(for style: ColorStyle) -> HexColor {
        self.palette.hexColor(for: style)
    }
    
    /// :nodoc:
    internal func color(for style: ColorStyle, background scheme: BackgroundColorScheme?, interface level: InterfaceLevel?, display mode: ColorDisplayMode?) -> Color {
        let uiColor = self.uiColor(for: style, background: scheme, interface: level, display: mode)
        let color = Color(uiColor)
        return color
    }
    
    func uiColor(for style: ColorStyle, background scheme: BackgroundColorScheme?, interface level: InterfaceLevel?, display mode: ColorDisplayMode?) -> UIColor {
        let hexColor: HexColor = self.palette.hexColor(for: style)
        let uiColor = UIColor { traitCollection in
            let variant: ColorVariant = hexColor.getVariant(traits: traitCollection, background: scheme, interface: level, display: mode)
            let hexColorString: String = hexColor.hex(variant)
            let components = hexColor.rgba(hexColorString)
            return UIColor(red: CGFloat(components.r), green: CGFloat(components.g),
                           blue: CGFloat(components.b), alpha: CGFloat(components.a))
        }
        return uiColor
    }
}
