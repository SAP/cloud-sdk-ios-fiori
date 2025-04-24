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
        func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
            TextInputField(configuration)
                .frame(minHeight: 44)
        }
    }
}

/// Decimal style
public struct TextInputFieldDecimalStyle: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .frame(minHeight: 44)
            .keyboardType(.decimalPad)
    }
}

/// Integer number style
public struct TextInputFieldNumberStyle: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .frame(minHeight: 44)
            .keyboardType(.numberPad)
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
