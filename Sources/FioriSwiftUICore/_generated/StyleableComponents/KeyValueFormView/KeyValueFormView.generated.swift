// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct KeyValueFormView {
    let title: any View
    @Binding var text: String
    let placeholder: any View
    let controlState: ControlState?
    let errorMessage: AttributedString?
    let minTextEditorHeight: CGFloat?
    let maxTextEditorHeight: CGFloat?
    let maxTextLength: Int?
    let hintText: AttributedString?
    let hidesReadOnlyHint: Bool?
    let isCharCountEnabled: Bool?
    let allowsBeyondLimit: Bool?
    let charCountReachLimitMessage: String?
    let charCountBeyondLimitMsg: String?

    @Environment(\.keyValueFormViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                text: Binding<String>,
                @ViewBuilder placeholder: () -> any View = { EmptyView() },
                controlState: ControlState? = nil,
                errorMessage: AttributedString? = nil,
                minTextEditorHeight: CGFloat? = nil,
                maxTextEditorHeight: CGFloat? = nil,
                maxTextLength: Int? = nil,
                hintText: AttributedString? = nil,
                hidesReadOnlyHint: Bool? = nil,
                isCharCountEnabled: Bool? = nil,
                allowsBeyondLimit: Bool? = nil,
                charCountReachLimitMessage: String? = nil,
                charCountBeyondLimitMsg: String? = nil)
    {
        self.title = Title { title() }
        self._text = text
        self.placeholder = Placeholder { placeholder() }
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.minTextEditorHeight = minTextEditorHeight
        self.maxTextEditorHeight = maxTextEditorHeight
        self.maxTextLength = maxTextLength
        self.hintText = hintText
        self.hidesReadOnlyHint = hidesReadOnlyHint
        self.isCharCountEnabled = isCharCountEnabled
        self.allowsBeyondLimit = allowsBeyondLimit
        self.charCountReachLimitMessage = charCountReachLimitMessage
        self.charCountBeyondLimitMsg = charCountBeyondLimitMsg
    }
}

public extension KeyValueFormView {
    init(title: AttributedString,
         text: Binding<String>,
         placeholder: AttributedString? = nil,
         controlState: ControlState? = nil,
         errorMessage: AttributedString? = nil,
         minTextEditorHeight: CGFloat? = nil,
         maxTextEditorHeight: CGFloat? = nil,
         maxTextLength: Int? = nil,
         hintText: AttributedString? = nil,
         hidesReadOnlyHint: Bool? = nil,
         isCharCountEnabled: Bool? = nil,
         allowsBeyondLimit: Bool? = nil,
         charCountReachLimitMessage: String? = nil,
         charCountBeyondLimitMsg: String? = nil)
    {
        self.init(title: { Text(title) }, text: text, placeholder: { OptionalText(placeholder) }, controlState: controlState, errorMessage: errorMessage, minTextEditorHeight: minTextEditorHeight, maxTextEditorHeight: maxTextEditorHeight, maxTextLength: maxTextLength, hintText: hintText, hidesReadOnlyHint: hidesReadOnlyHint, isCharCountEnabled: isCharCountEnabled, allowsBeyondLimit: allowsBeyondLimit, charCountReachLimitMessage: charCountReachLimitMessage, charCountBeyondLimitMsg: charCountBeyondLimitMsg)
    }
}

public extension KeyValueFormView {
    init(_ configuration: KeyValueFormViewConfiguration) {
        self.title = configuration.title
        self._text = configuration.$text
        self.placeholder = configuration.placeholder
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self.minTextEditorHeight = configuration.minTextEditorHeight
        self.maxTextEditorHeight = configuration.maxTextEditorHeight
        self.maxTextLength = configuration.maxTextLength
        self.hintText = configuration.hintText
        self.hidesReadOnlyHint = configuration.hidesReadOnlyHint
        self.isCharCountEnabled = configuration.isCharCountEnabled
        self.allowsBeyondLimit = configuration.allowsBeyondLimit
        self.charCountReachLimitMessage = configuration.charCountReachLimitMessage
        self.charCountBeyondLimitMsg = configuration.charCountBeyondLimitMsg
        self._shouldApplyDefaultStyle = false
    }
}

extension KeyValueFormView: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(title: .init(self.title), text: self.$text, placeholder: .init(self.placeholder), controlState: self.controlState, errorMessage: self.errorMessage, minTextEditorHeight: self.minTextEditorHeight, maxTextEditorHeight: self.maxTextEditorHeight, maxTextLength: self.maxTextLength, hintText: self.hintText, hidesReadOnlyHint: self.hidesReadOnlyHint, isCharCountEnabled: self.isCharCountEnabled, allowsBeyondLimit: self.allowsBeyondLimit, charCountReachLimitMessage: self.charCountReachLimitMessage, charCountBeyondLimitMsg: self.charCountBeyondLimitMsg)).typeErased
                .transformEnvironment(\.keyValueFormViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension KeyValueFormView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        KeyValueFormView(.init(title: .init(self.title), text: self.$text, placeholder: .init(self.placeholder), controlState: self.controlState, errorMessage: self.errorMessage, minTextEditorHeight: self.minTextEditorHeight, maxTextEditorHeight: self.maxTextEditorHeight, maxTextLength: self.maxTextLength, hintText: self.hintText, hidesReadOnlyHint: self.hidesReadOnlyHint, isCharCountEnabled: self.isCharCountEnabled, allowsBeyondLimit: self.allowsBeyondLimit, charCountReachLimitMessage: self.charCountReachLimitMessage, charCountBeyondLimitMsg: self.charCountBeyondLimitMsg))
            .shouldApplyDefaultStyle(false)
            .keyValueFormViewStyle(KeyValueFormViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
