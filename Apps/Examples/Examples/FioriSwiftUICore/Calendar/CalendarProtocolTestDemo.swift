import FioriSwiftUICore
import SwiftUI

struct CalendarProtocolTestDemo: View {
    var body: some View {
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
        let weekOfYear = calendar.component(.weekOfYear, from: firstDayOfWeek)
        
        let weekInfo = CalendarWeekInfo(year: year, month: month, weekNumber: weekOfYear, dates: [
            firstDayOfWeek,
            calendar.date(byAdding: .day, value: 1, to: firstDayOfWeek)!,
            calendar.date(byAdding: .day, value: 2, to: firstDayOfWeek)!,
            calendar.date(byAdding: .day, value: 3, to: firstDayOfWeek)!,
            calendar.date(byAdding: .day, value: 4, to: firstDayOfWeek)!,
            calendar.date(byAdding: .day, value: 5, to: firstDayOfWeek)!,
            calendar.date(byAdding: .day, value: 6, to: firstDayOfWeek)!
        ])
        
        CalendarWeekView(calendarStyle: .fullScreenMonth, weekInfo: weekInfo, startDate: weekInfo.dates.first ?? Date(), endDate: weekInfo.dates.last ?? Date())
            .environment(\.showsWeekNumbers, true)
    }
}

#Preview {
    CalendarProtocolTestDemo()
}
