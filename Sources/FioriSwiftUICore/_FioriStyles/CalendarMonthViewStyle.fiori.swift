import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct CalendarMonthViewBaseStyle: CalendarMonthViewStyle {
    @Environment(\.customLanguageId) var customLanguageId
    @Environment(\.calendarItemTintAttributes) var calendarItemTintAttributes
    @Environment(\.monthHeaderDateFormat) var monthHeaderDateFormat
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    public func makeBody(_ configuration: CalendarMonthViewConfiguration) -> some View {
        VStack(spacing: 0, content: {
            if configuration.showsMonthHeader {
                Text(self.monthText(configuration))
                    .font(.fiori(fixedSize: 17 * self.scaleForSizeChange, weight: .semibold))
                    .foregroundStyle(self.monthHeaderForegroundStyle)
                    .padding(.top, 30)
                    .padding(.bottom, 14)
            }
            
            ForEach(configuration.model.weeks, id: \.self) { info in
                CalendarWeekView(calendarStyle: configuration.calendarStyle, weekInfo: info, startDate: configuration.startDate, endDate: configuration.endDate, showsOutOfMonthDates: configuration.showsOutOfMonthDates, selectedDate: configuration.selectedDate, selectedDates: configuration.selectedDates, selectedRange: configuration.selectedRange, disabledDates: configuration.disabledDates, dayTappedCallback: configuration.dayTappedCallback, customEventView: configuration.customEventView)
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
        let date = fm.date(from: "\(configuration.model.year) \(configuration.model.month)")
        
        fm.setLocalizedDateFormatFromTemplate(self.monthHeaderDateFormat)
        
        if let date {
            return fm.string(from: date)
        } else {
            return ""
        }
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
               model.year == year,
               model.month == month
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
        let result = (lhsContains == rhsContains) && (lhs.model.weeks == rhs.model.weeks)
        
        return result
    }
}
