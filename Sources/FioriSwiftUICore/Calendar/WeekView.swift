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
    @Environment(\.hasEventIndicator) var isEventIndicatorVisible
    @Environment(\.alternateCalendarType) var alternateCalendarType
    @Environment(\.alternateCalendarLocale) var alternateCalendarLocale
    @Environment(\.weekNumberTintColor) var weekNumberTintColor
    
    let customEventView: (Date) -> any View
    
    let selectedDate: Date?
    let selectedDates: Set<Date>?
    let selectedRange: ClosedRange<Date>?
    let disabledDates: CalendarDisabledDates?
    
    let dayTappedCallback: ((Date, DayViewState) -> Void)?
    
    private var weekNumberVisibility: Bool = true
    
    init(style: CalendarStyle, weekInfo: WeekInfo, startDate: Date, endDate: Date, showOutOfMonth: Bool = true, selectedDate: Date? = nil, selectedDates: Set<Date>? = nil, selectedRange: ClosedRange<Date>? = nil, disabledDates: CalendarDisabledDates? = nil, dayTappedCallback: ((Date, DayViewState) -> Void)? = nil, @ViewBuilder customEventView: @escaping (Date) -> any View = { _ in EmptyView() }) {
        self.style = style
        self.weekInfo = weekInfo
        self.startDate = startDate
        self.endDate = endDate
        self.showOutOfMonth = showOutOfMonth
        self.selectedDate = selectedDate
        self.selectedDates = selectedDates
        self.selectedRange = selectedRange
        self.disabledDates = disabledDates
        self.dayTappedCallback = dayTappedCallback
        self.customEventView = customEventView
        
        if let date = self.weekInfo.dates.first {
            let targetComponents = Calendar.autoupdatingCurrent.dateComponents([.year, .month], from: date)
            if let year = weekInfo.year, let month = weekInfo.month, targetComponents.year != year || targetComponents.month != month {
                /// When the first date of the week is out of month, hide the week number
                self.weekNumberVisibility = false
            }
        }
    }
    
    /// Used for compare to avoid redundant view refresh
    func selectedDatesInCurrentWeek() -> Set<Date> {
        var dates: Set<Date> = []
        if self.style == .datesSelection {
            if let selectedDates {
                for date in selectedDates {
                    if self.weekInfo.dates.contains(date) {
                        dates.insert(date)
                    }
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
        
        CalendarWeekContainerHStack(showWeekNumber: self.showWeekNumber, verticalGuide: .titleFirstTextBaseline) {
            Text("\(self.weekInfo.weekNumber)")
                .font(.fiori(fixedSize: 11 * self.scaleForSizeChange, weight: .bold))
                .foregroundStyle(self.weekNumberTintColor ?? Color.preferredColor(.tertiaryLabel).opacity(0.6))
                .opacity(self.weekNumberVisibility ? 1 : 0)
                .alignmentGuide(.titleFirstTextBaseline) { $0[.firstTextBaseline] }
            
            ForEach(self.weekInfo.dates, id: \.self) { date in
                let day = calendar.component(.day, from: date)
                let state = self.dayState(date)
                DayView(title: "\(day)", subtitle: getSecondaryDayTitle(date),
                        isEventIndicatorVisible: self.isEventIndicatorVisible, state: state, customEventView: self.customEventView(date))
                    .opacity((state == .outOfMonth && !self.showOutOfMonth) ? 0 : 1)
                    .contentShape(Rectangle())
                    .ifApply(!state.isDisabled, content: {
                        $0.onTapGesture {
                            self.dayTappedCallback?(date, state)
                        }
                    })
            }
        }
    }
    
    func dayState(_ date: Date) -> DayViewState {
        let calendar = Calendar.autoupdatingCurrent
        let targetComponents = calendar.dateComponents([.year, .month], from: date)
        
        if let year = weekInfo.year, let month = weekInfo.month, targetComponents.year != year || targetComponents.month != month {
            return .outOfMonth
        } else if let disabledDates, disabledDates.isDisabled(date) {
            if self.style == .rangeSelection, let selectedRange, checkDateRangeContainsDate(selectedRange, date: date) {
                if calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
                    return .disabledAndTodayInMultiSelection
                }
                return .disabledInMultiSelection
            } else if calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
                return .disabledAndToday
            }
            return .disabled
        } else if self.style == .rangeSelection, let selectedRange, checkDateRangeContainsDate(selectedRange, date: date) {
            if selectedRange.lowerBound == selectedRange.upperBound {
                return .singleSelected
            } else if calendar.compare(date, to: selectedRange.lowerBound, toGranularity: .day) == .orderedSame {
                return .multiSelectedStart
            } else if calendar.compare(date, to: selectedRange.upperBound, toGranularity: .day) == .orderedSame {
                return .multiSelectedEnd
            } else {
                return .multiSelectedMiddle
            }
        } else if calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
            if self.style == .datesSelection {
                if let selectedDates, selectedDates.contains(date) {
                    return .singleSelected
                }
            } else if let selectedDate, calendar.compare(date, to: selectedDate, toGranularity: .day) == .orderedSame {
                if self.style == .rangeSelection {
                    return .singleSelected
                }
                return .singleSelectedAndToday
            }
            return .today
        } else if self.style == .datesSelection, let selectedDates, selectedDates.contains(date) {
            return .singleSelected
        } else if self.style != .datesSelection, let selectedDate, calendar.compare(date, to: selectedDate, toGranularity: .day) == .orderedSame {
            return .singleSelected
        } else if date.compare(self.startDate) == .orderedAscending || date.compare(self.endDate) == .orderedDescending {
            return .disabled
        } else {
            return .normal
        }
    }
    
    func checkDateRangeContainsDate(_ selectedRange: ClosedRange<Date>, date: Date) -> Bool {
        let calendar = Calendar.autoupdatingCurrent
        return calendar.compare(date, to: selectedRange.lowerBound, toGranularity: .day) != .orderedAscending && calendar.compare(date, to: selectedRange.upperBound, toGranularity: .day) != .orderedDescending
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
    
    WeekView(style: .fullScreenMonth, weekInfo: weekInfo, startDate: weekInfo.dates.first ?? Date(), endDate: weekInfo.dates.last ?? Date())
        .environment(\.showWeekNumber, true)
}
