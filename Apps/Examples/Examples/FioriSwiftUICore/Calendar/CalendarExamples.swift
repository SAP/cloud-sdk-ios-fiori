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
//                NavigationLink("Calendar - week") {
//                    VStack {
//                        CalendarView(style: .week)
//
//                        Spacer()
//                    }
//                    .navigationTitle("Week")
//                }
//                NavigationLink("Calendar - expandable") {
//                    VStack {
//                        CalendarView(style: .expandable)
//
//                        Spacer()
//                    }
//                    .navigationTitle("Expandable")
//                }
//                NavigationLink("Calendar - month") {
//                    VStack {
//                        CalendarView(style: .month)
//
//                        Spacer()
//                    }
//                    .navigationTitle("Month")
//                }
//                NavigationLink("Calendar - fullScreenMonth") {
//                    VStack {
//                        CalendarView(style: .fullScreenMonth, selectedDate: self.$selectedDate)
//                        Spacer()
//                    }
//                    .navigationTitle("Full Screen Month")
//                }
//                NavigationLink("Calendar - datesSelection") {
//                    VStack {
//                        CalendarView(style: .datesSelection, selectedDates: self.$selectedDates)
//                        Spacer()
//                    }
//                    .navigationTitle("Dates Selection")
//                }
                NavigationLink("Calendar - rangeSelection") {
                    CalendarRangeSelectionExample()
                        .environmentObject(self.settings)
                }
            }
            
//            Section {
//                NavigationLink("Calendar Test Setting") {
//                    CalendarTestSettingExample()
//                        .environmentObject(self.settings)
//                }
//            }
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
