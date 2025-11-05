// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CalendarMonthViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CalendarMonthViewConfiguration) -> Body
}

struct AnyCalendarMonthViewStyle: CalendarMonthViewStyle {
    let content: (CalendarMonthViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CalendarMonthViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CalendarMonthViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CalendarMonthViewConfiguration {
    public var componentIdentifier: String = "fiori_calendarmonthview_component"
    public let calendarStyle: CalendarStyle
    public let model: CalendarMonthModel
    public let startDate: Date
    public let endDate: Date
    public let showsMonthHeader: Bool
    public let showsOutOfMonthDates: Bool
    public let selectedDate: Date?
    public let selectedDates: Set<Date>?
    public let selectedRange: ClosedRange<Date>?
    public let disabledDates: CalendarDisabledDates?
    public let dayTappedCallback: ((Date, CalendarDayState) -> Void)?
    public let customEventView: (Date) -> any View
}

extension CalendarMonthViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct CalendarMonthViewFioriStyle: CalendarMonthViewStyle {
    public func makeBody(_ configuration: CalendarMonthViewConfiguration) -> some View {
        CalendarMonthView(configuration)
    }
}
