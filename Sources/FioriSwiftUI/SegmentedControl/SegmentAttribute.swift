//
//  SegmentAttribute.swift
//  AnyCodable
//
//  Created by Ma, Xiao on 4/28/20.
//

import Foundation
import SwiftUI

public class SegmentAttribute {
    public var fontColor: Color!
    public var fontSize: CGFloat?
    public var font: Font?
    public var borderColor: Color!
    
    public init(fontColor: Color,
                fontSize: CGFloat? = nil,
                font: Font? = nil,
                borderColor: Color) {
        self.fontColor      = fontColor
        self.fontSize       = fontSize
        self.font           = font
        self.borderColor    = borderColor
    }
}
