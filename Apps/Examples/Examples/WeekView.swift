import SwiftUI

struct WeekView: View {
    var dates: [Date] = []
    
    let maxNumberOfDaysInWeek: Double = 7
    let maxNumberOfRowsPerMonth = 6
    
    var isEventIndicatorVisible: Bool = false
    
    var showWeekNumber: Bool = false
    
    // Week starts from Sunday by default
    var firstWeekday: Int = 1
    
    @State private var currentWeekNumber: Int?
    
    var body: some View {
        GeometryReader { proxy in
            HStack(alignment: .center, spacing: 0, content: {
                ForEach(0 ..< self.dates.count, id: \.self) { index in
                    let day = Calendar.current.component(.day, from: self.dates[index])
                    let weekNumber = weekNumber(date: dates[index], index: index)
                    let weekNumberViewWidth = proxy.size.width * 0.05
                    let dayWidth = dayWidth(weekNumberViewWidth: weekNumberViewWidth, availableWidth: proxy.size.width, index: index)
                    DayView(title: "\(day)", weekNumber: weekNumber, weekNumberViewWidth: weekNumberViewWidth, isEventIndicatorVisible: self.isEventIndicatorVisible)
                        .frame(width: dayWidth)
                }
            })
        }
    }
    
    // Get week number from a date. If nil, the day view won't display the week number. In generally, only the first day of the week displays the week number.
    func weekNumber(date: Date, index: Int) -> String? {
        guard self.showWeekNumber, index == 0 else { return nil }
        var calendar = Calendar.current
        calendar.firstWeekday = self.firstWeekday
        let weekNumber = calendar.component(.weekOfYear, from: date)
        self.currentWeekNumber = weekNumber
        return "\(weekNumber)"
    }

    func dayWidth(weekNumberViewWidth: CGFloat, availableWidth: CGFloat, index: Int) -> CGFloat {
        guard let _ = currentWeekNumber else { return availableWidth / self.maxNumberOfDaysInWeek }
        var singleDayWidth = (availableWidth - weekNumberViewWidth) / self.maxNumberOfDaysInWeek
        if index == 0 {
            singleDayWidth += weekNumberViewWidth
        }
        return singleDayWidth
    }
}

#Preview {
    let firstDayOfWeek: Date = {
        var calendar = Calendar.current
        calendar.firstWeekday = 1 // Week starts from Sunday
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        let firstDayOfWeek = calendar.date(from: components)!
        return firstDayOfWeek
    }()
    
    WeekView(dates: [
        firstDayOfWeek,
        Calendar.current.date(byAdding: .day, value: 1, to: firstDayOfWeek)!,
        Calendar.current.date(byAdding: .day, value: 2, to: firstDayOfWeek)!,
        Calendar.current.date(byAdding: .day, value: 3, to: firstDayOfWeek)!,
        Calendar.current.date(byAdding: .day, value: 4, to: firstDayOfWeek)!,
        Calendar.current.date(byAdding: .day, value: 5, to: firstDayOfWeek)!,
        Calendar.current.date(byAdding: .day, value: 6, to: firstDayOfWeek)!
    ], isEventIndicatorVisible: true, showWeekNumber: true)
}
