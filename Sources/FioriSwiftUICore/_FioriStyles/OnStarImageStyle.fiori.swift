import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct OnStarImageBaseStyle: OnStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OnStarImageConfiguration) -> some View {
        // Add default layout here
        configuration.onStarImage
    }
}

// Default fiori styles
public struct OnStarImageFioriStyle: OnStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OnStarImageConfiguration) -> some View {
        OnStarImage(configuration)
    }
}
