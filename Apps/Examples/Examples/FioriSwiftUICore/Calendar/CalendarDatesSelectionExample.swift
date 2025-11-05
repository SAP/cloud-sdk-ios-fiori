import FioriSwiftUICore
import SwiftUI

struct CalendarDatesSelectionExample: View {
    @EnvironmentObject var settings: CalendarTestSetting
    
    @State private var title: String?
    
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        var result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [:]
        if let testWeekNumberTintColor = self.settings.testWeekNumberTintColor() {
            result.updateValue([.normal: testWeekNumberTintColor], forKey: .weekNumberText)
        }
        return result
    }
    
    @State var model: CalendarModel
    @State var showBannerMessage: Bool = true
    @State var safeAreaInsets: EdgeInsets = .init(.zero)
    
    init(showsMonthHeader: Bool = false) {
        let model = CalendarModel(calendarStyle: .datesSelection, selectedDates: [], showsMonthHeader: showsMonthHeader)
        _model = State(wrappedValue: model)
    }
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
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
            
            if self.showBannerMessage {
                CalendarBannerView(title: "Tap to select dates", bottomPadding: self.safeAreaInsets.bottom) {
                    self.showBannerMessage = false
                }
            }
        })
        .onGeometryChange(for: EdgeInsets.self, of: { proxy in
            proxy.safeAreaInsets
        }, action: { newValue in
            if self.safeAreaInsets.bottom >= 0.0,
               self.safeAreaInsets != newValue
            {
                DispatchQueue.main.async {
                    self.safeAreaInsets = newValue
                }
            }
        })
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
            self.model.firstWeekday = self.settings.firstWeekDay
        }
    }
    
    var customCalendarBackgroundColor: Color? {
        self.settings.testsCustomCalBgColor ? .preferredColor(.blue1) : nil
    }
}

#Preview {
    CalendarDatesSelectionExample()
}
