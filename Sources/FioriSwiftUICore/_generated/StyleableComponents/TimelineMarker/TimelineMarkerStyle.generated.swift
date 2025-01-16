// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TimelineMarkerStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimelineMarkerConfiguration) -> Body
}

struct AnyTimelineMarkerStyle: TimelineMarkerStyle {
    let content: (TimelineMarkerConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimelineMarkerConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimelineMarkerConfiguration {
    public var componentIdentifier: String = "fiori_timelinemarker_component"
    public let timestamp: Timestamp
    public let secondaryTimestamp: SecondaryTimestamp
    public let timelineNode: TimelineNode
    public let icon: Icon
    public let title: Title
    public let isPast: Bool
    public let isPresent: Bool
    public let showUpperVerticalLine: Bool
    public let showLowerVerticalLine: Bool

    public typealias Timestamp = ConfigurationViewWrapper
    public typealias SecondaryTimestamp = ConfigurationViewWrapper
    public typealias TimelineNode = ConfigurationViewWrapper
    public typealias Icon = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
}

extension TimelineMarkerConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct TimelineMarkerFioriStyle: TimelineMarkerStyle {
    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .timestampStyle(TimestampFioriStyle(timelineMarkerConfiguration: configuration))
            .secondaryTimestampStyle(SecondaryTimestampFioriStyle(timelineMarkerConfiguration: configuration))
            .timelineNodeStyle(TimelineNodeFioriStyle(timelineMarkerConfiguration: configuration))
            .iconStyle(IconFioriStyle(timelineMarkerConfiguration: configuration))
            .titleStyle(TitleFioriStyle(timelineMarkerConfiguration: configuration))
    }
}
