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

// Default nss styles
public struct TextInputFieldNSSStyle: TextInputFieldStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.textInputFieldIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

/// Number style
public struct TextInputFieldNumberStyle: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .frame(minHeight: 44)
            .keyboardType(.numberPad)
            .setOnChange(of: configuration.text, action1: { newValue in
                let filtered = newValue.filter { $0.isNumber || $0 == "." }
                if filtered != newValue {
                    configuration.text = filtered
                }
            }) { _, newValue in
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
