// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TimelineNode {
    let timelineNode: any View

    @Environment(\.timelineNodeStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder timelineNode: () -> any View) {
        self.timelineNode = timelineNode()
    }
}

public extension TimelineNode {
    init(timelineNode: TimelineNodeType) {
        self.init(timelineNode: { TimelineNodeView(timelineNode) })
    }
}

public extension TimelineNode {
    init(_ configuration: TimelineNodeConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineNodeConfiguration, shouldApplyDefaultStyle: Bool) {
        self.timelineNode = configuration.timelineNode
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimelineNode: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(timelineNode: .init(self.timelineNode))).typeErased
                .transformEnvironment(\.timelineNodeStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TimelineNode {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TimelineNode(timelineNode: { self.timelineNode })
            .shouldApplyDefaultStyle(false)
            .timelineNodeStyle(.fiori)
            .typeErased
    }
}
