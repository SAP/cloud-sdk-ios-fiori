import SwiftUI

/// The date model for one week in Calendar.
public struct CalendarWeekInfo: Hashable {
    let id = UUID()
    let year: Int?
    let month: Int?
    let weekNumber: Int
    let dates: [Date]
    
    /// Public initializer for calendar week info.
    /// - Parameters:
    ///   - year: The year that the week belongs to.
    ///   - month: The month that the week belongs to.
    ///   - weekNumber: The week number in the year.
    ///   - dates: The dates in the week.
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
