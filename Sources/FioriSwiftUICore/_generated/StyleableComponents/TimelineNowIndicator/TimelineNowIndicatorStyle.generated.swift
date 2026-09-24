// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol TimelineNowIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_timelinenowindicator_component"
    public let nowIndicatorNode: NowIndicatorNode

    public typealias NowIndicatorNode = ConfigurationViewWrapper
}

extension TimelineNowIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct TimelineNowIndicatorFioriStyle: TimelineNowIndicatorStyle {
    public func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        TimelineNowIndicator(configuration)
            .nowIndicatorNodeStyle(NowIndicatorNodeFioriStyle(timelineNowIndicatorConfiguration: configuration))
    }
}

struct TimelineNowIndicatorDefaultStyle: TimelineNowIndicatorStyle {
    nonisolated init() {}

    func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        TimelineNowIndicator(configuration)
            .timelineNowIndicatorStyle(TimelineNowIndicatorFioriStyle())
            .modifier(TimelineNowIndicatorStyleModifier(style: TimelineNowIndicatorBaseStyle()))
    }
}
