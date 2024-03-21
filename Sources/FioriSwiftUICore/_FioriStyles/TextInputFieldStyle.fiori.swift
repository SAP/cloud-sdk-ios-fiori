import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TextInputField`.
public struct TextInputFieldBaseStyle: TextInputFieldStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextField("", text: configuration.$text)
    }
}

// Default fiori styles
public struct TextInputFieldFioriStyle: TextInputFieldStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .frame(minHeight: 44)
    }
}
