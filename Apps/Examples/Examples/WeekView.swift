import SwiftUI

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
        CalendarWeekContainerHStack(showWeekNumber: self.showWeekNumber) {
            Text("\(self.weekNumber)")
                .font(.fiori(fixedSize: 11 * self.scaleForSizeChange, weight: .regular))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel).opacity(0.6))
                .alignmentGuide(.titleFirstTextBaseline) { $0[.firstTextBaseline] }
            
            ForEach(0 ..< self.dates.count, id: \.self) { index in
                let day = Calendar.current.component(.day, from: self.dates[index])
                DayView(title: "\(day)",
                        isEventIndicatorVisible: self.isEventIndicatorVisible)
            }
        }
    }
    
    var scaleForSizeChange: Double {
        sizeEnumToValue(limitMaxCategory: .accessibilityMedium)
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
        .environment(\.showWeekNumber, true)
}
