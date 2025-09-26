import FioriSwiftUICore
import SwiftUI

struct CalendarRangeSelectionExample: View {
    @EnvironmentObject var settings: CalendarTestSetting
    
    @State var selectedDate: Date?
    @State var selectedDates: Set<Date>? = []
    @State var selectedRange: ClosedRange<Date>? = nil
    
    var body: some View {
        VStack {
            CalendarView(style: .rangeSelection, selectedRange: self.$selectedRange, disabledDates: self.settings.checkDisabledDates(), customCalendarBackgroundColor: self.customCalendarBackgroundColor, customEventView: { date in
                
                let previousDay = Calendar.current.date(byAdding: .day, value: -1, to: Date())
                let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: Date())
                let theDayAfterTomorrow = Calendar.current.date(byAdding: .day, value: 2, to: Date())
                let theDayBeforeYesterday = Calendar.current.date(byAdding: .day, value: -2, to: Date())
                
                if self.settings.customizesEventViews {
                    if Calendar.current.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
                        Rectangle()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 8, height: 8)
                            .foregroundStyle(Color.gray)
                    } else if let previousDay, Calendar.current.compare(date, to: previousDay, toGranularity: .day) == .orderedSame {
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 8, height: 8)
                            .foregroundStyle(Color.orange)
                    } else if let nextDay, Calendar.current.compare(date, to: nextDay, toGranularity: .day) == .orderedSame {
                        Image(systemName: "triangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 8, height: 8)
                            .foregroundStyle(Color.red)
                    } else if let theDayAfterTomorrow, Calendar.current.compare(date, to: theDayAfterTomorrow, toGranularity: .day) == .orderedSame {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 8, height: 8)
                            .foregroundStyle(Color.preferredColor(.tintColor))
                    } else if let theDayBeforeYesterday, Calendar.current.compare(date, to: theDayBeforeYesterday, toGranularity: .day) == .orderedSame {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 8, height: 8)
                            .foregroundStyle(Color.preferredColor(.tintColor))
                    }
                }
            })
            .environment(\.hasEventIndicator, self.settings.testsEventViews)
            .environment(\.showWeekNumber, self.settings.showsWeekNumber)
            .environment(\.firstWeekday, self.settings.firstWeekDay)
            .environment(\.alternateCalendarType, self.settings.testsAlternateCalendar)
            .environment(\.weekNumberTintColor, self.settings.testWeekNumberTintColor())
            .environment(\.alternateCalendarLocale, self.settings.testAlternateCalendarLocale())
            .environment(\.customLanguageId, self.settings.testLanguage)
            
            Spacer()
        }
        .navigationTitle("Range Selection")
        .onAppear(perform: {
            if self.settings.testPreselectRange != nil {
                self.selectedRange = self.settings.testPreselectRange
            }
        })
        .onChange(of: self.selectedRange) {
            if let selectedRange {
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
