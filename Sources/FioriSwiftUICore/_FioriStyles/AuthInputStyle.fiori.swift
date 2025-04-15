// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AuthInputBaseStyle: AuthInputStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AuthInputConfiguration) -> some View {
        // Add default layout here
        configuration.authInput
    }
}

// Default fiori styles
public struct AuthInputFioriStyle: AuthInputStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AuthInputConfiguration) -> some View {
        AuthInput(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}
