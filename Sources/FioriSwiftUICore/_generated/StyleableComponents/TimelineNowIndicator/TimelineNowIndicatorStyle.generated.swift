// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriTimelineNowIndicator_content"
    public let nowIndicatorNodeIdentifier = "FioriTimelineNowIndicator_nowIndicatorNode"

    public let nowIndicatorNode: NowIndicatorNode

    public typealias NowIndicatorNode = ConfigurationViewWrapper
}

public struct TimelineNowIndicatorFioriStyle: TimelineNowIndicatorStyle {
    public func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        TimelineNowIndicator(configuration)
            .nowIndicatorNodeStyle(NowIndicatorNodeFioriStyle(timelineNowIndicatorConfiguration: configuration))
    }
}

public struct TimelineNowIndicatorNSSStyle: TimelineNowIndicatorStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        TimelineNowIndicator(configuration)
            .nowIndicatorNodeStyle(NowIndicatorNodeNSSStyle(timelineNowIndicatorConfiguration: configuration, nssData: self.data.value(configuration.nowIndicatorNodeIdentifier)))
            .timelineNowIndicatorStyle(ContentNSSStyle(timelineNowIndicatorConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
