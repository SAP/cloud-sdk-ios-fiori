//
//  PaletteProvider.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/14/20.
//

import Foundation

/// Protocol defining available color palette provider.
public protocol PaletteProvider {
    /// :nodoc:
    var uuid: UUID { get }
    
    /// Required interface to supply color definitions for the `ColorStyle` and `BackgroundColorScheme` combination.
    ///
    /// - Parameters:
    ///   - style: `ColorStyle` for which color definition is required
    /// - Returns: Hex color, a dictionary contains `.light` and `.dark` variant
    func hexColor(for style: ColorStyle) -> HexColor
}

extension PaletteProvider {
    
    /// Utility method which should be invoked by the `PaletteProvider`, when encountering a `ColorStyle` for which no known definition exists in the current palette.
    /// This is most likely to occur when basing the palette on a version `< .latest`, which might be missing definitions added in later palettes. Also, this might occur if
    /// the `FUIColorStyle` has been deprecated or removed from the API.
    ///
    /// The default behavior when encountering a `ColorStyle` with no definition, is to iterate *down* from the latest
    /// palette, until a style is discovered. This should ensure that that latest definition of the style is used.
    ///
    /// - Parameters:
    ///   - style: Style which is not defined or overridden in this palette
    ///   - variant: Color variant (defaults to `.light)
    ///   - paletteVersion: Current palette version (when invoked internally from SDK), or, greatest version on which developer's custom palette is based
    /// - Returns: Optional hex color code
    func hexColor(forUnknown style: ColorStyle, variant: ColorVariant, basedOn paletteVersion: PaletteVersion = PaletteVersion.latest) -> String? {
        // if the style was never defined up to this palette version, use from .latest
        guard paletteVersion.supportedStyles().contains(style) else {
            guard paletteVersion != PaletteVersion.latest else { return nil }
            return PaletteVersion.latest.rawValue.hexColor(for: style).colors[variant]
        }
        
        // if the style was defined in one or more *older* palettes, iterate backwards from the palette version to find a valid value
        if let previous = paletteVersion.previous() {
            return previous.rawValue.hexColor(for: style).colors[variant]
        }
        
        return nil
    }
}
