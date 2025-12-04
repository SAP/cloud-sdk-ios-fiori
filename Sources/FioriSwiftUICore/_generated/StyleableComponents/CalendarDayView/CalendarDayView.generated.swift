// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `CalendarDayView` is used to display a day with title, subtitle and eventIndicator.
///
/// ## Usage
/// ```swift
/// var calendarItemTintAttributes: [CalendarPropertyRef: [CalendarItemControlState: Color]] {
///     let result: [CalendarPropertyRef: [CalendarItemControlState: Color]] = [
///         .title: [
///             .normal: Color(UIColor.blue),
///             .disabled: Color(UIColor.red),
///             .highlighted: Color(UIColor.green),
///             .selected: Color(UIColor.yellow)
///         ]
///     ]
///     return result
/// }
/// CalendarDayView(title: "10", subtitle: "22", isEventIndicatorVisible: true, state: .singleSelectedAndToday, customEventView: Rectangle().foregroundStyle(Color.red))
/// .environment(\.eventViewColor, .red)
/// .environment(\.selectionSingleColor, .yellow)
/// .environment(\.calendarItemTintAttributes, calendarItemTintAttributes)
///
/// CalendarDayView(title: "10", subtitle: "22", isEventIndicatorVisible: true, state: .disabled)
/// .environment(\.eventViewColorDisabled, .gray)
///
/// CalendarDayView(title: "10", subtitle: "22", isEventIndicatorVisible: true, state: .multiSelectedStart)
/// .environment(\.selectionRangeColor, .red)
/// ```
public struct CalendarDayView {
    /// The day of the date in Calendar.
    let title: AttributedString
    /// The day of the date in alternative Calendar.
    let subtitle: AttributedString?
    /// This property indicates whether the event view is to be displayed or not. The default is false.
    let isEventIndicatorVisible: Bool
    /// The state of the day  view. The default is `.normal`.
    let state: CalendarDayState
    /// This property is used to customize event view.
    let customEventView: any View

    @Environment(\.calendarDayViewStyle) var style

    var componentIdentifier: String = CalendarDayView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(title: AttributedString,
                subtitle: AttributedString? = nil,
                isEventIndicatorVisible: Bool = false,
                state: CalendarDayState = .normal,
                customEventView: any View = EmptyView(),
                componentIdentifier: String? = CalendarDayView.identifier)
    {
        self.title = title
        self.subtitle = subtitle
        self.isEventIndicatorVisible = isEventIndicatorVisible
        self.state = state
        self.customEventView = customEventView
        self.componentIdentifier = componentIdentifier ?? CalendarDayView.identifier
    }
}

public extension CalendarDayView {
    static let identifier = "fiori_calendardayview_component"
}

public extension CalendarDayView {
    init(_ configuration: CalendarDayViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CalendarDayViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.isEventIndicatorVisible = configuration.isEventIndicatorVisible
        self.state = configuration.state
        self.customEventView = configuration.customEventView
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CalendarDayView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: self.title, subtitle: self.subtitle, isEventIndicatorVisible: self.isEventIndicatorVisible, state: self.state, customEventView: self.customEventView)).typeErased
                .transformEnvironment(\.calendarDayViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CalendarDayView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CalendarDayView(.init(componentIdentifier: self.componentIdentifier, title: self.title, subtitle: self.subtitle, isEventIndicatorVisible: self.isEventIndicatorVisible, state: self.state, customEventView: self.customEventView))
            .shouldApplyDefaultStyle(false)
            .calendarDayViewStyle(CalendarDayViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
