import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `PlaceholderTextEditor`.
public struct PlaceholderTextEditorBaseStyle: PlaceholderTextEditorStyle {
    @FocusState var isFocused: Bool
    @State var isKeyboardShown: Bool = false

    public func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
        ZStack(alignment: .topLeading) {
            configuration._textView.body
                .focused(self.$isFocused)
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
            if configuration.text.isEmpty, !self.isFocused, !configuration.placeholder.isEmpty {
                configuration.placeholder.body
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
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        let placeholderTextEditorConfiguration: PlaceholderTextEditorConfiguration
        
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
                .padding(.top, 8)
                .padding(.leading, 8)
        }
    }
}
