// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DateTimePicker {
    let title: any View
    let valueLabel: any View
    let mandatoryFieldIndicator: any View
    let isRequired: Bool
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    @Binding var selectedDate: Date
    let pickerComponents: DatePicker.Components

    @Environment(\.dateTimePickerStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder valueLabel: () -> any View = { EmptyView() },
                @ViewBuilder mandatoryFieldIndicator: () -> any View = { EmptyView() },
                isRequired: Bool = false,
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                selectedDate: Binding<Date>,
                pickerComponents: DatePicker.Components = [.date, .hourAndMinute])
    {
        self.title = Title(title: title)
        self.valueLabel = ValueLabel(valueLabel: valueLabel)
        self.mandatoryFieldIndicator = MandatoryFieldIndicator(mandatoryFieldIndicator: mandatoryFieldIndicator)
        self.isRequired = isRequired
        self.controlState = controlState
        self.errorMessage = errorMessage
        self._selectedDate = selectedDate
        self.pickerComponents = pickerComponents
    }
}

public extension DateTimePicker {
    init(title: AttributedString,
         valueLabel: AttributedString? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         selectedDate: Binding<Date>,
         pickerComponents: DatePicker.Components = [.date, .hourAndMinute])
    {
        self.init(title: { Text(title) }, valueLabel: { OptionalText(valueLabel) }, mandatoryFieldIndicator: { TextOrIconView(mandatoryFieldIndicator) }, isRequired: isRequired, controlState: controlState, errorMessage: errorMessage, selectedDate: selectedDate, pickerComponents: pickerComponents)
    }
}

public extension DateTimePicker {
    init(_ configuration: DateTimePickerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DateTimePickerConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.valueLabel = configuration.valueLabel
        self.mandatoryFieldIndicator = configuration.mandatoryFieldIndicator
        self.isRequired = configuration.isRequired
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self._selectedDate = configuration.$selectedDate
        self.pickerComponents = configuration.pickerComponents
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension DateTimePicker: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), valueLabel: .init(self.valueLabel), mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator), isRequired: self.isRequired, controlState: self.controlState, errorMessage: self.errorMessage, selectedDate: self.$selectedDate, pickerComponents: self.pickerComponents)).typeErased
                .transformEnvironment(\.dateTimePickerStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DateTimePicker {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DateTimePicker(.init(title: .init(self.title), valueLabel: .init(self.valueLabel), mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator), isRequired: self.isRequired, controlState: self.controlState, errorMessage: self.errorMessage, selectedDate: self.$selectedDate, pickerComponents: self.pickerComponents))
            .shouldApplyDefaultStyle(false)
            .dateTimePickerStyle(DateTimePickerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
