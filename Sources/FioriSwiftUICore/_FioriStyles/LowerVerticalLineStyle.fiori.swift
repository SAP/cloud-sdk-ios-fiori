import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct LowerVerticalLineBaseStyle: LowerVerticalLineStyle {
    @ViewBuilder
    public func makeBody(_ configuration: LowerVerticalLineConfiguration) -> some View {
        configuration.lowerVerticalLine
    }
}

// Default fiori styles
public struct LowerVerticalLineFioriStyle: LowerVerticalLineStyle {
    @ViewBuilder
    public func makeBody(_ configuration: LowerVerticalLineConfiguration) -> some View {
        LowerVerticalLine(configuration)
    }
}
