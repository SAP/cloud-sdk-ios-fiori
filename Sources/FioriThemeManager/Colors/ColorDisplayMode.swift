import Foundation

public enum ColorDisplayMode: String, CaseIterable {
    /// - Use device specified display mode of the interface
    case device
    /// - Use inversed device specified display mode of the interface
    case deviceInverse
    /// - Use normal contrast level regardless of device accessibility contrast setting
    case normalConstant
    /// - Use high contrast level regardless of device accessibility contrast setting
    case highConstant
    
    /// Helper function to return an opposite color display mode of current value.
    ///
    /// - Returns: inverse of current color display mode.
    public func inverse() -> ColorDisplayMode {
        switch self {
        case .device:
            return .deviceInverse
        case .deviceInverse:
            return .device
        case .normalConstant:
            return .highConstant
        case .highConstant:
            return .normalConstant
        }
    }
    
    /// :nodoc:
    public init?(rawValue: String) {
        switch rawValue {
        case "device":
            self = .device
        case "deviceInverse":
            self = .deviceInverse
        case "normalConstant":
            self = .normalConstant
        case "highConstant":
            self = .highConstant
        default:
            return nil
        }
    }
}

extension ColorDisplayMode: CustomDebugStringConvertible {
    /// :nodoc:
    public var debugDescription: String {
        switch self {
        case .deviceInverse:
            return "deviceInverse"
        case .device:
            return "device"
        case .normalConstant:
            return "normalConstant"
        case .highConstant:
            return "highConstant"
        }
    }
}
