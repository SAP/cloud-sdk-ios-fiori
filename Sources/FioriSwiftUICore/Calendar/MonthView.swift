import SwiftUI

struct MonthView: View {
    let year: Int
    let month: Int
    
    @Environment(\.firstWeekday) var firstWeekday
    
    var body: some View {
        VStack(spacing: 0, content: {
            Text(self.monthText)
                .font(.fiori(fixedSize: 17 * self.scaleForSizeChange, weight: .semibold))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .padding(.top, 30)
                .padding(.bottom, 14)
            
            if let weeks = self.weeks {
                ForEach(weeks, id: \.self) { info in
                    WeekView(weekInfo: info)
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
        var calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = self.firstWeekday
        var components = DateComponents()
        components.year = self.year
        components.month = self.month
        
        guard let startDate = calendar.date(from: components) else {
            return nil
        }
        
        // Get the first Day of the week
        guard var firstDayOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startDate)) else { return nil }
        
        guard let range = calendar.range(of: .weekOfMonth, in: .month, for: startDate) else { return nil }
        
        var weeks: [WeekInfo] = []
        for _ in 0 ..< range.count {
            let weekNumber = calendar.component(.weekOfYear, from: firstDayOfWeek)
            var dates: [Date] = []
            for dayOffset in 0 ..< 7 {
                if let date = calendar.date(byAdding: .day, value: dayOffset, to: firstDayOfWeek) {
                    dates.append(date)
                }
            }
            let weekInfo = WeekInfo(year: year, month: month, weekNumber: weekNumber, dates: dates)
            weeks.append(weekInfo)
            
            guard let nextFirstDayOfWeek = calendar.date(byAdding: .day, value: 7, to: firstDayOfWeek) else { return nil }
            firstDayOfWeek = nextFirstDayOfWeek
        }
        return weeks
    }
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var scaleForSizeChange: Double {
        sizeEnumToValue(dynamicTypeSize: self.dynamicTypeSize, limitMaxTypeSize: .accessibility1)
    }
}

#Preview {
    let year = Calendar.autoupdatingCurrent.component(.year, from: Date())
    let month = Calendar.autoupdatingCurrent.component(.month, from: Date())
    MonthView(year: year, month: month)
        .environment(\.showWeekNumber, true)
}
