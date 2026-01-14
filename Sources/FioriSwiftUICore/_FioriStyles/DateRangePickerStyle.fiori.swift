import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DateRangePickerBaseStyle: DateRangePickerStyle {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var isPresented = false
    
    public func makeBody(_ configuration: DateRangePickerConfiguration) -> some View {
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
            $0.environment(\.locale, FioriLocale.shared.locale!)
        }
        .ifApply(FioriLocale.shared.locale != nil) {
            $0.environment(\.calendar, FioriLocale.shared.locale!.calendar)
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
            
            ValueLabel(valueLabel: AttributedString(self.getValueLabel(configuration)))
                .accessibilityLabel(self.getValueAccessibilityLabelString(configuration))
        }
        .accessibilityElement(children: .combine)
        .accessibilityHint(self.mainStackAccessibilityHint(configuration))
        .contentShape(Rectangle())
        .ifApply(configuration.controlState != .disabled && configuration.controlState != .readOnly) {
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
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(self.dateRangePickerConfiguration.controlState == .disabled ? .quaternaryLabel : .primaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }
    
    struct ValueLabelFioriStyle: ValueLabelStyle {
        let dateRangePickerConfiguration: DateRangePickerConfiguration
        
        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
                .foregroundStyle(self.getFontColor(self.dateRangePickerConfiguration))
                .font(.fiori(forTextStyle: .body))
        }
        
        func getFontColor(_ configuration: DateRangePickerConfiguration) -> Color {
            if configuration.controlState == .disabled {
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
