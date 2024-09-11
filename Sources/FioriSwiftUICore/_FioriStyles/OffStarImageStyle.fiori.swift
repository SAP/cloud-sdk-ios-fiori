import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct OffStarImageBaseStyle: OffStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OffStarImageConfiguration) -> some View {
        // Add default layout here
        configuration.offStarImage
    }
}

// Default fiori styles
public struct OffStarImageFioriStyle: OffStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OffStarImageConfiguration) -> some View {
        OffStarImage(configuration)
    }
}
