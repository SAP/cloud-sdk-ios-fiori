import Foundation
import SwiftUI

struct CalendarFirstWeekday: EnvironmentKey {
    // default value conforms system setting
    public static let defaultValue: Int = Calendar.autoupdatingCurrent.firstWeekday
}

struct CalendarShowWeekNumber: EnvironmentKey {
    public static let defaultValue: Bool = false
}

struct CalendarHasEventIndicator: EnvironmentKey {
    public static let defaultValue: Bool = true
}

struct CalendarCustomLocale: EnvironmentKey {
    public static let defaultValue: Locale? = nil
}

struct CalendarCustomBundle: EnvironmentKey {
    public static let defaultValue: Bundle? = nil
}

struct AlternateCalendarTypeKey: EnvironmentKey {
    public static let defaultValue: AlternateCalendarType = .none
}

struct AlternateCalendarLocaleKey: EnvironmentKey {
    public static let defaultValue: Locale? = nil
}

struct WeekNumberTintColorKey: EnvironmentKey {
    public static let defaultValue: Color? = nil
}

struct CalendarDisabledDatesKey: EnvironmentKey {
    public static let defaultValue: CalendarDisabledDates? = nil
}

public extension EnvironmentValues {
    var firstWeekday: Int {
        get { self[CalendarFirstWeekday.self] }
        set { self[CalendarFirstWeekday.self] = newValue }
    }

    var showWeekNumber: Bool {
        get { self[CalendarShowWeekNumber.self] }
        set { self[CalendarShowWeekNumber.self] = newValue }
    }

    var hasEventIndicator: Bool {
        get { self[CalendarHasEventIndicator.self] }
        set { self[CalendarHasEventIndicator.self] = newValue }
    }

    var customLocale: Locale? {
        get { self[CalendarCustomLocale.self] }
        set { self[CalendarCustomLocale.self] = newValue }
    }

    var customBundle: Bundle? {
        get { self[CalendarCustomBundle.self] }
        set { self[CalendarCustomBundle.self] = newValue }
    }

    /**
     The type of secondary calendar to be displayed.

     The default is `.none`, meaning that there is no secondary calendar to be displayed.
     */
    var alternateCalendarType: AlternateCalendarType {
        get { self[AlternateCalendarTypeKey.self] }
        set { self[AlternateCalendarTypeKey.self] = newValue }
    }
    
    /**
     The `Locale` to be used for alternate calendar.

     The default is `nil` which means the corresponding default `Locale` for the secondary calendar is used.
     */
    var alternateCalendarLocale: Locale? {
        get { self[AlternateCalendarLocaleKey.self] }
        set { self[AlternateCalendarLocaleKey.self] = newValue }
    }
    
    var weekNumberTintColor: Color? {
        get { self[WeekNumberTintColorKey.self] }
        set { self[WeekNumberTintColorKey.self] = newValue }
    }

    var disabledDates: CalendarDisabledDates? {
        get { self[CalendarDisabledDatesKey.self] }
        set { self[CalendarDisabledDatesKey.self] = newValue }
    }
}
