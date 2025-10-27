import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct CalendarMonthViewBaseStyle: CalendarMonthViewStyle {
    @Environment(\.firstWeekday) var firstWeekday
    @Environment(\.customLanguageId) var customLanguageId
    @Environment(\.calendarItemTintAttributes) var calendarItemTintAttributes
    @Environment(\.monthHeaderDateFormat) var monthHeaderDateFormat
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    public func makeBody(_ configuration: CalendarMonthViewConfiguration) -> some View {
        VStack(spacing: 0, content: {
            let weeks = self.weeks(configuration)
            
            if configuration.showMonthHeader {
                Text(self.monthText(configuration))
                    .font(.fiori(fixedSize: 17 * self.scaleForSizeChange, weight: .semibold))
                    .foregroundStyle(self.monthHeaderForegroundStyle)
                    .padding(.top, 30)
                    .padding(.bottom, 14)
            }
            
            ForEach(weeks, id: \.self) { info in
                CalendarWeekView(calendarStyle: configuration.calendarStyle, weekInfo: info, startDate: configuration.startDate, endDate: configuration.endDate, showOutOfMonth: configuration.showOutOfMonth, selectedDate: configuration.selectedDate, selectedDates: configuration.selectedDates, selectedRange: configuration.selectedRange, disabledDates: configuration.disabledDates, dayTappedCallback: configuration.dayTappedCallback, customEventView: configuration.customEventView)
            }
        })
    }
    
    var monthHeaderForegroundStyle: Color {
        self.calendarItemTintAttributes[.monthHeaderText]?[.normal] ?? Color.preferredColor(.tertiaryLabel)
    }
    
    func monthText(_ configuration: CalendarMonthViewConfiguration) -> String {
        let fm = DateFormatter()
        fm.dateFormat = "yyyy MM"
        if let customLanguageId {
            fm.locale = Locale(identifier: customLanguageId)
        } else {
            fm.locale = Calendar.current.locale
        }
        let date = fm.date(from: "\(configuration.year) \(configuration.month)")
        
        fm.setLocalizedDateFormatFromTemplate(self.monthHeaderDateFormat)
        
        if let date {
            return fm.string(from: date)
        } else {
            return ""
        }
    }
    
    func weeks(_ configuration: CalendarMonthViewConfiguration) -> [CalendarWeekInfo] {
        let year = configuration.year
        let month = configuration.month
        
        var calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = self.firstWeekday
        var components = DateComponents()
        components.year = year
        components.month = month
        
        guard let startDate = calendar.date(from: components) else {
            return []
        }
        
        // Get the first Day of the week
        guard var firstDayOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startDate)) else { return [] }
        
//        guard let range = calendar.range(of: .weekOfMonth, in: .month, for: startDate) else { return [] }
        
        var weeks: [CalendarWeekInfo] = []
        
        for _ in 0 ..< 6 {
            let weekNumber = calendar.component(.weekOfYear, from: firstDayOfWeek)
            var dates: [Date] = []
            for dayOffset in 0 ..< 7 {
                if let date = calendar.date(byAdding: .day, value: dayOffset, to: firstDayOfWeek) {
                    dates.append(date)
                }
            }
            let weekInfo = CalendarWeekInfo(year: year, month: month, weekNumber: weekNumber, dates: dates)
            weeks.append(weekInfo)
            
            guard let nextFirstDayOfWeek = calendar.date(byAdding: .day, value: 7, to: firstDayOfWeek) else { return [] }
            firstDayOfWeek = nextFirstDayOfWeek
        }
        return weeks
    }
    
    var scaleForSizeChange: Double {
        sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
    }
}

// Default fiori styles
extension CalendarMonthViewFioriStyle {
    struct ContentFioriStyle: CalendarMonthViewStyle {
        func makeBody(_ configuration: CalendarMonthViewConfiguration) -> some View {
            CalendarMonthView(configuration)
            // Add default style for its content
            // .background()
        }
    }
}

extension CalendarMonthView: Equatable {
    /// Used for compare to avoid redundant view refresh
    func selectedDatesInCurrentMonth() -> Set<Date> {
        let compareDateInCurrentMonth: ((Date) -> Bool) = { date in
            let components = Calendar.autoupdatingCurrent.dateComponents([.year, .month], from: date)
            if let year = components.year,
               let month = components.month,
               self.year == year,
               self.month == month
            {
                return true
            }
            return false
        }
        
        var dates: Set<Date> = []
        if self.calendarStyle == .datesSelection {
            if let selectedDates {
                for date in selectedDates {
                    if compareDateInCurrentMonth(date) {
                        dates.insert(date)
                    }
                }
            }
        } else if self.calendarStyle == .rangeSelection, let selectedRange {
            let interval: TimeInterval = 24 * 60 * 60
            for date in stride(from: selectedRange.lowerBound, through: selectedRange.upperBound, by: interval) {
                if compareDateInCurrentMonth(date) {
                    dates.insert(date)
                }
            }
        } else if let selectedDate, compareDateInCurrentMonth(selectedDate) {
            dates.insert(selectedDate)
        }
        return dates
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        let lhsContains = lhs.selectedDatesInCurrentMonth()
        let rhsContains = rhs.selectedDatesInCurrentMonth()
        let result = lhsContains == rhsContains
        
        return result
    }
}
