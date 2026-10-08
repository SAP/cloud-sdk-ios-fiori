// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol CalendarDayViewStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: CalendarDayViewConfiguration) -> Body
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
    public let title: AttributedString
    public let subtitle: AttributedString?
    public let isEventIndicatorVisible: Bool
    public let state: CalendarDayState
    public let customEventView: any View
}

extension CalendarDayViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct CalendarDayViewFioriStyle: CalendarDayViewStyle {
    public func makeBody(_ configuration: CalendarDayViewConfiguration) -> some View {
        CalendarDayView(configuration)
    }
}

struct CalendarDayViewDefaultStyle: CalendarDayViewStyle {
    nonisolated init() {}

    func makeBody(_ configuration: CalendarDayViewConfiguration) -> some View {
        CalendarDayView(configuration)
            .calendarDayViewStyle(CalendarDayViewFioriStyle())
            .modifier(CalendarDayViewStyleModifier(style: CalendarDayViewBaseStyle()))
    }
}
