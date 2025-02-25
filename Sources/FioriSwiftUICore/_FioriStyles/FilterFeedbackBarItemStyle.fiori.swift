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

#if !os(visionOS)
    /// default filter feedbackbar foreground color
    public let DefaultFilterFeedbackBarItemForegroundColor = Color.preferredColor(.tintColor)
#else
    /// default filter feedbackbar foreground color
    public let DefaultFilterFeedbackBarItemForegroundColor = Color.preferredColor(.primaryLabel)
#endif

// Base Layout style
public struct FilterFeedbackBarItemBaseStyle: FilterFeedbackBarItemStyle {
    @Environment(\.filterFeedbackBarItemFont) var font
    @Environment(\.filterFeedbackBarItemSelectedForegroundColor) var selectedForegroundColor
    @Environment(\.filterFeedbackBarItemUnselectedForegroundColor) var unselectedForegroundColor
    @Environment(\.filterFeedbackBarItemSpacing) var spacing
    @Environment(\.filterFeedbackBarItemPadding) var padding
    @Environment(\.filterFeedbackBarItemMaxWidth) var maxWidth
    @Environment(\.filterFeedbackBarItemMinHeight) var minHeight
    @Environment(\.filterFeedbackBarItemCornerRadius) var cornerRadius
    @Environment(\.filterFeedbackBarItemBackgroundSelectedFillColor) var selectedFillColor
    @Environment(\.filterFeedbackBarItemBackgroundUnselectedFillColor) var unselectedFillColor
    @Environment(\.filterFeedbackBarItemBackgroundSelectedStrokeColor) var selectedStokeColor
    @Environment(\.filterFeedbackBarItemBackgroundUnselectedStrokeColor) var unselectedStokeColor
    @Environment(\.filterFeedbackBarItemBorderWidth) var borderWidth
    
    public func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> some View {
        // Add default layout here
        HStack(spacing: self.spacing) {
            configuration.icon
            configuration.title
            configuration.accessoryIcon
        }
        .font(self.font)
        .foregroundStyle(configuration.isSelected ? self.selectedForegroundColor : self.unselectedForegroundColor)
        .padding(self.padding)
        .frame(maxWidth: self.maxWidth > 0 ? self.maxWidth : nil, minHeight: self.minHeight)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .fill(configuration.isSelected ? self.selectedFillColor : self.unselectedFillColor)
                    .strokeBorder(configuration.isSelected ? self.selectedStokeColor : self.unselectedStokeColor, lineWidth: self.borderWidth)
            }
        )
    }
}

// Default fiori styles
extension FilterFeedbackBarItemFioriStyle {
    struct ContentFioriStyle: FilterFeedbackBarItemStyle {
        @Environment(\.filterFeedbackBarItemFont) var font
        @Environment(\.filterFeedbackBarItemSelectedForegroundColor) var selectedForegroundColor
        @Environment(\.filterFeedbackBarItemUnselectedForegroundColor) var unselectedForegroundColor
        
        func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> some View {
            FilterFeedbackBarItem(configuration)
                .titleStyle { c in
                    c.title
                        .foregroundStyle(configuration.isSelected ? self.selectedForegroundColor : self.unselectedForegroundColor)
                        .font(self.font)
                }
                .iconStyle { c in
                    c.icon.foregroundStyle(configuration.isSelected ? self.selectedForegroundColor : self.unselectedForegroundColor)
                }
                .accessoryIconStyle { c in
                    c.accessoryIcon.foregroundStyle(configuration.isSelected ? self.selectedForegroundColor : self.unselectedForegroundColor)
                }
        }
    }

    struct IconFioriStyle: IconStyle {
        let filterFeedbackBarItemConfiguration: FilterFeedbackBarItemConfiguration

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(self.filterFeedbackBarItemConfiguration.isSelected ? DefaultFilterFeedbackBarItemForegroundColor : Color.preferredColor(.tertiaryLabel))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let filterFeedbackBarItemConfiguration: FilterFeedbackBarItemConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.system(.body))
                .foregroundStyle(self.filterFeedbackBarItemConfiguration.isSelected ? DefaultFilterFeedbackBarItemForegroundColor : .preferredColor(.tertiaryLabel))
        }
    }

    struct AccessoryIconFioriStyle: AccessoryIconStyle {
        let filterFeedbackBarItemConfiguration: FilterFeedbackBarItemConfiguration

        func makeBody(_ configuration: AccessoryIconConfiguration) -> some View {
            AccessoryIcon(configuration)
                // Add default style for AccessoryIcon
                .foregroundStyle(self.filterFeedbackBarItemConfiguration.isSelected ? DefaultFilterFeedbackBarItemForegroundColor : Color.preferredColor(.tertiaryLabel))
        }
    }
}
