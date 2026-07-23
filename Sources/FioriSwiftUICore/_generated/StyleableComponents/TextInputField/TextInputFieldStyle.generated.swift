// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol TextInputFieldStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: TextInputFieldConfiguration) -> Body
}

struct AnyTextInputFieldStyle: TextInputFieldStyle {
    let content: (TextInputFieldConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TextInputFieldConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TextInputFieldConfiguration {
    public var componentIdentifier: String = "fiori_textinputfield_component"
    @Binding public var text: String
    public let isSecureEnabled: Bool?
    public let formatter: FormattedStringEditing?
}

extension TextInputFieldConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct TextInputFieldFioriStyle: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
    }
}

struct TextInputFieldDefaultStyle: TextInputFieldStyle {
    nonisolated init() {}

    func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .textInputFieldStyle(TextInputFieldFioriStyle())
            .modifier(TextInputFieldStyleModifier(style: TextInputFieldBaseStyle()))
    }
}
