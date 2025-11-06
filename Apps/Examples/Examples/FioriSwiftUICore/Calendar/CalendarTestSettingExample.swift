import FioriSwiftUICore
import SwiftUI

class CalendarTestSetting: ObservableObject {
    @Published var showsWeekNumber: Bool = false
    @Published var firstWeekDay: Int = Calendar.autoupdatingCurrent.firstWeekday
    @Published var testsWeekNumberTintColor: Bool = false
    @Published var testsDisabledDates: Bool = false
    @Published var testsDisabledDatesWithBefore: Bool = false
    @Published var testsDisabledDatesWithAfter: Bool = false
    @Published var testsDisabledDatesWithToday: Bool = false
    @Published var testsDisabledDatesWithWeekends: Bool = false
    @Published var testsEnLocalOnAlternateCalendar: Bool = false
    @Published var testsAlternateCalendar: AlternateCalendarType = .none
    @Published var testsEventViews: Bool = false
    @Published var customizesEventViews: Bool = false
    @Published var testsCustomCalBgColor: Bool = false
    @Published var rangePreselectionType: Int = 1
    @Published var languageCode: Int = 0
    
    // not handled as follows:
    @Published var preselectDateTriggersDelegateCall = false
    @Published var expandableStyleStartsWithWeek = false
    @Published var showsOutOfMonthDatesStyleForWeekView = false
    
    var testLanguage: String? {
        switch self.languageCode {
        case 1:
            "zh-Hans"
        case 2:
            "he"
        case 3:
            "ar"
        case 4:
            "nonono"
        default:
            nil
        }
    }
    
    var testPreselectRange: ClosedRange<Date>? {
        switch self.rangePreselectionType {
        case 1:
            self.configPreselectRange(startOffset: 0, endOffset: 5)
        case 2:
            self.configPreselectRange(startOffset: 10, endOffset: 15)
        case 3:
            self.configPreselectRange(startOffset: -5, endOffset: 0)
        default:
            nil
        }
    }
    
    func configPreselectRange(startOffset: Int, endOffset: Int) -> ClosedRange<Date> {
        let startDate = Calendar.autoupdatingCurrent.date(byAdding: .day, value: startOffset, to: Date())
        let endDate = Calendar.autoupdatingCurrent.date(byAdding: .day, value: endOffset, to: Date())
        if let startDate, let endDate {
            return startDate ... endDate
        } else {
            return Date() ... Date()
        }
    }
    
    func testWeekNumberTintColor() -> Color? {
        self.testsWeekNumberTintColor ? Color(UIColor.green) : nil
    }
    
    func testAlternateCalendarLocale() -> Locale? {
        self.testsEnLocalOnAlternateCalendar ? Locale(identifier: "en") : nil
    }
    
    func checkDisabledDates() -> CalendarDisabledDates {
        guard self.testsDisabledDates else {
            return CalendarDisabledDates()
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"

        let currentDate = Date()
        let year = Calendar.current.component(.year, from: currentDate)
        let month = Calendar.current.component(.month, from: currentDate)
        let day = Calendar.current.component(.day, from: currentDate)

        var disabledDates = CalendarDisabledDates()
        if self.testsDisabledDatesWithBefore {
            disabledDates.beforeDate = formatter.date(from: "\(year) \(month) 2")!
        }
        if self.testsDisabledDatesWithAfter {
            disabledDates.afterDate = formatter.date(from: "\(year) \(month) 28")!
        }
        if self.testsDisabledDatesWithWeekends {
            disabledDates.weekdays = [1, 7] // Sunday and Saturday
        }
        disabledDates.others.append(formatter.date(from: "\(year) \(month) 10")!)
        disabledDates.others.append(formatter.date(from: "\(year) \(month) 15")!)
        disabledDates.others.append(formatter.date(from: "\(year) \(month) 20")!)
        if self.testsDisabledDatesWithToday {
            disabledDates.others.append(formatter.date(from: "\(year) \(month) \(day)")!) // today
        }
        return disabledDates
    }
}

struct CalendarTestSettingExample: View {
    @EnvironmentObject var settings: CalendarTestSetting

    var alternateCalendars = ["none", "Chinese", "Hebrew", "Islamic"]
    var alternateCalendar: [Int] = [0] {
        didSet {
            switch self.alternateCalendar[0] {
            case 1:
                self.settings.testsAlternateCalendar = .chinese
            case 2:
                self.settings.testsAlternateCalendar = .hebrew
            case 3:
                self.settings.testsAlternateCalendar = .islamic
            default:
                self.settings.testsAlternateCalendar = .none
            }
        }
    }

    var rangePreselections = ["none", "From Today", "Future Date", "Past Date"]

    var testLanguages = ["none", "Simplified Chinese", "Hebrew", "Arabic", "Wrong Language code"]
    
    var body: some View {
        List {
            Toggle("Display Week Number in Calendar", isOn: self.$settings.showsWeekNumber)
            Picker("First Week day", selection: self.$settings.firstWeekDay) {
                Text("Sunday").tag(1)
                Text("Monday").tag(2)
                Text("Tuesday").tag(3)
                Text("Wednesday").tag(4)
                Text("Thursday").tag(5)
                Text("Friday").tag(6)
                Text("Saturday").tag(7)
            }
            Toggle("Test Week Number Tint Color", isOn: self.$settings.testsWeekNumberTintColor)
            Toggle("Tests Disabled Dates", isOn: self.$settings.testsDisabledDates)
            Toggle("Disabled Dates with Before Dates", isOn: self.$settings.testsDisabledDatesWithBefore)
            Toggle("Disabled Dates with After Dates", isOn: self.$settings.testsDisabledDatesWithAfter)
            Toggle("Disabled Dates With Today", isOn: self.$settings.testsDisabledDatesWithToday)
            Toggle("Disabled Dates with Weekends", isOn: self.$settings.testsDisabledDatesWithWeekends)
            Picker("Alternate Calendar", selection: self.$settings.testsAlternateCalendar) {
                ForEach(AlternateCalendarType.allCases, id: \.self) { type in
                    Text(String(describing: type))
                        .tag(type)
                        .font(.fiori(forTextStyle: .body))
                }
            }
            .pickerStyle(.navigationLink)
            Toggle("Use EN Locale on alternate calendar", isOn: self.$settings.testsEnLocalOnAlternateCalendar)
            Toggle("Has event view", isOn: self.$settings.testsEventViews)
            Toggle("Customize Event View", isOn: self.$settings.customizesEventViews)
            Toggle("Customize Calendar Background Color", isOn: self.$settings.testsCustomCalBgColor)
//            Toggle("Preselect date triggers delegate call", isOn: self.$settings.preselectDateTriggersDelegateCall)
//            Toggle("Expandable style starts with week", isOn: self.$settings.expandableStyleStartsWithWeek)
//            Toggle("Shows out-of-month style for week", isOn: self.$settings.showsOutOfMonthDatesStyleForWeekView)
            Picker("Preselect Range", selection: self.$settings.rangePreselectionType) {
                ForEach(0 ..< self.rangePreselections.count, id: \.self) { index in
                    Text(self.rangePreselections[index])
                        .tag(index)
                        .font(.fiori(forTextStyle: .body))
                }
            }
            Picker("Custom Language", selection: self.$settings.languageCode) {
                ForEach(0 ..< self.testLanguages.count, id: \.self) { index in
                    Text(self.testLanguages[index])
                        .tag(index)
                        .font(.fiori(forTextStyle: .body))
                }
            }
        }
        .foregroundStyle(Color.preferredColor(.primaryLabel))
        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        .tint(.preferredColor(.tintColor))
        .listStyle(.plain)
        .navigationTitle(Text("Calendar Test Setting"))
    }
}

#Preview {
    CalendarTestSettingExample()
}
