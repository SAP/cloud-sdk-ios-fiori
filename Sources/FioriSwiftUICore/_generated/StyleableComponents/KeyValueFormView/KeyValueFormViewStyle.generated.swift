// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol KeyValueFormViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: KeyValueFormViewConfiguration) -> Body
}

struct AnyKeyValueFormViewStyle: KeyValueFormViewStyle {
    let content: (KeyValueFormViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KeyValueFormViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KeyValueFormViewConfiguration {
    public var componentIdentifier: String = "fiori_keyvalueformview_component"
    public let title: Title
    @Binding public var text: String
    public let placeholder: Placeholder
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    public let minTextEditorHeight: CGFloat?
    public let maxTextEditorHeight: CGFloat?
    public let maxTextLength: Int?
    public let hintText: AttributedString?
    public let hidesReadOnlyHint: Bool
    public let isCharCountEnabled: Bool
    public let allowsBeyondLimit: Bool
    public let charCountReachLimitMessage: String?
    public let charCountBeyondLimitMsg: String?

    public typealias Title = ConfigurationViewWrapper
    public typealias Placeholder = ConfigurationViewWrapper
}

extension KeyValueFormViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct KeyValueFormViewFioriStyle: KeyValueFormViewStyle {
    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .titleStyle(TitleFioriStyle(keyValueFormViewConfiguration: configuration))
            .textViewStyle(TextViewFioriStyle(keyValueFormViewConfiguration: configuration))
            .placeholderStyle(PlaceholderFioriStyle(keyValueFormViewConfiguration: configuration))
            .noteFormViewStyle(NoteFormViewFioriStyle(keyValueFormViewConfiguration: configuration))
    }
}
