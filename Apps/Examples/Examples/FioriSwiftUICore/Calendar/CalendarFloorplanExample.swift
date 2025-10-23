import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct CalendarFloorplanExample: View {
    @State var style: CalendarStyle = .month
    
    @EnvironmentObject var settings: CalendarTestSetting
    
    @State var selectedDate: Date?
    
    @State private var title: String?
    
    @State var withToolBar = false
    
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
        VStack {
            CalendarView(style: self.$style, selectedDate: self.$selectedDate, disabledDates: self.settings.checkDisabledDates(), titleChangeCallback: {
                self.title = $0
            }, customCalendarBackgroundColor: self.customCalendarBackgroundColor)
                .environment(\.hasEventIndicator, self.settings.testsEventViews)
                .environment(\.showsWeekNumbers, self.settings.showsWeekNumber)
                .environment(\.firstWeekday, self.settings.firstWeekDay)
                .environment(\.alternateCalendarType, self.settings.testsAlternateCalendar)
                .environment(\.alternateCalendarLocale, self.settings.testAlternateCalendarLocale())
                .environment(\.customLanguageId, self.settings.testLanguage)
                .environment(\.calendarItemTintAttributes, self.calendarItemTintAttributes)
            
            HStack {
                Text(self.datesSelectionTips)
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
                    .font(.fiori(forTextStyle: .callout, weight: .medium))
                    .padding([.leading, .bottom, .top], 12)
                
                Spacer()
            }
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color.preferredColor(.separatorOpaque))
                    .padding(.bottom, 0),
                alignment: .bottom
            )
            
            Spacer()
        }
        .toolbar(content: {
            if self.withToolBar {
                ToolbarItem(placement: .topBarTrailing) {
                    FioriButton { _ in
                        self.style = (self.style == .month ? .week : .month)
                    } image: { _ in
                        FioriIcon.actions.switchViews
                    }
                    .fioriButtonStyle(FioriTertiaryButtonStyle().eraseToAnyFioriButtonStyle())
                }
            }
        })
        .navigationTitle(self.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: self.selectedDate) {
            if let selectedDate {
                print("selectedDate onChange:\(selectedDate)")
            } else {
                print("No date selected")
            }
        }
    }

    var datesSelectionTips: String {
        if let date = selectedDate {
            let fm = DateFormatter()
            fm.dateFormat = "EEEE"
            let day = fm.string(from: date)
            fm.dateFormat = "MMM"
            let month = fm.string(from: date)
            fm.dateFormat = "d"
            let dayNum = fm.string(from: date)
            return day + ", " + month + " " + dayNum
        } else {
            return ""
        }
    }
    
    var customCalendarBackgroundColor: Color? {
        self.settings.testsCustomCalBgColor ? .preferredColor(.blue1) : nil
    }
}

#Preview {
    CalendarFloorplanExample()
}
