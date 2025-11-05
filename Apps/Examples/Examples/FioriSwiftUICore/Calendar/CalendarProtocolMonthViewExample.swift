import FioriSwiftUICore
import SwiftUI

struct CalendarProtocolMonthViewExample: View {
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
                .disabled: Color(UIColor.gray),
                .highlighted: Color(UIColor.green),
                .selected: Color(UIColor.yellow)
            ],
            .monthHeaderText: [
                .normal: Color(UIColor.green)
            ],
            .weekDayText: [
                .normal: Color(UIColor.blue),
                .highlighted: Color(UIColor.green)
            ],
            .weekNumberText: [
                .normal: Color(UIColor.green)
            ]
        ]
        return result
    }
    
    @State var selectedDate: Date?
    
    var body: some View {
        let year = 2025
        let month = 10
        let startDate = self.fm.date(from: "2025 01 01")!
        let endDate = self.fm.date(from: "2025 12 31")!
        let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
        let weeks: [CalendarWeekInfo] = [
            CalendarWeekInfo(year: year, month: month, weekNumber: 39, dates: [self.fm.date(from: "2025 09 28")!, self.fm.date(from: "2025 09 29")!, self.fm.date(from: "2025 09 30")!, self.fm.date(from: "2025 10 01")!, self.fm.date(from: "2025 10 02")!, self.fm.date(from: "2025 10 03")!, self.fm.date(from: "2025 10 04")!]),
            CalendarWeekInfo(year: year, month: month, weekNumber: 40, dates: [self.fm.date(from: "2025 10 05")!, self.fm.date(from: "2025 10 06")!, self.fm.date(from: "2025 10 07")!, self.fm.date(from: "2025 10 08")!, self.fm.date(from: "2025 10 09")!, self.fm.date(from: "2025 10 10")!, self.fm.date(from: "2025 10 11")!]),
            CalendarWeekInfo(year: year, month: month, weekNumber: 41, dates: [self.fm.date(from: "2025 10 12")!, self.fm.date(from: "2025 10 13")!, self.fm.date(from: "2025 10 14")!, self.fm.date(from: "2025 10 15")!, self.fm.date(from: "2025 10 16")!, self.fm.date(from: "2025 10 17")!, self.fm.date(from: "2025 10 18")!]),
            CalendarWeekInfo(year: year, month: month, weekNumber: 42, dates: [self.fm.date(from: "2025 10 19")!, self.fm.date(from: "2025 10 20")!, self.fm.date(from: "2025 10 21")!, self.fm.date(from: "2025 10 22")!, self.fm.date(from: "2025 10 23")!, self.fm.date(from: "2025 10 24")!, self.fm.date(from: "2025 10 25")!]),
            CalendarWeekInfo(year: year, month: month, weekNumber: 43, dates: [self.fm.date(from: "2025 10 26")!, self.fm.date(from: "2025 10 27")!, self.fm.date(from: "2025 10 28")!, self.fm.date(from: "2025 10 29")!, self.fm.date(from: "2025 10 30")!, self.fm.date(from: "2025 10 31")!, self.fm.date(from: "2025 11 01")!])
        ]
        let model = CalendarMonthModel(year: year, month: month, weeks: weeks)
        CalendarMonthView(calendarStyle: .month, model: model, startDate: startDate, endDate: endDate, showsMonthHeader: true, selectedDate: self.selectedDate, disabledDates: disabledDates, dayTappedCallback: { date, state in
            print("Tapped date:\(date), state:\(state)")
            self.selectedDate = date
        }) { _ in
            Circle()
        }
        .background(
            Color.preferredColor(.primaryGroupedBackground)
        )
        .environment(\.showsWeekNumbers, true)
        .environment(\.hasEventIndicator, true)
        .environment(\.alternateCalendarType, .chinese)
        .environment(\.alternateCalendarLocale, Locale(identifier: "en"))
        .environment(\.calendarItemTintAttributes, self.calendarItemTintAttributes)
        .environment(\.customLanguageId, "en")
        .onAppear {
            self.selectedDate = self.fm.date(from: "2025 10 24")!
        }
    }
}

#Preview {
    CalendarProtocolMonthViewExample()
}
