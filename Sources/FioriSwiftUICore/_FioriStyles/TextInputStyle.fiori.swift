import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment the following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

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
