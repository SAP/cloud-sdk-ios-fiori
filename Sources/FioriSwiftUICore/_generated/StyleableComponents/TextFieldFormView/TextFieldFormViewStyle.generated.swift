// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    public var componentIdentifier: String = "fiori_textfieldformview_component"
    public let title: Title
    @Binding public var text: String
    public let isSecureEnabled: Bool?
    public let formatter: GenericTextFormatter?
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
    public let actionIcon: Image?
    public let action: (() -> Void)?
    public let actionIconAccessibilityLabel: String?

    public typealias Title = ConfigurationViewWrapper
    public typealias Placeholder = ConfigurationViewWrapper
}

extension TextFieldFormViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct TextFieldFormViewFioriStyle: TextFieldFormViewStyle {
    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .titleStyle(TitleFioriStyle(textFieldFormViewConfiguration: configuration))
            .placeholderStyle(PlaceholderFioriStyle(textFieldFormViewConfiguration: configuration))
            .titleFormViewStyle(TitleFormViewFioriStyle(textFieldFormViewConfiguration: configuration))
    }
}
