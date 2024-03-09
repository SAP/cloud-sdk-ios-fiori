import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct PlaceholderTextEditorBaseStyle: PlaceholderTextEditorStyle {
    @FocusState var isFocused: Bool

    public func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
        ZStack(alignment: .topLeading) {
            configuration._textView.body
                .zIndex(1.0)
                .padding(.bottom, 0)
                .focused($isFocused)
            if configuration.text.isEmpty, !isFocused, !configuration.placeholder.isEmpty {
                configuration.placeholder.body
                    .padding(.top, 8)
                    .padding(.leading, 8)
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
        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }
}
