import FioriThemeManager
import Foundation
import SwiftUI

public struct CalendarWeekViewBaseStyle: CalendarWeekViewStyle {
    @Environment(\.showsWeekNumbers) var showWeekNumber
    @Environment(\.hasEventIndicator) var isEventIndicatorVisible
    @Environment(\.alternateCalendarType) var alternateCalendarType
    @Environment(\.alternateCalendarLocale) var alternateCalendarLocale
    @Environment(\.calendarItemTintAttributes) var calendarItemTintAttributes
    
    public func makeBody(_ configuration: CalendarWeekViewConfiguration) -> some View {
        CalendarWeekContainerHStack(showWeekNumber: self.showWeekNumber, verticalGuide: .titleFirstTextBaseline) {
            if self.weekNumberVisibility(configuration) {
                Text("\(configuration.weekInfo.weekNumber)")
                    .font(.fiori(fixedSize: 11 * self.weekNumberForSizeChange, weight: .bold))
                    .foregroundStyle(self.calendarItemTintAttributes[.weekNumberText]?[.normal] ?? Color.preferredColor(.tertiaryLabel).opacity(0.6))
                    .alignmentGuide(.titleFirstTextBaseline) { $0[.firstTextBaseline] }
            } else {
                Spacer(minLength: 0)
            }
            
            ForEach(configuration.weekInfo.dates, id: \.self) { date in
                
                let day = Calendar.autoupdatingCurrent.component(.day, from: date)
                let state = self.dayState(configuration, date)
                
                if state == .outOfMonth, !configuration.showsOutOfMonthDates {
                    Spacer(minLength: 0)
                } else {
                    CalendarDayView(title: AttributedString("\(day)"), subtitle: self.getSecondaryDayTitle(date), isEventIndicatorVisible: self.isEventIndicatorVisible, state: state, customEventView: configuration.customEventView(date))
                        .contentShape(Rectangle())
                        .ifApply(!state.isDisabled, content: {
                            $0.onTapGesture {
                                configuration.dayTappedCallback?(date, state)
                            }
                        })
                }
            }
        }
    }
    
    func weekNumberVisibility(_ configuration: CalendarWeekViewConfiguration) -> Bool {
        let weekInfo = configuration.weekInfo
        if [.month, .week, .expandable].contains(configuration.calendarStyle) {
            return true
        } else if let date = weekInfo.dates.first {
            let targetComponents = Calendar.autoupdatingCurrent.dateComponents([.year, .month], from: date)
            if let year = weekInfo.year, let month = weekInfo.month, targetComponents.year != year || targetComponents.month != month {
                /// When the first date of the week is out of month, hide the week number
                return false
            }
        }
        return true
    }
    
    // swiftlint:disable cyclomatic_complexity
    func dayState(_ configuration: CalendarWeekViewConfiguration, _ date: Date) -> CalendarDayState {
        let calendar = Calendar.autoupdatingCurrent
        let targetComponents = calendar.dateComponents([.year, .month], from: date)
        let style = configuration.calendarStyle
        
        if style != .week,
           let year = configuration.weekInfo.year,
           let month = configuration.weekInfo.month,
           targetComponents.year != year || targetComponents.month != month
        {
            return .outOfMonth
        } else if let disabledDates = configuration.disabledDates, disabledDates.isDisabled(date) {
            if style == .rangeSelection, let selectedRange = configuration.selectedRange, checkDateRangeContainsDate(selectedRange, date: date) {
                if calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
                    return .disabledAndTodayInMultiSelection
                }
                return .disabledInMultiSelection
            } else if calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
                return .disabledAndToday
            }
            return .disabled
        } else if style == .rangeSelection, let selectedRange = configuration.selectedRange, checkDateRangeContainsDate(selectedRange, date: date) {
            if selectedRange.lowerBound == selectedRange.upperBound {
                return .singleSelected
            } else if calendar.compare(date, to: selectedRange.lowerBound, toGranularity: .day) == .orderedSame {
                return .multiSelectedStart
            } else if calendar.compare(date, to: selectedRange.upperBound, toGranularity: .day) == .orderedSame {
                return .multiSelectedEnd
            } else {
                return .multiSelectedMiddle
            }
        } else if calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
            if style == .datesSelection {
                if let selectedDates = configuration.selectedDates, selectedDates.contains(date) {
                    return .singleSelected
                }
            } else if let selectedDate = configuration.selectedDate, calendar.compare(date, to: selectedDate, toGranularity: .day) == .orderedSame {
                if style == .rangeSelection {
                    return .singleSelected
                }
                return .singleSelectedAndToday
            }
            return .today
        } else if style == .datesSelection, let selectedDates = configuration.selectedDates, selectedDates.contains(date) {
            return .singleSelected
        } else if style != .datesSelection, let selectedDate = configuration.selectedDate, calendar.compare(date, to: selectedDate, toGranularity: .day) == .orderedSame {
            return .singleSelected
        } else if date.compare(configuration.startDate) == .orderedAscending || date.compare(configuration.endDate) == .orderedDescending {
            return .disabled
        } else {
            return .normal
        }
    }
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var scaleForSizeChange: Double {
        sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
    }

    var weekNumberForSizeChange: Double {
        sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .xxxLarge)
    }
    
    func getSecondaryDayTitle(_ date: Date) -> AttributedString? {
        switch self.alternateCalendarType {
        case .chinese:
            return self.getAlternateDayTitle(date, identifier: .chinese, defaultLocale: Locale(identifier: "zh-Hans"))
        case .hebrew:
            return self.getAlternateDayTitle(date, identifier: .hebrew, defaultLocale: Locale(identifier: "he"))
        case .islamic:
            return self.getAlternateDayTitle(date, identifier: .islamic, defaultLocale: Locale(identifier: "ar"))
        default:
            return nil
        }
    }

    func getAlternateDayTitle(_ date: Date, identifier: Calendar.Identifier, defaultLocale: Locale) -> AttributedString {
        let calendar = Calendar(identifier: identifier)
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateStyle = .short
        dateFormatter.locale = self.alternateCalendarLocale ?? defaultLocale
        let day = calendar.component(.day, from: date)
        if day == 1 {
            dateFormatter.dateFormat = "MMMM"
            return AttributedString(dateFormatter.string(from: date).trim(8))
        }
        dateFormatter.dateFormat = "dd"
        return AttributedString(dateFormatter.string(from: date).trim(8))
    }
}

// Default fiori styles
extension CalendarWeekViewFioriStyle {
    struct ContentFioriStyle: CalendarWeekViewStyle {
        func makeBody(_ configuration: CalendarWeekViewConfiguration) -> some View {
            CalendarWeekView(configuration)
            // Add default style for its content
            // .background()
        }
    }
}

extension CalendarWeekView: Equatable {
    /// Used for compare to avoid redundant view refresh
    func selectedDatesInCurrentWeek() -> Set<Date> {
        var dates: Set<Date> = []
        if self.calendarStyle == .datesSelection {
            if let selectedDates {
                for date in selectedDates {
                    if self.weekInfo.containsDate(date) {
                        dates.insert(date)
                    }
                }
            }
        } else if self.calendarStyle == .rangeSelection, let selectedRange {
            let interval: TimeInterval = 24 * 60 * 60
            for date in stride(from: selectedRange.lowerBound, through: selectedRange.upperBound, by: interval) {
                if self.weekInfo.containsDate(date) {
                    dates.insert(date)
                }
            }
        } else if let selectedDate, weekInfo.containsDate(selectedDate) {
            dates.insert(selectedDate)
        }
        return dates
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        let result = lhs.selectedDatesInCurrentWeek() == rhs.selectedDatesInCurrentWeek()
        return result
    }
}
