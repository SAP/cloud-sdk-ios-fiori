import FioriSwiftUICore
import SwiftUI

struct CalendarRangeSelectionExample: View {
//    @EnvironmentObject var settings: CalendarTestSetting
    
    @State var selectedDate: Date?
    @State var selectedDates: Set<Date>? = []
    @State var selectedRange: ClosedRange<Date>? = nil
    
    var body: some View {
        VStack {
            CalendarView(style: .rangeSelection, selectedRange: self.$selectedRange, customEventView: { date in
                
                if Calendar.current.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
                    Rectangle()
                        .foregroundStyle(Color.red)
                }
            })
//            .environment(\.hasEventIndicator, self.settings.testsEventViews)
//                .environment(\.showWeekNumber, self.settings.showsWeekNumber)
//                .environment(\.firstWeekday, self.settings.firstWeekDay)
//                .environment(\.alternateCalendarType, self.settings.testsAlternateCalendar)
//                .environment(\.weekNumberTintColor, self.settings.testWeekNumberTintColor())
//                .environment(\.disabledDates, self.settings.checkDisabledDates())
//                .environment(\.alternateCalendarLocale, self.settings.testAlternateCalendarLocale())
            
            Spacer()
        }
        .navigationTitle("Range Selection")
    }
}

#Preview {
    CalendarRangeSelectionExample()
}
