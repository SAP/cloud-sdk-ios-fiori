// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct PlaceholderTextField {
    @Binding var text: String
    let placeholder: any View

    @Environment(\.placeholderTextFieldStyle) var style

    var componentIdentifier: String = PlaceholderTextField.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(text: Binding<String>,
                @ViewBuilder placeholder: () -> any View = { EmptyView() },
                componentIdentifier: String? = PlaceholderTextField.identifier)
    {
        self._text = text
        self.placeholder = Placeholder(placeholder: placeholder, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? PlaceholderTextField.identifier
    }
}

public extension PlaceholderTextField {
    static let identifier = "fiori_placeholdertextfield_component"
}

public extension PlaceholderTextField {
    init(text: Binding<String>,
         placeholder: AttributedString? = nil)
    {
        self.init(text: text, placeholder: { OptionalText(placeholder) })
    }
}

public extension PlaceholderTextField {
    init(_ configuration: PlaceholderTextFieldConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: PlaceholderTextFieldConfiguration, shouldApplyDefaultStyle: Bool) {
        self._text = configuration.$text
        self.placeholder = configuration.placeholder
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension PlaceholderTextField: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, text: self.$text, placeholder: .init(self.placeholder))).typeErased
                .transformEnvironment(\.placeholderTextFieldStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension PlaceholderTextField {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        PlaceholderTextField(.init(componentIdentifier: self.componentIdentifier, text: self.$text, placeholder: .init(self.placeholder)))
            .shouldApplyDefaultStyle(false)
            .placeholderTextFieldStyle(PlaceholderTextFieldFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
