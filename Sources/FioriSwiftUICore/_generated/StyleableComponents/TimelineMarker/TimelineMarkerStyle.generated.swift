// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriTimelineMarker_content"
    public let timestampIdentifier = "FioriTimelineMarker_timestamp"
    public let secondaryTimestampIdentifier = "FioriTimelineMarker_secondaryTimestamp"
    public let timelineNodeIdentifier = "FioriTimelineMarker_timelineNode"
    public let iconIdentifier = "FioriTimelineMarker_icon"
    public let titleIdentifier = "FioriTimelineMarker_title"

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

public struct TimelineMarkerNSSStyle: TimelineMarkerStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .timestampStyle(TimestampNSSStyle(timelineMarkerConfiguration: configuration, nssData: self.data.value(configuration.timestampIdentifier)))
            .secondaryTimestampStyle(SecondaryTimestampNSSStyle(timelineMarkerConfiguration: configuration, nssData: self.data.value(configuration.secondaryTimestampIdentifier)))
            .timelineNodeStyle(TimelineNodeNSSStyle(timelineMarkerConfiguration: configuration, nssData: self.data.value(configuration.timelineNodeIdentifier)))
            .iconStyle(IconNSSStyle(timelineMarkerConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .titleStyle(TitleNSSStyle(timelineMarkerConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .timelineMarkerStyle(ContentNSSStyle(timelineMarkerConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
