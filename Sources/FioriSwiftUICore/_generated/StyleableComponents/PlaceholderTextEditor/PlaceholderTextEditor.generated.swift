// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct PlaceholderTextEditor {
    @Binding var text: String
    let placeholder: any View

    @Environment(\.placeholderTextEditorStyle) var style

    var componentIdentifier: String = PlaceholderTextEditor.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(text: Binding<String>,
                @ViewBuilder placeholder: () -> any View = { EmptyView() },
                componentIdentifier: String? = PlaceholderTextEditor.identifier)
    {
        self._text = text
        self.placeholder = Placeholder(placeholder: placeholder, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? PlaceholderTextEditor.identifier
    }
}

public extension PlaceholderTextEditor {
    static let identifier = "fiori_placeholdertexteditor_component"
}

public extension PlaceholderTextEditor {
    init(text: Binding<String>,
         placeholder: AttributedString? = nil,
         componentIdentifier: String? = PlaceholderTextEditor.identifier)
    {
        self.init(text: text, placeholder: { OptionalText(placeholder) }, componentIdentifier: componentIdentifier)
    }
}

public extension PlaceholderTextEditor {
    init(_ configuration: PlaceholderTextEditorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: PlaceholderTextEditorConfiguration, shouldApplyDefaultStyle: Bool) {
        self._text = configuration.$text
        self.placeholder = configuration.placeholder
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension PlaceholderTextEditor: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, text: self.$text, placeholder: .init(self.placeholder))).typeErased
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
        PlaceholderTextEditor(.init(componentIdentifier: self.componentIdentifier, text: self.$text, placeholder: .init(self.placeholder)))
            .shouldApplyDefaultStyle(false)
            .placeholderTextEditorStyle(PlaceholderTextEditorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
