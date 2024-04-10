// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol PlaceholderTextEditorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> Body
}

struct AnyPlaceholderTextEditorStyle: PlaceholderTextEditorStyle {
    let content: (PlaceholderTextEditorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (PlaceholderTextEditorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct PlaceholderTextEditorConfiguration {
    @Binding public var text: String
    public let placeholder: Placeholder

    public typealias Placeholder = ConfigurationViewWrapper
}

public struct PlaceholderTextEditorFioriStyle: PlaceholderTextEditorStyle {
    public func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
        PlaceholderTextEditor(configuration)
            .textViewStyle(TextViewFioriStyle(placeholderTextEditorConfiguration: configuration))
            .placeholderStyle(PlaceholderFioriStyle(placeholderTextEditorConfiguration: configuration))
    }
}
