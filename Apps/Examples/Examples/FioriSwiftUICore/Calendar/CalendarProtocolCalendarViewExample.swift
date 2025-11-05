import FioriSwiftUICore
import SwiftUI

struct CalendarProtocolCalendarViewExample: View {
    @State var model = CalendarModel(calendarStyle: .month)
    
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

    var body: some View {
        VStack {
            CalendarView(model: self.model, titleChangeCallback: {
                print("\($0)")
            }, customCalendarBackgroundColor: .preferredColor(.primaryGroupedBackground)) { _ in
                Rectangle()
            }
            .environment(\.showsWeekNumbers, true)
            .environment(\.hasEventIndicator, true)
            .environment(\.alternateCalendarType, .chinese)
            .environment(\.alternateCalendarLocale, Locale(identifier: "en"))
            .environment(\.calendarItemTintAttributes, self.calendarItemTintAttributes)
            .environment(\.customLanguageId, "zh-Hans")
        }
    }
}

#Preview {
    CalendarProtocolCalendarViewExample()
}
