import Foundation

/// Data types for `FioriUIControlState`. Equivalent to `UIControl.State`.
public struct ControlStateSet: OptionSet {
    public let rawValue: UInt
    
    /// Initialization
    public init(rawValue: UInt) { self.rawValue = rawValue }
    
    /// Normal UI control state
    public static let normal = ControlStateSet(rawValue: 1 << 0)
    /// Highlighted UI control state
    public static let highlighted = ControlStateSet(rawValue: 1 << 1)
    /// Disabled UI control state
    public static let disabled = ControlStateSet(rawValue: 1 << 2)
    /// Selected UI control state
    public static let selected = ControlStateSet(rawValue: 1 << 3)
    /// Focused UI control state
    public static let focused = ControlStateSet(rawValue: 1 << 4)
}

extension ControlStateSet: Hashable {
    /// Extends ``UIControl.State`` to be ``Hashable``
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}
