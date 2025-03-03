import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TrendBaseStyle: TrendStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TrendConfiguration) -> some View {
        // Add default layout here
        configuration.trend
    }
}

// Default fiori styles
public struct TrendFioriStyle: TrendStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TrendConfiguration) -> some View {
        Trend(configuration)
    }
}
