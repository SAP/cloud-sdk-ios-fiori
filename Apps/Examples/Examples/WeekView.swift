import SwiftUI

struct CalendarFirstWeekday: EnvironmentKey {
    public static let defaultValue: Int = 1
}

struct CalendarShowWeekNumber: EnvironmentKey {
    public static let defaultValue: Bool = true
}

struct CalendarIsEventIndicatorVisible: EnvironmentKey {
    public static let defaultValue: Bool = true
}

public extension EnvironmentValues {
    var firstWeekday: Int {
        get { self[CalendarFirstWeekday.self] }
        set { self[CalendarFirstWeekday.self] = newValue }
    }

    var showWeekNumber: Bool {
        get { self[CalendarShowWeekNumber.self] }
        set { self[CalendarShowWeekNumber.self] = newValue }
    }

    var isEventIndicatorVisible: Bool {
        get { self[CalendarIsEventIndicatorVisible.self] }
        set { self[CalendarIsEventIndicatorVisible.self] = newValue }
    }
}

public struct WeekView: View {
    var dates: [Date]
    var weekNumber: Int
    
    let maxNumberOfDaysInWeek: Double = 7
    let maxNumberOfRowsPerMonth = 6
    
    @Environment(\.firstWeekday) var firstWeekday
    @Environment(\.showWeekNumber) var showWeekNumber
    @Environment(\.isEventIndicatorVisible) var isEventIndicatorVisible
    
    init(dates: [Date], weekNumber: Int = 0) {
        self.dates = dates
        self.weekNumber = weekNumber
    }
    
    public var body: some View {
        GeometryReader { proxy in
            HStack(alignment: .center, spacing: 0, content: {
                ForEach(0 ..< self.dates.count, id: \.self) { index in
                    let day = Calendar.current.component(.day, from: self.dates[index])
                    let weekNumber = (showWeekNumber && index == 0) ? self.weekNumber : nil
                    let weekNumberViewWidth = proxy.size.width * 0.05
                    let dayWidth = dayWidth(weekNumberViewWidth: weekNumberViewWidth, availableWidth: proxy.size.width, index: index)
                    DayView(title: "\(day)",
                            weekNumber: weekNumber,
                            weekNumberViewWidth: weekNumberViewWidth,
                            isEventIndicatorVisible: self.isEventIndicatorVisible)
                        .frame(width: dayWidth)
                }
            })
        }
        .frame(minHeight: 44)
        .frame(maxHeight: 51)
    }

    func dayWidth(weekNumberViewWidth: CGFloat, availableWidth: CGFloat, index: Int) -> CGFloat {
        guard self.showWeekNumber else { return availableWidth / self.maxNumberOfDaysInWeek }
        var singleDayWidth = (availableWidth - weekNumberViewWidth) / self.maxNumberOfDaysInWeek
        if index == 0 {
            singleDayWidth += weekNumberViewWidth
        }
        return singleDayWidth
    }
}

#Preview {
    let firstWeekday = 1
    // Prepare data source
    let firstDayOfWeek: Date = {
        var calendar = Calendar.current
        calendar.firstWeekday = firstWeekday // Week starts from Sunday
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        let firstDayOfWeek = calendar.date(from: components)!
        return firstDayOfWeek
    }()
    
    var weekOfYear = Calendar.current.component(.weekOfYear, from: firstDayOfWeek)
    
    WeekView(dates: [
        firstDayOfWeek,
        Calendar.current.date(byAdding: .day, value: 1, to: firstDayOfWeek)!,
        Calendar.current.date(byAdding: .day, value: 2, to: firstDayOfWeek)!,
        Calendar.current.date(byAdding: .day, value: 3, to: firstDayOfWeek)!,
        Calendar.current.date(byAdding: .day, value: 4, to: firstDayOfWeek)!,
        Calendar.current.date(byAdding: .day, value: 5, to: firstDayOfWeek)!,
        Calendar.current.date(byAdding: .day, value: 6, to: firstDayOfWeek)!
    ], weekNumber: weekOfYear)
}
