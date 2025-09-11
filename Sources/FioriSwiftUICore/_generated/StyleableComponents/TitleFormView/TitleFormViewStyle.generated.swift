// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    public var componentIdentifier: String = "fiori_titleformview_component"
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

    public typealias Placeholder = ConfigurationViewWrapper
}

extension TitleFormViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct TitleFormViewFioriStyle: TitleFormViewStyle {
    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .placeholderStyle(PlaceholderFioriStyle(titleFormViewConfiguration: configuration))
            .placeholderTextFieldStyle(PlaceholderTextFieldFioriStyle(titleFormViewConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(titleFormViewConfiguration: configuration))
    }
}
