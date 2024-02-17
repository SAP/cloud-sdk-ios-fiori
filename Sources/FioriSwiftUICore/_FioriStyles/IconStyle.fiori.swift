import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct IconBaseStyle: IconStyle {
    @ViewBuilder
    public func makeBody(_ configuration: IconConfiguration) -> some View {
        configuration.icon
    }
}

// Default fiori styles
public struct IconFioriStyle: IconStyle {
    @ViewBuilder
    public func makeBody(_ configuration: IconConfiguration) -> some View {
        Icon(configuration)
    }
}
