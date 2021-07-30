import SwiftUI

/// An image item for `DataTable`
public struct DataImageItem: DataItem, CheckBinding {
    /// Type.
    public var type: DataItemType
    /// Mapping rule.
    public var binding: ObjectViewProperty.Image?
    
    /// Image for item.
    public var image: Image
    /// Tint color for image.
    public var tintColor: Color?
    
    var hasBinding: Bool {
        self.binding != nil
    }
    
    /// Public initializer for `DataImageItem`
    /// - Parameters:
    ///   - image: Image for item.
    ///   - tintColor: Tint color for image.
    ///   - binding: Mapping rule.
    public init(_ image: Image, _ tintColor: Color? = nil, _ binding: ObjectViewProperty.Image? = nil) {
        self.image = image.resizable()
        self.tintColor = tintColor
        self.type = .image
        self.binding = binding
    }
}
