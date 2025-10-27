import FioriSwiftUICore
import SwiftUI

struct CalendarFloorplanDatesSelectionWithToolBarExample: View {
    @EnvironmentObject var settings: CalendarTestSetting
    
    @StateObject var model = CalendarModel(calendarStyle: .datesSelection, selectedDates: [])
    
    @State private var title: String?
    
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        var result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [:]
        if let testWeekNumberTintColor = self.settings.testWeekNumberTintColor() {
            result.updateValue([.normal: testWeekNumberTintColor], forKey: .weekNumberText)
        }
        return result
    }
    
    @State var withToolBar = true
    
    var body: some View {
        NavigationView {
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
                
                if self.withToolBar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("Done") {
                            self.didTapDone()
                        }
                    }
                }
            })
        }
        .navigationTitle(self.title ?? "Dates Selection")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: self.model.selectedDates) {
            if let selectedDates = $1 {
                print("selectedDates onChange:\(selectedDates)")
            } else {
                print("No dates selected")
            }
        }
        .onAppear {
            self.model.disabledDates = self.settings.checkDisabledDates()
        }
    }
    
    var customCalendarBackgroundColor: Color? {
        self.settings.testsCustomCalBgColor ? .preferredColor(.blue1) : nil
    }
    
    func didTapDone() {}

    func clearAll() {
        self.model.selectedDates = []
    }

    var clearAllDisabled: Bool {
        if let selectedDates = self.model.selectedDates {
            return selectedDates.count == 0
        }
        return true
    }
}

#Preview {
    CalendarFloorplanDatesSelectionWithToolBarExample()
}
