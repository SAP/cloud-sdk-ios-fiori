import FioriSwiftUICore
import SwiftUI

struct CalendarRangeSelectionExample: View {
    @EnvironmentObject var settings: CalendarTestSetting
    
    @State var isCustomPreselected = false
    
    @State private var title: String?
    
    @State var model: CalendarModel
    
    init(isPreselected: Bool = false, showsMonthHeader: Bool = false) {
        self.isCustomPreselected = isPreselected
        
        let model = CalendarModel(calendarStyle: .rangeSelection, showsMonthHeader: showsMonthHeader)
        if isPreselected {
            let fm = DateFormatter()
            fm.timeZone = Calendar.current.timeZone
            fm.locale = Calendar.current.locale
            fm.dateFormat = "yyyy MM dd"
            
            let year = Calendar.current.component(.year, from: Date())
            if let startDate = fm.date(from: "\(year) 10 20"),
               let endDate = fm.date(from: "\(year) 10 22")
            {
                model.selectedRange = startDate ... endDate
            }
        }
        _model = State(wrappedValue: model)
    }
    
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        var result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [:]
        if let testWeekNumberTintColor = self.settings.testWeekNumberTintColor() {
            result.updateValue([.normal: testWeekNumberTintColor], forKey: .weekNumberText)
        }
        return result
    }
    
    var body: some View {
        VStack {
            CalendarView(model: self.model, titleChangeCallback: {
                self.title = $0
            }, customCalendarBackgroundColor: self.customCalendarBackgroundColor) { date in
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
            }
            .environment(\.hasEventIndicator, self.settings.testsEventViews)
            .environment(\.showsWeekNumbers, self.settings.showsWeekNumber)
            .environment(\.alternateCalendarType, self.settings.testsAlternateCalendar)
            .environment(\.alternateCalendarLocale, self.settings.testAlternateCalendarLocale())
            .environment(\.customLanguageId, self.settings.testLanguage)
            .environment(\.calendarItemTintAttributes, self.calendarItemTintAttributes)
        }
        .navigationTitle(self.title ?? "Range Selection")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            if !self.isCustomPreselected,
               self.settings.testPreselectRange != nil
            {
                self.model.selectedRange = self.settings.testPreselectRange
            }
            self.model.disabledDates = self.settings.checkDisabledDates()
            self.model.firstWeekday = self.settings.firstWeekDay
        })
        .onChange(of: self.model.selectedRange) {
            if let selectedRange = self.model.selectedRange {
                print("selectedRange onChange:\(selectedRange)")
            } else {
                print("No range selected")
            }
        }
    }
    
    var customCalendarBackgroundColor: Color? {
        self.settings.testsCustomCalBgColor ? .preferredColor(.blue1) : nil
    }
}

#Preview {
    CalendarRangeSelectionExample()
}
