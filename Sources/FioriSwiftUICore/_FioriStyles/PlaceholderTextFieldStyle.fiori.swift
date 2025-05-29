import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `PlaceholderTextField`.
public struct PlaceholderTextFieldBaseStyle: PlaceholderTextFieldStyle {
    @FocusState var isFocused: Bool

    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        HStack {
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
            if self.isFocused, !configuration.text.isEmpty, !(configuration.isSecureEnabled ?? false) {
                Button(action: {
                    configuration.text = ""
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.fiori(forTextStyle: .body))
                        .foregroundColor(.preferredColor(.tertiaryLabel))
                        .padding(.trailing, 1)
                }
                .buttonStyle(.plain)
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
