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
    public let timestampLabel: TimestampLabel
    public let secondaryTimestampLabel: SecondaryTimestampLabel
    public let secondaryTimestampImage: SecondaryTimestampImage
    public let upperVerticalLine: UpperVerticalLine
    public let nodeImage: NodeImage
    public let lowerVerticalLine: LowerVerticalLine
    public let showUpperVerticalLine: Bool
    public let showLowerVerticalLine: Bool
    public let title: Title
    public let isPast: Bool
    public let isPresent: Bool

    public typealias TimestampLabel = ConfigurationViewWrapper
    public typealias SecondaryTimestampLabel = ConfigurationViewWrapper
    public typealias SecondaryTimestampImage = ConfigurationViewWrapper
    public typealias UpperVerticalLine = ConfigurationViewWrapper
    public typealias NodeImage = ConfigurationViewWrapper
    public typealias LowerVerticalLine = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
}

public struct TimelineMarkerFioriStyle: TimelineMarkerStyle {
    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .timestampLabelStyle(TimestampLabelFioriStyle(timelineMarkerConfiguration: configuration))
            .secondaryTimestampLabelStyle(SecondaryTimestampLabelFioriStyle(timelineMarkerConfiguration: configuration))
            .secondaryTimestampImageStyle(SecondaryTimestampImageFioriStyle(timelineMarkerConfiguration: configuration))
            .upperVerticalLineStyle(UpperVerticalLineFioriStyle(timelineMarkerConfiguration: configuration))
            .nodeImageStyle(NodeImageFioriStyle(timelineMarkerConfiguration: configuration))
            .lowerVerticalLineStyle(LowerVerticalLineFioriStyle(timelineMarkerConfiguration: configuration))
            .titleStyle(TitleFioriStyle(timelineMarkerConfiguration: configuration))
            .timelineTimeStackStyle(TimelineTimeStackFioriStyle(timelineMarkerConfiguration: configuration))
            .timelineMarkerNodeStyle(TimelineMarkerNodeFioriStyle(timelineMarkerConfiguration: configuration))
            .timelineMarkerMainStackStyle(TimelineMarkerMainStackFioriStyle(timelineMarkerConfiguration: configuration))
    }
}
