import FioriThemeManager
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
public struct TextViewBaseStyle: TextViewStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TextViewConfiguration) -> some View {
        TextEditor(text: configuration.$text)
    }
}

// Default fiori styles
public struct TextViewFioriStyle: TextViewStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TextViewConfiguration) -> some View {
        TextView(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.fiori(forTextStyle: .body))
    }
}
