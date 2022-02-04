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
        if self.paletteVersion != version {
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
    public private(set) var palette: Palette = PaletteVersion.latest.rawValue {
        didSet {
            self.paletteVersion = PaletteVersion(rawValue: self.palette)
        }
    }
    
    internal var compatibilityMap: ColorCompatibilityMap? {
        self.paletteVersion?.compatibilityMap
    }
    
    internal var paletteVersion: PaletteVersion? = PaletteVersion.latest
    
    /// :nodoc:
    internal func hexColor(for style: ColorStyle) -> HexColor? {
        let compatibleDefinitions = self.mergedCompatibleDefinitions()
        guard !compatibleDefinitions.isEmpty else {
            return self.mergedDeprecatedDefinitions()[style]
        }
        let _style = compatibleDefinitions[style] ?? style
        return self.mergedDeprecatedDefinitions()[_style]
    }
    
    /// Merges deprecated styles till the `current` palette.
    private func mergedDeprecatedDefinitions() -> [ColorStyle: HexColor] {
        guard let paletteVersion = paletteVersion else { return [ColorStyle: HexColor]() }
        var current = paletteVersion
        var result = paletteVersion.rawValue.colorDefinitions
        var cumulative = [ColorStyle: HexColor]()
        while let previous = current.previous() {
            cumulative.merge(previous.rawValue.colorDefinitions) { curr, _ in curr }
            current = previous
        }
        result.merge(cumulative) { curr, _ in curr }
        return result
    }
    
    /// Merges new styles that are not existed in current palette till the `latest` palette.
    private func mergedCompatibleDefinitions() -> [ColorStyle: ColorStyle] {
        guard let paletteVersion = paletteVersion,
              let map = paletteVersion.compatibilityMap
        else {
            return [ColorStyle: ColorStyle]()
        }
        var current = paletteVersion
        var result = map.compatibleColorDefinitions
        var cumulative = [ColorStyle: ColorStyle]()
        while let next = current.next(), let map = next.compatibilityMap {
            cumulative.merge(map.compatibleColorDefinitions) { _, next in next }
            current = next
        }
        result.merge(cumulative) { curr, _ in curr }
        return result
    }
    
    /// :nodoc:
    internal func color(for style: ColorStyle, background scheme: BackgroundColorScheme?, interface level: InterfaceLevel?, display mode: ColorDisplayMode?) -> Color {
        let uiColor = self.uiColor(for: style, background: scheme, interface: level, display: mode)
        let color = Color(uiColor)
        return color
    }
    
    func uiColor(for style: ColorStyle, background scheme: BackgroundColorScheme?, interface level: InterfaceLevel?, display mode: ColorDisplayMode?) -> UIColor {
        guard let hc = self.hexColor(for: style) else { return UIColor() }
        let uc = UIColor { traitCollection in
            let variant: ColorVariant = hc.getVariant(traits: traitCollection, background: scheme, interface: level, display: mode)
            let hexColorString: String = hc.hex(variant)
            let components = hc.rgba(hexColorString)
            return UIColor(red: CGFloat(components.r), green: CGFloat(components.g),
                           blue: CGFloat(components.b), alpha: CGFloat(components.a))
        }
        return uc
    }
}
