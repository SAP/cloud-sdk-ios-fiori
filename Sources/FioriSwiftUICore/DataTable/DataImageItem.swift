import SwiftUI

/// An image item for `DataTable`
public struct DataImageItem: DataItem, CheckBinding {
    /// Type.
    public var type: DataItemType
    /// Mapping rule.
    public var binding: ObjectViewProperty.Image?
    
    /// Image for item.
    public var image: Image
    
    var hasBinding: Bool {
        self.binding != nil
    }
    
    /// Public initializer for `DataImageItem`
    /// - Parameters:
    ///   - image: Image for item.
    ///   - mapping: Mapping rule.
    public init(_ image: Image, _ mapping: ObjectViewProperty.Image? = nil) {
        self.image = image.resizable()
        self.type = .image
        self.binding = mapping
    }
}
