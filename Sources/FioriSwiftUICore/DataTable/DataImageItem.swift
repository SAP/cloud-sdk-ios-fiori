import SwiftUI

/// An image item for `DataTable`
public class DataImageItem: DataItem {
    /// Type.
    public var type: DataItemType
    /// Mapping rule.
    public var mapping: ObjectViewProperty.Image?
    
    /// Image for item.
    var image: Image
    
    /// Public initializer for `DataImageItem`
    /// - Parameters:
    ///   - image: Image for item.
    ///   - mapping: Mapping rule.
    public init(_ image: Image, _ mapping: ObjectViewProperty.Image? = nil) {
        self.image = image.resizable()
        self.type = .image
        self.mapping = mapping
    }
}
