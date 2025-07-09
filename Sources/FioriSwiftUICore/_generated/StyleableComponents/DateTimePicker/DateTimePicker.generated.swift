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
    let range: ClosedRange<Date>?
    @Binding var selectedDate: Date
    /// The `DateFormatter` to be used to display the selected `Date`. Default formatter will use customized dateStyle and timeStyle.
    let dateFormatter: DateFormatter?
    /// The components shown in the date picker, default value shows date and time.
    let pickerComponents: DatePicker.Components
    /// The custom style for displaying the date. The default value is `.abbreviated`, showing for example, "Oct 21, 2015".
    let dateStyle: Date.FormatStyle.DateStyle
    /// The custom style for displaying the time. The default value is `.shortened`, showing for example, "4:29 PM" or "16:29".
    let timeStyle: Date.FormatStyle.TimeStyle
    /// The text to be displayed when no date is selected. If this property is `nil`, the localized string “No date selected” will be used.
    let noDateSelectedString: String?
    /// This property indicates whether the picker is to be displayed.
    @Binding var pickerVisible: Bool

    @Environment(\.dateTimePickerStyle) var style

    var componentIdentifier: String = DateTimePicker.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder valueLabel: () -> any View = { EmptyView() },
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                range: ClosedRange<Date>? = nil,
                selectedDate: Binding<Date>,
                dateFormatter: DateFormatter? = nil,
                pickerComponents: DatePicker.Components = [.date, .hourAndMinute],
                dateStyle: Date.FormatStyle.DateStyle = .abbreviated,
                timeStyle: Date.FormatStyle.TimeStyle = .shortened,
                noDateSelectedString: String? = nil,
                pickerVisible: Binding<Bool>,
                componentIdentifier: String? = DateTimePicker.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.valueLabel = ValueLabel(valueLabel: valueLabel, componentIdentifier: componentIdentifier)
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.range = range
        self._selectedDate = selectedDate
        self.dateFormatter = dateFormatter
        self.pickerComponents = pickerComponents
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
        self.noDateSelectedString = noDateSelectedString
        self._pickerVisible = pickerVisible
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
         range: ClosedRange<Date>? = nil,
         selectedDate: Binding<Date>,
         dateFormatter: DateFormatter? = nil,
         pickerComponents: DatePicker.Components = [.date, .hourAndMinute],
         dateStyle: Date.FormatStyle.DateStyle = .abbreviated,
         timeStyle: Date.FormatStyle.TimeStyle = .shortened,
         noDateSelectedString: String? = nil,
         pickerVisible: Binding<Bool>)
    {
        self.init(title: {
            TextWithMandatoryFieldIndicator(text: title, isRequired: isRequired, mandatoryFieldIndicator: mandatoryFieldIndicator)
        }, valueLabel: { OptionalText(valueLabel) }, controlState: controlState, errorMessage: errorMessage, range: range, selectedDate: selectedDate, dateFormatter: dateFormatter, pickerComponents: pickerComponents, dateStyle: dateStyle, timeStyle: timeStyle, noDateSelectedString: noDateSelectedString, pickerVisible: pickerVisible)
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
        self.range = configuration.range
        self._selectedDate = configuration.$selectedDate
        self.dateFormatter = configuration.dateFormatter
        self.pickerComponents = configuration.pickerComponents
        self.dateStyle = configuration.dateStyle
        self.timeStyle = configuration.timeStyle
        self.noDateSelectedString = configuration.noDateSelectedString
        self._pickerVisible = configuration.$pickerVisible
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DateTimePicker: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), valueLabel: .init(self.valueLabel), controlState: self.controlState, errorMessage: self.errorMessage, range: self.range, selectedDate: self.$selectedDate, dateFormatter: self.dateFormatter, pickerComponents: self.pickerComponents, dateStyle: self.dateStyle, timeStyle: self.timeStyle, noDateSelectedString: self.noDateSelectedString, pickerVisible: self.$pickerVisible)).typeErased
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
        DateTimePicker(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), valueLabel: .init(self.valueLabel), controlState: self.controlState, errorMessage: self.errorMessage, range: self.range, selectedDate: self.$selectedDate, dateFormatter: self.dateFormatter, pickerComponents: self.pickerComponents, dateStyle: self.dateStyle, timeStyle: self.timeStyle, noDateSelectedString: self.noDateSelectedString, pickerVisible: self.$pickerVisible))
            .shouldApplyDefaultStyle(false)
            .dateTimePickerStyle(DateTimePickerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
