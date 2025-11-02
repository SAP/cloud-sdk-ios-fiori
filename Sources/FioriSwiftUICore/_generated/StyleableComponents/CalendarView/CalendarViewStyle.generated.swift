// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CalendarViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CalendarViewConfiguration) -> Body
}

struct AnyCalendarViewStyle: CalendarViewStyle {
    let content: (CalendarViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CalendarViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CalendarViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CalendarViewConfiguration {
    public var componentIdentifier: String = "fiori_calendarview_component"
    public let model: CalendarModel
    public let titleChangeCallback: ((String) -> Void)?
    public let customCalendarBackgroundColor: Color?
    public let customEventView: (Date) -> any View
}

extension CalendarViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct CalendarViewFioriStyle: CalendarViewStyle {
    public func makeBody(_ configuration: CalendarViewConfiguration) -> some View {
        CalendarView(configuration)
    }
}
