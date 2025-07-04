import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DateRangePickerBaseStyle: DateRangePickerStyle {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var selectedDates: Set<DateComponents> = []
    
    @State private var tapCount = 0
    
    public func makeBody(_ configuration: DateRangePickerConfiguration) -> some View {
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
            
            if configuration.pickerVisible, configuration.controlState != .disabled {
                LazyVStack {
                    Divider()
                        .frame(height: 0.33)
                        .foregroundStyle(Color.preferredColor(.separatorOpaque))
                    self.showPicker(configuration)
                }
                .transition(.opacity.combined(with: .scale(scale: 1.0, anchor: .top)))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: configuration.pickerVisible)
        .onAppear {
            self.getDateComponentsFromDates(configuration)
        }
    }
    
    private let components: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second, .calendar]
    
    func getDateComponentsFromDates(_ configuration: DateRangePickerConfiguration) {
        let calendar = Calendar.current
        
        if let startDate = configuration.selectedRange?.lowerBound,
           let endDate = configuration.selectedRange?.upperBound
        {
            let startDateComponents = calendar.dateComponents(self.components, from: startDate)
            self.selectedDates.insert(startDateComponents)
            
            let endDateComponents = calendar.dateComponents(self.components, from: endDate)
            self.handleDateSelection(configuration, newSelection: [startDateComponents, endDateComponents], isTapped: false)
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
        .contentShape(Rectangle())
        .ifApply(configuration.controlState != .disabled && configuration.controlState != .readOnly) {
            $0.onTapGesture(perform: {
                configuration.pickerVisible.toggle()
            })
        }
    }
    
    private func getValueAccessibilityLabelString(_ configuration: DateRangePickerConfiguration) -> String {
        var valueStr = self.getValueLabel(configuration)
        
        if configuration.selectedRange == nil {
            let dateRangeSetTips = NSLocalizedString("PressSpaceToSelectRangeKey", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            valueStr += ", \(dateRangeSetTips)"
        }
        return valueStr
    }
    
    private func getValueLabel(_ configuration: DateRangePickerConfiguration) -> String {
        let result = self.selectedDates.sorted {
            if let date1 = $0.date, let date2 = $1.date {
                date1 < date2
            } else {
                true
            }
        }
        
        if self.tapCount > 1,
           let startDate = result.first?.date,
           let endDate = result.last?.date
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
    
    func showPicker(_ configuration: DateRangePickerConfiguration) -> some View {
        let selection: Binding<Set<DateComponents>> = Binding(
            get: { self.selectedDates },
            set: { self.handleDateSelection(configuration, newSelection: $0) }
        )
        
        if let range = configuration.range {
            return MultiDatePicker("", selection: selection, in: range)
                .typeErased
        } else {
            return MultiDatePicker("", selection: selection)
                .typeErased
        }
    }
    
    func handleDateSelection(_ configuration: DateRangePickerConfiguration, newSelection: Set<DateComponents>, isTapped: Bool = true) {
        if self.selectedDates.count == 0 {
            self.selectedDates = newSelection
            self.tapCount = 1
        } else if self.selectedDates.count == 1, self.tapCount < 2 {
            self.selectedDates = self.updateDateRange(self.selectedDates, newSelection)
            self.tapCount = 2
        } else if isTapped {
            self.selectedDates = []
            self.tapCount = 0
        }
        
        let result = self.selectedDates.sorted {
            if let date1 = $0.date, let date2 = $1.date {
                date1 < date2
            } else {
                true
            }
        }
        
        if self.tapCount > 1,
           let startDate = result.first?.date,
           let endDate = result.last?.date
        {
            configuration.selectedRange = startDate ... endDate
        } else {
            configuration.selectedRange = nil
        }
    }
    
    private func updateDateRange(_ selectedDates: Set<DateComponents>,
                                 _ newSelection: Set<DateComponents>) -> Set<DateComponents>
    {
        let newDate = newSelection.subtracting(selectedDates)
        
        guard let firstDate = selectedDates.first?.date,
              let secondDate = newDate.first?.date, newSelection.count > 1
        else {
            // Reset if we can't form a valid range
            return selectedDates
        }
        
        let startDate = min(firstDate, secondDate)
        let endDate = max(firstDate, secondDate)
        
        // Generate a range of dates between start and end dates
        let allDates = self.generateDateRange(from: startDate, to: endDate)
        
        // Map the dates to DateComponents and return them as a new set
        return Set(allDates.map {
            Calendar.current.dateComponents(
                self.components, from: $0
            )
        })
    }
    
    private func generateDateRange(from startDate: Date, to endDate: Date) -> [Date] {
        guard startDate <= endDate else { return [] }
        
        var dates: [Date] = []
        var currentDate = startDate
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = Calendar.current.date(
                byAdding: .day, value: 1, to: currentDate
            )!
        }
        return dates
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
