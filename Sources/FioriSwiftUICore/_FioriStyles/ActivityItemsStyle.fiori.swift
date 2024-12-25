import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ActivityItemsBaseStyle: ActivityItemsStyle {
    public func makeBody(_ configuration: ActivityItemsConfiguration) -> some View {
        // Add default layout here
        configuration.actionItems
    }
}

// Default fiori styles
extension ActivityItemsFioriStyle {
    struct ContentFioriStyle: ActivityItemsStyle {
        func makeBody(_ configuration: ActivityItemsConfiguration) -> some View {
            ActivityItems(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct ActionItemsFioriStyle: ActionItemsStyle {
        let activityItemsConfiguration: ActivityItemsConfiguration

        func makeBody(_ configuration: ActionItemsConfiguration) -> some View {
            ActionItems(configuration)
                .font(.fiori(forTextStyle: .body).weight(.light))
                .foregroundColor(.preferredColor(.tintColor))
        }
    }
}
