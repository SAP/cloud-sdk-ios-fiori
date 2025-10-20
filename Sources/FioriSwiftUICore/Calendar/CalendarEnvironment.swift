import FioriThemeManager
import Foundation
import SwiftUI

struct CalendarFirstWeekday: EnvironmentKey {
    // default value conforms system setting
    public static let defaultValue: Int = Calendar.autoupdatingCurrent.firstWeekday
}

struct CalendarShowsWeekNumbers: EnvironmentKey {
    public static let defaultValue: Bool = false
}

struct CalendarHasEventIndicator: EnvironmentKey {
    public static let defaultValue: Bool = true
}

struct CalendarCustomLanguageId: EnvironmentKey {
    public static let defaultValue: String? = nil
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

struct CalendarMonthHeaderDateFormatKey: EnvironmentKey {
    public static let defaultValue: String = "MMMM"
}

struct CalendarSelectionSingleColorKey: EnvironmentKey {
    public static let defaultValue: Color = .preferredColor(.tintColor)
}

struct CalendarSelectionRangeColorKey: EnvironmentKey {
    public static let defaultValue: Color = .preferredColor(.tintColor)
}

struct CalendarEventViewColorKey: EnvironmentKey {
    public static let defaultValue: Color = .preferredColor(.tertiaryLabel).opacity(0.6)
}

struct CalendarEventViewColorDisabledKey: EnvironmentKey {
    public static let defaultValue: Color = .preferredColor(.quaternaryLabel).opacity(0.6)
}

struct CalendarItemTintAttributesKey: EnvironmentKey {
    public static let defaultValue: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [:]
}

struct BannerMessageBackgroundColorKey: EnvironmentKey {
    public static let defaultValue: Color? = nil
}

public enum CalendarItemControlState {
    /// Item is in normal state. Default.
    case normal
    /// Item is in selected state.
    case selected
    /// Item is in disabled state.
    case disabled
    /// Item is in highlighted state.
    case highlighted
}

public enum CalendarPropertyRef {
    case title
    case monthHeaderText
    case weekDayText
    case weekNumberText
}

public extension EnvironmentValues {
    /**
     The first day of the week for the calendar.
     
     The default value of firstWeekday varies by calendar and locale. Your app can reset this value.
     
     The weekday units are one-based. For Gregorian and ISO 8601 calendars, 1 is Sunday, 2 is Monday, 3 is Tuesday, 4 is Wednesday, 5 is Thursday, 6 is Friday and 7 is Saturday.
     */
    var firstWeekday: Int {
        get { self[CalendarFirstWeekday.self] }
        set { self[CalendarFirstWeekday.self] = newValue }
    }

    /// This property indicates if the calendar view also shows the week number of not. The default is `false`.
    var showsWeekNumbers: Bool {
        get { self[CalendarShowsWeekNumbers.self] }
        set { self[CalendarShowsWeekNumbers.self] = newValue }
    }

    /// Specifies if the event indicator view is displayed
    var hasEventIndicator: Bool {
        get { self[CalendarHasEventIndicator.self] }
        set { self[CalendarHasEventIndicator.self] = newValue }
    }
    
    /// The ID of the language to be used when displaying the `CalendarView`.
    var customLanguageId: String? {
        get { self[CalendarCustomLanguageId.self] }
        set { self[CalendarCustomLanguageId.self] = newValue }
    }

    /// Custom bundle.
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
    
    /// The color of the view displayed upon selection of a date.
    var selectionSingleColor: Color {
        get { self[CalendarSelectionSingleColorKey.self] }
        set { self[CalendarSelectionSingleColorKey.self] = newValue }
    }
    
    /// The color of the view displayed upon a range selection of dates
    var selectionRangeColor: Color {
        get { self[CalendarSelectionRangeColorKey.self] }
        set { self[CalendarSelectionRangeColorKey.self] = newValue }
    }

    /// The color of the `eventView` displayed below each date.
    var eventViewColor: Color {
        get { self[CalendarEventViewColorKey.self] }
        set { self[CalendarEventViewColorKey.self] = newValue }
    }

    /// The color of the `eventView` displayed below each date for disabled dates.
    var eventViewColorDisabled: Color {
        get { self[CalendarEventViewColorDisabledKey.self] }
        set { self[CalendarEventViewColorDisabledKey.self] = newValue }
    }

    /**
     The color of calendar item in different state, only support foregroundColor.
     For .weekDayText, only .normal and .highlighted states will be used.
     For .monthHeaderText, only .normal state will be used.
     For .weekNumberText, only .normal state will be used.
     */
    var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
        get { self[CalendarItemTintAttributesKey.self] }
        set { self[CalendarItemTintAttributesKey.self] = newValue }
    }
    
    /// The date formatter for month header. Default is "MMMM"
    var monthHeaderDateFormat: String {
        get { self[CalendarMonthHeaderDateFormatKey.self] }
        set { self[CalendarMonthHeaderDateFormatKey.self] = newValue }
    }

    /// The backgroundColor for banner message
    var bannerMessageBackgroundColor: Color? {
        get { self[BannerMessageBackgroundColorKey.self] }
        set { self[BannerMessageBackgroundColorKey.self] = newValue }
    }
}
