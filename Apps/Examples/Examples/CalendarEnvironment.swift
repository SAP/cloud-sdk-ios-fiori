import Foundation
import SwiftUI

struct CalendarFirstWeekday: EnvironmentKey {
    public static let defaultValue: Int = 1
}

struct CalendarShowWeekNumber: EnvironmentKey {
    public static let defaultValue: Bool = false
}

struct CalendarIsEventIndicatorVisible: EnvironmentKey {
    public static let defaultValue: Bool = true
}

struct CalendarCustomLocale: EnvironmentKey {
    public static let defaultValue: Locale? = nil
}

struct CalendarCustomBundle: EnvironmentKey {
    public static let defaultValue: Bundle? = nil
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

    var isEventIndicatorVisible: Bool {
        get { self[CalendarIsEventIndicatorVisible.self] }
        set { self[CalendarIsEventIndicatorVisible.self] = newValue }
    }

    var customLocale: Locale? {
        get { self[CalendarCustomLocale.self] }
        set { self[CalendarCustomLocale.self] = newValue }
    }

    var customBundle: Bundle? {
        get { self[CalendarCustomBundle.self] }
        set { self[CalendarCustomBundle.self] = newValue }
    }
}
