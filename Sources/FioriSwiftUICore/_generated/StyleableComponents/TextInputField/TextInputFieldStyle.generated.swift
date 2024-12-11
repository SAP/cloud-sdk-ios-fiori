// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol TextInputFieldStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TextInputFieldConfiguration) -> Body
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
    public let textInputFieldIdentifier = "FioriTextInputField_content"

    @Binding public var text: String
}
