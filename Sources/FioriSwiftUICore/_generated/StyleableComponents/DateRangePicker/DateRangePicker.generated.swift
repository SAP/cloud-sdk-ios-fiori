// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `DateRangePicker`  provides a title and value label with Fiori styling and a `MultiDatePicker`.
/// ## Usage
/// ```swift
/// @State var isRequired = false
/// @State var selectedRange1: ClosedRange<Date>? = Date.now...Date.init(timeIntervalSinceNow: 24 * 60 * 60 * 2)
/// @State var selectedRange2: ClosedRange<Date>? = Date.now...Date.init(timeIntervalSinceNow: 24 * 60 * 60 * 2)
/// @State var selectedRange3: ClosedRange<Date>? = Date.now...Date.init(timeIntervalSinceNow: 24 * 60 * 60 * 2)
/// @State var pickerVisible1 = false
/// @State var pickerVisible2 = false
/// @State var pickerVisible3 = false
/// @State var showsErrorMessage = false
/// @State var showAINotice: Bool = false
/// let customizedDateFormatter: DateFormatter = {
///     let formatter = DateFormatter()
///     formatter.dateFormat = "dd-MM-yyyy"
///     return formatter
/// }()
/// DateRangePicker(title: "Range Selection1", isRequired: isRequired, selectedRange: $selectedRange1, pickerVisible: $pickerVisible1)
///     .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("This is information hint message."))
///     .informationViewStyle(.informational)
///     .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
///
/// DateRangePicker(title: "Customized Date Formatter", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedRange: self.$selectedRange2, rangeFormatter: self.customizedDateFormatter, pickerVisible: self.$pickerVisible2)
///     .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("This is information success message."))
///     .informationViewStyle(.success)
///     .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
///
/// DateRangePicker(title: "Custom Locale & Calendar", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedRange: self.$selectedRange3, pickerVisible: self.$pickerVisible3)
///     .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("This is information hint message."))
///     .informationViewStyle(.informational)
///     .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
///     .environment(\.locale, Locale(identifier: "zh-Hans"))
///     .environment(\.calendar, Calendar(identifier: .gregorian))
/// ```
public struct DateRangePicker {
    let title: any View
    let valueLabel: any View
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    /// The inclusive range of selectable dates.
    let range: Range<Date>?
    /// The range of selected dates. Default is nil. It's continuous in ascending order.
    @Binding var selectedRange: ClosedRange<Date>?
    /// Range date formatter. The default date formatter conforms system setting, it uses short date type in compact screen and uses long date type in regular screen.
    let rangeFormatter: DateFormatter?
    /// The text to be displayed when no range is selected. If this property is `nil`, the localized string “No range selected” will be used.
    let noRangeSelectedString: String?
    /// This property indicates whether the picker is to be displayed or not.
    @Binding var pickerVisible: Bool

    @Environment(\.dateRangePickerStyle) var style

    var componentIdentifier: String = DateRangePicker.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder valueLabel: () -> any View = { EmptyView() },
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                range: Range<Date>? = nil,
                selectedRange: Binding<ClosedRange<Date>?> = .constant(nil),
                rangeFormatter: DateFormatter? = nil,
                noRangeSelectedString: String? = nil,
                pickerVisible: Binding<Bool>,
                componentIdentifier: String? = DateRangePicker.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.valueLabel = ValueLabel(valueLabel: valueLabel, componentIdentifier: componentIdentifier)
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.range = range
        self._selectedRange = selectedRange
        self.rangeFormatter = rangeFormatter
        self.noRangeSelectedString = noRangeSelectedString
        self._pickerVisible = pickerVisible
        self.componentIdentifier = componentIdentifier ?? DateRangePicker.identifier
    }
}

public extension DateRangePicker {
    static let identifier = "fiori_daterangepicker_component"
}

public extension DateRangePicker {
    init(title: AttributedString,
         valueLabel: AttributedString? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         range: Range<Date>? = nil,
         selectedRange: Binding<ClosedRange<Date>?>,
         rangeFormatter: DateFormatter? = nil,
         noRangeSelectedString: String? = nil,
         pickerVisible: Binding<Bool>)
    {
        self.init(title: {
            TextWithMandatoryFieldIndicator(text: title, isRequired: isRequired, mandatoryFieldIndicator: mandatoryFieldIndicator)
        }, valueLabel: { OptionalText(valueLabel) }, controlState: controlState, errorMessage: errorMessage, range: range, selectedRange: selectedRange, rangeFormatter: rangeFormatter, noRangeSelectedString: noRangeSelectedString, pickerVisible: pickerVisible)
    }
}

public extension DateRangePicker {
    init(_ configuration: DateRangePickerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DateRangePickerConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.valueLabel = configuration.valueLabel
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self.range = configuration.range
        self._selectedRange = configuration.$selectedRange
        self.rangeFormatter = configuration.rangeFormatter
        self.noRangeSelectedString = configuration.noRangeSelectedString
        self._pickerVisible = configuration.$pickerVisible
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DateRangePicker: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), valueLabel: .init(self.valueLabel), controlState: self.controlState, errorMessage: self.errorMessage, range: self.range, selectedRange: self.$selectedRange, rangeFormatter: self.rangeFormatter, noRangeSelectedString: self.noRangeSelectedString, pickerVisible: self.$pickerVisible)).typeErased
                .transformEnvironment(\.dateRangePickerStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DateRangePicker {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DateRangePicker(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), valueLabel: .init(self.valueLabel), controlState: self.controlState, errorMessage: self.errorMessage, range: self.range, selectedRange: self.$selectedRange, rangeFormatter: self.rangeFormatter, noRangeSelectedString: self.noRangeSelectedString, pickerVisible: self.$pickerVisible))
            .shouldApplyDefaultStyle(false)
            .dateRangePickerStyle(DateRangePickerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
