// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CalendarWeekViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CalendarWeekViewConfiguration) -> Body
}

struct AnyCalendarWeekViewStyle: CalendarWeekViewStyle {
    let content: (CalendarWeekViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CalendarWeekViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CalendarWeekViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CalendarWeekViewConfiguration {
    public var componentIdentifier: String = "fiori_calendarweekview_component"
    public let calendarStyle: CalendarStyle
    public let weekInfo: CalendarWeekInfo
    public let startDate: Date
    public let endDate: Date
    public let showsOutOfMonthDates: Bool
    public let selectedDate: Date?
    public let selectedDates: Set<Date>?
    public let selectedRange: ClosedRange<Date>?
    public let disabledDates: CalendarDisabledDates?
    public let dayTappedCallback: ((Date, CalendarDayState) -> Void)?
    public let customEventView: (Date) -> any View
}

extension CalendarWeekViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct CalendarWeekViewFioriStyle: CalendarWeekViewStyle {
    public func makeBody(_ configuration: CalendarWeekViewConfiguration) -> some View {
        CalendarWeekView(configuration)
    }
}
