import Foundation
import SwiftUI

/// A struct for stylings in the `DimensionSelector`
public struct SegmentAttributes {
    /// Font color for titles
    public var textColor: Color?
    /// Font for titles
    public var font: Font?
    /// Border width for segments
    public var borderWidth: CGFloat?
    /// Border color for segments
    public var borderColor: Color?
    /// Background color for segments
    public var backgroundColor: Color?
    
    /// A struct for stylings in the `DimensionSelector`
    /// - Parameters:
    ///   - textColor: Font color for titles
    ///   - font: Font for titles
    ///   - borderColor: Border color for segments
    public init(textColor: Color? = nil,
                font: Font? = nil,
                borderWidth: CGFloat? = nil,
                borderColor: Color? = nil,
                backgroundColor: Color? = nil)
    {
        self.textColor = textColor
        self.font = font
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.backgroundColor = backgroundColor
    }
}
