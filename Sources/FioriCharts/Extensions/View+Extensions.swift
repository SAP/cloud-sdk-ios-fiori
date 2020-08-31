//
//  View+Extensions.swift
//  
//
//  Created by Xu, Sheng on 8/26/20.
//

import Foundation
import SwiftUI

extension View {
    func ifApply<Content: View>(_ conditinal: Bool, content: (Self) -> Content) -> some View {
        if conditinal {
            return AnyView(content(self))
        } else {
            return AnyView(self)
        }
    }
    
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            return AnyView(content(self))
        } else {
            return AnyView(self)
        }
    }
}
