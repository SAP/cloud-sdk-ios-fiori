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

// Default nss styles
extension ActivityItemNSSStyle {
    struct ContentNSSStyle: ActivityItemStyle {
        let activityItemConfiguration: ActivityItemConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: ActivityItemConfiguration) -> some View {
            ActivityItem(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct IconNSSStyle: IconStyle {
        let activityItemConfiguration: ActivityItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Icon
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct SubtitleNSSStyle: SubtitleStyle {
        let activityItemConfiguration: ActivityItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Subtitle
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
