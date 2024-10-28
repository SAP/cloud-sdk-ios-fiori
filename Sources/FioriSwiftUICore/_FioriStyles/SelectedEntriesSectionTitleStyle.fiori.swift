import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SelectedEntriesSectionTitleBaseStyle: SelectedEntriesSectionTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SelectedEntriesSectionTitleConfiguration) -> some View {
        // Add default layout here
        configuration.selectedEntriesSectionTitle
    }
}

// Default fiori styles
public struct SelectedEntriesSectionTitleFioriStyle: SelectedEntriesSectionTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SelectedEntriesSectionTitleConfiguration) -> some View {
        SelectedEntriesSectionTitle(configuration)
    }
}
