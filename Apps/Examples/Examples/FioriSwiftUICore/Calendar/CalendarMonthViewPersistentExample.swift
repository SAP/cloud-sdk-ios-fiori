import FioriSwiftUICore
import SwiftUI

struct CalendarMonthViewPersistentExample: View {
    @EnvironmentObject var settings: CalendarTestSetting
    
    @StateObject var model = CalendarModel(calendarStyle: .month, isPersistentSelection: true)
    
    @State private var title: String?
    
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        var result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [
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
            ]
        ]
        if let testWeekNumberTintColor = self.settings.testWeekNumberTintColor() {
            result.updateValue([.normal: testWeekNumberTintColor], forKey: .weekNumberText)
        }
        return result
    }
    
    var body: some View {
        VStack {
            CalendarView(model: self.model) {
                self.title = $0
            }
            .environment(\.hasEventIndicator, self.settings.testsEventViews)
            .environment(\.showsWeekNumbers, self.settings.showsWeekNumber)
            .environment(\.firstWeekday, self.settings.firstWeekDay)
            .environment(\.alternateCalendarType, self.settings.testsAlternateCalendar)
            .environment(\.alternateCalendarLocale, self.settings.testAlternateCalendarLocale())
            .environment(\.customLanguageId, self.settings.testLanguage)
            .environment(\.calendarItemTintAttributes, self.calendarItemTintAttributes)
            .environment(\.eventViewColor, .red)
            
            Spacer()
        }
        .navigationTitle(self.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: self.model.selectedDate) {
            if let selectedDate = $1 {
                print("selectedDate:\(selectedDate)")
            } else {
                print("No date selected")
            }
        }
        .onAppear {
            self.model.disabledDates = self.settings.checkDisabledDates()
        }
    }
}

#Preview {
    CalendarMonthViewPersistentExample()
}
