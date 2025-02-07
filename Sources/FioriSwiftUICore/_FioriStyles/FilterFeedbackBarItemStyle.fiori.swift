import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct FilterFeedbackBarItemBaseStyle: FilterFeedbackBarItemStyle {
    public func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> some View {
        // Add default layout here
        HStack(spacing: configuration.spacing) {
            configuration.icon
            configuration.title
            configuration.accessoryIcon
        }
        .padding(8)
        .frame(minHeight: 38)
    }
}

// Default fiori styles
extension FilterFeedbackBarItemFioriStyle {
    struct ContentFioriStyle: FilterFeedbackBarItemStyle {
        func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> some View {
            FilterFeedbackBarItem(configuration)
                // Add default style for its content
                // .background()
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(configuration.isSelected ? Color.clear : .preferredColor(.tertiaryFill))
                            .strokeBorder(configuration.isSelected ? DefaultFilterFeedbackBarForegroundColor : .preferredColor(.separatorOpaque), lineWidth: 1)
                    }
                )
        }
    }

    struct IconFioriStyle: IconStyle {
        let filterFeedbackBarItemConfiguration: FilterFeedbackBarItemConfiguration

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                // Add default style for Icon
                // .foregroundStyle(Color.preferredColor(<#fiori color#>))
                .foregroundStyle(self.filterFeedbackBarItemConfiguration.isSelected ? DefaultFilterFeedbackBarForegroundColor : Color.preferredColor(.tertiaryLabel))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let filterFeedbackBarItemConfiguration: FilterFeedbackBarItemConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                // .foregroundStyle(Color.preferredColor(<#fiori color#>))
                // .font(.fiori(forTextStyle: <#fiori font#>))
                .font(.system(.body))
                .foregroundColor(self.filterFeedbackBarItemConfiguration.isSelected ? DefaultFilterFeedbackBarForegroundColor : .preferredColor(.tertiaryLabel))
        }
    }

    struct AccessoryIconFioriStyle: AccessoryIconStyle {
        let filterFeedbackBarItemConfiguration: FilterFeedbackBarItemConfiguration

        func makeBody(_ configuration: AccessoryIconConfiguration) -> some View {
            AccessoryIcon(configuration)
                // Add default style for AccessoryIcon
                .foregroundStyle(self.filterFeedbackBarItemConfiguration.isSelected ? DefaultFilterFeedbackBarForegroundColor : Color.preferredColor(.tertiaryLabel))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}
