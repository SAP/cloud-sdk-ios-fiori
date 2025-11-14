import Foundation

/// The date model of the calendar month view.
public struct CalendarMonthModel: Hashable {
    let id = UUID()
    /// The year that the view belong to.
    let year: Int
    /// The month that the view belong to.
    let month: Int
    /// The weeks date under the month, six weeks.
    var weeks: [CalendarWeekInfo]
    
    /// The initializer of calendar month model
    /// - Parameters:
    ///   - year: The year that the view belong to.
    ///   - month: The month that the view belong to.
    ///   - weeks: The weeks date under the month, should have six weeks.
    public init(year: Int, month: Int, weeks: [CalendarWeekInfo]) {
        self.year = year
        self.month = month
        self.weeks = weeks
    }
}
