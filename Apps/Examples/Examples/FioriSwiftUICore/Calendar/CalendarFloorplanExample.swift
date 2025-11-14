import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct CalendarFloorplanExample: View {
    @EnvironmentObject var settings: CalendarTestSetting
    
    @State var model: CalendarModel
    
    @State private var title: String?
    
    let withToolBar: Bool
    
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        var result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [:]
        if let testWeekNumberTintColor = self.settings.testWeekNumberTintColor() {
            result.updateValue([.normal: testWeekNumberTintColor], forKey: .weekNumberText)
        }
        return result
    }
    
    init(calendarStyle: CalendarStyle = .month, withToolBar: Bool = false) {
        self.withToolBar = withToolBar
        
        let model = CalendarModel(calendarStyle: calendarStyle)
        _model = State(wrappedValue: model)
    }
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ScrollView {
            CalendarView(model: self.model, titleChangeCallback: {
                self.title = $0
            }, customCalendarBackgroundColor: self.customCalendarBackgroundColor)
                .padding([.leading, .trailing], self.horizontalSizeClass == .compact ? 0 : 50)
                .environment(\.hasEventIndicator, self.settings.testsEventViews)
                .environment(\.showsWeekNumbers, self.settings.showsWeekNumber)
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
                        self.model.calendarStyle = (self.model.calendarStyle == .month ? .week : .month)
                    } image: { _ in
                        FioriIcon.actions.switchViews
                    }
                    .fioriButtonStyle(FioriTertiaryButtonStyle().eraseToAnyFioriButtonStyle())
                }
            }
        })
        .navigationTitle(self.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: self.model.selectedDate) {
            if let selectedDate = $1 {
                print("selectedDate onChange:\(selectedDate)")
            } else {
                print("No date selected")
            }
        }
        .onAppear {
            self.model.disabledDates = self.settings.checkDisabledDates()
            self.model.firstWeekday = self.settings.firstWeekDay
        }
    }

    var datesSelectionTips: String {
        if let date = self.model.selectedDate {
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
