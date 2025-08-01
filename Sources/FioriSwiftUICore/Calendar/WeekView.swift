import SwiftUI

struct WeekInfo: Hashable {
    let id = UUID()
    let year: Int
    let month: Int
    let weekNumber: Int
    let dates: [Date]
}

public struct WeekView: View {
    let weekInfo: WeekInfo
    
    let maxNumberOfDaysInWeek: Double = 7
    let maxNumberOfRowsPerMonth = 6
    
    @Environment(\.firstWeekday) var firstWeekday
    @Environment(\.showWeekNumber) var showWeekNumber
    @Environment(\.isEventIndicatorVisible) var isEventIndicatorVisible
    
    init(weekInfo: WeekInfo) {
        self.weekInfo = weekInfo
    }
    
    public var body: some View {
        let calendar = Calendar.autoupdatingCurrent
        
        CalendarWeekContainerHStack(showWeekNumber: self.showWeekNumber) {
            Text("\(self.weekInfo.weekNumber)")
                .font(.fiori(fixedSize: 11 * self.scaleForSizeChange, weight: .regular))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel).opacity(0.6))
                .alignmentGuide(.titleFirstTextBaseline) { $0[.firstTextBaseline] }
            
            ForEach(0 ..< self.weekInfo.dates.count, id: \.self) { index in
                let date = self.weekInfo.dates[index]
                let day = calendar.component(.day, from: date)
                DayView(title: "\(day)",
                        isEventIndicatorVisible: self.isEventIndicatorVisible, state: self.dayState(date))
            }
        }
    }
    
    func dayState(_ date: Date) -> DayViewState {
        let calendar = Calendar.autoupdatingCurrent
        let targetComponents = calendar.dateComponents([.year, .month], from: date)
        
        if targetComponents.year != self.weekInfo.year || targetComponents.month != self.weekInfo.month {
            return .outOfMonth
        } else if calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
            return .today
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
    let year = 2025
    let month = 7
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
    
    WeekView(weekInfo: weekInfo)
        .environment(\.showWeekNumber, true)
}
