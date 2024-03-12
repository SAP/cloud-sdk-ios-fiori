// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct PlaceholderTextEditor {
    @Binding var text: String
    let placeholder: any View

    @Environment(\.placeholderTextEditorStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(text: Binding<String>,
                @ViewBuilder placeholder: () -> any View = { EmptyView() })
    {
        self._text = text
        self.placeholder = Placeholder { placeholder() }
    }
}

public extension PlaceholderTextEditor {
    init(text: Binding<String>,
         placeholder: AttributedString? = nil)
    {
        self.init(text: text, placeholder: { OptionalText(placeholder) })
    }
}

public extension PlaceholderTextEditor {
    init(_ configuration: PlaceholderTextEditorConfiguration) {
        self._text = configuration.$text
        self.placeholder = configuration.placeholder
        self._shouldApplyDefaultStyle = false
    }
}

extension PlaceholderTextEditor: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(text: self.$text, placeholder: .init(self.placeholder))).typeErased
                .transformEnvironment(\.placeholderTextEditorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension PlaceholderTextEditor {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        PlaceholderTextEditor(.init(text: self.$text, placeholder: .init(self.placeholder)))
            .shouldApplyDefaultStyle(false)
            .placeholderTextEditorStyle(PlaceholderTextEditorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
