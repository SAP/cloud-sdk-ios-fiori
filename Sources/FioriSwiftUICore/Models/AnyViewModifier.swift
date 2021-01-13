// https://github.com/objcio/S01E220-swiftui-slides-styling-elements-with-view-modifiers/blob/16d3aefacc8acbb4931c6fb3e43975adf0f22f7d/Slides/ContentView.swift#L156

// See https://talk.objc.io/episodes/S01E220-swiftui-slides-styling-elements-with-view-modifiers for further explanation

import SwiftUI

public struct AnyViewModifier: ViewModifier {
    var apply: (Content) -> AnyView
    var _concat: ((AnyViewModifier) -> AnyView)?
    
    public init<V: View>(_ transform: @escaping (Content) -> V) {
        self.apply = { AnyView(transform($0)) }
    }

    public func body(content: Content) -> AnyView {
        self.apply(content)
    }
}
