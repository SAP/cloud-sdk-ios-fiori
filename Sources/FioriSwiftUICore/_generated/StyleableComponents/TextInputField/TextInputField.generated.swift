// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TextInputField {
    @Binding var text: String
    var isSecureEnabled: Bool?

    @Environment(\.textInputFieldStyle) var style

    var componentIdentifier: String = TextInputField.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(text: Binding<String>,
                isSecureEnabled: Bool? = false,
                componentIdentifier: String? = TextInputField.identifier)
    {
        self._text = text
        self.isSecureEnabled = isSecureEnabled
        self.componentIdentifier = componentIdentifier ?? TextInputField.identifier
    }
}

public extension TextInputField {
    static let identifier = "fiori_textinputfield_component"
}

public extension TextInputField {
    init(_ configuration: TextInputFieldConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TextInputFieldConfiguration, shouldApplyDefaultStyle: Bool) {
        self._text = configuration.$text
        self.isSecureEnabled = configuration.isSecureEnabled
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TextInputField: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, text: self.$text, isSecureEnabled: self.isSecureEnabled)).typeErased
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
        TextInputField(.init(componentIdentifier: self.componentIdentifier, text: self.$text, isSecureEnabled: self.isSecureEnabled))
            .shouldApplyDefaultStyle(false)
            .textInputFieldStyle(TextInputFieldFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
