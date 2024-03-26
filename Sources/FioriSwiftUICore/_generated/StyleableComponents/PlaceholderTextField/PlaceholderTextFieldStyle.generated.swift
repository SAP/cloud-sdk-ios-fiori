// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol PlaceholderTextFieldStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> Body
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
    @Binding public var text: String
    public let placeholder: Placeholder

    public typealias Placeholder = ConfigurationViewWrapper
}

public struct PlaceholderTextFieldFioriStyle: PlaceholderTextFieldStyle {
    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        PlaceholderTextField(configuration)
            .textInputFieldStyle(TextInputFieldFioriStyle())
            .placeholderStyle(PlaceholderFioriStyle())
    }
}
