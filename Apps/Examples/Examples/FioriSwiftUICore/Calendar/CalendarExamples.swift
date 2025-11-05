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
                NavigationLink("CalendarProtocolDayViewExample") {
                    CalendarProtocolDayViewExample()
                }
                NavigationLink("CalendarProtocolWeekViewExample") {
                    CalendarProtocolWeekViewExample()
                }
                NavigationLink("CalendarProtocolMonthViewExample") {
                    CalendarProtocolMonthViewExample()
                }
                NavigationLink("CalendarProtocolCalendarViewExample") {
                    CalendarProtocolCalendarViewExample()
                }
            } header: {
                Text("Calendar Protocol")
            }
            
            Section {
                NavigationLink("Default - Not Persistent, No PreselectDate") {
                    CalendarPersistentPreselectDateTestExample(isPersistentSelection: false, showScrollToDate: true)
                        .environmentObject(self.settings)
                }
                NavigationLink("Persistent, No PreselectDate") {
                    CalendarMonthViewPersistentExample()
                        .environmentObject(self.settings)
                }
                NavigationLink("Not Persistent, PreselectDate: Today") {
                    CalendarPersistentPreselectDateTestExample(
                        selectedDate: .now,
                        isPersistentSelection: false,
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Mar 23") {
                    CalendarPersistentPreselectDateTestExample(
                        selectedDate: self.fm.date(from: "\(self.year) 03 23")
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Mar 23 (full screen)") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .fullScreenMonth,
                        selectedDate: self.fm.date(from: "\(self.year) 03 23"),
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Mar 23 (full screen shows month header)") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .fullScreenMonth,
                        selectedDate: self.fm.date(from: "\(self.year) 03 23"),
                        showsMonthHeader: true
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Mar 23, 2015") {
                    CalendarPersistentPreselectDateTestExample(
                        startDate: self.fm.date(from: "2015 01 01"),
                        selectedDate: self.fm.date(from: "2015 03 23"),
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Mar 23, 2015 (full screen)") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .fullScreenMonth,
                        startDate: self.fm.date(from: "2015 01 01"),
                        selectedDate: self.fm.date(from: "2015 03 23"),
                    )
                    .environmentObject(self.settings)
                }
            }
            
            Section {
                NavigationLink("Default weekStartDay: Mon") {
                    CalendarPersistentPreselectDateTestExample(
                        isPersistentSelection: false,
                        firstWeekday: 2
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Default weekStartDay: Mon (Show month header)") {
                    CalendarPersistentPreselectDateTestExample(
                        isPersistentSelection: false,
                        firstWeekday: 2,
                        showsMonthHeader: true
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("StartDate: Oct 1,  weekStartDay: Sat") {
                    CalendarPersistentPreselectDateTestExample(
                        displayDateAtStartup: self.fm.date(from: "2018 10 01") ?? .now,
                        isPersistentSelection: false,
                        firstWeekday: 7
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Start - end: 2018 - 2020") {
                    CalendarPersistentPreselectDateTestExample(
                        startDate: self.fm.date(from: "2018 01 01"),
                        endDate: self.fm.date(from: "2020 12 31"),
                        isPersistentSelection: false,
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Start, end and Display date") {
                    CalendarPersistentPreselectDateTestExample(
                        startDate: self.fm.date(from: "\(self.year - 1) 05 01"),
                        endDate: self.fm.date(from: "\(self.year) 05 01"),
                        displayDateAtStartup: self.fm.date(from: "\(self.year) 02 01") ?? .now,
                        isPersistentSelection: false,
                    )
                    .environmentObject(self.settings)
                }
//                NavigationLink("Default with No Status Indicator") {
//                    Text("TODO")
//                }
            } header: {
                Text("Month View")
            }
            
            Section {
                NavigationLink("Not Persistent, No PreselectDate") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .week,
                        isPersistentSelection: false,
                        showScrollToDate: true
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, No PreselectDate") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .week,
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("No Persistent, PreselectDate: Today") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .week,
                        selectedDate: Date(),
                        isPersistentSelection: false,
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Jan 23") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .week,
                        selectedDate: self.fm.date(from: "\(self.year) 01 23"),
                    )
                    .environmentObject(self.settings)
                }
                
            } header: {
                Text("Week View")
                    .textCase(.none)
            }
            
            Section {
                NavigationLink("Not Persistent, No PreselectDate") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .expandable,
                        isPersistentSelection: false,
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Not Persistent, No PreselectDate (in week mode)") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .expandable,
                        isPersistentSelection: false,
                        expandableStyleInWeekMode: true
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, No PreselectDate") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .expandable,
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("No Persistent, PreselectDate: Today") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .expandable,
                        selectedDate: Date(),
                        isPersistentSelection: false,
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Jan 23") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .expandable,
                        selectedDate: self.fm.date(from: "\(self.year) 01 23"),
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Jan 23, 2015") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .expandable,
                        startDate: self.fm.date(from: "2015 01 01"),
                        displayDateAtStartup: self.fm.date(from: "2015 01 01") ?? .now,
                        selectedDate: self.fm.date(from: "2015 01 23"),
                    )
                    .environmentObject(self.settings)
                }
            } header: {
                Text("Expandable View")
                    .textCase(.none)
            }
            
            Section {
                NavigationLink("RangeSelectionView") {
                    CalendarRangeSelectionExample()
                        .environmentObject(self.settings)
                }
                NavigationLink("RangeSelectionView (shows month header)") {
                    CalendarRangeSelectionExample(
                        showsMonthHeader: true
                    )
                    .environmentObject(self.settings)
                }
//                NavigationLink("RangeSelectionView-Preselect") {
//                    CalendarRangeSelectionExample()
//                        .environmentObject(self.settings)
//                }
                NavigationLink("DatesSelectionView") {
                    CalendarDatesSelectionExample()
                        .environmentObject(self.settings)
                }
                NavigationLink("DatesSelectionView (shows month header)") {
                    CalendarDatesSelectionExample(
                        showsMonthHeader: true
                    )
                    .environmentObject(self.settings)
                }
            }
            
            Section {
                NavigationLink("Floorplan - DatesSelection - With toolbar") {
                    CalendarFloorplanDatesSelectionWithToolBarExample()
                        .environmentObject(self.settings)
                }
                NavigationLink("Floorplan - DatesSelection - No toolbar") {
                    CalendarFloorplanDatesSelectionExample()
                        .environmentObject(self.settings)
                }
                NavigationLink("Floorplan - Month") {
                    CalendarFloorplanExample()
                        .environmentObject(self.settings)
                }
                NavigationLink("Floorplan - Week") {
                    CalendarFloorplanExample(calendarStyle: .week)
                        .environmentObject(self.settings)
                }
                NavigationLink("Floorplan - Month - Week Transition") {
                    CalendarFloorplanExample(calendarStyle: .month, withToolBar: true)
                        .environmentObject(self.settings)
                }
//                NavigationLink("Floorplan - Expandable") {
//                    //
//                }
//                NavigationLink("Calendar CustomerTest") {
//                    //
//                }
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
    
    var fm: DateFormatter {
        let fm = DateFormatter()
        fm.timeZone = Calendar.current.timeZone
        fm.locale = Calendar.current.locale
        fm.dateFormat = "yyyy MM dd"
        return fm
    }
    
    var year: Int {
        Calendar.current.component(.year, from: Date())
    }
}
