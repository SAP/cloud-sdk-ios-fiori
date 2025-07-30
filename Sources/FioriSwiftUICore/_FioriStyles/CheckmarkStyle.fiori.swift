import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct CheckmarkBaseStyle: CheckmarkStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CheckmarkConfiguration) -> some View {
        // Add default layout here
        configuration.checkmark
    }
}

// Default fiori styles
public struct CheckmarkFioriStyle: CheckmarkStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CheckmarkConfiguration) -> some View {
        Checkmark(configuration)
    }
}
