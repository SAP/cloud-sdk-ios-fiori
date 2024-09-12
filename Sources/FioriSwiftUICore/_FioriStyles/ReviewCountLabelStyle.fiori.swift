import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ReviewCountLabelBaseStyle: ReviewCountLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ReviewCountLabelConfiguration) -> some View {
        // Add default layout here
        configuration.reviewCountLabel
    }
}

// Default fiori styles
public struct ReviewCountLabelFioriStyle: ReviewCountLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ReviewCountLabelConfiguration) -> some View {
        ReviewCountLabel(configuration)
    }
}
