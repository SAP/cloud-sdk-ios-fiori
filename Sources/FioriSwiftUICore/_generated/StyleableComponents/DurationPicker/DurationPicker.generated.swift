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
/// DurationPicker(title: "Measurement Formatter", selection: self.$selection3, maximumMinutes: 124, minimumMinutes: 60, minuteInterval: 2)
///    .measurementFormatter(self.formatter)
/// ```
public struct DurationPicker {
    let title: any View
    let valueLabel: any View
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    @Binding var selection: Int
    var maximumMinutes: Int
    var minimumMinutes: Int
    var minuteInterval: Int
    var measurementFormatter: MeasurementFormatter

    @Environment(\.durationPickerStyle) var style

    var componentIdentifier: String = DurationPicker.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder valueLabel: () -> any View = { EmptyView() },
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                selection: Binding<Int>,
                maximumMinutes: Int = 1439,
                minimumMinutes: Int = 0,
                minuteInterval: Int = 1,
                measurementFormatter: MeasurementFormatter = MeasurementFormatter(),
                componentIdentifier: String? = DurationPicker.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.valueLabel = ValueLabel(valueLabel: valueLabel, componentIdentifier: componentIdentifier)
        self.controlState = controlState
        self.errorMessage = errorMessage
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
    init(title: AttributedString,
         valueLabel: AttributedString? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         selection: Binding<Int>,
         maximumMinutes: Int = 1439,
         minimumMinutes: Int = 0,
         minuteInterval: Int = 1,
         measurementFormatter: MeasurementFormatter = MeasurementFormatter())
    {
        self.init(title: {
            TextWithMandatoryFieldIndicator(text: title, isRequired: isRequired, mandatoryFieldIndicator: mandatoryFieldIndicator)
        }, valueLabel: { OptionalText(valueLabel) }, controlState: controlState, errorMessage: errorMessage, selection: selection, maximumMinutes: maximumMinutes, minimumMinutes: minimumMinutes, minuteInterval: minuteInterval, measurementFormatter: measurementFormatter)
    }
}

public extension DurationPicker {
    init(_ configuration: DurationPickerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DurationPickerConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.valueLabel = configuration.valueLabel
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
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
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), valueLabel: .init(self.valueLabel), controlState: self.controlState, errorMessage: self.errorMessage, selection: self.$selection, maximumMinutes: self.maximumMinutes, minimumMinutes: self.minimumMinutes, minuteInterval: self.minuteInterval, measurementFormatter: self.measurementFormatter)).typeErased
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
        DurationPicker(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), valueLabel: .init(self.valueLabel), controlState: self.controlState, errorMessage: self.errorMessage, selection: self.$selection, maximumMinutes: self.maximumMinutes, minimumMinutes: self.minimumMinutes, minuteInterval: self.minuteInterval, measurementFormatter: self.measurementFormatter))
            .shouldApplyDefaultStyle(false)
            .durationPickerStyle(DurationPickerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
