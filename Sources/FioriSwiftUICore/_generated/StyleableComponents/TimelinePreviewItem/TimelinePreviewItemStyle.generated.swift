// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol TimelinePreviewItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> Body
}

struct AnyTimelinePreviewItemStyle: TimelinePreviewItemStyle {
    let content: (TimelinePreviewItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimelinePreviewItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimelinePreviewItemConfiguration {
    public var componentIdentifier: String = "fiori_timelinepreviewitem_component"
    public let title: Title
    public let icon: Icon
    public let timelineNode: TimelineNode
    public let timestamp: Timestamp
    public let isFuture: Bool
    public let nodeType: TimelineNodeType

    public typealias Title = ConfigurationViewWrapper
    public typealias Icon = ConfigurationViewWrapper
    public typealias TimelineNode = ConfigurationViewWrapper
    public typealias Timestamp = ConfigurationViewWrapper
}

public extension TimelinePreviewItemConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var titleIdentifier: String {
        self.componentIdentifier + "_title"
    }

    var iconIdentifier: String {
        self.componentIdentifier + "_icon"
    }

    var timelineNodeIdentifier: String {
        self.componentIdentifier + "_timelineNode"
    }

    var timestampIdentifier: String {
        self.componentIdentifier + "_timestamp"
    }
}

extension TimelinePreviewItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct TimelinePreviewItemFioriStyle: TimelinePreviewItemStyle {
    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .titleStyle(TitleFioriStyle(timelinePreviewItemConfiguration: configuration))
            .iconStyle(IconFioriStyle(timelinePreviewItemConfiguration: configuration))
            .timelineNodeStyle(TimelineNodeFioriStyle(timelinePreviewItemConfiguration: configuration))
            .timestampStyle(TimestampFioriStyle(timelinePreviewItemConfiguration: configuration))
    }
}

public struct TimelinePreviewItemNSSStyle: TimelinePreviewItemStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .titleStyle(TitleNSSStyle(timelinePreviewItemConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .iconStyle(IconNSSStyle(timelinePreviewItemConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .timelineNodeStyle(TimelineNodeNSSStyle(timelinePreviewItemConfiguration: configuration, nssData: self.data.value(configuration.timelineNodeIdentifier)))
            .timestampStyle(TimestampNSSStyle(timelinePreviewItemConfiguration: configuration, nssData: self.data.value(configuration.timestampIdentifier)))
            .timelinePreviewItemStyle(ContentNSSStyle(timelinePreviewItemConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
