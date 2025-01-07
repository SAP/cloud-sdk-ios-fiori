import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct InnerCircleBaseStyle: InnerCircleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: InnerCircleConfiguration) -> some View {
        // Add default layout here
        configuration.innerCircle
    }
}

// Default fiori styles
public struct InnerCircleFioriStyle: InnerCircleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: InnerCircleConfiguration) -> some View {
        InnerCircle(configuration)
    }
}
