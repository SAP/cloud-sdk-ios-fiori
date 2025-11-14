// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `CalendarWeekView` is used to display the dates in one week.
///
/// Developer can set the `.showsWeekNumbers` environment to show the week numberText. If calendarStyle is `.datesSelection` or `.rangeSelection`, and when the first date of the week is out of month, always hide the week number.
/// ## Usage
/// ```swift
/// var fm: DateFormatter {
///     let fm = DateFormatter()
///     fm.timeZone = Calendar.current.timeZone
///     fm.locale = Calendar.current.locale
///     fm.dateFormat = "yyyy MM dd"
///     return fm
/// }
/// var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
///     let result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [
///         .title: [
///             .normal: Color(UIColor.blue),
///             .disabled: Color(UIColor.red),
///             .highlighted: Color(UIColor.green),
///             .selected: Color(UIColor.yellow)
///         ],
///         .weekNumberText: [
///             .normal: Color(UIColor.green)
///         ]
///     ]
///     return result
/// }
/// let info = CalendarWeekInfo(year: 2025, month: 10, weekNumber: 43, dates: [
///     self.fm.date(from: "2025 10 26")!,
///     self.fm.date(from: "2025 10 27")!,
///     self.fm.date(from: "2025 10 28")!,
///     self.fm.date(from: "2025 10 29")!,
///     self.fm.date(from: "2025 10 30")!,
///     self.fm.date(from: "2025 10 31")!,
///     self.fm.date(from: "2025 11 01")!
/// ])
/// @State var selectedDate: Date? = .now
/// CalendarWeekView(calendarStyle: .month, weekInfo: info, startDate: self.fm.date(from: "2025 01 01")!, endDate: self.fm.date(from: "2025 12 31")!, showsOutOfMonthDates: true, selectedDate: selectedDate, dayTappedCallback: { date, state in
///     print("Tap on a date:\(date), with state:\(state)")
///     self.selectedDate = date
/// }, customEventView: { date in
///     Rectangle()
/// })
/// .environment(\.showsWeekNumbers, true)
/// .environment(\.hasEventIndicator, true)
/// .environment(\.alternateCalendarType, .chinese)
/// .environment(\.alternateCalendarLocale, Locale(identifier: "en"))
/// .environment(\.calendarItemTintAttributes, calendarItemTintAttributes)
/// ```
public struct CalendarWeekView {
    /// The calendar style.
    let calendarStyle: CalendarStyle
    /// This property is used to display the dates in one week.
    let weekInfo: CalendarWeekInfo
    /// The start date of the calendar.
    let startDate: Date
    /// The end date of the calendar.
    let endDate: Date
    /// Whether to show a day or not when the day is in `.outOfMonth` state.
    let showsOutOfMonthDates: Bool
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

    @Environment(\.calendarWeekViewStyle) var style

    var componentIdentifier: String = CalendarWeekView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(calendarStyle: CalendarStyle,
                weekInfo: CalendarWeekInfo,
                startDate: Date,
                endDate: Date,
                showsOutOfMonthDates: Bool = true,
                selectedDate: Date? = nil,
                selectedDates: Set<Date>? = nil,
                selectedRange: ClosedRange<Date>? = nil,
                disabledDates: CalendarDisabledDates? = nil,
                dayTappedCallback: ((Date, CalendarDayState) -> Void)? = nil,
                @ViewBuilder customEventView: @escaping (Date) -> any View = { _ in EmptyView() },
                componentIdentifier: String? = CalendarWeekView.identifier)
    {
        self.calendarStyle = calendarStyle
        self.weekInfo = weekInfo
        self.startDate = startDate
        self.endDate = endDate
        self.showsOutOfMonthDates = showsOutOfMonthDates
        self.selectedDate = selectedDate
        self.selectedDates = selectedDates
        self.selectedRange = selectedRange
        self.disabledDates = disabledDates
        self.dayTappedCallback = dayTappedCallback
        self.customEventView = customEventView
        self.componentIdentifier = componentIdentifier ?? CalendarWeekView.identifier
    }
}

public extension CalendarWeekView {
    static let identifier = "fiori_calendarweekview_component"
}

public extension CalendarWeekView {
    init(_ configuration: CalendarWeekViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CalendarWeekViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.calendarStyle = configuration.calendarStyle
        self.weekInfo = configuration.weekInfo
        self.startDate = configuration.startDate
        self.endDate = configuration.endDate
        self.showsOutOfMonthDates = configuration.showsOutOfMonthDates
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

extension CalendarWeekView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, calendarStyle: self.calendarStyle, weekInfo: self.weekInfo, startDate: self.startDate, endDate: self.endDate, showsOutOfMonthDates: self.showsOutOfMonthDates, selectedDate: self.selectedDate, selectedDates: self.selectedDates, selectedRange: self.selectedRange, disabledDates: self.disabledDates, dayTappedCallback: self.dayTappedCallback, customEventView: self.customEventView)).typeErased
                .transformEnvironment(\.calendarWeekViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CalendarWeekView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CalendarWeekView(.init(componentIdentifier: self.componentIdentifier, calendarStyle: self.calendarStyle, weekInfo: self.weekInfo, startDate: self.startDate, endDate: self.endDate, showsOutOfMonthDates: self.showsOutOfMonthDates, selectedDate: self.selectedDate, selectedDates: self.selectedDates, selectedRange: self.selectedRange, disabledDates: self.disabledDates, dayTappedCallback: self.dayTappedCallback, customEventView: self.customEventView))
            .shouldApplyDefaultStyle(false)
            .calendarWeekViewStyle(CalendarWeekViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
