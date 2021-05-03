import SwiftUI

open class DataImageItem: DataItem {
    public var type: DataItemType
    public var mapping: ObjectViewProperty.Image?
    
    var image: Image
    
    public init(_ image: Image, _ mapping: ObjectViewProperty.Image? = nil) {
        self.image = image.resizable()
        self.type = .image
        self.mapping = mapping
    }
}
