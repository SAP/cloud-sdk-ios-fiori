// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public var componentIdentifier: String = "fiori_timeline_component"
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

public extension TimelineConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var timestampIdentifier: String {
        self.componentIdentifier + "_timestamp"
    }

    var secondaryTimestampIdentifier: String {
        self.componentIdentifier + "_secondaryTimestamp"
    }

    var timelineNodeIdentifier: String {
        self.componentIdentifier + "_timelineNode"
    }

    var iconIdentifier: String {
        self.componentIdentifier + "_icon"
    }

    var titleIdentifier: String {
        self.componentIdentifier + "_title"
    }

    var subtitleIdentifier: String {
        self.componentIdentifier + "_subtitle"
    }

    var attributeIdentifier: String {
        self.componentIdentifier + "_attribute"
    }

    var statusIdentifier: String {
        self.componentIdentifier + "_status"
    }

    var substatusIdentifier: String {
        self.componentIdentifier + "_substatus"
    }

    var subAttributeIdentifier: String {
        self.componentIdentifier + "_subAttribute"
    }
}

extension TimelineConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
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

public struct TimelineNSSStyle: TimelineStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .timestampStyle(TimestampNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.timestampIdentifier)))
            .secondaryTimestampStyle(SecondaryTimestampNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.secondaryTimestampIdentifier)))
            .timelineNodeStyle(TimelineNodeNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.timelineNodeIdentifier)))
            .iconStyle(IconNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .titleStyle(TitleNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .attributeStyle(AttributeNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.attributeIdentifier)))
            .statusStyle(StatusNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.statusIdentifier)))
            .substatusStyle(SubstatusNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.substatusIdentifier)))
            .subAttributeStyle(SubAttributeNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.subAttributeIdentifier)))
            .timelineStyle(ContentNSSStyle(timelineConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
