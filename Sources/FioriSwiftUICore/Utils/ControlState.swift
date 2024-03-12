import SwiftUI

/// Data types for `ControlState`. Equivalent to `UIControl.State`.
public struct ControlState: OptionSet {
    public let rawValue: UInt
    
    /// Initialization
    public init(rawValue: UInt) { self.rawValue = rawValue }
    
    /// Normal UI control state
    public static let normal = ControlState(rawValue: 1 << 0)
    /// Highlighted UI control state
    public static let highlighted = ControlState(rawValue: 1 << 1)
    /// Disabled UI control state
    public static let disabled = ControlState(rawValue: 1 << 2)
    /// Selected UI control state
    public static let selected = ControlState(rawValue: 1 << 3)
    /// Focused UI control state
    public static let focused = ControlState(rawValue: 1 << 4)

    /// Read-Only control state
    public static let readOnly = ControlState(rawValue: 1 << 5)
}

extension ControlState: Hashable {
    /// Extends ``UIControl.State`` to be ``Hashable``
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}
