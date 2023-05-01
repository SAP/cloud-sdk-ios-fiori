import Foundation
import SwiftUI

/// Data structure for each row in the DataTable
public struct TableRowItem: Equatable {
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
    
    /// Public initializer for TableRowItem
    /// - Parameters:
    ///   - data: Row data.
    ///   - selectedImage: Selected image in editing mode.
    ///   - deSelectedImage: Desekected image in edting mode.
    public init(data: [DataItem], selectedImage: Image? = nil, deSelectedImage: Image? = nil) {
        self.leadingAccessories = []
        self.trailingAccessory = nil
        self.data = data
        self.selectedImage = selectedImage
        self.deSelectedImage = deSelectedImage
    }
    
    /// check equality
    public static func == (lhs: TableRowItem, rhs: TableRowItem) -> Bool {
        // check leadingAccessories
        if lhs.leadingAccessories.count != rhs.leadingAccessories.count {
            return false
        }
        
        for index in 0 ..< lhs.leadingAccessories.count {
            if lhs.leadingAccessories[index] != rhs.leadingAccessories[index] {
                return false
            }
        }
        
        // check trailingAccessory
        if lhs.trailingAccessory != rhs.trailingAccessory {
            return false
        }

        // check data
        if lhs.data.count != rhs.data.count {
            return false
        }
        
        for index in 0 ..< lhs.data.count {
            if lhs.data[index].type != rhs.data[index].type {
                return false
            }
  
            if let lhsItem = lhs.data[index] as? DataTextItem, let rhsItem = rhs.data[index] as? DataTextItem, lhsItem != rhsItem {
                return false
            } else if let lhsItem = lhs.data[index] as? DataImageItem, let rhsItem = rhs.data[index] as? DataImageItem, lhsItem != rhsItem {
                return false
            } else if let lhsItem = lhs.data[index] as? DataDateItem, let rhsItem = rhs.data[index] as? DataDateItem, lhsItem != rhsItem {
                return false
            } else if let lhsItem = lhs.data[index] as? DataTimeItem, let rhsItem = rhs.data[index] as? DataTimeItem, lhsItem != rhsItem {
                return false
            } else if let lhsItem = lhs.data[index] as? DataDurationItem, let rhsItem = rhs.data[index] as? DataDurationItem, lhsItem != rhsItem {
                return false
            } else if let lhsItem = lhs.data[index] as? DataListItem, let rhsItem = rhs.data[index] as? DataListItem, lhsItem != rhsItem {
                return false
            }
        }
        
        return true
    }
}

/// Accessory item type.
public enum AccessoryItem: Equatable {
    case button(AccessoryButton)
    case icon(Image)
    
    /// check equality
    public static func == (lhs: AccessoryItem, rhs: AccessoryItem) -> Bool {
        switch (lhs, rhs) {
        case (.button(let button1), .button(let button2)):
            return button1 == button2
        case (.icon(let image1), .icon(let image2)):
            return image1 == image2
        default:
            return false
        }
    }
}

/// Button for accessory item.
public struct AccessoryButton: Equatable {
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
    
    /// check equality
    public static func == (lhs: AccessoryButton, rhs: AccessoryButton) -> Bool {
        if lhs.image != rhs.image {
            return false
        }
        
        if lhs.title != rhs.title {
            return false
        }
        
        return true
    }
}
