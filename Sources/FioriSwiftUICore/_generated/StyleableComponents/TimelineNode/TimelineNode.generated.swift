// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TimelineNode {
    let upperVerticalLine: any View
    let nodeImage: any View
    let lowerVerticalLine: any View

    @Environment(\.timelineNodeStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder upperVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
                @ViewBuilder nodeImage: () -> any View,
                @ViewBuilder lowerVerticalLine: () -> any View = { Rectangle().fill(Color.clear) })
    {
        self.upperVerticalLine = UpperVerticalLine { upperVerticalLine() }
        self.nodeImage = NodeImage { nodeImage() }
        self.lowerVerticalLine = LowerVerticalLine { lowerVerticalLine() }
    }
}

public extension TimelineNode {
    init(@ViewBuilder upperVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
         nodeImage: TimelineNodeType,
         @ViewBuilder lowerVerticalLine: () -> any View = { Rectangle().fill(Color.clear) })
    {
        self.init(upperVerticalLine: upperVerticalLine, nodeImage: { TimelineNodeView(nodeImage) }, lowerVerticalLine: lowerVerticalLine)
    }
}

public extension TimelineNode {
    init(_ configuration: TimelineNodeConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineNodeConfiguration, shouldApplyDefaultStyle: Bool) {
        self.upperVerticalLine = configuration.upperVerticalLine
        self.nodeImage = configuration.nodeImage
        self.lowerVerticalLine = configuration.lowerVerticalLine
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimelineNode: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(upperVerticalLine: .init(self.upperVerticalLine), nodeImage: .init(self.nodeImage), lowerVerticalLine: .init(self.lowerVerticalLine))).typeErased
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
        TimelineNode(.init(upperVerticalLine: .init(self.upperVerticalLine), nodeImage: .init(self.nodeImage), lowerVerticalLine: .init(self.lowerVerticalLine)))
            .shouldApplyDefaultStyle(false)
            .timelineNodeStyle(TimelineNodeFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
