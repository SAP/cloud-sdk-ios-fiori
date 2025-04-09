// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `DateTimePicker`  provides a title and value label with Fiori styling and a `DatePicker`.
///
/// ## Usage
/// ```swift
/// @State var selection: Date = .init(timeIntervalSince1970: 0.0)
/// @State var isRequired = false
/// @State var showsErrorMessage = false
///
/// DateTimePicker(title: "Default", isRequired: self.isRequired, selectedDate: self.$selection)
///    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("The Date should be before December."))
///    .informationViewStyle(.informational)
/// ```
public struct DateTimePicker {
    let title: any View
    let valueLabel: any View
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    @Binding var selectedDate: Date
    /// The components shown in the date picker, default value shows date and time.
    let pickerComponents: DatePicker.Components
    /// The custom style for displaying the date. The default value is `.abbreviated`, showing for example, "Oct 21, 2015".
    let dateStyle: Date.FormatStyle.DateStyle
    /// The custom style for displaying the time. The default value is `.shortened`, showing for example, "4:29 PM" or "16:29".
    let timeStyle: Date.FormatStyle.TimeStyle
    /// The text to be displayed when no date is selected. If this property is `nil`, the localized string “No date selected” will be used.
    let noDateSelectedString: String?

    @Environment(\.dateTimePickerStyle) var style

    var componentIdentifier: String = DateTimePicker.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder valueLabel: () -> any View = { EmptyView() },
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                selectedDate: Binding<Date>,
                pickerComponents: DatePicker.Components = [.date, .hourAndMinute],
                dateStyle: Date.FormatStyle.DateStyle = .abbreviated,
                timeStyle: Date.FormatStyle.TimeStyle = .shortened,
                noDateSelectedString: String? = nil,
                componentIdentifier: String? = DateTimePicker.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.valueLabel = ValueLabel(valueLabel: valueLabel, componentIdentifier: componentIdentifier)
        self.controlState = controlState
        self.errorMessage = errorMessage
        self._selectedDate = selectedDate
        self.pickerComponents = pickerComponents
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
        self.noDateSelectedString = noDateSelectedString
        self.componentIdentifier = componentIdentifier ?? DateTimePicker.identifier
    }
}

public extension DateTimePicker {
    static let identifier = "fiori_datetimepicker_component"
}

public extension DateTimePicker {
    init(title: AttributedString,
         valueLabel: AttributedString? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         selectedDate: Binding<Date>,
         pickerComponents: DatePicker.Components = [.date, .hourAndMinute],
         dateStyle: Date.FormatStyle.DateStyle = .abbreviated,
         timeStyle: Date.FormatStyle.TimeStyle = .shortened,
         noDateSelectedString: String? = nil)
    {
        self.init(title: {
            TextWithMandatoryFieldIndicator(text: title, isRequired: isRequired, mandatoryFieldIndicator: mandatoryFieldIndicator)
        }, valueLabel: { OptionalText(valueLabel) }, controlState: controlState, errorMessage: errorMessage, selectedDate: selectedDate, pickerComponents: pickerComponents, dateStyle: dateStyle, timeStyle: timeStyle, noDateSelectedString: noDateSelectedString)
    }
}

public extension DateTimePicker {
    init(_ configuration: DateTimePickerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DateTimePickerConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.valueLabel = configuration.valueLabel
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self._selectedDate = configuration.$selectedDate
        self.pickerComponents = configuration.pickerComponents
        self.dateStyle = configuration.dateStyle
        self.timeStyle = configuration.timeStyle
        self.noDateSelectedString = configuration.noDateSelectedString
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DateTimePicker: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), valueLabel: .init(self.valueLabel), controlState: self.controlState, errorMessage: self.errorMessage, selectedDate: self.$selectedDate, pickerComponents: self.pickerComponents, dateStyle: self.dateStyle, timeStyle: self.timeStyle, noDateSelectedString: self.noDateSelectedString)).typeErased
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
        DateTimePicker(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), valueLabel: .init(self.valueLabel), controlState: self.controlState, errorMessage: self.errorMessage, selectedDate: self.$selectedDate, pickerComponents: self.pickerComponents, dateStyle: self.dateStyle, timeStyle: self.timeStyle, noDateSelectedString: self.noDateSelectedString))
            .shouldApplyDefaultStyle(false)
            .dateTimePickerStyle(DateTimePickerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
