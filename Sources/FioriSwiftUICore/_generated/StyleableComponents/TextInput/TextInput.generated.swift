// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TextInput {
    @Binding var textInputValue: String
    let onCommit: (() -> Void)?

    @Environment(\.textInputStyle) var style

    var componentIdentifier: String = TextInput.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(textInputValue: Binding<String> = .constant(""),
                onCommit: (() -> Void)? = nil,
                componentIdentifier: String? = TextInput.identifier)
    {
        self._textInputValue = textInputValue
        self.onCommit = onCommit
        self.componentIdentifier = componentIdentifier ?? TextInput.identifier
    }
}

public extension TextInput {
    static let identifier = "fiori_textinput_component"
}

public extension TextInput {
    init(_ configuration: TextInputConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TextInputConfiguration, shouldApplyDefaultStyle: Bool) {
        self._textInputValue = configuration.$textInputValue
        self.onCommit = configuration.onCommit
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TextInput: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, textInputValue: self.$textInputValue, onCommit: self.onCommit)).typeErased
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
        TextInput(.init(componentIdentifier: self.componentIdentifier, textInputValue: self.$textInputValue, onCommit: self.onCommit))
            .shouldApplyDefaultStyle(false)
            .textInputStyle(.fiori)
            .typeErased
    }
}
