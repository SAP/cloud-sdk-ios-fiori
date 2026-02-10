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

#if !os(visionOS)
    /// default filter feedbackbar foreground color
    public let DefaultFilterFeedbackBarForegroundColor = Color.preferredColor(.tintColor)
#else
    /// default filter feedbackbar foreground color
    public let DefaultFilterFeedbackBarForegroundColor = Color.preferredColor(.primaryLabel)
#endif
