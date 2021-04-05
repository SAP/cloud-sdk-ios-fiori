import SwiftUI

open class DataImageItem: DataItem {
    public var type: DataItemType

    var image: Image
    
    public init(_ image: Image) {
        self.image = image.resizable()
        self.type = .image
    }
}
