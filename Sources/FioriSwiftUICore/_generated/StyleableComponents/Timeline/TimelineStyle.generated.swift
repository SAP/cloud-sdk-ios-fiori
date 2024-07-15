// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TimelineStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimelineConfiguration) -> Body
}

struct AnyTimelineStyle: TimelineStyle {
    let content: (TimelineConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimelineConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimelineConfiguration {
    public let timestamp: Timestamp
    public let secondaryTimestamp: SecondaryTimestamp
    public let timelineNode: TimelineNode
    public let icon: Icon
    public let title: Title
    public let subtitle: Subtitle
    public let attribute: Attribute
    public let status: Status
    public let substatus: Substatus
    public let subAttribute: SubAttribute
    public let isPast: Bool
    public let isPresent: Bool

    public typealias Timestamp = ConfigurationViewWrapper
    public typealias SecondaryTimestamp = ConfigurationViewWrapper
    public typealias TimelineNode = ConfigurationViewWrapper
    public typealias Icon = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Attribute = ConfigurationViewWrapper
    public typealias Status = ConfigurationViewWrapper
    public typealias Substatus = ConfigurationViewWrapper
    public typealias SubAttribute = ConfigurationViewWrapper
}

public struct TimelineFioriStyle: TimelineStyle {
    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .timestampStyle(TimestampFioriStyle(timelineConfiguration: configuration))
            .secondaryTimestampStyle(SecondaryTimestampFioriStyle(timelineConfiguration: configuration))
            .timelineNodeStyle(TimelineNodeFioriStyle(timelineConfiguration: configuration))
            .iconStyle(IconFioriStyle(timelineConfiguration: configuration))
            .titleStyle(TitleFioriStyle(timelineConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(timelineConfiguration: configuration))
            .attributeStyle(AttributeFioriStyle(timelineConfiguration: configuration))
            .statusStyle(StatusFioriStyle(timelineConfiguration: configuration))
            .substatusStyle(SubstatusFioriStyle(timelineConfiguration: configuration))
            .subAttributeStyle(SubAttributeFioriStyle(timelineConfiguration: configuration))
    }
}
