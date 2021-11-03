import Foundation
import SwiftUI

/// Data structure for each row in the DataTable
public struct TableRowItem {
    /// Leading accessory items.
    public let leadingAccessories: [AccessoryItem]
    /// Trailing accessory item.
    public let trailingAccessory: AccessoryItem?
    /// Row data.
    public internal(set) var data: [DataItem]
    /// Selected image in editing mode.
    public let selectedImage: Image?
    /// Desekected image in edting mode.
    public let deSelectedImage: Image?
    
    /// Public initializer for TableRowItem
    /// - Parameters:
    ///   - leadingAccessories: Leading accessory items.
    ///   - trailingAccessory: Trailing accessory item.
    ///   - data: Row data.
    ///   - selectedImage: Selected image in editing mode.
    ///   - deSelectedImage: Desekected image in edting mode.
    public init(leadingAccessories: [AccessoryItem], trailingAccessory: AccessoryItem?, data: [DataItem], selectedImage: Image? = nil, deSelectedImage: Image? = nil) {
        self.leadingAccessories = leadingAccessories
        self.trailingAccessory = trailingAccessory
        self.data = data
        self.selectedImage = selectedImage
        self.deSelectedImage = deSelectedImage
    }
}

/// Accessory item type.
public enum AccessoryItem {
    case button(AccessoryButton)
    case icon(Image)
}

/// Button for accessory item.
public struct AccessoryButton {
    /// Image for button.
    public let image: Image?
    /// Title for button.
    public let title: String?
    /// Action for button.
    public let action: () -> Void
    
    /// Public initializer for AccessoryButton
    /// - Parameters:
    ///   - image: Image for button.
    ///   - title: Title string for button.
    ///   - action: Action for button.
    public init(image: Image? = nil, title: String? = nil, action: @escaping () -> Void) {
        self.image = image
        self.title = title
        self.action = action
    }
}
