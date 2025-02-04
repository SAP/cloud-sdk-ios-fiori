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
public struct FilterFeedbackBarButtonBaseStyle: FilterFeedbackBarButtonStyle {
    public func makeBody(_ configuration: FilterFeedbackBarButtonConfiguration) -> some View {
        // Add default layout here
        HStack(spacing: configuration.spacing) {
            configuration.icon
            configuration.title
                .lineLimit(1)
        }
        .padding([.leading, .trailing], configuration.isSelected ? 9 : 20)
        .frame(maxWidth: .infinity, minHeight: 50)
    }
}

// Default fiori styles
extension FilterFeedbackBarButtonFioriStyle {
    struct ContentFioriStyle: FilterFeedbackBarButtonStyle {
        func makeBody(_ configuration: FilterFeedbackBarButtonConfiguration) -> some View {
            FilterFeedbackBarButton(configuration)
                // Add default style for its content
                // .background()
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(configuration.isSelected ? Color.preferredColor(.secondaryGroupedBackground) : Color.preferredColor(.tertiaryFill))
                            .stroke(configuration.isSelected ? DefaultOptionListPickerForegroundColor : Color.preferredColor(.separator), lineWidth: 1)
                    }
                )
        }
    }

    struct IconFioriStyle: IconStyle {
        let filterFeedbackBarButtonConfiguration: FilterFeedbackBarButtonConfiguration
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                // Add default style for Icon
                .foregroundStyle(self.filterFeedbackBarButtonConfiguration.isSelected ? DefaultOptionListPickerForegroundColor : Color.preferredColor(.tertiaryLabel))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let filterFeedbackBarButtonConfiguration: FilterFeedbackBarButtonConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                .foregroundStyle(self.filterFeedbackBarButtonConfiguration.isSelected ? DefaultOptionListPickerForegroundColor : Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .callout))
        }
    }
}
