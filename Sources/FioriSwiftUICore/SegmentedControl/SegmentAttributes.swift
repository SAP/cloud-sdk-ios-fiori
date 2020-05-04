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
    public var font: UIFont?
    public var borderColor: Color?
    
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
