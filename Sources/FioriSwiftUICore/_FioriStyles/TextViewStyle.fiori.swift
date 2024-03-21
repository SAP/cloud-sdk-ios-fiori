import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TextView`.
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
    }
}
