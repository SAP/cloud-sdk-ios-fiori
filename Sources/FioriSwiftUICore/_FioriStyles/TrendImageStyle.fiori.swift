import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TrendImageBaseStyle: TrendImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TrendImageConfiguration) -> some View {
        // Add default layout here
        configuration.trendImage
    }
}

// Default fiori styles
public struct TrendImageFioriStyle: TrendImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TrendImageConfiguration) -> some View {
        TrendImage(configuration)
    }
}
