// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TimelineNowIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> Body
}

struct AnyTimelineNowIndicatorStyle: TimelineNowIndicatorStyle {
    let content: (TimelineNowIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimelineNowIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimelineNowIndicatorConfiguration {
    public let nowIndicatorNode: NowIndicatorNode
    public let trailingHorizontalLine: TrailingHorizontalLine

    public typealias NowIndicatorNode = ConfigurationViewWrapper
    public typealias TrailingHorizontalLine = ConfigurationViewWrapper
}

public struct TimelineNowIndicatorFioriStyle: TimelineNowIndicatorStyle {
    public func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        TimelineNowIndicator(configuration)
            .nowIndicatorNodeStyle(NowIndicatorNodeFioriStyle(timelineNowIndicatorConfiguration: configuration))
            .trailingHorizontalLineStyle(TrailingHorizontalLineFioriStyle(timelineNowIndicatorConfiguration: configuration))
    }
}
