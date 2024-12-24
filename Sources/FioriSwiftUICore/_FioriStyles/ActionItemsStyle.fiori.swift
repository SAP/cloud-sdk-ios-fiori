import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ActionItemsBaseStyle: ActionItemsStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ActionItemsConfiguration) -> some View {
        // Add default layout here
        configuration.actionItems
    }
}

// Default fiori styles
public struct ActionItemsFioriStyle: ActionItemsStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ActionItemsConfiguration) -> some View {
        ActionItems(configuration)
            .font(.fiori(forTextStyle: .body).weight(.light))
            .foregroundColor(.preferredColor(.tintColor))
    }
}
