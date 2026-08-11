import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DateRangePickerBaseStyle: DateRangePickerStyle {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.isLoading) var isLoading
    @Environment(\.pickerSeparator) private var pickerSeparatorConfiguration

    @State var isPresented = false

    public func makeBody(_ configuration: DateRangePickerConfiguration) -> some View {
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.top, 8)
                }
            }
            .ifApply(FioriLocale.shared.locale != nil) {
                let fioriLocale = FioriLocale.shared.locale ?? .current
                return $0.environment(\.locale, fioriLocale)
                    .environment(\.calendar, fioriLocale.calendar)
            }
            .sheet(isPresented: self.$isPresented) {
                DateRangePickerPopView(startDate: configuration.range?.lowerBound, endDate: configuration.range?.upperBound, selectedRange: configuration.selectedRange, applyActionCallback: { selectedRange in
                    configuration.selectedRange = selectedRange
                    self.isPresented = false
                }) {
                    self.isPresented = false
                }
                .presentationDetents([.large])
            }
            .environment(\.pickerSeparator, self.pickerSeparatorConfiguration)
        }
    }

    func configureMainStack(_ configuration: DateRangePickerConfiguration, isVertical: Bool) -> some View {
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
                    .accessibilityLabel(self.getValueAccessibilityLabelString(configuration))
                if configuration.controlState != .disabled,
                   configuration.controlState != .readOnly,
                   configuration.selectedRange != nil,
                   configuration.showsClearAction
                {
                    configuration.clearAction
                        .onSimultaneousTapGesture {
                            configuration.selectedRange = nil
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
                self.isPresented = true
            })
        }
    }
    
    func mainStackAccessibilityHint(_ configuration: DateRangePickerConfiguration) -> String {
        if configuration.controlState != .disabled, configuration.controlState != .readOnly {
            "DoubleTapToOpenKey".localizedFioriString()
        } else {
            ""
        }
    }
    
    func getValueAccessibilityLabelString(_ configuration: DateRangePickerConfiguration) -> String {
        var valueStr = self.getValueLabel(configuration)
        
        if configuration.selectedRange == nil {
            let dateRangeSetTips = NSLocalizedString("PressSpaceToSelectRangeKey", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            valueStr += ", \(dateRangeSetTips)"
        }
        return valueStr
    }
    
    func getValueLabel(_ configuration: DateRangePickerConfiguration) -> String {
        if let startDate = configuration.selectedRange?.lowerBound,
           let endDate = configuration.selectedRange?.upperBound
        {
            var valueDescDateFormatter = DateFormatter()
            if let customizedFormatter = configuration.rangeFormatter {
                valueDescDateFormatter = customizedFormatter
            } else {
                valueDescDateFormatter.timeZone = Calendar.current.timeZone
                valueDescDateFormatter.locale = Calendar.current.locale
                valueDescDateFormatter.dateStyle = self.horizontalSizeClass == .compact ? .short : .long
                valueDescDateFormatter.timeStyle = .none
            }
            let startDateStr = valueDescDateFormatter.string(from: startDate)
            let endDateStr = valueDescDateFormatter.string(from: endDate)
            
            return "\(startDateStr) – \(endDateStr)"
        } else {
            return configuration.noRangeSelectedString ?? NSLocalizedString("No range selected", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        }
    }
}

// Default fiori styles
extension DateRangePickerFioriStyle {
    struct ContentFioriStyle: DateRangePickerStyle {
        func makeBody(_ configuration: DateRangePickerConfiguration) -> some View {
            DateRangePicker(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let dateRangePickerConfiguration: DateRangePickerConfiguration
        @Environment(\.isLoading) var isLoading

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : (self.dateRangePickerConfiguration.controlState == .disabled ? .quaternaryLabel : .primaryLabel)))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }

    struct ValueLabelFioriStyle: ValueLabelStyle {
        let dateRangePickerConfiguration: DateRangePickerConfiguration
        @Environment(\.isLoading) var isLoading

        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
                .foregroundStyle(self.getFontColor(self.dateRangePickerConfiguration))
                .font(.fiori(forTextStyle: .body))
        }

        func getFontColor(_ configuration: DateRangePickerConfiguration) -> Color {
            if self.isLoading {
                return .preferredColor(.separator)
            } else if configuration.controlState == .disabled {
                return .preferredColor(.separator)
            } else if configuration.selectedRange != nil {
                return .preferredColor(.tintColor)
            } else {
                return .preferredColor(.secondaryLabel)
            }
        }
    }
    
    struct FormViewFioriStyle: FormViewStyle {
        let dateRangePickerConfiguration: DateRangePickerConfiguration

        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}

public extension DateRangePicker {
    /// Convenience initializer for `DateRangePicker`
    /// - Parameters:
    ///   - title: The title view for the date range picker.
    ///   - valueLabel: The value view for the date range picker.
    ///   - controlState: The `ControlState` of the form view. The default is `normal`.
    ///   - errorMessage: The error message of the form view.
    ///   - range: The inclusive range of selectable dates.
    ///   - selectedRange: The range of selected dates. Default is nil. It's continuous in ascending order.
    ///   - rangeFormatter: Range date formatter. The default date formatter conforms system setting, it uses short date type in compact screen and uses long date type in regular screen.
    ///   - noRangeSelectedString: The text to be displayed when no range is selected. If this property is `nil`, the localized string “No range selected” will be used.
    ///   - pickerVisible: This property indicates whether the picker is to be displayed or not.
    init(@ViewBuilder title: () -> any View,
         @ViewBuilder valueLabel: () -> any View = { EmptyView() },
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         range: Range<Date>? = nil,
         selectedRange: Binding<ClosedRange<Date>?> = .constant(nil),
         rangeFormatter: DateFormatter? = nil,
         noRangeSelectedString: String? = nil,
         pickerVisible: Binding<Bool>)
    {
        self.init(title: title, valueLabel: valueLabel, controlState: controlState, errorMessage: errorMessage, range: range, selectedRange: selectedRange, rangeFormatter: rangeFormatter, noRangeSelectedString: noRangeSelectedString, pickerVisible: pickerVisible, showsClearAction: false)
    }
    
    /// Convenience initializer for `DateRangePicker`
    /// - Parameters:
    ///   - title: The title string for the date range picker.
    ///   - valueLabel: The value string for the date range picker.
    ///   - mandatoryFieldIndicator: The mandatory field indicator for the date range picker.
    ///   - isRequired: This property indicates whether the mandatory field indicator is to be displayed.
    ///   - controlState: The `ControlState` of the form view. The default is `normal`.
    ///   - errorMessage: The error message of the form view.
    ///   - range: The inclusive range of selectable dates.
    ///   - selectedRange: The range of selected dates. Default is nil. It's continuous in ascending order.
    ///   - rangeFormatter: Range date formatter. The default date formatter conforms system setting, it uses short date type in compact screen and uses long date type in regular screen.
    ///   - noRangeSelectedString: The text to be displayed when no range is selected. If this property is `nil`, the localized string “No range selected” will be used.
    ///   - pickerVisible: This property indicates whether the picker is to be displayed or not.
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
        self.init(title: title, valueLabel: valueLabel, mandatoryFieldIndicator: mandatoryFieldIndicator, isRequired: isRequired, controlState: controlState, errorMessage: errorMessage, range: range, selectedRange: selectedRange, rangeFormatter: rangeFormatter, noRangeSelectedString: noRangeSelectedString, pickerVisible: pickerVisible, showsClearAction: false)
    }
}
