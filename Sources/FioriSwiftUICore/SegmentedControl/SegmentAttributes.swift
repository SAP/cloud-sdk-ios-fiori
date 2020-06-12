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
    public var textColor: Color?
    /// Font for titles
    public var font: Font?
    /// Border color for segments
    public var borderColor: Color?
    
    /// A struct for stylings in the `SegmentedControl`
    /// - Parameters:
    ///   - textColor: Font color for titles
    ///   - font: Font for titles
    ///   - borderColor: Border color for segments
    public init(textColor: Color? = nil,
                font: Font? = nil,
                borderColor: Color? = nil) {
        self.textColor      = textColor
        self.font           = font
        self.borderColor    = borderColor
    }
}
