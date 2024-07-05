// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TimelineMarkerNode {
    let upperVerticalLine: any View
    let nodeImage: any View
    let lowerVerticalLine: any View
    /// check if show upper vertical line
    let showUpperVerticalLine: Bool
    /// check if show lower vertical line
    let showLowerVerticalLine: Bool

    @Environment(\.timelineMarkerNodeStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder upperVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
                @ViewBuilder nodeImage: () -> any View,
                @ViewBuilder lowerVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
                showUpperVerticalLine: Bool = true,
                showLowerVerticalLine: Bool = true)
    {
        self.upperVerticalLine = UpperVerticalLine { upperVerticalLine() }
        self.nodeImage = NodeImage { nodeImage() }
        self.lowerVerticalLine = LowerVerticalLine { lowerVerticalLine() }
        self.showUpperVerticalLine = showUpperVerticalLine
        self.showLowerVerticalLine = showLowerVerticalLine
    }
}

public extension TimelineMarkerNode {
    init(@ViewBuilder upperVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
         nodeImage: TimelineNodeType,
         @ViewBuilder lowerVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
         showUpperVerticalLine: Bool = true,
         showLowerVerticalLine: Bool = true)
    {
        self.init(upperVerticalLine: upperVerticalLine, nodeImage: { TimelineNodeView(nodeImage) }, lowerVerticalLine: lowerVerticalLine, showUpperVerticalLine: showUpperVerticalLine, showLowerVerticalLine: showLowerVerticalLine)
    }
}

public extension TimelineMarkerNode {
    init(_ configuration: TimelineMarkerNodeConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineMarkerNodeConfiguration, shouldApplyDefaultStyle: Bool) {
        self.upperVerticalLine = configuration.upperVerticalLine
        self.nodeImage = configuration.nodeImage
        self.lowerVerticalLine = configuration.lowerVerticalLine
        self.showUpperVerticalLine = configuration.showUpperVerticalLine
        self.showLowerVerticalLine = configuration.showLowerVerticalLine
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimelineMarkerNode: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(upperVerticalLine: .init(self.upperVerticalLine), nodeImage: .init(self.nodeImage), lowerVerticalLine: .init(self.lowerVerticalLine), showUpperVerticalLine: self.showUpperVerticalLine, showLowerVerticalLine: self.showLowerVerticalLine)).typeErased
                .transformEnvironment(\.timelineMarkerNodeStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TimelineMarkerNode {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TimelineMarkerNode(.init(upperVerticalLine: .init(self.upperVerticalLine), nodeImage: .init(self.nodeImage), lowerVerticalLine: .init(self.lowerVerticalLine), showUpperVerticalLine: self.showUpperVerticalLine, showLowerVerticalLine: self.showLowerVerticalLine))
            .shouldApplyDefaultStyle(false)
            .timelineMarkerNodeStyle(TimelineMarkerNodeFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
