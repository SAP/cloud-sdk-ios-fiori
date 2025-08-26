import FioriSwiftUICore
import SwiftUI

class CalendarTestSetting: ObservableObject {
    @Published var showsWeekNumber: Bool = true
    @Published var firstWeekDay: Int = Calendar.autoupdatingCurrent.firstWeekday
    @Published var testsWeekNumberTintColor: Bool = true
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
    @Published var preselectDateTriggersDelegateCall = false
    @Published var expandableStyleStartsWithWeek = false
    @Published var showsOutOfMonthStyleForWeekView = false
    @Published var testPreselectRange: ClosedRange<Date>? = nil
    @Published var testLanguage: String? = nil
}

struct CalendarTestSettingExample: View {
    @EnvironmentObject var setting: CalendarTestSetting

    var alternateCalendars = ["none", "Chinese", "Hebrew", "Islamic"]
    var alternateCalendar: [Int] = [0] {
        didSet {
            switch self.alternateCalendar[0] {
            case 1:
                self.setting.testsAlternateCalendar = .chinese
            case 2:
                self.setting.testsAlternateCalendar = .hebrew
            case 3:
                self.setting.testsAlternateCalendar = .islamic
            default:
                self.setting.testsAlternateCalendar = .none
            }
        }
    }

    var rangePreselections = ["none", "From Today", "Future Date", "Past Date"]
    @State var rangePreselectionType: Int = 0 {
        didSet {
            switch self.rangePreselectionType {
            case 1:
                self.setting.testPreselectRange = self.configPreselectRange(startOffset: 0, endOffset: 5)
            case 2:
                self.setting.testPreselectRange = self.configPreselectRange(startOffset: 60, endOffset: 65)
            case 3:
                self.setting.testPreselectRange = self.configPreselectRange(startOffset: -5, endOffset: 0)
            default:
                self.setting.testPreselectRange = nil
            }
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

    var testLanguages = ["none", "Simplified Chinese", "Hebrew", "Arabic", "Wrong Language code"]
    @State var languageCode: Int = 0 {
        didSet {
            switch self.languageCode {
            case 1:
                self.setting.testLanguage = "zh-Hans"
            case 2:
                self.setting.testLanguage = "he"
            case 3:
                self.setting.testLanguage = "ar"
            case 4:
                self.setting.testLanguage = "nonono"
            default:
                self.setting.testLanguage = nil
            }
        }
    }
    
    var body: some View {
        List {
            Toggle("Display Week Number in Calendar", isOn: self.$setting.showsWeekNumber)
            Picker("First Week day", selection: self.$setting.firstWeekDay) {
                Text("Sunday").tag(1)
                Text("Monday").tag(2)
                Text("Tuesday").tag(3)
                Text("Wednesday").tag(4)
                Text("Thursday").tag(5)
                Text("Friday").tag(6)
                Text("Saturday").tag(7)
            }
            Toggle("Test Week Number Tint Color", isOn: self.$setting.testsWeekNumberTintColor)
            Toggle("Tests Disabled Dates", isOn: self.$setting.testsDisabledDates)
            Toggle("Disabled Dates with Before Dates", isOn: self.$setting.testsDisabledDatesWithBefore)
            Toggle("Disabled Dates with After Dates", isOn: self.$setting.testsDisabledDatesWithAfter)
            Toggle("Disabled Dates With Today", isOn: self.$setting.testsDisabledDatesWithToday)
            Toggle("Disabled Dates with Weekends", isOn: self.$setting.testsDisabledDatesWithWeekends)
            Picker("Alternate Calendar", selection: self.$setting.testsAlternateCalendar) {
                ForEach(AlternateCalendarType.allCases, id: \.self) { type in
                    Text(String(describing: type))
                        .tag(type)
                        .font(.fiori(forTextStyle: .body))
                }
            }
            .pickerStyle(.navigationLink)
            Toggle("Use EN Locale on alternate calendar", isOn: self.$setting.testsEnLocalOnAlternateCalendar)
            Toggle("Has event view", isOn: self.$setting.testsEventViews)
            Toggle("Customize Event View", isOn: self.$setting.customizesEventViews)
            Toggle("Customize Calendar Background Color", isOn: self.$setting.testsCustomCalBgColor)
            Toggle("Preselect date triggers delegate call", isOn: self.$setting.preselectDateTriggersDelegateCall)
            Toggle("Expandable style starts with week", isOn: self.$setting.expandableStyleStartsWithWeek)
            Toggle("Shows out-of-month style for week", isOn: self.$setting.showsOutOfMonthStyleForWeekView)
            Picker("Preselect Range", selection: self.$rangePreselectionType) {
                ForEach(0 ..< self.rangePreselections.count, id: \.self) { index in
                    Text(self.rangePreselections[index])
                        .tag(index)
                        .font(.fiori(forTextStyle: .body))
                }
            }
            Picker("Custom Language", selection: self.$languageCode) {
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
