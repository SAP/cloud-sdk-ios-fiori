// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TimelineMarkerNodeStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimelineMarkerNodeConfiguration) -> Body
}

struct AnyTimelineMarkerNodeStyle: TimelineMarkerNodeStyle {
    let content: (TimelineMarkerNodeConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimelineMarkerNodeConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimelineMarkerNodeConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimelineMarkerNodeConfiguration {
    public let upperVerticalLine: UpperVerticalLine
    public let nodeImage: NodeImage
    public let lowerVerticalLine: LowerVerticalLine
    public let showUpperVerticalLine: Bool
    public let showLowerVerticalLine: Bool

    public typealias UpperVerticalLine = ConfigurationViewWrapper
    public typealias NodeImage = ConfigurationViewWrapper
    public typealias LowerVerticalLine = ConfigurationViewWrapper
}

public struct TimelineMarkerNodeFioriStyle: TimelineMarkerNodeStyle {
    public func makeBody(_ configuration: TimelineMarkerNodeConfiguration) -> some View {
        TimelineMarkerNode(configuration)
            .upperVerticalLineStyle(UpperVerticalLineFioriStyle(timelineMarkerNodeConfiguration: configuration))
            .nodeImageStyle(NodeImageFioriStyle(timelineMarkerNodeConfiguration: configuration))
            .lowerVerticalLineStyle(LowerVerticalLineFioriStyle(timelineMarkerNodeConfiguration: configuration))
    }
}
