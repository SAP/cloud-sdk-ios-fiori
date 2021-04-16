import Foundation
import SwiftUI

public struct TableRowItem {
    let leadingAccessories: [AccessoryItem]
    let trailingAccessory: AccessoryItem?
    let data: [DataItem]
    let selectedImage: Image?
    let deSelectedImage: Image?
    
    init(leadingAccessories: [AccessoryItem], trailingAccessory: AccessoryItem?, data: [DataItem], selectedImage: Image? = nil, deSelectedImage: Image? = nil) {
        self.leadingAccessories = leadingAccessories
        self.trailingAccessory = trailingAccessory
        self.data = data
        self.selectedImage = selectedImage
        self.deSelectedImage = deSelectedImage
    }
}

enum AccessoryItem {
    case button(AccessoryButton)
    case icon(Image)
    case text(String)
}

// extension AccessoryItem: Hashable {
//    static func == (lhs: AccessoryItem, rhs: AccessoryItem) -> Bool {
//        switch (lhs, rhs) {
//        case (.button(let lButton), .button(let rButton)):
//            return lButton == rButton
//        case (.icon(let lIcon), .icon(let rIcon)):
//            return lIcon == rIcon
//        case (.text(let lText), .text(let rText)):
//            return lText == rText
//        default:
//            return false
//        }
//    }
// }

struct AccessoryButton {
    let image: Image
    let title: String
    let action: () -> Void
}

//
// extension AccessoryButton: Hashable {
//    static func == (lhs: AccessoryButton, rhs: AccessoryButton) -> Bool {
//        return lhs.title == rhs.title
//            && lhs.imageName_selected == rhs.imageName_selected
//            && lhs.imageName_deSelected == rhs.imageName_deSelected
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(title)
//        hasher.combine(imageName_selected)
//        hasher.combine(imageName_deSelected)
//    }
// }
