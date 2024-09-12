import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct HalfStarImageBaseStyle: HalfStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HalfStarImageConfiguration) -> some View {
        // Add default layout here
        configuration.halfStarImage
    }
}

// Default fiori styles
public struct HalfStarImageFioriStyle: HalfStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HalfStarImageConfiguration) -> some View {
        HalfStarImage(configuration)
    }
}
