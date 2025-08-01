import Foundation

/**
 This defines the dates to be displayed as disabled in the `CalendarView`.

 User cannot choose disabled days in the calendar.
 */
public struct CalendarDisabledDates {
    /**
     All dates before and include the `beforeDate` are considered disabled.
     */
    let beforeDate: Date?

    /**
     All dates after and including the `afterDate` are considered disabled.
     */
    let afterDate: Date?

    /**
     All dates with the specific weekdays are considered disabled.

     The weekday units are the numbers 1 through 7 (where 1 is Sunday).
     */
    let weekdays: [Int]

    /**
     The other random disabled dates.
     */
    let others: [Date]

    /**
     The default initializer.
     - Parameters:
     - beforeDate: All dates before and include the `beforeDate` are considered disabled.
     - afterDate: All dates after and including the `afterDate` are considered disabled.
     - weekdays: All dates with the specific weekdays are considered disabled. The weekday units are the numbers 1 through 7 (where 1 is Sunday).
     - others: The other random disabled dates.
     */
    public init(beforeDate: Date? = nil, afterDate: Date? = nil, weekdays: [Int] = [], others: [Date] = []) {
        self.beforeDate = beforeDate
        self.afterDate = afterDate
        self.weekdays = weekdays
        self.others = others
    }

    /**
     Check whether the date is disabled or not.
     - parameter date: the date to be checked.
     */
    public func isDisabled(_ date: Date) -> Bool {
        if let beforeDate {
            if self.compareDatesByDay(date1: date, date2: beforeDate) != .orderedDescending {
                return true
            }
        }
        if let afterDate {
            if self.compareDatesByDay(date1: date, date2: afterDate) != .orderedAscending {
                return true
            }
        }
        let weekday = Calendar.autoupdatingCurrent.component(.weekday, from: date)
        if self.weekdays.contains(weekday) {
            return true
        }

        if !self.others.isEmpty {
            return self.others.contains { d in
                self.compareDatesByDay(date1: d, date2: date) == .orderedSame
            }
        }

        return false
    }

    func compareDatesByDay(date1: Date, date2: Date) -> ComparisonResult {
        Calendar.autoupdatingCurrent.compare(date1, to: date2, toGranularity: .day)
    }
}
