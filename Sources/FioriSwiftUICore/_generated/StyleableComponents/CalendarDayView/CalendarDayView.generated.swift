// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CalendarDayView {
    let title: any View
    let subtitle: any View
    let isEventIndicatorVisible: Bool
    let state: CalendarDayState
    let customEventView: any View

    @Environment(\.calendarDayViewStyle) var style

    var componentIdentifier: String = CalendarDayView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                isEventIndicatorVisible: Bool = false,
                state: CalendarDayState = .normal,
                customEventView: any View = EmptyView(),
                componentIdentifier: String? = CalendarDayView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
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
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         isEventIndicatorVisible: Bool = false,
         state: CalendarDayState = .normal,
         customEventView: any View = EmptyView())
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, isEventIndicatorVisible: isEventIndicatorVisible, state: state, customEventView: customEventView)
    }
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
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), isEventIndicatorVisible: self.isEventIndicatorVisible, state: self.state, customEventView: self.customEventView)).typeErased
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
        CalendarDayView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), isEventIndicatorVisible: self.isEventIndicatorVisible, state: self.state, customEventView: self.customEventView))
            .shouldApplyDefaultStyle(false)
            .calendarDayViewStyle(CalendarDayViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
