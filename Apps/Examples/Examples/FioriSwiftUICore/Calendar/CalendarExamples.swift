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
            }
            
            Section {
                NavigationLink("Default - Not Persistent, No PreselectDate") {
                    CalendarPersistentPreselectDateTestExample(isPersistentSelection: false, defaultTitle: "Default - Not Persistent, No PreselectDate")
                        .environmentObject(self.settings)
                }
                NavigationLink("Persistent, No PreselectDate") {
                    CalendarMonthViewPersistentExample(defaultTitle: "Persistent, No PreselectDate")
                        .environmentObject(self.settings)
                }
                NavigationLink("Not Persistent, PreselectDate: Today") {
                    CalendarPersistentPreselectDateTestExample(selectedDate: .now, isPersistentSelection: false, defaultTitle: "Not Persistent, PreselectDate: Today")
                        .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Mar 23") {
                    CalendarPersistentPreselectDateTestExample(selectedDate: self.fm.date(from: "\(self.year) 03 23"), defaultTitle: "Persistent, PreselectDate: Mar 23")
                        .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Mar 23 (full screen)") {
                    CalendarPersistentPreselectDateTestExample(style: .fullScreenMonth, selectedDate: self.fm.date(from: "\(self.year) 03 23"), defaultTitle: "Persistent, PreselectDate: Mar 23 (full screen)")
                        .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Mar 23 (full screen shows month header)") {
                    Text("TODO")
                }
                NavigationLink("Persistent, PreselectDate: Mar 23, 2015") {
                    CalendarPersistentPreselectDateTestExample(
                        startDate: self.fm.date(from: "2015 01 01"),
                        selectedDate: self.fm.date(from: "2015 03 23"),
                        defaultTitle: "Persistent, PreselectDate: Mar 23, 2015"
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Persistent, PreselectDate: Mar 23, 2015 (full screen)") {
                    CalendarPersistentPreselectDateTestExample(
                        style: .fullScreenMonth,
                        startDate: self.fm.date(from: "2015 01 01"),
                        selectedDate: self.fm.date(from: "2015 03 23"),
                        defaultTitle: "Persistent, PreselectDate: Mar 23, 2015"
                    )
                    .environmentObject(self.settings)
                }
            }
            
            Section {
                NavigationLink("Default weekStartDay: Mon") {
                    CalendarPersistentPreselectDateTestExample(
                        isPersistentSelection: false,
                        defaultTitle: "Default weekStartDay: Mon",
                        firstWeekday: 2
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("StartDate: Oct 1,  weekStartDay: Sat") {
                    CalendarPersistentPreselectDateTestExample(
                        displayDateAtStartup: self.fm.date(from: "2018 10 01"),
                        isPersistentSelection: false,
                        defaultTitle: "StartDate: Oct 1,  weekStartDay: Sat",
                        firstWeekday: 7
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Start - end: 2018 - 2020") {
                    CalendarPersistentPreselectDateTestExample(
                        startDate: self.fm.date(from: "2018 01 01"),
                        endDate: self.fm.date(from: "2020 12 31"),
                        isPersistentSelection: false,
                        defaultTitle: "Start - end: 2018 - 2020"
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Start, end and Display date") {
                    CalendarPersistentPreselectDateTestExample(
                        startDate: self.fm.date(from: "\(self.year - 1) 05 01"),
                        endDate: self.fm.date(from: "\(self.year) 05 01"),
                        displayDateAtStartup: self.fm.date(from: "\(self.year) 02 01"),
                        isPersistentSelection: false,
                        defaultTitle: "Start, end and Display date"
                    )
                    .environmentObject(self.settings)
                }
                NavigationLink("Default with No Status Indicator") {
                    //
                }
            } header: {
                Text("Month View")
            }
            
            Section {
                NavigationLink("Not Persistent, No PreselectDate") {
                    //
                }
                NavigationLink("Persistent, No PreselectDate") {
                    //
                }
                NavigationLink("No Persistent, PreselectDate: Today") {
                    //
                }
                NavigationLink("Persistent, PreselectDate: Jan 23") {
                    //
                }
                
            } header: {
                Text("Week View")
                    .textCase(.none)
            }
            
            Section {
                NavigationLink("Not Persistent, No PreselectDate") {
                    //
                }
                NavigationLink("Persistent, No PreselectDate") {
                    //
                }
                NavigationLink("No Persistent, PreselectDate: Today") {
                    //
                }
                NavigationLink("Persistent, PreselectDate: Jan 23") {
                    //
                }
                NavigationLink("Persistent, PreselectDate: Jan 23, 2015") {
                    //
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
                    //
                }
                NavigationLink("RangeSelectionView-Preselect") {
                    //
                }
                NavigationLink("DatesSelectionView") {
                    //
                }
                NavigationLink("DatesSelectionView (shows month header)") {
                    //
                }
            }
            
            Section {
                NavigationLink("Floorplan - DatesSelection - With toolbar") {
                    //
                }
                NavigationLink("Floorplan - DatesSelection - No toolbar") {
                    //
                }
                NavigationLink("Floorplan - Month") {
                    //
                }
                NavigationLink("Floorplan - Week") {
                    //
                }
                NavigationLink("Floorplan - Month - Week Transition") {
                    //
                }
                NavigationLink("Floorplan - Expandable") {
                    //
                }
                NavigationLink("Calendar CustomerTest") {
                    //
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
