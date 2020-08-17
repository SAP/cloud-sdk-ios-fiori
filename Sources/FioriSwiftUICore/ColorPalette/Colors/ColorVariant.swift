//
//  ColorVariant.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/14/20.
//

import Foundation

public enum ColorVariant {
    /// Light color variant, which is used when `.colorScheme` sets to `.dark` and `.userInterfaceLevel` sets to `.base`.
    case light
    /// Dark color variant, which is used when `.colorScheme` sets to `.light` and `.userInterfaceLevel` sets to `.base`.
    case dark
    /// Elevated light color variant, which is used when `.colorScheme` sets to `.dark` and `.userInterfaceLevel` sets to `.elevated`.
    case elevatedLight
    /// Elevated light color variant, which is used when `.colorScheme` sets to `.light` and `.userInterfaceLevel` sets to `.elevated`.
    case elevatedDark
    /// Light variant color, used as foreground color when `.colorScheme` sets to `.dark` to display with dark background (contrast mode).
    case contrastLight
    /// Dark variant color, used as foreground color when `.colorScheme` sets to `.light` to display with dark background (contrast mode).
    case contrastDark
    
    /// Helper function to return opposite color variant of current value.
    ///
    /// - Returns: inverse of current color variant.
    func inverse() -> ColorVariant {
        switch self {
        case .light:
            return .dark
        case .dark:
            return .light
        case .elevatedLight:
            return .elevatedDark
        case .elevatedDark:
            return .elevatedLight
        case .contrastLight:
            return .contrastDark
        case .contrastDark:
            return .contrastLight
        }
    }
}

extension ColorVariant: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .light:
            return "light"
        case .dark:
            return "dark"
        case .elevatedLight:
            return "elevatedLight"
        case .elevatedDark:
            return "elevatedDark"
        case .contrastLight:
            return "contrastLight"
        case .contrastDark:
            return "contrastDark"
        }
    }
}
