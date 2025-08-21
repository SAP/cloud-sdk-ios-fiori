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
    
    @Binding var selectedDate: Date?
    @Binding var selectedDates: Set<Date>
    
    @Environment(\.firstWeekday) var firstWeekday
    
    init(style: CalendarStyle, year: Int, month: Int, startDate: Date, endDate: Date, showMonthHeader: Bool = false, showOutOfMonth: Bool = true, selectedDate: Binding<Date?> = .constant(nil), selectedDates: Binding<Set<Date>> = .constant([])) {
        self.style = style
        self.year = year
        self.month = month
        self.startDate = startDate
        self.endDate = endDate
        self.showMonthHeader = showMonthHeader
        self.showOutOfMonth = showOutOfMonth
        _selectedDate = selectedDate
        _selectedDates = selectedDates
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
            for date in self.selectedDates {
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
        print("compare result:\(result)")
        return result
    }
    
    var body: some View {
        let _ = print("\(year) \(month) refresh again")
        
        VStack(spacing: 0, content: {
            if self.showMonthHeader {
                Text(self.monthText)
                    .font(.fiori(fixedSize: 17 * self.scaleForSizeChange, weight: .semibold))
                    .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                    .padding(.top, 30)
                    .padding(.bottom, 14)
            }
            
            ForEach(self.weeks, id: \.self) { info in
                WeekView(style: self.style, weekInfo: info, startDate: self.startDate, endDate: self.endDate, showOutOfMonth: self.showOutOfMonth, selectedDate: self.$selectedDate, selectedDates: self.$selectedDates)
            }
        })
    }
    
    var monthText: String {
        let fm = DateFormatter()
        fm.dateFormat = "yyyy MM"
        let date = fm.date(from: "\(self.year) \(self.month)")
        
        fm.setLocalizedDateFormatFromTemplate("yyyy MMM")
        
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
        for _ in 0 ..< range.count {
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
        .environment(\.showWeekNumber, true)
}
