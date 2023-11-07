import FioriThemeManager
import SwiftUI

/// Configuration for filter feedback bar styling
public struct FilterFeedbackBarStyleConfiguration {
    let leftIcon: AnyView
    let title: AnyView
    let isSelected: Bool
    let rightIcon: AnyView
    
    public init(leftIcon: AnyView, title: AnyView, isSelected: Bool, rightIcon: AnyView) {
        self.leftIcon = leftIcon
        self.title = title
        self.isSelected = isSelected
        self.rightIcon = rightIcon
    }
}

/// Protocol for sort and filer menu item styling
public protocol FilterFeedbackBarStyle {
    typealias Configuration = FilterFeedbackBarStyleConfiguration
    
    /// Build view according to configuration and style
    func makeBody(configuration: Self.Configuration) -> AnyView
}

/// Default style for sort and filer menu item
public struct DefaultFilterFeedbackBarStyle: FilterFeedbackBarStyle {
    let font: Font
    let foregroundColorSelected: Color
    let foregroundColorUnselected: Color
    let fillColorSelected: Color
    let fillColorUnselected: Color
    let strokeColorSelected: Color
    let strokeColorUnselected: Color
    let cornerRadius: CGFloat
    let spacing: CGFloat
    let padding: CGFloat
    let borderWidth: CGFloat
    let minHeight: CGFloat
    
    /// :nodoc:
    public init(font: Font = .system(.body), foregroundColorSelected: Color = .preferredColor(.tintColor), foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = .preferredColor(.primaryFill), fillColorUnselected: Color = .preferredColor(.secondaryFill), strokeColorSelected: Color = .preferredColor(.tintColor), strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 10, spacing: CGFloat = 6, padding: CGFloat = 8, borderWidth: CGFloat = 1, minHeight: CGFloat = 38) {
        self.font = font
        self.foregroundColorSelected = foregroundColorSelected
        self.foregroundColorUnselected = foregroundColorUnselected
        self.fillColorSelected = fillColorSelected
        self.fillColorUnselected = fillColorUnselected
        self.strokeColorSelected = strokeColorSelected
        self.strokeColorUnselected = strokeColorUnselected
        self.cornerRadius = cornerRadius
        self.spacing = spacing
        self.padding = padding
        self.borderWidth = borderWidth
        self.minHeight = minHeight
    }
    
    /// Build view according to configuration and style
    public func makeBody(configuration: Configuration) -> AnyView {
        AnyView(
            HStack(spacing: self.spacing) {
                configuration.leftIcon
                configuration.title
                configuration.rightIcon
            }
            .font(self.font)
            .foregroundColor(configuration.isSelected ? self.foregroundColorSelected : self.foregroundColorUnselected)
            .padding(self.padding)
            .frame(minHeight: self.minHeight)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(configuration.isSelected ? fillColorSelected : fillColorUnselected)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(configuration.isSelected ? strokeColorSelected : strokeColorUnselected, lineWidth: borderWidth)
                }
            )
        )
    }
}

struct FilterFeedbackBarStyleKey: EnvironmentKey {    
    static var defaultValue: any FilterFeedbackBarStyle = DefaultFilterFeedbackBarStyle()
}

extension EnvironmentValues {
    var filterFeedbackBarStyle: any FilterFeedbackBarStyle {
        get {
            self[FilterFeedbackBarStyleKey.self]
        }
        set {
            self[FilterFeedbackBarStyleKey.self] = newValue
        }
    }
}

/// Experimental filter feedback bar styling
public extension View {
    /// Experimental filter feedback bar styling
    func filterFeedbackBarStyle<S>(_ style: S) -> some View where S: FilterFeedbackBarStyle {
        self.environment(\.filterFeedbackBarStyle, style)
    }
    
    /// Experimental filter feedback bar styling
    func filterFeedbackBarStyle(font: Font = .system(.body), foregroundColorSelected: Color = .preferredColor(.tintColor), foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = .preferredColor(.primaryFill), fillColorUnselected: Color = .preferredColor(.secondaryFill), strokeColorSelected: Color = .preferredColor(.tintColor), strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 10, spacing: CGFloat = 6, padding: CGFloat = 8, borderWidth: CGFloat = 1, minHeight: CGFloat = 38) -> some View {
        self.environment(\.filterFeedbackBarStyle,
                         DefaultFilterFeedbackBarStyle(font: font, foregroundColorSelected: foregroundColorSelected, foregroundColorUnselected: foregroundColorUnselected, fillColorSelected: fillColorSelected, fillColorUnselected: fillColorUnselected, strokeColorSelected: strokeColorSelected, strokeColorUnselected: strokeColorUnselected, cornerRadius: cornerRadius, spacing: spacing, padding: padding, borderWidth: borderWidth, minHeight: minHeight))
    }
}
