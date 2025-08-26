import Foundation

/**
 The enum denoting `CalendarStyle`.
 */
public enum CalendarStyle {
    /**
     Creates a calendar displaying one month at a time on the screen with vertical scrolling enabled. Allows for single selection only.
     */
    case month

    /**
     Creates a calendar displaying months on the full screen of the device with vertical scrolling enabled.

     Allows single selection only.
     */
    case fullScreenMonth

    /**
     Creates a calendar displaying one week at a time on the screen with horizontal scrolling enabled. Allows for single selection only.
     */
    case week

    /**
     Creates a calendar displaying one month at a time on the screen with horizontal scrolling enabled, which can be transitioned to a week view and vice versa using the provided handle. Allows for single selection only.
     */
    case expandable
    
    /**
     Creates a calendar displaying each month on the screen with vertical scrolling enabled and occupies the entire height of the screen. This view allows for the selection of a single range of contiguous dates.
     */
    case rangeSelection

    /**
     Creates a calendar displaying each month on the screen with vertical scrolling enabled and occupies the entire height of the screen. This view allows for selecting a non-contiguous set of dates.
     */
    case datesSelection
}

/**
 The types of secondary calendar to be displayed in `CalendarView`.
 */
public enum AlternateCalendarType: CaseIterable {
    /// No alternate calendar.
    case none

    /// Chinese alternate calendar.
    case chinese

    /// Hebrew alternate calendar.
    case hebrew

    /// Islamic alternate calendar.
    case islamic
}

extension WeekView {
    func getSecondaryDayTitle(_ date: Date) -> String? {
        switch alternateCalendarType {
        case .chinese:
            return self.getAlternateDayTitle(date, identifier: .chinese, defaultLocale: Locale(identifier: "zh-Hans"))
        case .hebrew:
            return self.getAlternateDayTitle(date, identifier: .hebrew, defaultLocale: Locale(identifier: "he"))
        case .islamic:
            return self.getAlternateDayTitle(date, identifier: .islamic, defaultLocale: Locale(identifier: "ar"))
        default:
            return nil
        }
    }

    func getAlternateDayTitle(_ date: Date, identifier: Calendar.Identifier, defaultLocale: Locale) -> String {
        let calendar = Calendar(identifier: identifier)
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateStyle = .short
        dateFormatter.locale = alternateCalendarLocale ?? defaultLocale
        let day = calendar.component(.day, from: date)
        if day == 1 {
            dateFormatter.dateFormat = "MMMM"
            return dateFormatter.string(from: date).trim(8)
        }
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date).trim(8)
    }
}

extension String {
    func trim(_ maxCount: Int) -> String {
        guard self.count > maxCount else {
            return self
        }
        return self.prefix(maxCount - 1) + "."
    }
}
