import SwiftUI

struct WeekInfo: Hashable {
    let id = UUID()
    let year: Int?
    let month: Int?
    let weekNumber: Int
    let dates: [Date]
    
    init(year: Int? = nil, month: Int? = nil, weekNumber: Int, dates: [Date]) {
        self.year = year
        self.month = month
        self.weekNumber = weekNumber
        self.dates = dates
    }
}

public struct WeekView: View, Equatable {
    let style: CalendarStyle
    let weekInfo: WeekInfo
    /// The start date of the calendar. Default is current year's first day.
    let startDate: Date
    /// The end date of the calendar. Default is next year's last day.
    let endDate: Date
    
    let showOutOfMonth: Bool
    
    @Environment(\.firstWeekday) var firstWeekday
    @Environment(\.showWeekNumber) var showWeekNumber
    @Environment(\.isEventIndicatorVisible) var isEventIndicatorVisible
    
    @Binding var selectedDate: Date?
    @Binding var selectedDates: Set<Date>
    
    init(style: CalendarStyle, weekInfo: WeekInfo, startDate: Date, endDate: Date, showOutOfMonth: Bool = true, selectedDate: Binding<Date?> = .constant(nil), selectedDates: Binding<Set<Date>> = .constant([])) {
        self.style = style
        self.weekInfo = weekInfo
        self.startDate = startDate
        self.endDate = endDate
        self.showOutOfMonth = showOutOfMonth
        _selectedDate = selectedDate
        _selectedDates = selectedDates
    }
    
    /// Used for compare to avoid redundant view refresh
    func selectedDatesInCurrentWeek() -> Set<Date> {
        var dates: Set<Date> = []
        if self.style == .datesSelection {
            for date in self.selectedDates {
                if self.weekInfo.dates.contains(date) {
                    dates.insert(date)
                }
            }
        } else if let selectedDate, weekInfo.dates.contains(selectedDate) {
            dates.insert(selectedDate)
        }
        return dates
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        let result = lhs.selectedDatesInCurrentWeek() == rhs.selectedDatesInCurrentWeek()
        return result
    }
    
    public var body: some View {
        let calendar = Calendar.autoupdatingCurrent
        
        CalendarWeekContainerHStack(showWeekNumber: self.showWeekNumber) {
            Text("\(self.weekInfo.weekNumber)")
                .font(.fiori(fixedSize: 11 * self.scaleForSizeChange, weight: .regular))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel).opacity(0.6))
                .alignmentGuide(.titleFirstTextBaseline) { $0[.firstTextBaseline] }
            
            ForEach(self.weekInfo.dates, id: \.self) { date in
                let day = calendar.component(.day, from: date)
                let state = self.dayState(date)
                DayView(title: "\(day)",
                        isEventIndicatorVisible: self.isEventIndicatorVisible, state: state)
                    .opacity((state == .outOfMonth && !self.showOutOfMonth) ? 0 : 1)
                    .contentShape(Rectangle())
                    .ifApply(!state.isDisabled, content: {
                        $0.onTapGesture {
                            self.handleTapGesture(date, state: state)
                        }
                    })
            }
        }
    }
    
    func handleTapGesture(_ date: Date, state: DayViewState) {
        if self.style == .datesSelection {
            if self.selectedDates.contains(date) {
                self.selectedDates.remove(date)
            } else {
                self.selectedDates.insert(date)
            }
        } else {
            self.selectedDate = state.isSelected ? nil : date
        }
    }
    
    func dayState(_ date: Date) -> DayViewState {
        let calendar = Calendar.autoupdatingCurrent
        let targetComponents = calendar.dateComponents([.year, .month], from: date)
        
        if let year = weekInfo.year, let month = weekInfo.month, targetComponents.year != year || targetComponents.month != month {
            return .outOfMonth
        } else if calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
            if self.style == .datesSelection {
                if self.selectedDates.contains(date) {
                    return .singleSelectedAndToday
                }
            } else if let selectedDate = self.selectedDate, calendar.compare(date, to: selectedDate, toGranularity: .day) == .orderedSame {
                return .singleSelectedAndToday
            }
            return .today
        } else if self.style == .datesSelection, self.selectedDates.contains(date) {
            return .singleSelected
        } else if self.style != .datesSelection, let selectedDate = self.selectedDate, calendar.compare(date, to: selectedDate, toGranularity: .day) == .orderedSame {
            return .singleSelected
        } else if date.compare(self.startDate) == .orderedAscending || date.compare(self.endDate) == .orderedDescending {
            return .disabled
        } else {
            return .normal
        }
    }
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var scaleForSizeChange: Double {
        sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
    }
}

#Preview {
    let firstWeekday = 1
    let year = Calendar.autoupdatingCurrent.component(.year, from: Date())
    let month = Calendar.autoupdatingCurrent.component(.month, from: Date())
    // Prepare data source
    let firstDayOfWeek: Date = {
        var calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = firstWeekday // Week starts from Sunday
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        components.year = year
        components.month = month
        let firstDayOfWeek = calendar.date(from: components)!
        return firstDayOfWeek
    }()
    
    let calendar = Calendar.autoupdatingCurrent
    var weekOfYear = calendar.component(.weekOfYear, from: firstDayOfWeek)
    
    let weekInfo = WeekInfo(year: year, month: month, weekNumber: weekOfYear, dates: [
        firstDayOfWeek,
        calendar.date(byAdding: .day, value: 1, to: firstDayOfWeek)!,
        calendar.date(byAdding: .day, value: 2, to: firstDayOfWeek)!,
        calendar.date(byAdding: .day, value: 3, to: firstDayOfWeek)!,
        calendar.date(byAdding: .day, value: 4, to: firstDayOfWeek)!,
        calendar.date(byAdding: .day, value: 5, to: firstDayOfWeek)!,
        calendar.date(byAdding: .day, value: 6, to: firstDayOfWeek)!
    ])
    
    WeekView(style: .fullScreenMonth, weekInfo: weekInfo, startDate: Date(), endDate: Date())
        .environment(\.showWeekNumber, true)
}
