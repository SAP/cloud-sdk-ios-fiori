// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TimelineNodeStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimelineNodeConfiguration) -> Body
}

struct AnyTimelineNodeStyle: TimelineNodeStyle {
    let content: (TimelineNodeConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimelineNodeConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimelineNodeConfiguration {
    public let upperVerticalLine: UpperVerticalLine
    public let nodeImage: NodeImage
    public let lowerVerticalLine: LowerVerticalLine

    public typealias UpperVerticalLine = ConfigurationViewWrapper
    public typealias NodeImage = ConfigurationViewWrapper
    public typealias LowerVerticalLine = ConfigurationViewWrapper
}

public struct TimelineNodeFioriStyle: TimelineNodeStyle {
    public func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
        TimelineNode(configuration)
            .upperVerticalLineStyle(UpperVerticalLineFioriStyle(timelineNodeConfiguration: configuration))
            .nodeImageStyle(NodeImageFioriStyle(timelineNodeConfiguration: configuration))
            .lowerVerticalLineStyle(LowerVerticalLineFioriStyle(timelineNodeConfiguration: configuration))
    }
}
