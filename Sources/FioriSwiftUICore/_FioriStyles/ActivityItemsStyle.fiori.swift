import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ActivityItemsBaseStyle: ActivityItemsStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ActivityItemsConfiguration) -> some View {
        // Add default layout here
        configuration.activityItems
    }
}

// Default fiori styles
public struct ActivityItemsFioriStyle: ActivityItemsStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ActivityItemsConfiguration) -> some View {
        ActivityItems(configuration)
            .font(.fiori(forTextStyle: .body).weight(.light))
            .foregroundColor(.preferredColor(.tintColor))
    }
}
