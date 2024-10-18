import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AllEntriesSectionTitleBaseStyle: AllEntriesSectionTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AllEntriesSectionTitleConfiguration) -> some View {
        // Add default layout here
        configuration.allEntriesSectionTitle
    }
}

// Default fiori styles
public struct AllEntriesSectionTitleFioriStyle: AllEntriesSectionTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AllEntriesSectionTitleConfiguration) -> some View {
        AllEntriesSectionTitle(configuration)
    }
}
