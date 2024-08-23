// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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

public struct TimelinePreviewItemFioriStyle: TimelinePreviewItemStyle {
    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .titleStyle(TitleFioriStyle(timelinePreviewItemConfiguration: configuration))
            .iconStyle(IconFioriStyle(timelinePreviewItemConfiguration: configuration))
            .timelineNodeStyle(TimelineNodeFioriStyle(timelinePreviewItemConfiguration: configuration))
            .timestampStyle(TimestampFioriStyle(timelinePreviewItemConfiguration: configuration))
    }
}
