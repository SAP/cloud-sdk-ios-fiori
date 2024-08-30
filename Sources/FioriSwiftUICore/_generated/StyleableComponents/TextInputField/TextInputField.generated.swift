// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TextInputField {
    @Binding var text: String

    @Environment(\.textInputFieldStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(text: Binding<String>) {
        self._text = text
    }
}

public extension TextInputField {
    init(_ configuration: TextInputFieldConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TextInputFieldConfiguration, shouldApplyDefaultStyle: Bool) {
        self._text = configuration.$text
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TextInputField: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(text: self.$text)).typeErased
                .transformEnvironment(\.textInputFieldStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TextInputField {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TextInputField(.init(text: self.$text))
            .shouldApplyDefaultStyle(false)
            .textInputFieldStyle(.fiori)
            .typeErased
    }
}
