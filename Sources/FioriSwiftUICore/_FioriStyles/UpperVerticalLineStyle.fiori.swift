import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct UpperVerticalLineBaseStyle: UpperVerticalLineStyle {
    @ViewBuilder
    public func makeBody(_ configuration: UpperVerticalLineConfiguration) -> some View {
        configuration.upperVerticalLine
    }
}

// Default fiori styles
public struct UpperVerticalLineFioriStyle: UpperVerticalLineStyle {
    @ViewBuilder
    public func makeBody(_ configuration: UpperVerticalLineConfiguration) -> some View {
        UpperVerticalLine(configuration)
    }
}
