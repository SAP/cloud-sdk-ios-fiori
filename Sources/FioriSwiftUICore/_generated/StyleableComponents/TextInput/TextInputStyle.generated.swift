// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TextInputStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TextInputConfiguration) -> Body
}

struct AnyTextInputStyle: TextInputStyle {
    let content: (TextInputConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TextInputConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TextInputConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TextInputConfiguration {
    public var componentIdentifier: String = "fiori_textinput_component"
    @Binding public var textInputValue: String
    public let onCommit: (() -> Void)?
}

extension TextInputConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
