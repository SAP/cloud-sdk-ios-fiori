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
    public let timelineNode: TimelineNode

    public typealias TimelineNode = ConfigurationViewWrapper
}
