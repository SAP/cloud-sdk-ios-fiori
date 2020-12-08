//
//  ImageStyle.swift
//  ThemingPrototype
//
//  Created by Stan Stadelman on 8/19/20.
//

import SwiftUI

public struct ImageStyle: IStyle, _StyleGenerating {
    typealias Concrete = Image
    public init() {}
    // sourcery: return_concrete
    var _renderingMode: Image.TemplateRenderingMode? = nil
    // sourcery: return_concrete
    var _interpolation: Image.Interpolation? = nil
    // sourcery: swiftui_view_mod_param = "_ isAntialiased: Bool"
    // sourcery: return_concrete
    var _antialiased: Bool? = nil
    // sourcery: swiftui_view_mod_param = "capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch"
    // sourcery: return_concrete
    var _resizable: (capInsets: EdgeInsets, resizingMode: Image.ResizingMode)?

}
