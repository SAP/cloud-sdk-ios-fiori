import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct OuterCircleBaseStyle: OuterCircleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OuterCircleConfiguration) -> some View {
        // Add default layout here
        configuration.outerCircle
    }
}

// Default fiori styles
public struct OuterCircleFioriStyle: OuterCircleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OuterCircleConfiguration) -> some View {
        OuterCircle(configuration)
    }
}
