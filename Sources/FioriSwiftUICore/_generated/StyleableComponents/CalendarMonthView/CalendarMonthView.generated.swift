// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `CalendarMonthView` is used to display one month in the calendar.
public struct CalendarMonthView {
    /// The calendar style.
    let calendarStyle: CalendarStyle
    /// The year that the view belong to, used to produce the weeks info of the month.
    let year: Int
    /// The month that the view belong to, used to produce the weeks info of the month.
    let month: Int
    /// The start date of the calendar.
    let startDate: Date
    /// The end date of the calendar.
    let endDate: Date
    /// Whether to show the month header or not. The default is false.
    let showMonthHeader: Bool
    /// Whether to show a day or not when the day is in `.outOfMonth` state. The default is true.
    let showOutOfMonth: Bool
    /// The selected date in the calendar, used to single select, when the style is `.month`, `.fullScreenMonth`, `.week` or `.expandable`.
    let selectedDate: Date?
    /// The selected dates in the calendar, used to multi select, when the style is `.datesSelection`.
    let selectedDates: Set<Date>?
    /// The selected range in the calendar, used to range select, when the style is `.rangeSelection`.
    let selectedRange: ClosedRange<Date>?
    /// The disabled dates. Default is nil, which means all in month displayed dates are selectable.
    let disabledDates: CalendarDisabledDates?
    /// Callback when a day is tapped. The day should be in available state to response to tap gesture, like .normal, .today, .singleSelected, .singleSelectedAndToday, .multiSelectedStart, .multiSelectedMiddle and multiSelectedEnd.
    let dayTappedCallback: ((Date, CalendarDayState) -> Void)?
    /// This property is used to customize event view for each date.
    let customEventView: (Date) -> any View

    @Environment(\.calendarMonthViewStyle) var style

    var componentIdentifier: String = CalendarMonthView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(calendarStyle: CalendarStyle,
                year: Int,
                month: Int,
                startDate: Date,
                endDate: Date,
                showMonthHeader: Bool = false,
                showOutOfMonth: Bool = true,
                selectedDate: Date? = nil,
                selectedDates: Set<Date>? = nil,
                selectedRange: ClosedRange<Date>? = nil,
                disabledDates: CalendarDisabledDates? = nil,
                dayTappedCallback: ((Date, CalendarDayState) -> Void)? = nil,
                @ViewBuilder customEventView: @escaping (Date) -> any View = { _ in EmptyView() },
                componentIdentifier: String? = CalendarMonthView.identifier)
    {
        self.calendarStyle = calendarStyle
        self.year = year
        self.month = month
        self.startDate = startDate
        self.endDate = endDate
        self.showMonthHeader = showMonthHeader
        self.showOutOfMonth = showOutOfMonth
        self.selectedDate = selectedDate
        self.selectedDates = selectedDates
        self.selectedRange = selectedRange
        self.disabledDates = disabledDates
        self.dayTappedCallback = dayTappedCallback
        self.customEventView = customEventView
        self.componentIdentifier = componentIdentifier ?? CalendarMonthView.identifier
    }
}

public extension CalendarMonthView {
    static let identifier = "fiori_calendarmonthview_component"
}

public extension CalendarMonthView {
    init(_ configuration: CalendarMonthViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CalendarMonthViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.calendarStyle = configuration.calendarStyle
        self.year = configuration.year
        self.month = configuration.month
        self.startDate = configuration.startDate
        self.endDate = configuration.endDate
        self.showMonthHeader = configuration.showMonthHeader
        self.showOutOfMonth = configuration.showOutOfMonth
        self.selectedDate = configuration.selectedDate
        self.selectedDates = configuration.selectedDates
        self.selectedRange = configuration.selectedRange
        self.disabledDates = configuration.disabledDates
        self.dayTappedCallback = configuration.dayTappedCallback
        self.customEventView = configuration.customEventView
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CalendarMonthView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, calendarStyle: self.calendarStyle, year: self.year, month: self.month, startDate: self.startDate, endDate: self.endDate, showMonthHeader: self.showMonthHeader, showOutOfMonth: self.showOutOfMonth, selectedDate: self.selectedDate, selectedDates: self.selectedDates, selectedRange: self.selectedRange, disabledDates: self.disabledDates, dayTappedCallback: self.dayTappedCallback, customEventView: self.customEventView)).typeErased
                .transformEnvironment(\.calendarMonthViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CalendarMonthView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CalendarMonthView(.init(componentIdentifier: self.componentIdentifier, calendarStyle: self.calendarStyle, year: self.year, month: self.month, startDate: self.startDate, endDate: self.endDate, showMonthHeader: self.showMonthHeader, showOutOfMonth: self.showOutOfMonth, selectedDate: self.selectedDate, selectedDates: self.selectedDates, selectedRange: self.selectedRange, disabledDates: self.disabledDates, dayTappedCallback: self.dayTappedCallback, customEventView: self.customEventView))
            .shouldApplyDefaultStyle(false)
            .calendarMonthViewStyle(CalendarMonthViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
