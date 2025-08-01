import Foundation

/**
 The `CalendarDateRange` object denotes the start and end dates of a range.
 */
public struct CalendarDateRange {
    /**
     The start date of the range.
     */
    public let startDate: Date?

    /**
     The end date of the range.
     */
    public let endDate: Date?

    /**
     The constructor with a start date and an end date.

     - parameter startDate: The start date. The default is today, if it is not specified
     - parameter endDate: The end date. The default is today, if it is not specified.
     */
    public init(startDate: Date = Date(), endDate: Date = Date()) {
        self.startDate = startDate
        self.endDate = endDate
    }

    /**
     The constructor with a start date and a duration.

     - parameter startDate: The start date. The default is today, if it is not specified.
     - parameter duration: The duration of the range in days. The `endDate` is set to `nil` if this value is less than 0.
     */
    public init(startDate: Date = Date(), duration: Int = 1) {
        self.startDate = startDate
        self.endDate = duration < 0 ? nil : Calendar.autoupdatingCurrent.date(byAdding: .day, value: duration, to: self.startDate!)
    }
}
