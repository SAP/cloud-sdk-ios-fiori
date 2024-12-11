// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol TitleFormViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TitleFormViewConfiguration) -> Body
}

struct AnyTitleFormViewStyle: TitleFormViewStyle {
    let content: (TitleFormViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TitleFormViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TitleFormViewConfiguration {
    public let contentIdentifier = "FioriTitleFormView_content"
    public let textInputFieldIdentifier = "FioriTitleFormView_textInputField"
    public let placeholderIdentifier = "FioriTitleFormView_placeholder"
    public let placeholderTextFieldIdentifier = "FioriTitleFormView_placeholderTextField"
    public let formViewIdentifier = "FioriTitleFormView_formView"

    @Binding public var text: String
    public let placeholder: Placeholder
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    public let maxTextLength: Int?
    public let hintText: AttributedString?
    public let hidesReadOnlyHint: Bool
    public let isCharCountEnabled: Bool
    public let allowsBeyondLimit: Bool
    public let charCountReachLimitMessage: String?
    public let charCountBeyondLimitMsg: String?

    public typealias Placeholder = ConfigurationViewWrapper
}

public struct TitleFormViewFioriStyle: TitleFormViewStyle {
    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .textInputFieldStyle(TextInputFieldFioriStyle(titleFormViewConfiguration: configuration))
            .placeholderStyle(PlaceholderFioriStyle(titleFormViewConfiguration: configuration))
            .placeholderTextFieldStyle(PlaceholderTextFieldFioriStyle(titleFormViewConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(titleFormViewConfiguration: configuration))
    }
}

public struct TitleFormViewNSSStyle: TitleFormViewStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .textInputFieldStyle(TextInputFieldNSSStyle(titleFormViewConfiguration: configuration, nssData: self.data.value(configuration.textInputFieldIdentifier)))
            .placeholderStyle(PlaceholderNSSStyle(titleFormViewConfiguration: configuration, nssData: self.data.value(configuration.placeholderIdentifier)))
            .placeholderTextFieldStyle(PlaceholderTextFieldNSSStyle(titleFormViewConfiguration: configuration, nssData: self.data.value(configuration.placeholderTextFieldIdentifier)))
            .formViewStyle(FormViewNSSStyle(titleFormViewConfiguration: configuration, nssData: self.data.value(configuration.formViewIdentifier)))
            .titleFormViewStyle(ContentNSSStyle(titleFormViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
