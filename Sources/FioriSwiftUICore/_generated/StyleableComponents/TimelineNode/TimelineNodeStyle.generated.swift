// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let timelineNodeIdentifier = "FioriTimelineNode_timelineNode"

    public var componentIdentifier: String = "fiori_timelinenode_component"
    public let timelineNode: TimelineNode

    public typealias TimelineNode = ConfigurationViewWrapper
}

extension TimelineNodeConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
