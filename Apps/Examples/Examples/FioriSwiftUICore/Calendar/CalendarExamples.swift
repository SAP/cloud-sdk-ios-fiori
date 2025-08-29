import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct CalendarExamples: View {
    @StateObject var settings = CalendarTestSetting()
    
    @State var selectedDate: Date?
    @State var selectedDates: Set<Date>? = []
    @State var selectedRange: ClosedRange<Date>? = nil
    
    var body: some View {
        List {
            Section {
                NavigationLink("Calendar - week") {
                    VStack {
                        CalendarView(style: .week)
                        
                        Spacer()
                    }
                    .navigationTitle("Week")
                }
                NavigationLink("Calendar - expandable") {
                    VStack {
                        CalendarView(style: .expandable)
                        
                        Spacer()
                    }
                    .navigationTitle("Expandable")
                }
                NavigationLink("Calendar - month") {
                    VStack {
                        CalendarView(style: .month)
                        
                        Spacer()
                    }
                    .navigationTitle("Month")
                }
                NavigationLink("Calendar - fullScreenMonth") {
                    VStack {
                        CalendarView(style: .fullScreenMonth, selectedDate: self.$selectedDate)
                        Spacer()
                    }
                    .navigationTitle("Full Screen Month")
                }
                NavigationLink("Calendar - datesSelection") {
                    VStack {
                        CalendarView(style: .datesSelection, selectedDates: self.$selectedDates)
                        Spacer()
                    }
                    .navigationTitle("Dates Selection")
                }
                NavigationLink("Calendar - rangeSelection") {
                    VStack {
                        CalendarView(style: .rangeSelection, selectedRange: self.$selectedRange)
                            .environment(\.hasEventIndicator, true)
                            .environment(\.showWeekNumber, self.settings.showsWeekNumber)
                            .environment(\.firstWeekday, self.settings.firstWeekDay)
                            .environment(\.alternateCalendarType, self.settings.testsAlternateCalendar)
                            .environment(\.weekNumberTintColor, self.testWeekNumberTintColor())
                            .environment(\.disabledDates, self.checkDisabledDates())
                            .environment(\.alternateCalendarLocale, self.testAlternateCalendarLocale())
                        
                        Spacer()
                    }
                    .navigationTitle("Range Selection")
                }
            }
            
            Section {
                NavigationLink("Calendar Test Setting") {
                    CalendarTestSettingExample()
                        .environmentObject(self.settings)
                }
            }
        }
        .navigationTitle(Text("Calendar Examples"))
        .onChange(of: self.selectedDate) {
            print("selectedDate:\(self.selectedDate ?? .now)")
        }
        .onChange(of: self.selectedDates) {
            print("selectedDates:\(self.selectedDates?.sorted() ?? [])")
        }
        .onChange(of: self.selectedRange) {
            if let selectedRange {
                print("selectedRange:\(selectedRange)")
            } else {
                print("No range selected")
            }
        }
    }
    
    func testWeekNumberTintColor() -> Color? {
        self.settings.testsWeekNumberTintColor ? Color.green : nil
    }
    
    func testAlternateCalendarLocale() -> Locale? {
        self.settings.testsEnLocalOnAlternateCalendar ? Locale(identifier: "en") : nil
    }
    
    func checkDisabledDates() -> CalendarDisabledDates {
        guard self.settings.testsDisabledDates else {
            return CalendarDisabledDates()
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"

        let currentDate = Date()
        let year = Calendar.current.component(.year, from: currentDate)
        let month = Calendar.current.component(.month, from: currentDate)
        let day = Calendar.current.component(.day, from: currentDate)

        var disabledDates = CalendarDisabledDates()
        if self.settings.testsDisabledDatesWithBefore {
            disabledDates.beforeDate = formatter.date(from: "\(year) \(month) 2")!
        }
        if self.settings.testsDisabledDatesWithAfter {
            disabledDates.afterDate = formatter.date(from: "\(year) \(month) 28")!
        }
        if self.settings.testsDisabledDatesWithWeekends {
            disabledDates.weekdays = [1, 7] // Sunday and Saturday
        }
        disabledDates.others.append(formatter.date(from: "\(year) \(month) 10")!)
        disabledDates.others.append(formatter.date(from: "\(year) \(month) 15")!)
        disabledDates.others.append(formatter.date(from: "\(year) \(month) 20")!)
        if self.settings.testsDisabledDatesWithToday {
            disabledDates.others.append(formatter.date(from: "\(year) \(month) \(day)")!) // today
        }
        return disabledDates
    }
}
