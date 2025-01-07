import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TextInputBaseStyle: TextInputStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TextInputConfiguration) -> some View {
        // Add default layout here
        TextField("Default",
                  text: configuration.$textInputValue,
                  onCommit: configuration.onCommit ?? {})
    }
}

// Default fiori styles
public struct TextInputFioriStyle: TextInputStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TextInputConfiguration) -> some View {
        TextInput(configuration)
            .modifier(TextFieldClearButton(textValue: configuration.$textInputValue))
            .textFieldStyle(BottomTextFieldStyle())
            .font(.fiori(forTextStyle: .body))
            .foregroundColor(.preferredColor(.primaryLabel))
    }
}
