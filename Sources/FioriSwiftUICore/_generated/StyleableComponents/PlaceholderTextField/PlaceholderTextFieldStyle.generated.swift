// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol PlaceholderTextFieldStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> Body
}

struct AnyPlaceholderTextFieldStyle: PlaceholderTextFieldStyle {
    let content: (PlaceholderTextFieldConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (PlaceholderTextFieldConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct PlaceholderTextFieldConfiguration {
    public var componentIdentifier: String = "fiori_placeholdertextfield_component"
    @Binding public var text: String
    public let isSecureEnabled: Bool?
    public let formatter: FormattedStringEditing?
    public let placeholder: Placeholder

    public typealias Placeholder = ConfigurationViewWrapper
}

extension PlaceholderTextFieldConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct PlaceholderTextFieldFioriStyle: PlaceholderTextFieldStyle {
    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        PlaceholderTextField(configuration)
            .placeholderStyle(PlaceholderFioriStyle(placeholderTextFieldConfiguration: configuration))
            .textInputFieldStyle(TextInputFieldFioriStyle(placeholderTextFieldConfiguration: configuration))
    }
}

struct PlaceholderTextFieldDefaultStyle: PlaceholderTextFieldStyle {
    nonisolated init() {}

    func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        PlaceholderTextField(configuration)
            .placeholderTextFieldStyle(PlaceholderTextFieldFioriStyle())
            .modifier(PlaceholderTextFieldStyleModifier(style: PlaceholderTextFieldBaseStyle()))
    }
}
