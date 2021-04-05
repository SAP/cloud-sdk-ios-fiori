import SwiftUI

// MARK: - Public Enums

/// An enum representing the different item styles that a `FUIGridRowItem` can have.
public enum DataItemType {
    /// Indicating this `FUIGridRowItem` represents a number.
    case number(Float)
    /// Indicating this `FUIGridRowItem` represents a text.
    case text
    /// Indicating this `FUIGridRowItem` represents a image.
    case image
}

///  A protocol defines style of a `FUIGridRowItem`.
public protocol DataItem: AnyObject {
    /// Returns the `FUIGridRowItemStyle` enum value for the item.
    var type: DataItemType { get }
}
