//
//  ColorDisplayMode.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 8/17/20.
//

import Foundation

public enum ColorDisplayMode: String, CaseIterable {
    /// - Normal color display mode
    case normal
    /// - Contrast color display mode
    case contrast
    
    /// Helper function to return an opposite color display mode of current value.
    ///
    /// - Returns: inverse of current color display mode.
    public func inverse() -> ColorDisplayMode {
        switch self {
        case .normal:
            return .contrast
        case .contrast:
            return .normal
        }
    }
    
    /// :nodoc:
    public init?(rawValue: String) {
        switch rawValue {
        case "normal":
            self = .normal
        case "contrast":
            self = .contrast
        default:
            return nil
        }
    }
}

extension ColorDisplayMode: CustomDebugStringConvertible {
    /// :nodoc:
    public var debugDescription: String {
        switch self {
        case .normal:
            return "normal"
        case .contrast:
            return "contrast"
        }
    }
}
