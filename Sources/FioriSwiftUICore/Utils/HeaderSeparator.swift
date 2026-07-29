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

// Environment key for providing a configurable separator for picker components
// (DurationPicker, DateTimePicker, ValuePicker, DateRangePicker)
// Default value matches the previously hardcoded Divider style used by these pickers
struct PickerSeparatorKey: EnvironmentKey {
    static let defaultValue = PickerSeparatorConfiguration(showSeparator: true, color: Color.preferredColor(.separatorOpaque), lineWidth: 0.33)
}

extension EnvironmentValues {
    /// Gets or sets the separator configuration for picker components.
    ///
    /// Propagates the `PickerSeparatorConfiguration` through the view hierarchy.
    /// Pickers (`DurationPicker`, `DateTimePicker`, `ValuePicker`, `DateRangePicker`)
    /// read this value to render their internal separator. Prefer the
    /// `View.pickerSeparator(_:color:lineWidth:)` modifier over setting this
    /// environment value directly.
    var pickerSeparator: PickerSeparatorConfiguration {
        get { self[PickerSeparatorKey.self] }
        set { self[PickerSeparatorKey.self] = newValue }
    }
}

/// Configuration for the separator used inside picker components such as
/// `DurationPicker`, `DateTimePicker`, `ValuePicker` and `DateRangePicker`.
public struct PickerSeparatorConfiguration {
    /// Whether to show the separator.
    public let showSeparator: Bool

    /// Color of the separator.
    public let color: Color

    /// Width of the separator line.
    public let lineWidth: CGFloat

    /// Creates a new picker separator configuration.
    /// - Parameters:
    ///   - showSeparator: Whether to show the separator.
    ///   - color: Color of the separator.
    ///   - lineWidth: Width of the separator line.
    public init(showSeparator: Bool, color: Color, lineWidth: CGFloat) {
        self.showSeparator = showSeparator
        self.color = color
        self.lineWidth = lineWidth
    }
}

public extension View {
    /// Sets the separator for picker components.
    ///
    /// Applies to `DurationPicker`, `DateTimePicker`, `ValuePicker` and `DateRangePicker`'s
    /// internal separators.
    ///
    /// - Parameters:
    ///   - visibility: Whether to show the separator.
    ///   - color: Color of the separator. Defaults to the opaque separator color.
    ///   - lineWidth: Width of the separator line. Defaults to 0.33.
    /// - Returns: A view with the applied separator configuration.
    ///
    /// Example usage:
    /// ```swift
    /// DurationPicker(...)
    ///     .pickerSeparator(true)                              // default style
    ///     .pickerSeparator(true, color: .red)                 // red separator
    ///     .pickerSeparator(true, color: .blue, lineWidth: 1)  // thick blue separator
    ///     .pickerSeparator(false)                             // hide separator
    /// ```
    func pickerSeparator(_ visibility: Bool,
                         color: Color = Color.preferredColor(.separatorOpaque),
                         lineWidth: CGFloat = 0.33) -> some View
    {
        self.environment(\.pickerSeparator, PickerSeparatorConfiguration(showSeparator: visibility, color: color, lineWidth: lineWidth))
    }
}
