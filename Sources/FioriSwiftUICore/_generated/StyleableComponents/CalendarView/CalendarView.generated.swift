// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `CalendarView` is used to display the calendar. The calendar supports `.week`, `.month`, `.expandable`, `.fullScrollMonth`, `.rangeSelection`, and `.datesSelection` style.
public struct CalendarView {
    /// The model of the calendar view.
    @ObservedObject var model: CalendarModel
    /// Callback when the title is Changed.
    let titleChangeCallback: ((String) -> Void)?
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
