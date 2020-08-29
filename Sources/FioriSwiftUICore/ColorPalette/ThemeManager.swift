//
//  ThemeManager.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/16/20.
//

import Foundation
import SwiftUI
import UIKit

public class ThemeManager {
    /// Singleton instance shared by all application components.
    public static let shared: ThemeManager = ThemeManager()
    
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
        return palette.hexColor(for: style)
    }
    
    /// :nodoc:
    internal func color(for style: ColorStyle, background scheme: BackgroundColorScheme?, interface level: InterfaceLevel?, display mode: ColorDisplayMode?) -> Color {
        let uiColor: UIColor = UIColor { [unowned self] traitCollection in
            let variant = self.palette.hexColor(for: style).getVariant(background: scheme, interface: level, display: mode)
            let hexColorString = self.palette.hexColor(for: style).hex(variant)
            let components = self.palette.hexColor(for: style).rgba(hexColorString)
            return UIColor(red: CGFloat(components.r), green: CGFloat(components.g),
                           blue: CGFloat(components.b), alpha: CGFloat(components.a))
        }
        return Color(uiColor)
    }
}
