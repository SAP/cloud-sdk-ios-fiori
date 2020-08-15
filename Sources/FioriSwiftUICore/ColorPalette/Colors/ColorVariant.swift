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
        }
    }
}
