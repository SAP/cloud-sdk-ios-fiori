import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `PlaceholderTextField`.
public struct PlaceholderTextFieldBaseStyle: PlaceholderTextFieldStyle {
    @FocusState var isFocused: Bool
    @Environment(\.isEnabled) private var isEnabled
    /// Optional external focus binding supplied via `.textFieldFormViewFocused(_:)` / `.titleFormViewFocused(_:)`.
    /// Kept in sync with the internal focus state so consumers can host their own keyboard toolbar and
    /// dismiss the keyboard (the number/decimal keyboard used in currency mode has no Return/Done key).
    @Environment(\.textFieldFocusBinding) private var externalFocusBinding

    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        let showClear = self.isFocused
            && !configuration.text.isEmpty
            && !(configuration.isSecureEnabled ?? false)

        let accessible = self.isEnabled
            && !configuration.text.isEmpty
            && !(configuration.isSecureEnabled ?? false)

        return HStack {
            ZStack(alignment: .center) {
                configuration._textInputField.body
                    .focused(self.$isFocused)
                if configuration.text.isEmpty, !configuration.placeholder.isEmpty {
                    HStack {
                        configuration.placeholder.body
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    self.isFocused = true
                                }
                            }
                            .lineLimit(1)
                        Spacer()
                    }
                }
            }
            Button(action: {
                configuration.text = ""
            }) {
                Image(systemName: "xmark.circle")
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.tertiaryLabel))
                    .padding(.trailing, 1)
            }
            .opacity(showClear ? 1 : 0)
            .allowsHitTesting(showClear)
            .accessibilityLabel("Clear".localizedFioriString())
            .accessibilityHidden(!accessible)
        }
        .accessibilityElement(children: .contain)
        .onChange(of: self.isFocused) { _, newValue in
            DispatchQueue.main.async {
                UIAccessibility.post(notification: .layoutChanged, argument: nil)
            }
            // Mirror the internal focus state out so consumers can drive their own keyboard toolbar.
            if self.externalFocusBinding?.wrappedValue != newValue {
                self.externalFocusBinding?.wrappedValue = newValue
            }
        }
        .onChange(of: self.externalFocusBinding?.wrappedValue) { _, newValue in
            // Allow consumers to dismiss the keyboard by setting their binding to false.
            if newValue == false, self.isFocused {
                self.isFocused = false
            }
        }
        .onChange(of: configuration.text.isEmpty) { _, _ in
            DispatchQueue.main.async {
                UIAccessibility.post(notification: .layoutChanged, argument: nil)
            }
        }
    }
}
    
// Default fiori styles
extension PlaceholderTextFieldFioriStyle {
    struct ContentFioriStyle: PlaceholderTextFieldStyle {
        func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
            PlaceholderTextField(configuration)
                .frame(minHeight: 44)
        }
    }

    struct TextInputFieldFioriStyle: TextInputFieldStyle {
        let placeholderTextFieldConfiguration: PlaceholderTextFieldConfiguration
        
        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            TextInputField(configuration)
                .zIndex(1.0)
                .padding(.bottom, 0)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        let placeholderTextFieldConfiguration: PlaceholderTextFieldConfiguration
        
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }
}
