// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TextInput {
    @Binding var textInputValue: String
    let onCommit: (() -> Void)?

    @Environment(\.textInputStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(textInputValue: Binding<String>,
                onCommit: (() -> Void)? = nil)
    {
        self._textInputValue = textInputValue
        self.onCommit = onCommit
    }
}

public extension TextInput {
    init(_ configuration: TextInputConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TextInputConfiguration, shouldApplyDefaultStyle: Bool) {
        self._textInputValue = configuration.$textInputValue
        self.onCommit = configuration.onCommit
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TextInput: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(textInputValue: self.$textInputValue, onCommit: self.onCommit)).typeErased
                .transformEnvironment(\.textInputStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TextInput {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TextInput(.init(textInputValue: self.$textInputValue, onCommit: self.onCommit))
            .shouldApplyDefaultStyle(false)
            .textInputStyle(TextInputFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
