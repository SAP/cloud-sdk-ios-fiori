// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CalendarDayViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CalendarDayViewConfiguration) -> Body
}

struct AnyCalendarDayViewStyle: CalendarDayViewStyle {
    let content: (CalendarDayViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CalendarDayViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CalendarDayViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CalendarDayViewConfiguration {
    public var componentIdentifier: String = "fiori_calendardayview_component"
    public let title: Title
    public let subtitle: Subtitle
    public let isEventIndicatorVisible: Bool
    public let state: CalendarDayState
    public let customEventView: any View

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
}

extension CalendarDayViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct CalendarDayViewFioriStyle: CalendarDayViewStyle {
    public func makeBody(_ configuration: CalendarDayViewConfiguration) -> some View {
        CalendarDayView(configuration)
            .titleStyle(TitleFioriStyle(calendarDayViewConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(calendarDayViewConfiguration: configuration))
    }
}
