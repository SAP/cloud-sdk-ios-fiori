import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TextInputField`.
public struct TextInputFieldBaseStyle: TextInputFieldStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextField("", text: configuration.$text)
    }
}

// Default fiori styles
public struct TextInputFieldFioriStyle: TextInputFieldStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .frame(minHeight: 44)
    }
}

/// Number style
public struct TextInputFieldNumberStyle: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .frame(minHeight: 44)
            .keyboardType(.numberPad)
            .onChange(of: configuration.text) { newValue in
                let filtered = newValue.filter { $0.isNumber || $0 == "." }
                if filtered != newValue {
                    configuration.text = filtered
                }
            }
    }
}

/// Number style
public extension TextInputFieldStyle where Self == TextInputFieldNumberStyle {
    /// The `number` style is applied for the case that the `TextInputField` allows only numeric input. It will filter out any non-digit characters and removes any decimal points.
    static var number: TextInputFieldNumberStyle {
        TextInputFieldNumberStyle()
    }
}
