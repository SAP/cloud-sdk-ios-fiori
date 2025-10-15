import FioriSwiftUICore
import SwiftUI

struct CalendarMonthViewPersistentExample: View {
    @State var style: CalendarStyle = .month
    
    @EnvironmentObject var settings: CalendarTestSetting
    
    @State var startDate: Date?
    
    @State var selectedDate: Date?
    
    @State var isPersistentSelection: Bool = true
    
    @State var defaultTitle: String?
    
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
            CalendarView(style: self.style, startDate: self.startDate, selectedDate: self.$selectedDate, isPersistentSelection: self.isPersistentSelection) {
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
        .navigationTitle(self.title ?? self.defaultTitle ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: self.selectedDate) { _, _ in
            if let selectedDate {
                print("selectedDate:\(selectedDate)")
            } else {
                print("No date selected")
            }
        }
    }
}

#Preview {
    CalendarMonthViewPersistentExample()
}
