import Foundation
import SwiftUI
import UIKit

/**
 Manager class which supplies color palette values to Fiori components, and the `Color.preferredColor(_:background:interface:display:)` API.
 
 Changes made to the manager affect all future calls to `Color.preferredColor(_:background:interface:display:)`. Most components do not reload dynamically, so calls to the `ThemeManager` should happen at the beginning of the application lifecycle.
 
 - note: `AppDelegate.didFinishLaunching(withOptions...)` is the recommended location.
 
 **Example Usage**
 
 ```swift
 // Pin palette version used by application to a specific version (defaults to `.latest`)
 ThemeManager.shared.setPaletteVersion(.v7)
 
 // Override some color definitions to match your application palette
 ThemeManager.shared.setColor(.darkGray, for: .primary2, background: .light)
 ThemeManager.shared.setHexColor("1b931d", for: .positive, background: .light)
 */
public class ThemeManager {
    /// Singleton instance shared by all application components.
    public static let shared = ThemeManager()
    
    private init() {}
    
    /// Method to allow selecting a specific version of the palette.  Defaults to `latest`.
    ///
    /// - Parameter version: Major version of the color palette.
    public func setPaletteVersion(_ version: PaletteVersion) {
        if self.paletteVersion != version {
            self.palette = version.palette
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
    /// - note: It is unusual to need to read from the palette directly; generally, use the `Color.preferredColor(...)` API.
    public private(set) var palette: Palette = PaletteVersion.latest.palette {
        didSet {
            self.paletteVersion = PaletteVersion(palette: self.palette)
        }
    }
    
    /// Method to supply a custom definition for a particular `ColorStyle`. Will be applied to `.light` background color scheme.
    ///
    /// - Parameters:
    ///   - color: Color definition to override the base definition in the palette.
    ///   - style: Reference of `ColorStyle` to which color is bound.
    public func setColor(_ color: Color, for style: ColorStyle) {
        self.setColor(color, for: style, variant: .light)
    }
    
    /// Method to supply a custom definition for a particular `ColorStyle` and `ColorVariant` combination.
    /// - note:  A `nil` value for `background` will default to `.light`.
    ///
    /// - Parameters:
    ///   - color: Color definition to override the base definition in the palette.
    ///   - style: Reference of `ColorStyle` to which color is bound.
    ///   - variant: Reference of `ColorVariant` to which color is bound.  Defaults to `.light`. If no value is supplied for `.dark`, the value for `.light` will be read as a fallback.
    public func setColor(_ color: Color, for style: ColorStyle, variant: ColorVariant?) {
        self.developerOverrides[style, default: [:]].updateValue(color, forKey: variant ?? .light)
    }
    
    /// Method to supply a custom definition for a particular `ColorStyle`. Will applied to `.light` background color scheme.
    ///
    /// - Parameters:
    ///   - hex: Color definition as hexidecimal string to override the base definition in the palette.
    ///   - style: Reference of `ColorStyle` to which color is bound.
    public func setHexColor(_ hex: String, for style: ColorStyle) {
        self.setHexColor(hex, for: style, variant: .light)
    }
    
    /// Method to supply a custom definition for a particular `ColorStyle` and `ColorVariant` combination.
    ///
    /// - Parameters:
    ///   - hex: Color definition as hexidecimal string to override the base definition in the palette.
    ///   - style: Reference of `ColorStyle` to which color is bound.
    ///   - variant: Reference of `ColorVariant` to which color is bound.  Defaults to `.light`. If no value is supplied for `.dark`, the value for `.light` will be read as a fallback.
    public func setHexColor(_ hex: String, for style: ColorStyle, variant: ColorVariant) {
        guard let color = Color(hex: hex) else { return }
        self.setColor(color, for: style, variant: variant)
    }
    
    /// Helper method, to clear any override colors set via `setColor(...)` or `setHexColor(...)`. Does not affect the base definition of the current palette.
    public func reset() {
        self.developerOverrides.removeAll()
        self.styleSheetOverrides.removeAll()
    }
    
    internal var compatibilityMap: ColorCompatibilityMap? {
        self.paletteVersion?.compatibilityMap
    }
    
    internal var paletteVersion: PaletteVersion? = PaletteVersion.latest
    
    internal private(set) var developerOverrides: [ColorStyle: [ColorVariant: Color]] = [:]
    internal private(set) var styleSheetOverrides: [ColorStyle: [ColorVariant: Color]] = [:]
    
    /// :nodoc:
    internal func hexColor(for style: ColorStyle) -> HexColor? {
        switch self.paletteVersion {
        #if !os(watchOS)
            case .v3_x, .v3_2, .v4, .v5, .v6, .v7, .v8:
                let compatibleDefinitions = self.mergedCompatibleDefinitions()
                guard !compatibleDefinitions.isEmpty else {
                    return self.mergedDeprecatedDefinitions()[style]
                }
                let _style = compatibleDefinitions[style] ?? style
                return self.mergedDeprecatedDefinitions()[_style]
        #else
            case .v1:
                let compatibleDefinitions = self.mergedCompatibleDefinitions()
                guard !compatibleDefinitions.isEmpty else {
                    return self.mergedDeprecatedDefinitions()[style]
                }
                let _style = compatibleDefinitions[style] ?? style
                return self.mergedDeprecatedDefinitions()[_style]
        #endif
        default:
            return self.palette.hexColor(for: style)
        }
    }
    
    /// Merges deprecated styles till the `current` palette.
    private func mergedDeprecatedDefinitions() -> [ColorStyle: HexColor] {
        guard let paletteVersion = paletteVersion else { return self.palette.colorDefinitions }
        var current = paletteVersion
        var result = paletteVersion.palette.colorDefinitions
        var cumulative = [ColorStyle: HexColor]()
        while let previous = current.previous() {
            cumulative.merge(previous.palette.colorDefinitions) { curr, _ in curr }
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
        guard let hc = self.hexColor(for: style) else { return .clear }
        #if os(iOS)
            let uc = UIColor { [weak self] traitCollection in
                guard let self = self else { return .clear }
                guard let hexColor = self.hexColor(for: style) else { return .clear }
                let variant = hexColor.getVariant(traits: traitCollection, background: scheme, interface: level, display: mode)
                return self.color(for: style, hexColor: hc, variant: variant)?.uiColor() ?? .clear
            }
            return uc
        #else
            let variant = hc.getVariant(background: scheme, interface: level, display: mode)
            return self.color(for: style, hexColor: hc, variant: variant)?.uiColor() ?? .clear
        #endif
    }
    
    func color(for style: ColorStyle, hexColor: HexColor, variant: ColorVariant) -> Color? {
        let hexColorString: String = hexColor.hex(variant)

        if let ssOverrideColor = self.styleSheetOverrides[style, default: [:]][variant] {
            return ssOverrideColor
        }

        if let ssHexColor = self.nssHexColor(for: style, with: variant) {
            if let ssColor: Color = StyleSheetConverter.toColor(value: ssHexColor) {
                self.styleSheetOverrides[style, default: [:]].updateValue(ssColor, forKey: variant)
                return ssColor
            }
        }

        if let devOverrideColor = self.developerOverrides[style, default: [:]][variant] {
            return devOverrideColor
        }

        return Color(hex: hexColorString)
    }
    
    func nssHexColor(for style: ColorStyle, with variant: ColorVariant) -> String? {
        var developerOverriddenColors = [String: String]()
        
        // Get the developer defined color definitions from the .nss file
        developerOverriddenColors = StyleSheetSettings.shared.globalDefinitions // NUISettings.getInstance()._globalDefinitions
        
        // In .nss file color is defined using background scheme, so check for inversed color variant
        if !StyleSheetSettings.shared.globalDefinitions.isEmpty {
            // The keys in the .nss file are of the format style_scheme (for example, primary1_darkBackground) or just style (for example, "primary1)
            // convert the enums into a string to search for the corresponding key-value pairs in the dictionary retreived from the NUISettings.
            let keyStringForStyle = String(describing: style) // for example,"primary1"
            let keyStringForScheme: String = {
                switch variant {
                case .dark:
                    return "lightBackground"
                case .elevatedLight:
                    return "elevatedDarkBackground"
                case .elevatedDark:
                    return "elevatedLightBackground"
                case .contrastLight:
                    return "contrastDarkBackground"
                case .contrastDark:
                    return "contrastLightBackground"
                case .elevatedContrastLight:
                    return "elevatedContrastDarkBackground"
                case .elevatedContrastDark:
                    return "elevatedContrastLightkBackground"
                default:
                    return "darkBackground"
                }
            }()
            let combinedKeyString = keyStringForStyle + "_" + keyStringForScheme // "primary1_lightBackground"
            var developerOverrideColorString: String?
            
            switch variant {
            case .dark:
                if developerOverriddenColors.keys.contains(combinedKeyString) {
                    developerOverrideColorString = developerOverriddenColors[combinedKeyString] // First look for "primary1_lightBackground" as that has precedence
                } else if developerOverriddenColors.keys.contains(keyStringForStyle) {
                    developerOverrideColorString = developerOverriddenColors[keyStringForStyle] // Else return the value for "primary1"
                } else {
                    // Special case for tintColorDark - check if there is an override in the nss file for "tintColorDark" which is the same as "tintColor_lightBackground"
                    if keyStringForStyle == "tintColor" {
                        if developerOverriddenColors.keys.contains("tintColorDark") {
                            developerOverrideColorString = developerOverriddenColors["tintColorDark"]
                        }
                    }
                    // Special case for tintColorTapStateDark - check if there is an override in the nss file for "tintColorTapStateDark" which is the same as "tintColorTapState_lightBackground"
                    if keyStringForStyle == "tintColorTapState" {
                        if developerOverriddenColors.keys.contains("tintColorTapStateDark") {
                            developerOverrideColorString = developerOverriddenColors["tintColorTapStateDark"]
                        }
                    }
                }
            case .light:
                if developerOverriddenColors.keys.contains(combinedKeyString) {
                    developerOverrideColorString = developerOverriddenColors[combinedKeyString] // First look for "primary1_darkBackground" as that has precedence
                } else {
                    if keyStringForStyle == "tintColor" {
                        // Special case for tintColorLight  - check if there is an override for "tintColorLight" which is the same as "tintColor_darkBackground"
                        if developerOverriddenColors.keys.contains("tintColorLight") {
                            developerOverrideColorString = developerOverriddenColors["tintColorLight"]
                        }
                    }
                    // Special case for tintColorTapStateLight - check if there is an override in the nss file for "tintColorTapStateLight" which is the same as "tintColorTapState_darkBackground"
                    if keyStringForStyle == "tintColorTapState" {
                        if developerOverriddenColors.keys.contains("tintColorTapStateLight") {
                            developerOverrideColorString = developerOverriddenColors["tintColorTapStateLight"]
                        }
                    }
                }
            default:
                if developerOverriddenColors.keys.contains(combinedKeyString) {
                    developerOverrideColorString = developerOverriddenColors[combinedKeyString]
                }
            }
            return developerOverrideColorString
        }
        
        return nil
    }
}
