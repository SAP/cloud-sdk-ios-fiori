import Foundation
import SwiftUI

public struct TableRowItem {
    let leadingAccessories: [AccessoryItem]
    let trailingAccessory: AccessoryItem?
    let data: [DataItem]
    let selectedImage: Image?
    let deSelectedImage: Image?
    
    public init(leadingAccessories: [AccessoryItem], trailingAccessory: AccessoryItem?, data: [DataItem], selectedImage: Image? = nil, deSelectedImage: Image? = nil) {
        self.leadingAccessories = leadingAccessories
        self.trailingAccessory = trailingAccessory
        self.data = data
        self.selectedImage = selectedImage
        self.deSelectedImage = deSelectedImage
    }
}

public enum AccessoryItem {
    case button(AccessoryButton)
    case icon(Image)
    case text(String)
}

public struct AccessoryButton {
    let image: Image
    let title: String
    let action: () -> Void
    
    public init(image: Image, title: String, action: @escaping () -> Void) {
        self.image = image
        self.title = title
        self.action = action
    }
}
