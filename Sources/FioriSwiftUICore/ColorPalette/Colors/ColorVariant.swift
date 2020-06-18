//
//  ColorVariant.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/14/20.
//

import Foundation

public enum ColorVariant {
    /// Light color variant, which is used when `.colorScheme` sets to `.dark`.
    case light
    /// Dark color variant, which is used when `.colorScheme` sets to `.light`.
    case dark
    
    /// Helper function to return opposite color variant of current value.
    ///
    /// - Returns: inverse of current color variant.
    func inverse() -> ColorVariant {
        switch self {
        case .light:
            return .dark
        case .dark:
            return .light
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
        }
    }
}
