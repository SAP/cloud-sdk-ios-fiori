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
public struct DurationPickerBaseStyle: DurationPickerStyle {
    public func makeBody(_ configuration: DurationPickerConfiguration) -> some View {
        // Add default layout here
        DurationPickerViewWrapper(selection: configuration.$selection, maximumMinutes: configuration.maximumMinutes, minimumMinutes: configuration.minimumMinutes, minuteInterval: configuration.minuteInterval, measurementFormatter: configuration.measurementFormatter)
            .frame(width: 232, height: 204)
            .background(Color.preferredColor(.primaryBackground))
            .foregroundColor(Color.preferredColor(.primaryLabel))
            .cornerRadius(18)
            .shadow(color: Color.preferredColor(.cardShadow), radius: 5)
            .shadow(color: Color.preferredColor(.cardShadow), radius: 20)
    }
}

// Default fiori styles
extension DurationPickerFioriStyle {
    struct ContentFioriStyle: DurationPickerStyle {
        func makeBody(_ configuration: DurationPickerConfiguration) -> some View {
            DurationPicker(configuration)
            // Add default style for its content
            // .background()
        }
    }
}

/// The key for measurement formatter of duration picker in the environment.
struct MeasurementFormatterKey: EnvironmentKey {
    static var defaultValue: MeasurementFormatter = .init()
}

public extension EnvironmentValues {
    /// The formatter for duration picker.
    var measurementFormatter: MeasurementFormatter {
        get {
            self[MeasurementFormatterKey.self]
        }
        set {
            self[MeasurementFormatterKey.self] = newValue
        }
    }
}

public extension View {
    /// Set measurement formatter for duration picker.
    /// ```swift
    /// @State var selection: Int = 0
    /// var formatter: MeasurementFormatter {
    /// let formatter = MeasurementFormatter()
    ///     formatter.locale = Locale(identifier: "zh-CN")
    ///     formatter.unitStyle = .long
    ///     formatter.unitOptions = .providedUnit
    ///     return formatter
    /// }
    /// DurationPicker(selection: self.$selection, maximumMinutes: 124, minimumMinutes: 60, minuteInterval: 2)
    ///     .measurementFormatter(self.formatter)
    /// ```
    /// - Parameter formatter: The measurement formatter for duration picker.
    /// - Returns: A view with specified measurement formatter.
    func measurementFormatter(_ formatter: MeasurementFormatter) -> some View {
        environment(\.measurementFormatter, formatter)
    }
}
