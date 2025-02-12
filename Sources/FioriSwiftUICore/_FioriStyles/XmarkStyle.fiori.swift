import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct XmarkBaseStyle: XmarkStyle {
    @ViewBuilder
    public func makeBody(_ configuration: XmarkConfiguration) -> some View {
        // Add default layout here
        configuration.xmark
    }
}

// Default fiori styles
public struct XmarkFioriStyle: XmarkStyle {
    @ViewBuilder
    public func makeBody(_ configuration: XmarkConfiguration) -> some View {
        Xmark(configuration)
    }
}
