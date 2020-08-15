//
//  BackgroundColorScheme.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 6/17/20.
//

import Foundation

/// Color scheme scenario, describing how the *foreground* color of the content should be configured to use appropriate color variants based on *background* color scheme.
/// In Fiori UI design language, light color variants are mostly white, or a color with low alpha. Dark color variants are mostly black, charcoal, navy.
///
/// - device: Use device interface style for background scheme. Foreground colors should be dynamically adjusted to natural variants (e.g. *light* or *dark* color variants) based on user interface style settings on iOS/macOS. This is the default setting for most content.
/// - deviceInverse: Use inversed device interface style for background scheme. Foreground colors are inverted based on user interface style settings on iOS/macOS. If the device setting is in *light* user interface style, foreground colors will be adjusted to use *dark* color variants.
/// - lightConstant: Use constant light background scheme. Foreground colors should constantly use *light* variants regardless of user interface style settings on iOS/macOS.
/// - darkConstant: Use constant dark background scheme. Foreground colors should constantly use *dark* variants regardless of user interface style settings on iOS/macOS.
public enum BackgroundColorScheme: String, CaseIterable {
    /// - Use device interface style for background scheme, so foreground colors will be adjusted based on device background
    case device
    /// - Use inversed device interface style for background scheme, so foreground colors will be adjusted as opposite to device background
    case deviceInverse
    /// - Use constant light background scheme regardless of device settings, which means components will use dark variants of foreground colors
    case lightConstant
    /// - Use constant dark background scheme regardless of device settings, which means components will use light variants of foreground colors
    case darkConstant
    
    /// - Foreground color scheme that matches with light background color
    @available(*, deprecated, renamed: "lightConstant")
    public static let light = BackgroundColorScheme.lightConstant

    /// - Foreground color scheme that matches with dark background color
    @available(*, deprecated, renamed: "darkConstant")
    public static let dark = BackgroundColorScheme.darkConstant
    
    /// :nodoc:
    @available(*, unavailable, renamed: "dark")
    public static let darkBackground = BackgroundColorScheme(rawValue: "unavailable")

    /// :nodoc:
    @available(*, unavailable, renamed: "light")
    public static let lightBackground = BackgroundColorScheme(rawValue: "unavailable")
    
    /// Helper function to return an opposite color scheme of current value.
    ///
    /// - Returns: inverse of current color scheme.
    public func inverse() -> BackgroundColorScheme {
        switch self {
        case .device:
            return .deviceInverse
        case .deviceInverse:
            return .device
        case .lightConstant:
            return .darkConstant
        case .darkConstant:
            return .lightConstant
        }
    }
    
    /// :nodoc:
    public init?(rawValue: String) {
        switch rawValue {
        case "device":
            self = .device
        case "deviceInverse":
            self = .deviceInverse
        case "lightConstant":
            self = .lightConstant
        case "darkConstant":
            self = .darkConstant
        default:
            return nil
        }
    }
}

extension BackgroundColorScheme: CustomDebugStringConvertible {
    /// :nodoc:
    public var debugDescription: String {
        switch self {
        case .deviceInverse:
            return "deviceInverse"
        case .device:
            return "device"
        case .darkConstant:
            return "darkConstant"
        case .lightConstant:
            return "lightConstant"
        }
    }
}
