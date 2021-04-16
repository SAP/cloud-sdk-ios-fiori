import SwiftUI

// MARK: - Public Enums

/// An enum representing the different item styles that a `FUIGridRowItem` can have.
public enum DataItemType {
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

public enum ObjectViewProperty {
    /// Binding definitions for text in object view layout
    public enum Text {
        /// Object view headline area
        case title
        /// Object view subheadline area
        case subtitle
        /// Object view footnote area
        case footnote
        /// Object view status area
        case status
        /// Object view substatus area
        case substatus
    }

    /// Binding definitions for images in object view layout
    public enum Image {
        /// Object view detailImage area
        case detailImage
    }
}
