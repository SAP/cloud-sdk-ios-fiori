// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `CalendarView` is used to display the calendar. The calendar supports `.week`, `.month`, `.expandable`, `.fullScrollMonth`, `.rangeSelection`, and `.datesSelection` style.
///
/// ## Usage:
/// ```swift
///     @State var model = CalendarModel(calendarStyle: .month)
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
///     VStack {
///         CalendarView(model: model, titleChangeCallback: { _ in
///         }, customCalendarBackgroundColor: .white) { date in
///             Rectangle()
///         }
///         .environment(\.showsWeekNumbers, true)
///         .environment(\.hasEventIndicator, true)
///         .environment(\.alternateCalendarType, .chinese)
///         .environment(\.alternateCalendarLocale, Locale(identifier: "en"))
///         .environment(\.calendarItemTintAttributes, calendarItemTintAttributes)
///         .environment(\.customLanguageId, "zh-Hans")
///         Spacer()
///     }
///
/// ScrollView {
///     CalendarView(model: self.model)
///     .padding([.leading, .trailing], self.horizontalSizeClass == .compact ? 0 : 50)
///     .frame(maxHeight: self.maxHeight)
/// }
/// .onGeometryChange(for: CGSize.self, of: { proxy in
///     proxy.size
/// }, action: { size in
///     self.maxHeight = size.height
/// })
/// ```
/// ## Notes:
/// When style is `.fullScrollMonth`, `.rangeSelection`, or `.datesSelection`, and the CalendarView is used in ScrollView or List, the maxHeight of the CalendarView should be configured (e.g., the available screen height), otherwise it will slow down the scrolling, and the whole CalendarView will scroll in the ScrollView or List.
public struct CalendarView {
    /// The model of the calendar view.
    let model: CalendarModel
    /// Callback when the title is Changed.
    let titleChangeCallback: ((String) -> Void)?
    /// Customized background color for the calendar view.
    let customCalendarBackgroundColor: Color?
    /// This property is used to customize event view for each date.
    let customEventView: (Date) -> any View

    @Environment(\.calendarViewStyle) var style

    var componentIdentifier: String = CalendarView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(model: CalendarModel,
                titleChangeCallback: ((String) -> Void)? = nil,
                customCalendarBackgroundColor: Color? = nil,
                @ViewBuilder customEventView: @escaping (Date) -> any View = { _ in EmptyView() },
                componentIdentifier: String? = CalendarView.identifier)
    {
        self.model = model
        self.titleChangeCallback = titleChangeCallback
        self.customCalendarBackgroundColor = customCalendarBackgroundColor
        self.customEventView = customEventView
        self.componentIdentifier = componentIdentifier ?? CalendarView.identifier
    }
}

public extension CalendarView {
    static let identifier = "fiori_calendarview_component"
}

public extension CalendarView {
    init(_ configuration: CalendarViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CalendarViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.model = configuration.model
        self.titleChangeCallback = configuration.titleChangeCallback
        self.customCalendarBackgroundColor = configuration.customCalendarBackgroundColor
        self.customEventView = configuration.customEventView
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CalendarView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, model: self.model, titleChangeCallback: self.titleChangeCallback, customCalendarBackgroundColor: self.customCalendarBackgroundColor, customEventView: self.customEventView)).typeErased
                .transformEnvironment(\.calendarViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CalendarView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CalendarView(.init(componentIdentifier: self.componentIdentifier, model: self.model, titleChangeCallback: self.titleChangeCallback, customCalendarBackgroundColor: self.customCalendarBackgroundColor, customEventView: self.customEventView))
            .shouldApplyDefaultStyle(false)
            .calendarViewStyle(CalendarViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
