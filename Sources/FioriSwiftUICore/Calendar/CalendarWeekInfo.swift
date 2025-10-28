import SwiftUI

public struct CalendarWeekInfo: Hashable {
    public let id = UUID()
    public let year: Int?
    public let month: Int?
    public let weekNumber: Int
    public let dates: [Date]
    
    public init(year: Int? = nil, month: Int? = nil, weekNumber: Int, dates: [Date]) {
        self.year = year
        self.month = month
        self.weekNumber = weekNumber
        self.dates = dates
    }
    
    /// Check the week contains one date or not, the granularity is .day.
    public func containsDate(_ comparedDate: Date) -> Bool {
        for date in self.dates {
            if Calendar.autoupdatingCurrent.compare(date, to: comparedDate, toGranularity: .day) == .orderedSame {
                return true
            }
        }
        return false
    }
}
