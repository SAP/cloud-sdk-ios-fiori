import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KeyBaseStyle: KeyStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KeyConfiguration) -> some View {
        // Add default layout here
        configuration.key
    }
}

// Default fiori styles
public struct KeyFioriStyle: KeyStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KeyConfiguration) -> some View {
        Key(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}
