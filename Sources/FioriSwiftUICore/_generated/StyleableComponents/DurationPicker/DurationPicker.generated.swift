// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `DurationPicker` provides a wheel style `Picker` with Fiori styling to select a duration.
/// ## Usage
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
public struct DurationPicker {
    @Binding var selection: Int
    var maximumMinutes: Int
    var minimumMinutes: Int
    var minuteInterval: Int
    var measurementFormatter: MeasurementFormatter

    @Environment(\.durationPickerStyle) var style

    var componentIdentifier: String = DurationPicker.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(selection: Binding<Int>,
                maximumMinutes: Int = 1439,
                minimumMinutes: Int = 0,
                minuteInterval: Int = 1,
                measurementFormatter: MeasurementFormatter = MeasurementFormatter(),
                componentIdentifier: String? = DurationPicker.identifier)
    {
        self._selection = selection
        self.maximumMinutes = maximumMinutes
        self.minimumMinutes = minimumMinutes
        self.minuteInterval = minuteInterval
        self.measurementFormatter = measurementFormatter
        self.componentIdentifier = componentIdentifier ?? DurationPicker.identifier
    }
}

public extension DurationPicker {
    static let identifier = "fiori_durationpicker_component"
}

public extension DurationPicker {
    init(_ configuration: DurationPickerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DurationPickerConfiguration, shouldApplyDefaultStyle: Bool) {
        self._selection = configuration.$selection
        self.maximumMinutes = configuration.maximumMinutes
        self.minimumMinutes = configuration.minimumMinutes
        self.minuteInterval = configuration.minuteInterval
        self.measurementFormatter = configuration.measurementFormatter
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DurationPicker: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, selection: self.$selection, maximumMinutes: self.maximumMinutes, minimumMinutes: self.minimumMinutes, minuteInterval: self.minuteInterval, measurementFormatter: self.measurementFormatter)).typeErased
                .transformEnvironment(\.durationPickerStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DurationPicker {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DurationPicker(.init(componentIdentifier: self.componentIdentifier, selection: self.$selection, maximumMinutes: self.maximumMinutes, minimumMinutes: self.minimumMinutes, minuteInterval: self.minuteInterval, measurementFormatter: self.measurementFormatter))
            .shouldApplyDefaultStyle(false)
            .durationPickerStyle(DurationPickerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
