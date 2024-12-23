import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct LineBaseStyle: LineStyle {
    @ViewBuilder
    public func makeBody(_ configuration: LineConfiguration) -> some View {
        // Add default layout here
        configuration.line
    }
}

// Default fiori styles
public struct LineFioriStyle: LineStyle {
    @ViewBuilder
    public func makeBody(_ configuration: LineConfiguration) -> some View {
        Line(configuration)
    }
}
