// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TitleFormView {
    @Binding var text: String
    var isSecureEnabled: Bool?
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

    @Environment(\.titleFormViewStyle) var style

    var componentIdentifier: String = TitleFormView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(text: Binding<String>,
                isSecureEnabled: Bool? = false,
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
                componentIdentifier: String? = TitleFormView.identifier)
    {
        self._text = text
        self.isSecureEnabled = isSecureEnabled
        self.placeholder = Placeholder(placeholder: placeholder, componentIdentifier: componentIdentifier)
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.maxTextLength = maxTextLength
        self.hintText = hintText
        self.hidesReadOnlyHint = hidesReadOnlyHint
        self.isCharCountEnabled = isCharCountEnabled
        self.allowsBeyondLimit = allowsBeyondLimit
        self.charCountReachLimitMessage = charCountReachLimitMessage
        self.charCountBeyondLimitMsg = charCountBeyondLimitMsg
        self.componentIdentifier = componentIdentifier ?? TitleFormView.identifier
    }
}

public extension TitleFormView {
    static let identifier = "fiori_titleformview_component"
}

public extension TitleFormView {
    init(text: Binding<String>,
         isSecureEnabled: Bool? = false,
         placeholder: AttributedString? = nil,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         maxTextLength: Int? = nil,
         hintText: AttributedString? = nil,
         hidesReadOnlyHint: Bool = false,
         isCharCountEnabled: Bool = false,
         allowsBeyondLimit: Bool = false,
         charCountReachLimitMessage: String? = nil,
         charCountBeyondLimitMsg: String? = nil)
    {
        self.init(text: text, isSecureEnabled: isSecureEnabled, placeholder: { OptionalText(placeholder) }, controlState: controlState, errorMessage: errorMessage, maxTextLength: maxTextLength, hintText: hintText, hidesReadOnlyHint: hidesReadOnlyHint, isCharCountEnabled: isCharCountEnabled, allowsBeyondLimit: allowsBeyondLimit, charCountReachLimitMessage: charCountReachLimitMessage, charCountBeyondLimitMsg: charCountBeyondLimitMsg)
    }
}

public extension TitleFormView {
    init(_ configuration: TitleFormViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TitleFormViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self._text = configuration.$text
        self.isSecureEnabled = configuration.isSecureEnabled
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
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TitleFormView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, text: self.$text, isSecureEnabled: self.isSecureEnabled, placeholder: .init(self.placeholder), controlState: self.controlState, errorMessage: self.errorMessage, maxTextLength: self.maxTextLength, hintText: self.hintText, hidesReadOnlyHint: self.hidesReadOnlyHint, isCharCountEnabled: self.isCharCountEnabled, allowsBeyondLimit: self.allowsBeyondLimit, charCountReachLimitMessage: self.charCountReachLimitMessage, charCountBeyondLimitMsg: self.charCountBeyondLimitMsg)).typeErased
                .transformEnvironment(\.titleFormViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TitleFormView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TitleFormView(.init(componentIdentifier: self.componentIdentifier, text: self.$text, isSecureEnabled: self.isSecureEnabled, placeholder: .init(self.placeholder), controlState: self.controlState, errorMessage: self.errorMessage, maxTextLength: self.maxTextLength, hintText: self.hintText, hidesReadOnlyHint: self.hidesReadOnlyHint, isCharCountEnabled: self.isCharCountEnabled, allowsBeyondLimit: self.allowsBeyondLimit, charCountReachLimitMessage: self.charCountReachLimitMessage, charCountBeyondLimitMsg: self.charCountBeyondLimitMsg))
            .shouldApplyDefaultStyle(false)
            .titleFormViewStyle(TitleFormViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
