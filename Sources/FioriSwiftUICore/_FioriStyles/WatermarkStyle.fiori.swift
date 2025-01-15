import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct WatermarkBaseStyle: WatermarkStyle {
    @ViewBuilder
    public func makeBody(_ configuration: WatermarkConfiguration) -> some View {
        // Add default layout here
        configuration.watermark
    }
}

// Default fiori styles
public struct WatermarkFioriStyle: WatermarkStyle {
    @ViewBuilder
    public func makeBody(_ configuration: WatermarkConfiguration) -> some View {
        Watermark(configuration)
            .font(.fiori(forTextStyle: .caption1))
            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
    }
}
