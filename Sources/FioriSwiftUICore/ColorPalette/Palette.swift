//
//  Palette.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/14/20.
//

import Foundation

/// A struct for providing color palette.
public struct Palette: PaletteProvider {
    
    /// A function for getting `HexColor` from palette
    /// - Parameters:
    ///   - style: `ColorStyle` for which color definition is required.
    public func hexColor(for style: ColorStyle) -> HexColor {
        return self._palette.hexColor(for: style)
    }
    
    /// :nodoc:
    public var uuid: UUID {
        return self._palette.uuid
    }
    
    /// :nodoc:
    public init(_ palette: PaletteProvider) {
        self._palette = palette
    }
    
    private let _palette: PaletteProvider
}

extension Palette: Equatable {
    /// :nodoc:
    public static func == (lhs: Palette, rhs: Palette) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
