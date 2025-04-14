// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SignInActionBaseStyle: SignInActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SignInActionConfiguration) -> some View {
        // Add default layout here
        configuration.signInAction
    }
}

// Default fiori styles
public struct SignInActionFioriStyle: SignInActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SignInActionConfiguration) -> some View {
        SignInAction(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}
