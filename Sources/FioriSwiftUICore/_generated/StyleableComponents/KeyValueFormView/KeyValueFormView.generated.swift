// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct KeyValueFormView {
    let title: any View
    @Binding var text: String
    let placeholder: any View
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    /// The minimum height of the TextEditor. It needs to be greater than 44. Otherwise, it is ignored.
    let minTextEditorHeight: CGFloat?
    /// The maximum height of the TextEditor.
    let maxTextEditorHeight: CGFloat?
    /// The maximum length of the text.
    let maxTextLength: Int?
    /// The maximum length of the text. Default is no limit.
    let hintText: AttributedString?
    /// This property indicates if the read-only hint is to be hidden or not. Default is `false`.
    let hidesReadOnlyHint: Bool
    /// If `isCharCountEnabled` is true and `maxTextLenght` is not `nil`, the character count number and the `maxValueTextLength` will be shown. The character count number will be updated during editing. The default is `false`.
    let isCharCountEnabled: Bool
    /// If `allowsBeyondLimit` is `true`, it will allow the user to input continuously even after `maxValueTextLength` is reached. It will be in an error state with an error message and a semantic negative color. The default is false.
    let allowsBeyondLimit: Bool
    /// The custom error message when the character count limitation is reached. If this property is `nil`, the default localized message will be used.
    let charCountReachLimitMessage: String?
    /// The custom error message when the character count exceeds the limitation. If this property is `nil`, the default localized message will be used.
    let charCountBeyondLimitMsg: String?
    let mandatoryFieldIndicator: any View
    let isRequired: Bool

    @Environment(\.keyValueFormViewStyle) var style

    var componentIdentifier: String = KeyValueFormView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                text: Binding<String>,
                @ViewBuilder placeholder: () -> any View = { EmptyView() },
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                minTextEditorHeight: CGFloat? = nil,
                maxTextEditorHeight: CGFloat? = nil,
                maxTextLength: Int? = nil,
                hintText: AttributedString? = nil,
                hidesReadOnlyHint: Bool = false,
                isCharCountEnabled: Bool = false,
                allowsBeyondLimit: Bool = false,
                charCountReachLimitMessage: String? = nil,
                charCountBeyondLimitMsg: String? = nil,
                @ViewBuilder mandatoryFieldIndicator: () -> any View = { Text("*") },
                isRequired: Bool = false,
                componentIdentifier: String? = KeyValueFormView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self._text = text
        self.placeholder = Placeholder(placeholder: placeholder, componentIdentifier: componentIdentifier)
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
        self.mandatoryFieldIndicator = MandatoryFieldIndicator(mandatoryFieldIndicator: mandatoryFieldIndicator, componentIdentifier: componentIdentifier)
        self.isRequired = isRequired
        self.componentIdentifier = componentIdentifier ?? KeyValueFormView.identifier
    }
}

public extension KeyValueFormView {
    static let identifier = "fiori_keyvalueformview_component"
}

public extension KeyValueFormView {
    init(title: AttributedString,
         text: Binding<String>,
         placeholder: AttributedString? = nil,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         minTextEditorHeight: CGFloat? = nil,
         maxTextEditorHeight: CGFloat? = nil,
         maxTextLength: Int? = nil,
         hintText: AttributedString? = nil,
         hidesReadOnlyHint: Bool = false,
         isCharCountEnabled: Bool = false,
         allowsBeyondLimit: Bool = false,
         charCountReachLimitMessage: String? = nil,
         charCountBeyondLimitMsg: String? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         componentIdentifier: String? = KeyValueFormView.identifier)
    {
        self.init(title: { Text(title) }, text: text, placeholder: { OptionalText(placeholder) }, controlState: controlState, errorMessage: errorMessage, minTextEditorHeight: minTextEditorHeight, maxTextEditorHeight: maxTextEditorHeight, maxTextLength: maxTextLength, hintText: hintText, hidesReadOnlyHint: hidesReadOnlyHint, isCharCountEnabled: isCharCountEnabled, allowsBeyondLimit: allowsBeyondLimit, charCountReachLimitMessage: charCountReachLimitMessage, charCountBeyondLimitMsg: charCountBeyondLimitMsg, mandatoryFieldIndicator: { TextOrIconView(mandatoryFieldIndicator) }, isRequired: isRequired, componentIdentifier: componentIdentifier)
    }
}

public extension KeyValueFormView {
    init(_ configuration: KeyValueFormViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KeyValueFormViewConfiguration, shouldApplyDefaultStyle: Bool) {
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
        self.mandatoryFieldIndicator = configuration.mandatoryFieldIndicator
        self.isRequired = configuration.isRequired
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension KeyValueFormView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), text: self.$text, placeholder: .init(self.placeholder), controlState: self.controlState, errorMessage: self.errorMessage, minTextEditorHeight: self.minTextEditorHeight, maxTextEditorHeight: self.maxTextEditorHeight, maxTextLength: self.maxTextLength, hintText: self.hintText, hidesReadOnlyHint: self.hidesReadOnlyHint, isCharCountEnabled: self.isCharCountEnabled, allowsBeyondLimit: self.allowsBeyondLimit, charCountReachLimitMessage: self.charCountReachLimitMessage, charCountBeyondLimitMsg: self.charCountBeyondLimitMsg, mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator), isRequired: self.isRequired)).typeErased
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
        KeyValueFormView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), text: self.$text, placeholder: .init(self.placeholder), controlState: self.controlState, errorMessage: self.errorMessage, minTextEditorHeight: self.minTextEditorHeight, maxTextEditorHeight: self.maxTextEditorHeight, maxTextLength: self.maxTextLength, hintText: self.hintText, hidesReadOnlyHint: self.hidesReadOnlyHint, isCharCountEnabled: self.isCharCountEnabled, allowsBeyondLimit: self.allowsBeyondLimit, charCountReachLimitMessage: self.charCountReachLimitMessage, charCountBeyondLimitMsg: self.charCountBeyondLimitMsg, mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator), isRequired: self.isRequired))
            .shouldApplyDefaultStyle(false)
            .keyValueFormViewStyle(KeyValueFormViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
