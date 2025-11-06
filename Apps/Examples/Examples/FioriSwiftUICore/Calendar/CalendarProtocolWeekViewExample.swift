import FioriSwiftUICore
import SwiftUI

struct CalendarProtocolWeekViewExample: View {
    var fm: DateFormatter {
        let fm = DateFormatter()
        fm.timeZone = Calendar.current.timeZone
        fm.locale = Calendar.current.locale
        fm.dateFormat = "yyyy MM dd"
        return fm
    }

    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        let result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [
            .title: [
                .normal: Color(UIColor.blue),
                .disabled: Color(UIColor.red),
                .highlighted: Color(UIColor.green),
                .selected: Color(UIColor.yellow)
            ],
            .weekNumberText: [
                .normal: Color(UIColor.green)
            ]
        ]
        return result
    }

    @State var selectedDate: Date? = .now
    var body: some View {
        let info = CalendarWeekInfo(year: 2025, month: 10, weekNumber: 43, dates: [
            self.fm.date(from: "2025 10 26")!,
            self.fm.date(from: "2025 10 27")!,
            self.fm.date(from: "2025 10 28")!,
            self.fm.date(from: "2025 10 29")!,
            self.fm.date(from: "2025 10 30")!,
            self.fm.date(from: "2025 10 31")!,
            self.fm.date(from: "2025 11 01")!
        ])
        CalendarWeekView(calendarStyle: .month, weekInfo: info, startDate: self.fm.date(from: "2025 01 01")!, endDate: self.fm.date(from: "2025 12 31")!, showsOutOfMonthDates: true, selectedDate: self.selectedDate, dayTappedCallback: { date, state in
            print("Tap on a date:\(date), with state:\(state)")
            self.selectedDate = date
        }, customEventView: { _ in
            Rectangle()
        })
        .environment(\.showsWeekNumbers, true)
        .environment(\.hasEventIndicator, true)
        .environment(\.alternateCalendarType, .chinese)
        .environment(\.alternateCalendarLocale, Locale(identifier: "en"))
        .environment(\.calendarItemTintAttributes, self.calendarItemTintAttributes)
    }
}

#Preview {
    CalendarProtocolWeekViewExample()
}
