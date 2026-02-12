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

/// Option list picker configuration for styling
public struct OptionListPickerButtonConfiguration {
    let leftIcon: AnyView
    let title: AnyView
    let isSelected: Bool
    
    /// :nodoc:
    public init(leftIcon: AnyView, title: AnyView, isSelected: Bool) {
        self.leftIcon = leftIcon
        self.title = title
        self.isSelected = isSelected
    }
}

/// Option list picker style
public protocol OptionListPickerStyle {
    /// :nodoc:
    func makeBody(configuration: OptionListPickerButtonConfiguration) -> AnyView
}

#if !os(visionOS)
    /// Default option list picker foreground color
    public let DefaultOptionListPickerForegroundColor = Color.preferredColor(.tintColor)
#else
    /// Default option list picker foreground color
    public let DefaultOptionListPickerForegroundColor = Color.preferredColor(.primaryLabel)
#endif

/// Default option list picker style
public struct DefaultOptionListPickerStyle: OptionListPickerStyle {
    let font: Font
    let foregroundColorSelected: Color
    let foregroundColorUnselected: Color
    let fillColorSelected: Color
    let fillColorUnselected: Color
    let strokeColorSelected: Color
    let strokeColorUnselected: Color
    let cornerRadius: CGFloat
    let spacing: CGFloat
    let borderWidth: CGFloat
    let minHeight: CGFloat
    let minTouchHeight: CGFloat
    
    /// :nodoc:
    public init(font: Font = .system(.body), foregroundColorSelected: Color = DefaultOptionListPickerForegroundColor, foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = .preferredColor(.secondaryGroupedBackground), fillColorUnselected: Color = .preferredColor(.tertiaryFill), strokeColorSelected: Color = DefaultOptionListPickerForegroundColor, strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 16, spacing: CGFloat = 4, borderWidth: CGFloat = 1, minHeight: CGFloat = 44, minTouchHeight: CGFloat = 50) {
        self.font = font
        self.foregroundColorSelected = foregroundColorSelected
        self.foregroundColorUnselected = foregroundColorUnselected
        self.fillColorSelected = fillColorSelected
        self.fillColorUnselected = fillColorUnselected
        self.strokeColorSelected = strokeColorSelected
        self.strokeColorUnselected = strokeColorUnselected
        self.cornerRadius = cornerRadius
        self.spacing = spacing
        self.borderWidth = borderWidth
        self.minHeight = minHeight
        self.minTouchHeight = minTouchHeight
    }
    
    /// :nodoc:
    public func makeBody(configuration: OptionListPickerButtonConfiguration) -> AnyView {
        AnyView(
            HStack(spacing: self.spacing) {
                configuration.leftIcon
                configuration.title
                    .lineLimit(1)
            }
            .padding([.leading, .trailing], configuration.isSelected ? 9 : 20)
            .font(self.font)
            .foregroundColor(configuration.isSelected ? self.foregroundColorSelected : self.foregroundColorUnselected)
            .frame(maxWidth: .infinity, minHeight: self.minHeight)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .fill(configuration.isSelected ? self.fillColorSelected : self.fillColorUnselected)
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .stroke(configuration.isSelected ? self.strokeColorSelected : self.strokeColorUnselected, lineWidth: self.borderWidth)
                }
            )
            .frame(minHeight: self.minTouchHeight)
        )
    }
}
