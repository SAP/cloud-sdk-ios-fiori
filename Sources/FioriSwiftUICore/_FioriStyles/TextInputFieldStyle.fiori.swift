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
            if let _ = configuration.formatter as? GenericTextFormatter {
                TextInputFieldGenericTextStyle().makeBody(configuration)
                    .frame(minHeight: 44)
            } else if let _ = configuration.formatter as? PhoneNumberFormatter {
                TextInputFieldPhoneNumberStyle().makeBody(configuration)
                    .frame(minHeight: 44)
            } else if let _ = configuration.formatter as? CustomNumberFormatter {
                TextInputFieldCustomNumberStyle().makeBody(configuration)
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
            .setOnChange(of: configuration.text, action1: { _ in
            }) { oldValue, newValue in
                guard let formatter = configuration.formatter as? GenericTextFormatter else {
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
                    _ = formatter.editingString(for: "")
                }
                let processValue = deleteCharacter ? oldValue : newValue
                self.updateText(value: processValue, configuration: configuration, deleteCharacter: deleteCharacter)
            }
    }
    
    private func updateText(value: String, configuration: TextInputFieldConfiguration, deleteCharacter: Bool = false) {
        guard let formatter = configuration.formatter as? GenericTextFormatter else {
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
        guard let formatter = configuration.formatter as? GenericTextFormatter else {
            return
        }
        if let formattedString = formatter.formatString(for: value, cursorPosition: cursorPosition) {
            if formattedString != configuration.text {
                formatter.formatted = true
            } else {
                formatter.formatted = false
            }
            configuration.text = formattedString
        }
    }
}

public struct TextInputFieldPhoneNumberStyle: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .frame(minHeight: 44)
            .keyboardType(.default)
            .setOnChange(of: configuration.text, action1: { _ in
            }) { oldValue, newValue in
                guard let formatter = configuration.formatter as? PhoneNumberFormatter else {
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
                    _ = formatter.editingString(for: "")
                }
                let processValue = deleteCharacter ? oldValue : newValue
                self.updateText(value: processValue, configuration: configuration, deleteCharacter: deleteCharacter)
            }
    }
    
    private func updateText(value: String, configuration: TextInputFieldConfiguration, deleteCharacter: Bool = false) {
        guard let formatter = configuration.formatter as? PhoneNumberFormatter else {
            return
        }
        formatter.isSwiftUIInputField = true
        var isValid = true
        if formatter.formatted {
            formatter.formatted = false
            return
        }
        if deleteCharacter {
            isValid = formatter.isPartialStringValid("", newEditingString: nil, errorDescription: nil)
        } else if let char = value.last {
            isValid = formatter.isPartialStringValid(String(char), newEditingString: nil, errorDescription: nil)
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
        guard let formatter = configuration.formatter as? PhoneNumberFormatter else {
            return
        }
        if let formattedString = formatter.string(for: value, cursorPosition: cursorPosition)?.formattedString {
            if formattedString != configuration.text {
                formatter.formatted = true
            } else {
                formatter.formatted = false
            }
            configuration.text = formattedString
        }
    }
}

public struct TextInputFieldCustomNumberStyle: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputFieldWrapper(text: configuration.$text, formatter: configuration.formatter, onEditingChanged: { _ in })
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

/// Phone number style
public extension TextInputFieldStyle where Self == TextInputFieldPhoneNumberStyle {
    /// The `phone number` style is applied for the case that the `TextInputField` allows phone number text input. It will filter out any non-regular characters.
    static var phoneNumber: TextInputFieldPhoneNumberStyle {
        TextInputFieldPhoneNumberStyle()
    }
}

/// Custom number style
public extension TextInputFieldStyle where Self == TextInputFieldCustomNumberStyle {
    /// The `custom number` style is applied for the case that the `TextInputField` allows custom number text input. It will filter out any non-regular characters.
    static var customNumber: TextInputFieldCustomNumberStyle {
        TextInputFieldCustomNumberStyle()
    }
}

struct TextInputFieldWrapper: UIViewRepresentable {
    @Binding var text: String
    var formatter: FormattedStringEditing?
    var onEditingChanged: (Bool) -> Void
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.addTarget(
            context.coordinator,
            action: #selector(Coordinator.textFieldDidChange(_:)),
            for: .editingChanged
        )
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = self.formatter?.string(for: self.text, cursorPosition: 0)?.formattedString
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextInputFieldWrapper
        var formatter: FormattedStringEditing?
        
        init(_ textField: TextInputFieldWrapper) {
            self.parent = textField
            self.formatter = textField.formatter
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            guard let valueTextFieldText = textField.text else { return }
            self.parent.text = textField.text ?? ""
            self.formatAndUpdateText(textField, valueTextFieldText)
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            self.parent.onEditingChanged(true)
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            self.parent.onEditingChanged(false)
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let formatter = self.formatter as? CustomNumberFormatter {
                let range = textField.selectedTextRange
                var currentString = (textField.text ?? "") as NSString
                let pointer = withUnsafeMutablePointer(to: &currentString) {
                    AutoreleasingUnsafeMutablePointer<NSString?>($0)
                }
                if !formatter.isPartialStringValid(string, newEditingString: pointer, errorDescription: nil) {
                    DispatchQueue.main.async {
                        textField.selectedTextRange = range
                    }
                    return false
                }
            }
            let maxValueTextLength = (formatter as? CustomNumberFormatter)?.maximumIntegerDigits ?? 0
            if maxValueTextLength > 0 {
                var currentCharacterCount = 0
                if formatter == nil {
                    currentCharacterCount = textField.text?.count ?? 0
                } else {
                    currentCharacterCount = formatter?.editingString(for: textField.text ?? "")?.count ?? 0
                }
                let newLength = currentCharacterCount + string.count - range.length
                if newLength > maxValueTextLength {
                    return false
                }
            }
            return true
        }
        
        private func formatAndUpdateText(_ valueTextField: UITextField, _ valueTextFieldText: String) {
            if let formatter = formatter as? CustomNumberFormatter {
                let range = valueTextField.selectedTextRange
                var cursorPosition = 0
                if let range {
                    let location: Int = valueTextField.offset(from: valueTextField.beginningOfDocument, to: range.start)
                    let length: Int = valueTextField.offset(from: range.start, to: range.end)
                    cursorPosition = location + length
                }
                if let tuple = formatter.string(for: valueTextFieldText, cursorPosition: cursorPosition) {
                    if let formattedString = tuple.formattedString {
                        valueTextField.text = formattedString
                        if let position = valueTextField.position(from: valueTextField.beginningOfDocument, offset: tuple.adjustedCursorPosition) {
                            DispatchQueue.main.async {
                                valueTextField.selectedTextRange = valueTextField.textRange(from: position, to: position)
                            }
                        }
                    }
                }
            }
        }
    }
}
