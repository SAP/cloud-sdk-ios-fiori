//
//  SegmentAttribute.swift
//  FioriSwiftUICore
//
//  Created by Ma, Xiao on 4/28/20.
//

import Foundation
import SwiftUI

public struct SegmentAttributes {
    public var fontColor: Color?
    public var fontSize: CGFloat?
    public var font: Font?
    public var borderColor: Color?
    
    public init(fontColor: Color? = nil,
                fontSize: CGFloat? = nil,
                font: Font? = nil,
                borderColor: Color? = nil) {
        self.fontColor      = fontColor
        self.fontSize       = fontSize
        self.font           = font
        self.borderColor    = borderColor
    }
}
