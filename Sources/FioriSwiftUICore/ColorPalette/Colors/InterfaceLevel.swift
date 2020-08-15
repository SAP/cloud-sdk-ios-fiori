//
//  InterfaceLevel.swift
//  FioriSwiftUICore
//
//  Created by Guo, Justin on 8/11/20.
//

import Foundation

public enum InterfaceLevel: String, CaseIterable {
    /// - Use device specified elevation level of the interface
    case device
    /// - Use inversed device specified elevation level of the interface
    case deviceInverse
    /// - Use base interface level, which is usually used to display application window's main content
    case baseConstant
    /// - Use elevated interface level, which is usually used to highlight contents above window's main content
    case elevatedConstant
    
    /// Helper function to return an opposite user interface level of current value.
    ///
    /// - Returns: inverse of current user interface level.
    public func inverse() -> InterfaceLevel {
        switch self {
        case .device:
            return .deviceInverse
        case .deviceInverse:
            return .device
        case .baseConstant:
            return .elevatedConstant
        case .elevatedConstant:
            return .baseConstant
        }
    }
    
    /// :nodoc:
    public init?(rawValue: String) {
        switch rawValue {
        case "device":
            self = .device
        case "deviceInverse":
            self = .deviceInverse
        case "baseConstant":
            self = .baseConstant
        case "elevatedConstant":
            self = .elevatedConstant
        default:
            return nil
        }
    }
}

extension InterfaceLevel: CustomDebugStringConvertible {
    /// :nodoc:
    public var debugDescription: String {
        switch self {
        case .deviceInverse:
            return "deviceInverse"
        case .device:
            return "device"
        case .baseConstant:
            return "baseConstant"
        case .elevatedConstant:
            return "elevatedConstant"
        }
    }
}
