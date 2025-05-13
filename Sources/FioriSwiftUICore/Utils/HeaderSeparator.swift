import FioriThemeManager
import Foundation
import SwiftUI

// Environment key for providing a standard hairline separator for header components
// Default value is set to show separator with system default color and 0.45 line width
struct HeaderSeparatorKey: EnvironmentKey {
    // Default configuration: shows separator with system default color and 0.45 line width
    static let defaultValue = HeaderSeparatorConfiguration(showSeparator: true, color: Color.preferredColor(.separator), lineWidth: 0.45)
}

extension EnvironmentValues {
    // Gets or sets the separator configuration for header components
    // Propagates separator configuration through the view hierarchy using environment values
    var headerSeparator: HeaderSeparatorConfiguration {
        get { self[HeaderSeparatorKey.self] }
        set { self[HeaderSeparatorKey.self] = newValue }
    }
}

// Configuration for header component's separator
// Contains visibility state, color, and line width of the separator
struct HeaderSeparatorConfiguration {
    // Whether to show the separator
    let showSeparator: Bool
    
    // Color of the separator
    let color: Color
    
    // Width of the separator line
    let lineWidth: CGFloat
    
    init(showSeparator: Bool, color: Color, lineWidth: CGFloat) {
        self.showSeparator = showSeparator
        self.color = color
        self.lineWidth = lineWidth
    }
}

public extension View {
    /// Sets the separator for header components
    /// - Parameters:
    ///   - visibility: Whether to show the separator
    ///   - color: Color of the separator, defaults to system default color
    ///   - lineWidth: Width of the separator line, defaults to 0.45
    /// - Returns: A view with the applied separator configuration
    ///
    /// Example usage:
    /// ```swift
    /// ProfileHeader(...)
    ///     .headerSeparator(true) // Show separator with default style
    ///     .headerSeparator(true, color: .red) // Show red separator
    ///     .headerSeparator(true, color: .blue, lineWidth: 1.0) // Show thick blue separator
    ///     .headerSeparator(false) // Hide separator
    /// ```
    func headerSeparator(_ visibility: Bool,
                         color: Color = Color.preferredColor(.separator),
                         lineWidth: CGFloat = 0.45) -> some View
    {
        self.environment(\.headerSeparator, HeaderSeparatorConfiguration(showSeparator: visibility, color: color, lineWidth: lineWidth))
    }
}
