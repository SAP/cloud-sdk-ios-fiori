import FioriThemeManager
import Foundation
@preconcurrency import SwiftUI

/// `WAMenu` represents a single menu in the writing assistant feature.
public struct WAMenu: Hashable, Identifiable, Sendable {
    /// :nodoc:
    public let id = UUID()
    /// The title of the menu.
    public let title: String
    /// An optional icon for the menu.
    public let icon: Image?
    /// An array of child menus for hierarchical menus.
    public let children: [WAMenu]

    /// Initialization for a `WAMenu`.
    /// - Parameters:
    ///   - title: The title of the menu.
    ///   - icon: An optional icon for the menu.
    ///   - children: An array of child menus for hierarchical menus.
    public init(title: String, icon: Image? = nil, children: [WAMenu] = []) {
        self.title = title
        self.icon = icon
        self.children = children
    }

    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.title)
    }
    
    /// :nodoc:
    public static func == (lhs: WAMenu, rhs: WAMenu) -> Bool {
        lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.icon == rhs.icon &&
            lhs.children == rhs.children
    }
}

/// `WAError` represents an error in the writing assistant feature, providing details about the error and potential actions which will be used in `IllustratedMessage`.
public struct WAError: Error {
    let id = UUID()
    /// Detail image for the error.
    public let detailImage: Image?
    /// Title of the error.
    public let title: AttributedString
    /// Description of the error.
    public let description: AttributedString?
    /// Action button for the error.
    public let action: FioriButton?
    /// Secondary action button for the error.
    public let secondaryAction: FioriButton?
    /// Size of the detail image.
    public let detailImageSize: IllustratedMessage.DetailImageSize?
    /// Whether the action button is vertically aligned.
    public let isActionVerticallyAligned: Bool?
    /// Content alignment for the error message.
    public let contentAlignment: HorizontalAlignment?

    /// Initialization for a `WAError`.
    /// - Parameters:
    ///   - detailImage: Detail image for the error.
    ///   - title: The title of the error.
    ///   - description: Description of the error.
    ///   - action: Action button for the error.
    ///   - secondaryAction: Secondary action button for the error.
    ///   - detailImageSize: Size for the detail image.
    ///   - isActionVerticallyAligned: A boolean value to indicate whether the action button is vertically aligned.
    ///   - contentAlignment: Content alignment for the error message.
    public init(detailImage: Image? = nil,
                title: AttributedString,
                description: AttributedString? = nil,
                action: FioriButton? = nil,
                secondaryAction: FioriButton? = nil,
                detailImageSize: IllustratedMessage.DetailImageSize? = nil,
                isActionVerticallyAligned: Bool? = nil,
                contentAlignment: HorizontalAlignment? = nil)
    {
        self.detailImage = detailImage
        self.title = title
        self.description = description
        self.action = action
        self.secondaryAction = secondaryAction
        self.detailImageSize = detailImageSize
        self.isActionVerticallyAligned = isActionVerticallyAligned
        self.contentAlignment = contentAlignment
    }
}
