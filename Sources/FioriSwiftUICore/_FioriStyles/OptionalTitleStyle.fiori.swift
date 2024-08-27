import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct OptionalTitleBaseStyle: OptionalTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OptionalTitleConfiguration) -> some View {
        configuration.optionalTitle
    }
}

// Default fiori styles
public struct OptionalTitleFioriStyle: OptionalTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OptionalTitleConfiguration) -> some View {
        OptionalTitle(configuration)
    }
}
