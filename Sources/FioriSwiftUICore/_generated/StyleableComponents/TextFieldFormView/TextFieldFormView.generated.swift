// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TextFieldFormView {
    let title: any View
    @Binding var text: String
    let placeholder: any View
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    /// The maximum length of the text. Default is no limit.
    let maxTextLength: Int?
    /// The hint text.
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
    /// The icon for the action button.
    let actionIcon: Image?
    /// The action to be performed when the action button is tapped.
    let action: (() -> Void)?

    @Environment(\.textFieldFormViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                text: Binding<String>,
                @ViewBuilder placeholder: () -> any View = { EmptyView() },
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                maxTextLength: Int? = nil,
                hintText: AttributedString? = nil,
                hidesReadOnlyHint: Bool = false,
                isCharCountEnabled: Bool = false,
                allowsBeyondLimit: Bool = false,
                charCountReachLimitMessage: String? = nil,
                charCountBeyondLimitMsg: String? = nil,
                actionIcon: Image? = nil,
                action: (() -> Void)? = nil)
    {
        self.title = Title { title() }
        self._text = text
        self.placeholder = Placeholder { placeholder() }
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.maxTextLength = maxTextLength
        self.hintText = hintText
        self.hidesReadOnlyHint = hidesReadOnlyHint
        self.isCharCountEnabled = isCharCountEnabled
        self.allowsBeyondLimit = allowsBeyondLimit
        self.charCountReachLimitMessage = charCountReachLimitMessage
        self.charCountBeyondLimitMsg = charCountBeyondLimitMsg
        self.actionIcon = actionIcon
        self.action = action
    }
}

public extension TextFieldFormView {
    init(title: AttributedString,
         text: Binding<String>,
         placeholder: AttributedString? = nil,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         maxTextLength: Int? = nil,
         hintText: AttributedString? = nil,
         hidesReadOnlyHint: Bool = false,
         isCharCountEnabled: Bool = false,
         allowsBeyondLimit: Bool = false,
         charCountReachLimitMessage: String? = nil,
         charCountBeyondLimitMsg: String? = nil,
         actionIcon: Image? = nil,
         action: (() -> Void)? = nil)
    {
        self.init(title: { Text(title) }, text: text, placeholder: { OptionalText(placeholder) }, controlState: controlState, errorMessage: errorMessage, maxTextLength: maxTextLength, hintText: hintText, hidesReadOnlyHint: hidesReadOnlyHint, isCharCountEnabled: isCharCountEnabled, allowsBeyondLimit: allowsBeyondLimit, charCountReachLimitMessage: charCountReachLimitMessage, charCountBeyondLimitMsg: charCountBeyondLimitMsg, actionIcon: actionIcon, action: action)
    }
}

public extension TextFieldFormView {
    init(_ configuration: TextFieldFormViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TextFieldFormViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self._text = configuration.$text
        self.placeholder = configuration.placeholder
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self.maxTextLength = configuration.maxTextLength
        self.hintText = configuration.hintText
        self.hidesReadOnlyHint = configuration.hidesReadOnlyHint
        self.isCharCountEnabled = configuration.isCharCountEnabled
        self.allowsBeyondLimit = configuration.allowsBeyondLimit
        self.charCountReachLimitMessage = configuration.charCountReachLimitMessage
        self.charCountBeyondLimitMsg = configuration.charCountBeyondLimitMsg
        self.actionIcon = configuration.actionIcon
        self.action = configuration.action
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TextFieldFormView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), text: self.$text, placeholder: .init(self.placeholder), controlState: self.controlState, errorMessage: self.errorMessage, maxTextLength: self.maxTextLength, hintText: self.hintText, hidesReadOnlyHint: self.hidesReadOnlyHint, isCharCountEnabled: self.isCharCountEnabled, allowsBeyondLimit: self.allowsBeyondLimit, charCountReachLimitMessage: self.charCountReachLimitMessage, charCountBeyondLimitMsg: self.charCountBeyondLimitMsg, actionIcon: self.actionIcon, action: self.action)).typeErased
                .transformEnvironment(\.textFieldFormViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TextFieldFormView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TextFieldFormView(.init(title: .init(self.title), text: self.$text, placeholder: .init(self.placeholder), controlState: self.controlState, errorMessage: self.errorMessage, maxTextLength: self.maxTextLength, hintText: self.hintText, hidesReadOnlyHint: self.hidesReadOnlyHint, isCharCountEnabled: self.isCharCountEnabled, allowsBeyondLimit: self.allowsBeyondLimit, charCountReachLimitMessage: self.charCountReachLimitMessage, charCountBeyondLimitMsg: self.charCountBeyondLimitMsg, actionIcon: self.actionIcon, action: self.action))
            .shouldApplyDefaultStyle(false)
            .textFieldFormViewStyle(TextFieldFormViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
