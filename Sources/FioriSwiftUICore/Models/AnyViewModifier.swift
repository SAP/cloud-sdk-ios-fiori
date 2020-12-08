//
//  File.swift
//  
//
//  Created by Stan Stadelman on 10/8/20.
//

import SwiftUI

public struct AnyViewModifier: ViewModifier {
    var apply: (Content) -> AnyView
    var _concat: ((AnyViewModifier) -> AnyView)?
    
    public init<V: View>(_ transform: @escaping (Content) -> V) {
        self.apply = { AnyView(transform($0)) }
    }
    public func body(content: Content) -> AnyView {
        apply(content)
    }
}
