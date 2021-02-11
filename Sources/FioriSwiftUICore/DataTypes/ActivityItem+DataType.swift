import SwiftUI

/// :nodoc:
public enum ActivityItemType {
    case email
    case custom(Image)

    public var icon: Image {
        switch self {
        case .email:
            return Image(systemName: "mail")
        case .custom(let image):
            return image
        }
    }
}

/// :nodoc:
extension ActivityItemType: Equatable {
    public static func == (lhs: ActivityItemType, rhs: ActivityItemType) -> Bool {
        switch (lhs, rhs) {
        case (.email, .email):
            return true
        case (.custom, .custom):
            return true
        default:
            return false
        }
    }
}

// loose port of https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFiori/Contact%20views.html#/s:8SAPFiori15FUIActivityItemV
/// :nodoc:
public struct ActivityItemDataType: Identifiable {
    public private(set) var type: ActivityItemType

    public private(set) var data: String?

    public private(set) var id = UUID()

    public private(set) var icon: Image

    public init(type: ActivityItemType, data: String? = nil) {
        self.icon = type.icon
        self.type = type
        self.data = data
    }
}
