// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SeparatorBaseStyle: SeparatorStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SeparatorConfiguration) -> some View {
        // Add default layout here
        configuration.separator
            .frame(height: 0.45)
    }
}

// Default fiori styles
public struct SeparatorFioriStyle: SeparatorStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SeparatorConfiguration) -> some View {
        Separator(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}
