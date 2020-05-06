//
//  SegmentAttribute.swift
//  FioriSwiftUICore
//
//  Created by Ma, Xiao on 4/28/20.
//

import Foundation
import SwiftUI

/// A struct for stylings in the `SegmentedControl`
public struct SegmentAttributes {
    /// Font color for titles
    public var fontColor: Color?
    /// Font size for titles
    public var fontSize: CGFloat?
    /// Font for titles
    public var font: UIFont?
    /// Border color for segments
    public var borderColor: Color?
    
    /// A struct for stylings in the `SegmentedControl`
    /// - Parameters:
    ///   - fontColor: Font color for titles
    ///   - fontSize: Font size for titles
    ///   - font: Font for titles
    ///   - borderColor: Border color for segments
    public init(fontColor: Color? = nil,
                fontSize: CGFloat? = nil,
                font: UIFont? = nil,
                borderColor: Color? = nil) {
        self.fontColor      = fontColor
        self.fontSize       = fontSize
        self.font           = font
        self.borderColor    = borderColor
    }
    
    func getFont() -> Font {
        if let _fontSize = self.fontSize {
            return Font(self.font?.withSize(_fontSize) ?? UIFont.preferredFont(forTextStyle: .subheadline).withSize(_fontSize))
        }
        return Font(self.font ?? UIFont.preferredFont(forTextStyle: .subheadline))
    }
}
