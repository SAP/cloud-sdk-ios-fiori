// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `CalendarMonthView` is used to display one month in the calendar.
///
/// ## Usage
/// ```swift
///     var fm: DateFormatter {
///         let fm = DateFormatter()
///         fm.timeZone = Calendar.current.timeZone
///         fm.locale = Calendar.current.locale
///         fm.dateFormat = "yyyy MM dd"
///         return fm
///     }
///     var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
///         let result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [
///             .title: [
///                 .normal: Color(UIColor.blue),
///                 .disabled: Color(UIColor.red),
///                 .highlighted: Color(UIColor.green),
///                 .selected: Color(UIColor.yellow)
///             ],
///             .monthHeaderText: [
///                 .normal: Color(UIColor.green)
///             ],
///             .weekDayText: [
///                 .normal: Color(UIColor.blue),
///                 .highlighted: Color(UIColor.green)
///             ],
///             .weekNumberText: [
///                 .normal: Color(UIColor.green)
///             ]
///         ]
///         return result
///     }
///     let year = 2025
///     let month = 10
///     let startDate = self.fm.date(from: "2025 01 01")!
///     let endDate = self.fm.date(from: "2025 12 31")!
///     let selectedDate = self.fm.date(from: "2025 10 27")!
///     let disabledDates = CalendarDisabledDates(weekdays: [1, 2])
///     let weeks: [CalendarWeekInfo] = [
///         CalendarWeekInfo(year: year, month: month, weekNumber: 39, dates: [self.fm.date(from: "2025 09 28")!, self.fm.date(from: "2025 09 29")!, self.fm.date(from: "2025 09 30")!, self.fm.date(from: "2025 10 01")!, self.fm.date(from: "2025 10 02")!, self.fm.date(from: "2025 10 03")!, self.fm.date(from: "2025 10 04")!]),
///         CalendarWeekInfo(year: year, month: month, weekNumber: 40, dates: [self.fm.date(from: "2025 10 05")!, self.fm.date(from: "2025 10 06")!, self.fm.date(from: "2025 10 07")!, self.fm.date(from: "2025 10 08")!, self.fm.date(from: "2025 10 09")!, self.fm.date(from: "2025 10 10")!, self.fm.date(from: "2025 10 11")!]),
///         CalendarWeekInfo(year: year, month: month, weekNumber: 41, dates: [self.fm.date(from: "2025 10 12")!, self.fm.date(from: "2025 10 13")!, self.fm.date(from: "2025 10 14")!, self.fm.date(from: "2025 10 15")!, self.fm.date(from: "2025 10 16")!, self.fm.date(from: "2025 10 17")!, self.fm.date(from: "2025 10 18")!]),
///         CalendarWeekInfo(year: year, month: month, weekNumber: 42, dates: [self.fm.date(from: "2025 10 19")!, self.fm.date(from: "2025 10 20")!, self.fm.date(from: "2025 10 21")!, self.fm.date(from: "2025 10 22")!, self.fm.date(from: "2025 10 23")!, self.fm.date(from: "2025 10 24")!, self.fm.date(from: "2025 10 25")!]),
///         CalendarWeekInfo(year: year, month: month, weekNumber: 43, dates: [self.fm.date(from: "2025 10 26")!, self.fm.date(from: "2025 10 27")!, self.fm.date(from: "2025 10 28")!, self.fm.date(from: "2025 10 29")!, self.fm.date(from: "2025 10 30")!, self.fm.date(from: "2025 10 31")!, self.fm.date(from: "2025 11 01")!])
///     ]
///     let model = CalendarMonthModel(year: year, month: month, weeks: weeks)
///     let dayTappedCallback: (Date, CalendarDayState) -> Void = { date, state in
///         print("Tapped date:\(date), state:\(state)")
///     }
///     CalendarMonthView(calendarStyle: .month, model: model, startDate: startDate, endDate: endDate, showsMonthHeader: true, selectedDate: selectedDate, disabledDates: disabledDates, dayTappedCallback: dayTappedCallback) { _ in
///         Circle()
///     }
///     .background(
///         Color.preferredColor(.primaryGroupedBackground)
///     )
///     .environment(\.showsWeekNumbers, true)
///     .environment(\.hasEventIndicator, true)
///     .environment(\.alternateCalendarType, .chinese)
///     .environment(\.alternateCalendarLocale, Locale(identifier: "en"))
///     .environment(\.calendarItemTintAttributes, calendarItemTintAttributes)
///     .environment(\.customLanguageId, "en")
/// ```
public struct CalendarMonthView {
    /// The calendar style.
    let calendarStyle: CalendarStyle
    /// The date model of the calendar month view.
    let model: CalendarMonthModel
    /// The start date of the calendar.
    let startDate: Date
    /// The end date of the calendar.
    let endDate: Date
    /// Whether to show the month header or not. The default is false.
    let showsMonthHeader: Bool
    /// Whether to show a day or not when the day is in `.outOfMonth` state. The default is true.
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

    @Environment(\.calendarMonthViewStyle) var style

    var componentIdentifier: String = CalendarMonthView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(calendarStyle: CalendarStyle,
                model: CalendarMonthModel,
                startDate: Date,
                endDate: Date,
                showsMonthHeader: Bool = false,
                showsOutOfMonthDates: Bool = true,
                selectedDate: Date? = nil,
                selectedDates: Set<Date>? = nil,
                selectedRange: ClosedRange<Date>? = nil,
                disabledDates: CalendarDisabledDates? = nil,
                dayTappedCallback: ((Date, CalendarDayState) -> Void)? = nil,
                @ViewBuilder customEventView: @escaping (Date) -> any View = { _ in EmptyView() },
                componentIdentifier: String? = CalendarMonthView.identifier)
    {
        self.calendarStyle = calendarStyle
        self.model = model
        self.startDate = startDate
        self.endDate = endDate
        self.showsMonthHeader = showsMonthHeader
        self.showsOutOfMonthDates = showsOutOfMonthDates
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
        self.model = configuration.model
        self.startDate = configuration.startDate
        self.endDate = configuration.endDate
        self.showsMonthHeader = configuration.showsMonthHeader
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

extension CalendarMonthView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, calendarStyle: self.calendarStyle, model: self.model, startDate: self.startDate, endDate: self.endDate, showsMonthHeader: self.showsMonthHeader, showsOutOfMonthDates: self.showsOutOfMonthDates, selectedDate: self.selectedDate, selectedDates: self.selectedDates, selectedRange: self.selectedRange, disabledDates: self.disabledDates, dayTappedCallback: self.dayTappedCallback, customEventView: self.customEventView)).typeErased
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
        CalendarMonthView(.init(componentIdentifier: self.componentIdentifier, calendarStyle: self.calendarStyle, model: self.model, startDate: self.startDate, endDate: self.endDate, showsMonthHeader: self.showsMonthHeader, showsOutOfMonthDates: self.showsOutOfMonthDates, selectedDate: self.selectedDate, selectedDates: self.selectedDates, selectedRange: self.selectedRange, disabledDates: self.disabledDates, dayTappedCallback: self.dayTappedCallback, customEventView: self.customEventView))
            .shouldApplyDefaultStyle(false)
            .calendarMonthViewStyle(CalendarMonthViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
