import SwiftUI

struct MonthView: View, Equatable {
    let style: CalendarStyle
    let year: Int
    let month: Int
    /// The start date of the calendar. Default is current year's first day.
    let startDate: Date
    /// The end date of the calendar. Default is next year's last day.
    let endDate: Date
    
    let showMonthHeader: Bool
    
    let showOutOfMonth: Bool
    
    let customEventView: (Date) -> any View
    
    let selectedDate: Date?
    let selectedDates: Set<Date>?
    let selectedRange: ClosedRange<Date>?
    let disabledDates: CalendarDisabledDates?
    
    let dayTappedCallback: ((Date, CalendarDayState) -> Void)?
    
    @Environment(\.firstWeekday) var firstWeekday
    @Environment(\.customLanguageId) var customLanguageId
    @Environment(\.calendarItemTintAttributes) var calendarItemTintAttributes
    @Environment(\.monthHeaderDateFormat) var monthHeaderDateFormat
    
    init(style: CalendarStyle, year: Int, month: Int, startDate: Date, endDate: Date, showMonthHeader: Bool = false, showOutOfMonth: Bool = true, selectedDate: Date? = nil, selectedDates: Set<Date>? = nil, selectedRange: ClosedRange<Date>? = nil, disabledDates: CalendarDisabledDates? = nil, dayTappedCallback: ((Date, CalendarDayState) -> Void)? = nil, @ViewBuilder customEventView: @escaping (Date) -> any View = { _ in EmptyView() }) {
        self.style = style
        self.year = year
        self.month = month
        self.startDate = startDate
        self.endDate = endDate
        self.showMonthHeader = showMonthHeader
        self.showOutOfMonth = showOutOfMonth
        self.selectedDate = selectedDate
        self.selectedDates = selectedDates
        self.selectedRange = selectedRange
        self.disabledDates = disabledDates
        
        self.dayTappedCallback = dayTappedCallback
        self.customEventView = customEventView
    }
    
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
        if self.style == .datesSelection {
            if let selectedDates {
                for date in selectedDates {
                    if compareDateInCurrentMonth(date) {
                        dates.insert(date)
                    }
                }
            }
        } else if self.style == .rangeSelection, let selectedRange {
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
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        let lhsContains = lhs.selectedDatesInCurrentMonth()
        let rhsContains = rhs.selectedDatesInCurrentMonth()
        let result = lhsContains == rhsContains
        
        return result
    }
    
    var body: some View {
        VStack(spacing: 0, content: {
            if self.showMonthHeader {
                Text(self.monthText)
                    .font(.fiori(fixedSize: 17 * self.scaleForSizeChange, weight: .semibold))
                    .foregroundStyle(self.monthHeaderForegroundStyle)
                    .padding(.top, 30)
                    .padding(.bottom, 14)
            }
            
            ForEach(self.weeks, id: \.self) { info in
                WeekView(style: self.style, weekInfo: info, startDate: self.startDate, endDate: self.endDate, showOutOfMonth: self.showOutOfMonth, selectedDate: self.selectedDate, selectedDates: self.selectedDates, selectedRange: self.selectedRange, disabledDates: self.disabledDates, dayTappedCallback: self.dayTappedCallback, customEventView: self.customEventView)
            }
        })
    }
    
    var monthHeaderForegroundStyle: Color {
        self.calendarItemTintAttributes[.monthHeaderText]?[.normal] ?? Color.preferredColor(.tertiaryLabel)
    }
    
    var monthText: String {
        let fm = DateFormatter()
        fm.dateFormat = "yyyy MM"
        if let customLanguageId {
            fm.locale = Locale(identifier: customLanguageId)
        } else {
            fm.locale = Calendar.current.locale
        }
        let date = fm.date(from: "\(self.year) \(self.month)")
        
        fm.setLocalizedDateFormatFromTemplate(self.monthHeaderDateFormat)
        
        if let date {
            return fm.string(from: date)
        } else {
            return ""
        }
    }
    
    var weeks: [WeekInfo] {
        var calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = self.firstWeekday
        var components = DateComponents()
        components.year = self.year
        components.month = self.month
        
        guard let startDate = calendar.date(from: components) else {
            return []
        }
        
        // Get the first Day of the week
        guard var firstDayOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startDate)) else { return [] }
        
        guard let range = calendar.range(of: .weekOfMonth, in: .month, for: startDate) else { return [] }
        
        var weeks: [WeekInfo] = []
        
        let weekCount = self.style == .month ? 6 : range.count
//        let weekCount = range.count
        
        for _ in 0 ..< weekCount {
            let weekNumber = calendar.component(.weekOfYear, from: firstDayOfWeek)
            var dates: [Date] = []
            for dayOffset in 0 ..< 7 {
                if let date = calendar.date(byAdding: .day, value: dayOffset, to: firstDayOfWeek) {
                    dates.append(date)
                }
            }
            let weekInfo = WeekInfo(year: year, month: month, weekNumber: weekNumber, dates: dates)
            weeks.append(weekInfo)
            
            guard let nextFirstDayOfWeek = calendar.date(byAdding: .day, value: 7, to: firstDayOfWeek) else { return [] }
            firstDayOfWeek = nextFirstDayOfWeek
        }
        return weeks
    }
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var scaleForSizeChange: Double {
        sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
    }
}

#Preview {
    let year = Calendar.autoupdatingCurrent.component(.year, from: Date())
    let month = Calendar.autoupdatingCurrent.component(.month, from: Date())
    MonthView(style: .fullScreenMonth, year: year, month: month, startDate: Date(), endDate: Date(), showMonthHeader: true)
        .environment(\.showsWeekNumbers, true)
}
