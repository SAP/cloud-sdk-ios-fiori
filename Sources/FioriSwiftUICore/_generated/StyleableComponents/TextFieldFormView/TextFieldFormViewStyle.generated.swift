// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol TextFieldFormViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TextFieldFormViewConfiguration) -> Body
}

struct AnyTextFieldFormViewStyle: TextFieldFormViewStyle {
    let content: (TextFieldFormViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TextFieldFormViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TextFieldFormViewConfiguration {
    public let contentIdentifier = "FioriTextFieldFormView_content"
    public let titleIdentifier = "FioriTextFieldFormView_title"
    public let textInputFieldIdentifier = "FioriTextFieldFormView_textInputField"
    public let placeholderIdentifier = "FioriTextFieldFormView_placeholder"
    public let mandatoryFieldIndicatorIdentifier = "FioriTextFieldFormView_mandatoryFieldIndicator"
    public let titleFormViewIdentifier = "FioriTextFieldFormView_titleFormView"

    public let title: Title
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
    public let mandatoryFieldIndicator: MandatoryFieldIndicator
    public let isRequired: Bool
    public let actionIcon: Image?
    public let action: (() -> Void)?
    public let actionIconAccessibilityLabel: String?

    public typealias Title = ConfigurationViewWrapper
    public typealias Placeholder = ConfigurationViewWrapper
    public typealias MandatoryFieldIndicator = ConfigurationViewWrapper
}

public struct TextFieldFormViewFioriStyle: TextFieldFormViewStyle {
    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .titleStyle(TitleFioriStyle(textFieldFormViewConfiguration: configuration))
            .textInputFieldStyle(TextInputFieldFioriStyle(textFieldFormViewConfiguration: configuration))
            .placeholderStyle(PlaceholderFioriStyle(textFieldFormViewConfiguration: configuration))
            .mandatoryFieldIndicatorStyle(MandatoryFieldIndicatorFioriStyle(textFieldFormViewConfiguration: configuration))
            .titleFormViewStyle(TitleFormViewFioriStyle(textFieldFormViewConfiguration: configuration))
    }
}

public struct TextFieldFormViewNSSStyle: TextFieldFormViewStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .titleStyle(TitleNSSStyle(textFieldFormViewConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .textInputFieldStyle(TextInputFieldNSSStyle(textFieldFormViewConfiguration: configuration, nssData: self.data.value(configuration.textInputFieldIdentifier)))
            .placeholderStyle(PlaceholderNSSStyle(textFieldFormViewConfiguration: configuration, nssData: self.data.value(configuration.placeholderIdentifier)))
            .mandatoryFieldIndicatorStyle(MandatoryFieldIndicatorNSSStyle(textFieldFormViewConfiguration: configuration, nssData: self.data.value(configuration.mandatoryFieldIndicatorIdentifier)))
            .titleFormViewStyle(TitleFormViewNSSStyle(textFieldFormViewConfiguration: configuration, nssData: self.data.value(configuration.titleFormViewIdentifier)))
            .textFieldFormViewStyle(ContentNSSStyle(textFieldFormViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
