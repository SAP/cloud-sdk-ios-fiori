import FioriSwiftUICore
import SwiftUI

struct WeekInfo: Hashable {
    let id = UUID()
    var weekNumber: Int
    var dates: [Date]
}

struct MonthView: View {
    let year: Int
    let month: Int
    
    @Environment(\.firstWeekday) var firstWeekday
    @Environment(\.timeZone) var timeZone
    
    var body: some View {
        VStack(spacing: 0, content: {
            Text(self.monthText)
                .font(.fiori(fixedSize: 17 * self.scaleForSizeChange, weight: .semibold))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .padding(.top, 30)
                .padding(.bottom, 14)
            
            if let weeks = self.weeks {
                ForEach(weeks, id: \.self) { info in
                    WeekView(dates: info.dates, weekNumber: info.weekNumber)
                }
            }
            Spacer()
        })
    }
    
    var monthText: String {
        let fm = DateFormatter()
        fm.dateFormat = "yyyy MM"
        let date = fm.date(from: "\(self.year) \(self.month)")
        
        fm.setLocalizedDateFormatFromTemplate("yyyy MMM")
        
        if let date {
            return fm.string(from: date)
        } else {
            return ""
        }
    }
    
    var weeks: [WeekInfo]? {
        var calendar = Calendar.current
        calendar.firstWeekday = self.firstWeekday
        var components = DateComponents()
        components.year = self.year
        components.month = self.month
        
        guard let startDate = calendar.date(from: components) else {
            return nil
        }
        
        let weekOfYear = calendar.component(.weekOfYear, from: startDate)
        
        guard let range = calendar.range(of: .weekOfMonth, in: .month, for: startDate) else { return nil }
        
        var weeks: [WeekInfo] = []
        for i in 0 ..< range.count {
            let weekNumber = weekOfYear + i
            if let firstDayOfWeek = firstDayOfWeek(year: year, weekNumber: weekNumber) {
                var dates: [Date] = []
                for dayOffset in 0 ..< 7 {
                    if let date = Calendar.current.date(byAdding: .day, value: dayOffset, to: firstDayOfWeek) {
                        dates.append(date)
                    }
                }
                let weekInfo = WeekInfo(weekNumber: weekNumber, dates: dates)
                weeks.append(weekInfo)
            }
        }
        return weeks
    }
    
    func firstDayOfWeek(year: Int, weekNumber: Int) -> Date? {
        var calendar = Calendar.current
        calendar.timeZone = self.timeZone
        
        var components = DateComponents()
        components.yearForWeekOfYear = year
        components.weekOfYear = weekNumber
        components.weekday = self.firstWeekday
        
        return calendar.date(from: components)
    }
    
    var scaleForSizeChange: Double {
        sizeEnumToValue(limitMaxCategory: .accessibilityMedium)
    }
}

#Preview {
    MonthView(year: 2025, month: 7)
        .environment(\.showWeekNumber, true)
}
