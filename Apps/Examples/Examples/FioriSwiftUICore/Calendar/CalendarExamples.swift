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
                }
                NavigationLink("Calendar - expandable") {
                    VStack {
                        CalendarView(style: .expandable)
                        
                        Spacer()
                    }
                }
                NavigationLink("Calendar - month") {
                    VStack {
                        CalendarView(style: .month)
                        
                        Spacer()
                    }
                }
                NavigationLink("Calendar - fullScreenMonth") {
                    VStack {
                        CalendarView(style: .fullScreenMonth, selectedDate: self.$selectedDate)
                        Spacer()
                    }
                }
                NavigationLink("Calendar - datesSelection") {
                    VStack {
                        CalendarView(style: .datesSelection, selectedDates: self.$selectedDates)
                        Spacer()
                    }
                }
                NavigationLink("Calendar - rangeSelection") {
                    VStack {
                        CalendarView(style: .rangeSelection, selectedRange: self.$selectedRange)
                            .environment(\.isEventIndicatorVisible, true)
                            .environment(\.showWeekNumber, self.settings.showsWeekNumber)
                            .environment(\.firstWeekday, self.settings.firstWeekDay)
                            .environment(\.alternateCalendarType, self.settings.testsAlternateCalendar)
                            .environment(\.weekNumberTintColor, self.settings.testsWeekNumberTintColor ? Color.red : nil)
                        Spacer()
                    }
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
}
