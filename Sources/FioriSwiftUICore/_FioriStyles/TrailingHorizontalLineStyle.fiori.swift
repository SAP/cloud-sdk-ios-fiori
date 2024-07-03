import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TrailingHorizontalLineBaseStyle: TrailingHorizontalLineStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TrailingHorizontalLineConfiguration) -> some View {
        configuration.trailingHorizontalLine
    }
}

// Default fiori styles
public struct TrailingHorizontalLineFioriStyle: TrailingHorizontalLineStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TrailingHorizontalLineConfiguration) -> some View {
        TrailingHorizontalLine(configuration)
    }
}
