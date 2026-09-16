import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DateTimePickerBaseStyle: DateTimePickerStyle {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.dateTimePickerAutoSelected) var autoSelected
    @Environment(\.isLoading) var isLoading
    @Environment(\.pickerSeparator) private var pickerSeparatorConfiguration

    @State private var selectedDate: Date = .now

    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        SkeletonLoadingContainer {
            VStack {
                VStack(spacing: 0) {
                    Group {
                        if self.dynamicTypeSize >= .accessibility3 {
                            self.configureMainStack(configuration, isVertical: true)
                        } else {
                            ViewThatFits(in: .horizontal) {
                                self.configureMainStack(configuration, isVertical: false)
                                self.configureMainStack(configuration, isVertical: true)
                            }
                        }
                    }
                    .animation(nil, value: configuration.pickerVisible)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.top, 8)

                    if configuration.pickerVisible, !self.isLoading {
                        LazyVStack {
                            if !configuration.hidesSeparator, self.pickerSeparatorConfiguration.showSeparator {
                                self.pickerSeparatorConfiguration.color
                                    .frame(height: self.pickerSeparatorConfiguration.lineWidth)
                                    .padding(.top, 14)
                            }
                            self.showPicker(configuration)
                        }
                        .transition(.opacity.combined(with: .scale(scale: 1.0, anchor: .top)))
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: configuration.pickerVisible)
            }
            .onAppear {
                if let configuredDate = configuration.selectedDate {
                    self.selectedDate = configuredDate
                }
            }
            .ifApply(FioriLocale.shared.locale != nil) {
                let fioriLocale = FioriLocale.shared.locale ?? .current
                return $0.environment(\.locale, fioriLocale)
                    .environment(\.calendar, fioriLocale.calendar)
            }
            .onChange(of: configuration.selectedDate) { _, _ in
                if let configuredDate = configuration.selectedDate {
                    self.selectedDate = configuredDate
                }
            }
        }
    }

    func configureMainStack(_ configuration: DateTimePickerConfiguration, isVertical: Bool) -> some View {
        let mainStack = isVertical ? AnyLayout(VStackLayout(alignment: .leading, spacing: 3)) : AnyLayout(HStackLayout())
        return mainStack {
            configuration.title
            if !isVertical {
                Spacer()
            } else {
                Divider().hidden()
            }
            
            HStack(spacing: 4) {
                ValueLabel(valueLabel: AttributedString(self.getValueLabel(configuration)))
                    .foregroundStyle(self.getFontColor(configuration))
                    .font(.fiori(forTextStyle: .body))
                    .accessibilityLabel(self.getValueLabel(configuration))
                if configuration.controlState != .disabled,
                   configuration.controlState != .readOnly,
                   configuration.selectedDate != nil,
                   configuration.showsClearAction
                {
                    configuration.clearAction
                        .onSimultaneousTapGesture {
                            configuration.selectedDate = nil
                        }
                        .contentShape(.accessibility, .rect.scale(1.2))
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityHint(self.mainStackAccessibilityHint(configuration))
        .contentShape(Rectangle())
        .ifApply(configuration.controlState != .disabled && configuration.controlState != .readOnly && !self.isLoading) {
            $0.onTapGesture(perform: {
                if configuration.selectedDate == Date(timeIntervalSince1970: 0.0) {
                    configuration.selectedDate = Date()
                    self.selectedDate = Date()
                } else if configuration.selectedDate == nil,
                          self.autoSelected
                {
                    configuration.selectedDate = self.selectedDate
                }
                configuration.pickerVisible.toggle()
            })
        }
    }
    
    func mainStackAccessibilityHint(_ configuration: DateTimePickerConfiguration) -> String {
        if configuration.controlState != .disabled, configuration.controlState != .readOnly {
            configuration.pickerVisible ? "DoubleTapToCollapseKey".localizedFioriString() : "DoubleTapToOpenKey".localizedFioriString()
        } else {
            ""
        }
    }

    func getValueLabel(_ configuration: DateTimePickerConfiguration) -> String {
        if let selectedDate = configuration.selectedDate {
            if let dateFormatter = configuration.dateFormatter {
                return dateFormatter.string(from: selectedDate)
            }
            
            let formattedDate = selectedDate.formatted(date: configuration.dateStyle, time: .omitted)
            let formattedTime = selectedDate.formatted(date: .omitted, time: configuration.timeStyle)
            if configuration.pickerComponents == .date {
                return formattedDate
            } else if configuration.pickerComponents == .hourAndMinute {
                return formattedTime
            } else {
                return formattedDate + "   " + formattedTime
            }
        } else {
            return configuration.noDateSelectedString ?? NSLocalizedString("No date selected", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        }
    }
    
    func getFontColor(_ configuration: DateTimePickerConfiguration) -> Color {
        if configuration.controlState == .disabled {
            return .preferredColor(.separator)
        } else if configuration.pickerVisible {
            return .preferredColor(.tintColor)
        } else {
            return .preferredColor(.primaryLabel)
        }
    }
    
    func showPicker(_ configuration: DateTimePickerConfiguration) -> some View {
        let configSelectedDate = configuration.$selectedDate
        let selection: Binding<Date> = Binding {
            self.selectedDate
        } set: {
            self.selectedDate = $0
            configSelectedDate.wrappedValue = $0
        }

        if let range = configuration.range {
            return DatePicker("", selection: selection, in: range, displayedComponents: configuration.pickerComponents)
                .datePickerStyle(.graphical)
                .setOnChange(of: configuration.selectedDate) {
                    _ = self.getValueLabel(configuration)
                }
        } else {
            return DatePicker("", selection: selection, displayedComponents: configuration.pickerComponents)
                .datePickerStyle(.graphical)
                .setOnChange(of: configuration.selectedDate) {
                    _ = self.getValueLabel(configuration)
                }
        }
    }
}

// Default fiori styles
extension DateTimePickerFioriStyle {
    struct ContentFioriStyle: DateTimePickerStyle {
        func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
            DateTimePicker(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration
        @Environment(\.isLoading) var isLoading

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : (self.dateTimePickerConfiguration.controlState == .disabled ? .quaternaryLabel : .primaryLabel)))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }

    struct ValueLabelFioriStyle: ValueLabelStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration
        @Environment(\.isLoading) var isLoading

        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
                .ifApply(self.isLoading) {
                    $0.foregroundStyle(Color.preferredColor(.separator))
                }
        }
    }
    
    struct FormViewFioriStyle: FormViewStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration
        
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}

struct DateTimePickerAutoSelectedKey: EnvironmentKey {
    public static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    /// If this property is true and selectedDate's initial value is nil,  selectedDate will be set to  .now by default when the date picker opens.
    /// Default value is false.
    var dateTimePickerAutoSelected: Bool {
        get { self[DateTimePickerAutoSelectedKey.self] }
        set { self[DateTimePickerAutoSelectedKey.self] = newValue }
    }
}

/// Predefined skeleton loading patterns for `DateTimePicker`.
///
/// Apply the ``EnvironmentValues/isLoading`` environment value to trigger the shimmer effect:
///
/// ```swift
/// DateTimePickerSkeletonLoadingPattern.dateAndTime
///     .environment(\.isLoading, true)
/// ```
public enum DateTimePickerSkeletonLoadingPattern {
    /// A skeleton pattern that displays both a date and a time value.
    public static let dateAndTime = DateTimePicker(
        title: { Text("Date & Time") },
        selectedDate: .constant(Date()),
        pickerComponents: [.date, .hourAndMinute],
        pickerVisible: .constant(false)
    )

    /// A skeleton pattern that displays only a date value.
    public static let dateOnly = DateTimePicker(
        title: { Text("Date") },
        selectedDate: .constant(Date()),
        pickerComponents: [.date],
        pickerVisible: .constant(false)
    )

    /// A skeleton pattern that displays only a time value.
    public static let timeOnly = DateTimePicker(
        title: { Text("Time") },
        selectedDate: .constant(Date()),
        pickerComponents: [.hourAndMinute],
        pickerVisible: .constant(false)
    )
}

public extension DateTimePicker {
    /// Convenience initializer for `DateTimePicker`
    /// - Parameters:
    ///   - title: The title view for the date time picker.
    ///   - valueLabel: The value view for the date time picker.
    ///   - controlState: The `ControlState` of the form view. The default is `normal`.
    ///   - errorMessage: The error message of the form view.
    ///   - range: The inclusive range of selectable dates.
    ///   - selectedDate: The date value being displayed and selected.
    ///   - dateFormatter: The `DateFormatter` to be used to display the selected `Date`. Default formatter will use customized dateStyle and timeStyle.
    ///   - pickerComponents: The components shown in the date picker, default value shows date and time.
    ///   - dateStyle: The custom style for displaying the date. The default value is `.abbreviated`, showing for example, "Oct 21, 2015".
    ///   - timeStyle: The custom style for displaying the time. The default value is `.shortened`, showing for example, "4:29 PM" or "16:29".
    ///   - noDateSelectedString: The text to be displayed when no date is selected. If this property is `nil`, the localized string “No date selected” will be used.
    ///   - pickerVisible: This property indicates whether the picker is to be displayed.
    ///   - hidesSeparator: This property indicates whether the separator is to be displayed. Default is false.
    init(@ViewBuilder title: () -> any View,
         @ViewBuilder valueLabel: () -> any View = { EmptyView() },
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         range: ClosedRange<Date>? = nil,
         selectedDate: Binding<Date?> = .constant(nil),
         dateFormatter: DateFormatter? = nil,
         pickerComponents: DatePicker.Components = [.date, .hourAndMinute],
         dateStyle: Date.FormatStyle.DateStyle = .abbreviated,
         timeStyle: Date.FormatStyle.TimeStyle = .shortened,
         noDateSelectedString: String? = nil,
         pickerVisible: Binding<Bool>,
         hidesSeparator: Bool = false)
    {
        self.init(title: title, valueLabel: valueLabel, controlState: controlState, errorMessage: errorMessage, range: range, selectedDate: selectedDate, dateFormatter: dateFormatter, pickerComponents: pickerComponents, dateStyle: dateStyle, timeStyle: timeStyle, noDateSelectedString: noDateSelectedString, pickerVisible: pickerVisible, hidesSeparator: hidesSeparator, showsClearAction: false)
    }
    
    /// Convenience initializer for `DateTimePicker`
    /// - Parameters:
    ///   - title: The title string for the date time picker.
    ///   - valueLabel: The value string for the date time picker.
    ///   - mandatoryFieldIndicator: The mandatory field indicator for the date time picker.
    ///   - isRequired: This property indicates whether the mandatory field indicator is to be displayed.
    ///   - controlState: The `ControlState` of the form view. The default is `normal`.
    ///   - errorMessage: The error message of the form view.
    ///   - range: The inclusive range of selectable dates.
    ///   - selectedDate: The date value being displayed and selected.
    ///   - dateFormatter: The `DateFormatter` to be used to display the selected `Date`. Default formatter will use customized dateStyle and timeStyle.
    ///   - pickerComponents: The components shown in the date picker, default value shows date and time.
    ///   - dateStyle: The custom style for displaying the date. The default value is `.abbreviated`, showing for example, "Oct 21, 2015".
    ///   - timeStyle: The custom style for displaying the time. The default value is `.shortened`, showing for example, "4:29 PM" or "16:29".
    ///   - noDateSelectedString: The text to be displayed when no date is selected. If this property is `nil`, the localized string “No date selected” will be used.
    ///   - pickerVisible: This property indicates whether the picker is to be displayed.
    ///   - hidesSeparator: This property indicates whether the separator is to be displayed. Default is false.
    init(title: AttributedString,
         valueLabel: AttributedString? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         range: ClosedRange<Date>? = nil,
         selectedDate: Binding<Date?>,
         dateFormatter: DateFormatter? = nil,
         pickerComponents: DatePicker.Components = [.date, .hourAndMinute],
         dateStyle: Date.FormatStyle.DateStyle = .abbreviated,
         timeStyle: Date.FormatStyle.TimeStyle = .shortened,
         noDateSelectedString: String? = nil,
         pickerVisible: Binding<Bool>,
         hidesSeparator: Bool = false)
    {
        self.init(title: title, valueLabel: valueLabel, mandatoryFieldIndicator: mandatoryFieldIndicator, isRequired: isRequired, controlState: controlState, errorMessage: errorMessage, range: range, selectedDate: selectedDate, dateFormatter: dateFormatter, pickerComponents: pickerComponents, dateStyle: dateStyle, timeStyle: timeStyle, noDateSelectedString: noDateSelectedString, pickerVisible: pickerVisible, hidesSeparator: hidesSeparator, showsClearAction: false)
    }
}

public extension DateTimePickerConfiguration {
    /// Convenience initializer for `DateTimePickerConfiguration`
    /// - Parameters:
    ///   - title: The title view for the date time picker.
    ///   - valueLabel: The value view for the date time picker.
    ///   - controlState: The `ControlState` of the form view. The default is `normal`.
    ///   - errorMessage: The error message of the form view.
    ///   - range: The inclusive range of selectable dates.
    ///   - selectedDate: The date value being displayed and selected.
    ///   - dateFormatter: The `DateFormatter` to be used to display the selected `Date`. Default formatter will use customized dateStyle and timeStyle.
    ///   - pickerComponents: The components shown in the date picker, default value shows date and time.
    ///   - dateStyle: The custom style for displaying the date. The default value is `.abbreviated`, showing for example, "Oct 21, 2015".
    ///   - timeStyle: The custom style for displaying the time. The default value is `.shortened`, showing for example, "4:29 PM" or "16:29".
    ///   - noDateSelectedString: The text to be displayed when no date is selected. If this property is `nil`, the localized string “No date selected” will be used.
    ///   - pickerVisible: This property indicates whether the picker is to be displayed.
    ///   - hidesSeparator: This property indicates whether the separator is to be displayed. Default is false.
    init(title: Title,
         valueLabel: ValueLabel,
         controlState: ControlState,
         errorMessage: AttributedString?,
         range: ClosedRange<Date>?,
         selectedDate: Binding<Date?>,
         dateFormatter: DateFormatter?,
         pickerComponents: DatePicker.Components,
         dateStyle: Date.FormatStyle.DateStyle,
         timeStyle: Date.FormatStyle.TimeStyle,
         noDateSelectedString: String?,
         pickerVisible: Binding<Bool>,
         hidesSeparator: Bool)
    {
        self.init(title: title, valueLabel: valueLabel, controlState: controlState, errorMessage: errorMessage, range: range, selectedDate: selectedDate, dateFormatter: dateFormatter, pickerComponents: pickerComponents, dateStyle: dateStyle, timeStyle: timeStyle, noDateSelectedString: noDateSelectedString, pickerVisible: pickerVisible, hidesSeparator: hidesSeparator, showsClearAction: false, clearAction: .init(EmptyView()))
    }
}
