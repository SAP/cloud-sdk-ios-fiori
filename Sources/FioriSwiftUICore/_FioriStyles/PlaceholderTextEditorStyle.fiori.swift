import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `PlaceholderTextEditor`.
public struct PlaceholderTextEditorBaseStyle: PlaceholderTextEditorStyle {
    @FocusState var isFocused: Bool
    @State var isKeyboardShown: Bool = false
    /// Optional external focus binding supplied via `.noteFormViewFocused(_:)` / `.keyValueFormViewFocused(_:)`.
    /// Kept in sync with the internal focus state so consumers can host their own keyboard toolbar and
    /// dismiss the keyboard (the multi-line editor's Return key inserts a newline instead of dismissing).
    @Environment(\.textEditorFocusBinding) private var externalFocusBinding

    public func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
        ZStack(alignment: .topLeading) {
            configuration._textView.body
                .focused(self.$isFocused)
                .onChange(of: self.isFocused) { _, newValue in
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
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)) { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.isKeyboardShown = false
                    }
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                    DispatchQueue.main.async {
                        self.isKeyboardShown = true
                    }
                }
            if configuration.text.isEmpty, !configuration.placeholder.isEmpty {
                configuration.placeholder.body
                    .zIndex(1)
                    .onTapGesture {
                        DispatchQueue.main.async {
                            self.isFocused = true
                        }
                    }
            }
        }
    }
}
    
// Default fiori styles
extension PlaceholderTextEditorFioriStyle {
    struct ContentFioriStyle: PlaceholderTextEditorStyle {
        func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
            PlaceholderTextEditor(configuration)
        }
    }

    struct TextViewFioriStyle: TextViewStyle {
        let placeholderTextEditorConfiguration: PlaceholderTextEditorConfiguration
        
        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
                .zIndex(1.0)
                .padding(.bottom, 0)
                .scrollContentBackground(.hidden)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        let placeholderTextEditorConfiguration: PlaceholderTextEditorConfiguration
        
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
                .padding(.top, 8)
                .padding(.horizontal, 13)
        }
    }
}
