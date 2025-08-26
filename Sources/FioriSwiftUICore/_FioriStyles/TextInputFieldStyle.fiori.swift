import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TextInputField`.
public struct TextInputFieldBaseStyle: TextInputFieldStyle {
    @State var isSecure: Bool = false
    @ViewBuilder
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        if configuration.isSecureEnabled ?? false {
            HStack {
                if self.isSecure {
                    TextField("", text: configuration.$text)
                } else {
                    SecureField("", text: configuration.$text)
                }
            }
            .overlay(alignment: .trailing) {
                Image(systemName: self.isSecure ? "eye.fill" : "eye.slash.fill")
                    .onTapGesture {
                        self.isSecure.toggle()
                    }
            }
        } else {
            TextField("", text: configuration.$text)
        }
    }
}

/// Default fiori styles
extension TextInputFieldFioriStyle {
    struct ContentFioriStyle: TextInputFieldStyle {
        @ViewBuilder
        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            if configuration.formatter != nil {
                TextInputFieldGenericTextStyle().makeBody(configuration)
                    .frame(minHeight: 44)
            } else {
                TextInputField(configuration)
                    .frame(minHeight: 44)
            }
        }
    }
}

/// Decimal style
public struct TextInputFieldDecimalStyle: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .frame(minHeight: 44)
            .keyboardType(.decimalPad)
            .setOnChange(of: configuration.text, action1: { newValue in
                self.updateText(value: newValue, configuration: configuration)
            }) { _, newValue in
                self.updateText(value: newValue, configuration: configuration)
            }
    }
    
    private func updateText(value: String, configuration: TextInputFieldConfiguration) {
        var result = ""
        var hasDecimalPoint = false
        
        for char in value {
            if char.isNumber {
                result.append(char)
            } else if char == ".", !hasDecimalPoint {
                result.append(char)
                hasDecimalPoint = true
            }
        }
        configuration.text = result
    }
}

/// Integer number style
public struct TextInputFieldNumberStyle: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .frame(minHeight: 44)
            .keyboardType(.numberPad)
            .setOnChange(of: configuration.text, action1: { newValue in
                let filtered = newValue.filter(\.isNumber)
                if filtered != newValue {
                    configuration.text = filtered
                }
            }) { _, newValue in
                let filtered = newValue.filter(\.isNumber)
                if filtered != newValue {
                    configuration.text = filtered
                }
            }
    }
}

public struct TextInputFieldGenericTextStyle: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .frame(minHeight: 44)
            .keyboardType(.default)
            .setOnChange(of: configuration.text, action1: { newValue in
                self.updateText(value: newValue, configuration: configuration)
            }) { oldValue, newValue in
                guard let formatter = configuration.formatter else {
                    return
                }
                let deleteCharacter = oldValue.count > newValue.count

                if abs(oldValue.count - newValue.count) > 1 {
                    // Handle cases of multiple fixed characters insertion after formatting
                    // or copy-paste/direct assignment
                    // or high-speed/rapid input
                    if formatter.formatted {
                        formatter.formatted = false
                        return
                    }
                    self.formatString(for: newValue, cursorPosition: oldValue.count, configuration: configuration)
                    formatter.formatted = false
                    return
                }
                if deleteCharacter, newValue.isEmpty {
                    let _ = formatter.editingString(for: "")
                }
                let processValue = deleteCharacter ? oldValue : newValue
                self.updateText(value: processValue, configuration: configuration, deleteCharacter: deleteCharacter)
            }
    }
    
    private func updateText(value: String, configuration: TextInputFieldConfiguration, deleteCharacter: Bool = false) {
        guard let formatter = configuration.formatter else {
            return
        }
        var isValid = true
        if formatter.formatted {
            formatter.formatted = false
            return
        }
        if deleteCharacter {
            isValid = formatter.isPartialStringValid("")
        } else if let char = value.last {
            isValid = formatter.isPartialStringValid(String(char), position: value.count - 1)
            if !isValid {
                formatter.formatted = true
                configuration.text = String(value.dropLast())
            }
        }
        if isValid {
            self.formatString(for: value, cursorPosition: value.count, configuration: configuration)
        }
    }
    
    private func formatString(for value: String, cursorPosition: Int, configuration: TextInputFieldConfiguration) {
        guard let formatter = configuration.formatter else {
            return
        }
        if let tuple = formatter.string(for: value, cursorPosition: cursorPosition) {
            if let formattedString = tuple.formattedString {
                if formattedString != configuration.text {
                    formatter.formatted = true
                } else {
                    formatter.formatted = false
                }
                configuration.text = formattedString
            }
        }
    }
}

/// Decimal style
public extension TextInputFieldStyle where Self == TextInputFieldDecimalStyle {
    /// The `decimal` style is applied for the case that the `TextInputField` allows only decimal input. It will filter out any non-digit characters.
    static var decimal: TextInputFieldDecimalStyle {
        TextInputFieldDecimalStyle()
    }
}

/// Number style
public extension TextInputFieldStyle where Self == TextInputFieldNumberStyle {
    /// The `number` style is applied for the case that the `TextInputField` allows only integer numeric input. It will filter out any non-digit characters and removes any decimal points.
    static var number: TextInputFieldNumberStyle {
        TextInputFieldNumberStyle()
    }
}

/// Generic text style
public extension TextInputFieldStyle where Self == TextInputFieldGenericTextStyle {
    /// The `generic text` style is applied for the case that the `TextInputField` allows generic text input. It will filter out any non-regular characters.
    static var genericText: TextInputFieldGenericTextStyle {
        TextInputFieldGenericTextStyle()
    }
}
