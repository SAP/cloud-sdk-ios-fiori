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

#if !os(visionOS)
    /// default filter feedbackbar foreground color
    public let DefaultFilterFeedbackBarForegroundColor = Color.preferredColor(.tintColor)
#else
    /// default filter feedbackbar foreground color
    public let DefaultFilterFeedbackBarForegroundColor = Color.preferredColor(.primaryLabel)
#endif

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
    let maxWidth: CGFloat
    
    /// :nodoc:
    public init(font: Font = .system(.body), foregroundColorSelected: Color = DefaultFilterFeedbackBarForegroundColor, foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = Color.clear, fillColorUnselected: Color = .preferredColor(.tertiaryFill), strokeColorSelected: Color = DefaultFilterFeedbackBarForegroundColor, strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 10, spacing: CGFloat = 6, padding: CGFloat = 8, borderWidth: CGFloat = 1, minHeight: CGFloat = 38, maxWidth: CGFloat = 0) {
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
        self.maxWidth = maxWidth
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
            .frame(maxWidth: self.maxWidth > 0 ? self.maxWidth : nil, minHeight: self.minHeight)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .fill(configuration.isSelected ? self.fillColorSelected : self.fillColorUnselected)
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .strokeBorder(configuration.isSelected ? self.strokeColorSelected : self.strokeColorUnselected, lineWidth: self.borderWidth)
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
    func filterFeedbackBarStyle(_ style: some FilterFeedbackBarStyle) -> some View {
        self.environment(\.filterFeedbackBarStyle, style)
    }
    
    /// Experimental filter feedback bar styling
    func filterFeedbackBarStyle(font: Font = .system(.body), foregroundColorSelected: Color = .preferredColor(.tintColor), foregroundColorUnselected: Color = .preferredColor(.tertiaryLabel), fillColorSelected: Color = Color.clear, fillColorUnselected: Color = .preferredColor(.tertiaryFill), strokeColorSelected: Color = .preferredColor(.tintColor), strokeColorUnselected: Color = .preferredColor(.separator), cornerRadius: CGFloat = 10, spacing: CGFloat = 6, padding: CGFloat = 8, borderWidth: CGFloat = 1, minHeight: CGFloat = 38, maxWidth: CGFloat = 0) -> some View {
        self.environment(\.filterFeedbackBarStyle,
                         DefaultFilterFeedbackBarStyle(font: font, foregroundColorSelected: foregroundColorSelected, foregroundColorUnselected: foregroundColorUnselected, fillColorSelected: fillColorSelected, fillColorUnselected: fillColorUnselected, strokeColorSelected: strokeColorSelected, strokeColorUnselected: strokeColorUnselected, cornerRadius: cornerRadius, spacing: spacing, padding: padding, borderWidth: borderWidth, minHeight: minHeight, maxWidth: maxWidth))
    }
}
