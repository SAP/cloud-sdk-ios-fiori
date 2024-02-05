import SwiftUI

/// An image item for `DataTable`
public struct DataImageItem: DataItemImageComponent, CheckBinding, Equatable {
    /// Type.
    public var type: DataItemType = .image
    /// Mapping rule.
    public var binding: ObjectViewProperty.Image?
    
    /// Image for item.
    public var image: Image
    /// Tint color for image.
    public var tintColor: Color?
    
    /**
     Determines whether the cell is read-only or not for inline editing mode.  `DataImageItem` ignores this property since it doesn't support inline editing yet.
     */
    public var isReadonly: Bool?
    
    var hasBinding: Bool {
        self.binding != nil
    }
    
    /// Public initializer for `DataImageItem`
    /// - Parameters:
    ///   - image: Image for item.
    ///   - tintColor: Tint color for image.
    ///   - binding: Mapping rule.
    ///   - isReadonly: Whether the cell is read-only or not in inline editing mode.
    public init(_ image: Image, _ tintColor: Color? = nil, _ binding: ObjectViewProperty.Image? = nil, isReadonly: Bool? = nil) {
        self.image = image.resizable()
        self.tintColor = tintColor
        self.binding = binding
        self.isReadonly = isReadonly
    }
    
    /// check equality
    public static func == (lhs: DataImageItem, rhs: DataImageItem) -> Bool {
        if lhs.image != rhs.image {
            return false
        }
        
        if lhs.tintColor != rhs.tintColor {
            return false
        }
        
        if lhs.isReadonly != rhs.isReadonly {
            return false
        }
        
        return true
    }
}
