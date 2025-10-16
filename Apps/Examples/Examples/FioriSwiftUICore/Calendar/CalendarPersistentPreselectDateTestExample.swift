import FioriSwiftUICore
import SwiftUI

struct CalendarPersistentPreselectDateTestExample: View {
    @State var style: CalendarStyle = .month
    
    @EnvironmentObject var settings: CalendarTestSetting
    
    @State var startDate: Date?
    
    @State var endDate: Date?
    
    @State var displayDateAtStartup: Date?
    
    @State var selectedDate: Date?
    
    @State var isPersistentSelection: Bool = true
    
    @State private var title: String?
    
    @State var firstWeekday: Int = 1
    
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        var result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [:]
        if let testWeekNumberTintColor = self.settings.testWeekNumberTintColor() {
            result.updateValue([.normal: testWeekNumberTintColor], forKey: .weekNumberText)
        }
        return result
    }
    
    var body: some View {
        VStack {
            CalendarView(style: self.style, startDate: self.startDate, endDate: self.endDate, displayDateAtStartup: self.displayDateAtStartup, selectedDate: self.$selectedDate, isPersistentSelection: self.isPersistentSelection) {
                self.title = $0
            }
            .environment(\.hasEventIndicator, self.settings.testsEventViews)
            .environment(\.showsWeekNumbers, self.settings.showsWeekNumber)
            .environment(\.alternateCalendarType, self.settings.testsAlternateCalendar)
            .environment(\.alternateCalendarLocale, self.settings.testAlternateCalendarLocale())
            .environment(\.customLanguageId, self.settings.testLanguage)
            .environment(\.calendarItemTintAttributes, self.calendarItemTintAttributes)
            .environment(\.firstWeekday, self.firstWeekday)
            
            Spacer()
        }
        .navigationTitle(self.title ?? "")
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
    CalendarPersistentPreselectDateTestExample()
}
