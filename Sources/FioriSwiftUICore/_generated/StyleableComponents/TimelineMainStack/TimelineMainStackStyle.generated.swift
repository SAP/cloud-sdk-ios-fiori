// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TimelineMainStackStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimelineMainStackConfiguration) -> Body
}

struct AnyTimelineMainStackStyle: TimelineMainStackStyle {
    let content: (TimelineMainStackConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimelineMainStackConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimelineMainStackConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimelineMainStackConfiguration {
    public let title: Title
    public let subtitle: Subtitle
    public let attribute: Attribute
    public let status: Status
    public let substatus: Substatus
    public let subAttribute: SubAttribute

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Attribute = ConfigurationViewWrapper
    public typealias Status = ConfigurationViewWrapper
    public typealias Substatus = ConfigurationViewWrapper
    public typealias SubAttribute = ConfigurationViewWrapper
}

public struct TimelineMainStackFioriStyle: TimelineMainStackStyle {
    public func makeBody(_ configuration: TimelineMainStackConfiguration) -> some View {
        TimelineMainStack(configuration)
            .titleStyle(TitleFioriStyle(timelineMainStackConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(timelineMainStackConfiguration: configuration))
            .attributeStyle(AttributeFioriStyle(timelineMainStackConfiguration: configuration))
            .statusStyle(StatusFioriStyle(timelineMainStackConfiguration: configuration))
            .substatusStyle(SubstatusFioriStyle(timelineMainStackConfiguration: configuration))
            .subAttributeStyle(SubAttributeFioriStyle(timelineMainStackConfiguration: configuration))
    }
}
