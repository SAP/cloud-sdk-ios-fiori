import FioriThemeManager
import Foundation
import SwiftUI

/// Activity item layout
public enum ActivityItemLayout {
    /// Vertical layout for ActivityItem.
    case vertical
    /// Horizontal layout for ActivityItem.
    case horizontal
}

// Base Layout style
public struct ActivityItemBaseStyle: ActivityItemStyle {
    public func makeBody(_ configuration: ActivityItemConfiguration) -> some View {
        // Add default layout here
        switch configuration.layout {
        case .vertical:
            VStack {
                configuration.icon
                configuration.subtitle
            }
            .typeErased
        case .horizontal:
            HStack {
                configuration.icon
                configuration.subtitle
            }
            .typeErased
        }
    }
}

// Default fiori styles
extension ActivityItemFioriStyle {
    struct ContentFioriStyle: ActivityItemStyle {
        func makeBody(_ configuration: ActivityItemConfiguration) -> some View {
            ActivityItem(configuration)
        }
    }

    struct IconFioriStyle: IconStyle {
        let activityItemConfiguration: ActivityItemConfiguration

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let activityItemConfiguration: ActivityItemConfiguration

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
        }
    }
}
