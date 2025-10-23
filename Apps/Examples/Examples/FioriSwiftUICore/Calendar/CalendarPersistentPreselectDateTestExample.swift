import FioriSwiftUICore
import SwiftUI

struct CalendarPersistentPreselectDateTestExample: View {
    @State var style: CalendarStyle = .month
    
    @EnvironmentObject var settings: CalendarTestSetting
    
    @State var startDate: Date?
    
    @State var endDate: Date?
    
    @State var displayDateAtStartup: Date? = .now
    
    @State var selectedDate: Date?
    
    @State var isPersistentSelection: Bool = true
    
    @State private var title: String?
    
    @State var firstWeekday: Int = 1
    
    @State var showScrollToDate = false
    
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        var result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [:]
        if let testWeekNumberTintColor = self.settings.testWeekNumberTintColor() {
            result.updateValue([.normal: testWeekNumberTintColor], forKey: .weekNumberText)
        }
        return result
    }
    
    var body: some View {
        VStack {
            CalendarView(style: self.$style, startDate: self.startDate, endDate: self.endDate, displayDateAtStartup: self.$displayDateAtStartup, selectedDate: self.$selectedDate, isPersistentSelection: self.isPersistentSelection) {
                self.title = $0
                print("self.title:\($0)")
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
        .toolbar(content: {
            if self.showScrollToDate {
                if self.style == .week {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Scroll2") {
                            self.scrollDate2()
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Scroll1") {
                            self.scrollDate1()
                        }
                    }
                } else {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Scroll To Date") {
                            self.scrollDate()
                        }
                    }
                }
            }
        })
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
    
    func scrollDate() {
        if let sixtyDaysAfter = Calendar.current.date(byAdding: .day, value: 60, to: Date()) {
            self.displayDateAtStartup = sixtyDaysAfter
            self.selectedDate = sixtyDaysAfter
        }
    }
    
    func scrollDate1() {
        if let date = self.fm.date(from: "2023 01 10") {
            self.displayDateAtStartup = date
            self.selectedDate = date
        }
    }

    func scrollDate2() {
        if let date = self.fm.date(from: "2024 12 20") {
            self.displayDateAtStartup = date
            self.selectedDate = date
        }
    }
    
    var fm: DateFormatter {
        let fm = DateFormatter()
        fm.timeZone = Calendar.current.timeZone
        fm.locale = Calendar.current.locale
        fm.dateFormat = "yyyy MM dd"
        return fm
    }
}

#Preview {
    CalendarPersistentPreselectDateTestExample()
}
