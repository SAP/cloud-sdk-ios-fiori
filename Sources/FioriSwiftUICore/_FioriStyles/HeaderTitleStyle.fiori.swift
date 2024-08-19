import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct HeaderTitleBaseStyle: HeaderTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HeaderTitleConfiguration) -> some View {
        configuration.headerTitle
    }
}

// Default fiori styles
public struct HeaderTitleFioriStyle: HeaderTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HeaderTitleConfiguration) -> some View {
        HeaderTitle(configuration)
    }
}
