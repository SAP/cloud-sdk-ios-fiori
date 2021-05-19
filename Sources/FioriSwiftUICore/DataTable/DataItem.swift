import SwiftUI

/// An enum representing the different item styles that a `DataTable` can have.
public enum DataItemType {
    /// Indicating this row item represents a text.
    case text
    /// Indicating this row item represents a image.
    case image
}

///  A protocol defines style of a `DataItem`.
public protocol DataItem {
    /// Returns the `DataItemType` enum value for the item.
    var type: DataItemType { get }
}

/// Property for object view.
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
        /// Object view statusImage area
        case statusImage
        /// Object view substatusImage area
        case substatusImage
    }
}

protocol CheckBinding {
    var hasBinding: Bool { get }
}
