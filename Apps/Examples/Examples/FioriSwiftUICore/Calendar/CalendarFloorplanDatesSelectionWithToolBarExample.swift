import FioriSwiftUICore
import SwiftUI

struct CalendarFloorplanDatesSelectionWithToolBarExample: View {
    @EnvironmentObject var settings: CalendarTestSetting
    
    @State var selectedDates: Set<Date>? = []
    
    @State private var title: String?
    
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
    
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        var result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [:]
        if let testWeekNumberTintColor = self.settings.testWeekNumberTintColor() {
            result.updateValue([.normal: testWeekNumberTintColor], forKey: .weekNumberText)
        }
        return result
    }
    
    var body: some View {
        NavigationView {
            VStack {
                CalendarView(style: .datesSelection, selectedDates: self.$selectedDates, disabledDates: self.settings.checkDisabledDates(), titleChangeCallback: {
                    self.title = $0
                }, customCalendarBackgroundColor: self.customCalendarBackgroundColor, customEventView: { date in
                    
                    if self.settings.customizesEventViews {
                        let weekday = Calendar.current.component(.weekday, from: date)
                        if weekday == 2 {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 8, height: 8)
                                .foregroundStyle(Color.preferredColor(.tintColor))
                        } else if weekday == 4 {
                            Rectangle()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 5, height: 5)
                                .foregroundStyle(Color(UIColor.red))
                        } else if weekday == 6 {
                            Image(systemName: "triangle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 8, height: 8)
                                .foregroundStyle(Color(UIColor.green))
                        } else if [1, 3, 7].contains(weekday) {
                            EmptyView()
                        }
                    }
                })
                .environment(\.hasEventIndicator, self.settings.testsEventViews)
                .environment(\.showsWeekNumbers, self.settings.showsWeekNumber)
                .environment(\.firstWeekday, self.settings.firstWeekDay)
                .environment(\.alternateCalendarType, self.settings.testsAlternateCalendar)
                .environment(\.alternateCalendarLocale, self.settings.testAlternateCalendarLocale())
                .environment(\.customLanguageId, self.settings.testLanguage)
                .environment(\.calendarItemTintAttributes, self.calendarItemTintAttributes)
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Clear All") {
                        self.clearAll()
                    }
                    .disabled(self.clearAllDisabled)
                }
            })
        }
        .navigationTitle(self.title ?? "Dates Selection")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: self.selectedDates) {
            if let selectedDates {
                print("selectedDates onChange:\(selectedDates)")
            } else {
                print("No dates selected")
            }
        }
    }
    
    var customCalendarBackgroundColor: Color? {
        self.settings.testsCustomCalBgColor ? .preferredColor(.blue1) : nil
    }
    
    func didTapDone() {}

    func clearAll() {
        self.selectedDates = []
    }

    var clearAllDisabled: Bool {
        if let selectedDates {
            return selectedDates.count == 0
        }
        return true
    }
}

#Preview {
    CalendarFloorplanDatesSelectionWithToolBarExample()
}
