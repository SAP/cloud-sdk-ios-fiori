import FioriSwiftUICore
import SwiftUI

struct CalendarPersistentPreselectDateTestExample: View {
    @EnvironmentObject var settings: CalendarTestSetting
    
    @State private var title: String?
    @State var firstWeekday: Int?
    @State var showScrollToDate = false
    
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        var result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [:]
        if let testWeekNumberTintColor = self.settings.testWeekNumberTintColor() {
            result.updateValue([.normal: testWeekNumberTintColor], forKey: .weekNumberText)
        }
        return result
    }
    
    @State var model: CalendarModel
    
    init(style: CalendarStyle = .month, startDate: Date? = nil, endDate: Date? = nil, displayDateAtStartup: Date? = nil, scrollToDate: Date? = nil, selectedDate: Date? = nil, isPersistentSelection: Bool = true, title: String? = nil, firstWeekday: Int? = nil, showScrollToDate: Bool = false, showsMonthHeader: Bool? = nil, expandableStyleInWeekMode: Bool = false) {
        self.title = title
        self.firstWeekday = firstWeekday
        self.showScrollToDate = showScrollToDate
        _model = State(wrappedValue: CalendarModel(calendarStyle: style, startDate: startDate, endDate: endDate, displayDateAtStartup: displayDateAtStartup, selectedDate: selectedDate, isPersistentSelection: isPersistentSelection, scrollToDate: scrollToDate, showsMonthHeader: showsMonthHeader, expandableStyleInWeekMode: expandableStyleInWeekMode))
    }
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var maxHeight: CGFloat = 300
    
    var body: some View {
        ScrollView {
            CalendarView(model: self.model) {
                self.title = $0
            }
            .environment(\.hasEventIndicator, self.settings.testsEventViews)
            .environment(\.showsWeekNumbers, self.settings.showsWeekNumber)
            .environment(\.alternateCalendarType, self.settings.testsAlternateCalendar)
            .environment(\.alternateCalendarLocale, self.settings.testAlternateCalendarLocale())
            .environment(\.customLanguageId, self.settings.testLanguage)
            .environment(\.calendarItemTintAttributes, self.calendarItemTintAttributes)
            .frame(maxHeight: self.maxHeight)
            .padding([.leading, .trailing], self.horizontalSizeClass == .compact ? 0 : 50)
            
            Spacer()
        }
        .background(
            Color.clear
                .onGeometryChange(for: CGSize.self, of: { geometry in
                    geometry.frame(in: .global).size
                }, action: { newValue in
                    self.maxHeight = max(newValue.height, 300)
                })
                .hidden()
        )
        .toolbar(content: {
            if self.showScrollToDate {
                if self.model.calendarStyle == .week {
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
        .onChange(of: self.model.selectedDate) { _, _ in
            if let selectedDate = self.model.selectedDate {
                print("selectedDate:\(selectedDate)")
            } else {
                print("No date selected")
            }
        }
        .onAppear {
            self.model.disabledDates = self.settings.checkDisabledDates()
            self.model.firstWeekday = self.firstWeekday ?? self.settings.firstWeekDay
        }
    }
    
    func scrollDate() {
        if let sixtyDaysAfter = Calendar.current.date(byAdding: .day, value: 60, to: Date()) {
            self.model.scrollToDate = sixtyDaysAfter
            self.model.selectedDate = sixtyDaysAfter
        }
    }
    
    func scrollDate1() {
        if let date = self.fm.date(from: "\(year) 01 10") {
            self.model.scrollToDate = date
            self.model.selectedDate = date
        }
    }

    func scrollDate2() {
        if let date = self.fm.date(from: "\(year) 12 20") {
            self.model.scrollToDate = date
            self.model.selectedDate = date
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

#Preview {
    CalendarPersistentPreselectDateTestExample()
}
