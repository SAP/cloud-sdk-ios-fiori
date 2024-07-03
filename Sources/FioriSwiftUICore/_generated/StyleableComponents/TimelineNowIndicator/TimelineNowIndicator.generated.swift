// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `TimelineNowIndicator` designed to present now indicator in a Timeline view.
/// It uses a node view and  horizontal line to present now indicator.
///
/// ## Notes
/// ### Minimum list row height between Timeline Items in the List
/// Since the default size of node image on the TimelineNowIndicator is 7, in order to display TimelineNowIndicator correctly in the List, set the minimum height for all row in a List using the .environment(\.defaultMinListRowHeight, value) modifier on the List, the value should be less than or equal to 7.
public struct TimelineNowIndicator {
    let nowIndicatorNode: any View
    let trailingHorizontalLine: any View

    @Environment(\.timelineNowIndicatorStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder nowIndicatorNode: () -> any View = { Image(systemName: "circle.fill") },
                @ViewBuilder trailingHorizontalLine: () -> any View = { Rectangle().fill(Color.clear) })
    {
        self.nowIndicatorNode = NowIndicatorNode { nowIndicatorNode() }
        self.trailingHorizontalLine = TrailingHorizontalLine { trailingHorizontalLine() }
    }
}

public extension TimelineNowIndicator {
    init(_ configuration: TimelineNowIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineNowIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.nowIndicatorNode = configuration.nowIndicatorNode
        self.trailingHorizontalLine = configuration.trailingHorizontalLine
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimelineNowIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(nowIndicatorNode: .init(self.nowIndicatorNode), trailingHorizontalLine: .init(self.trailingHorizontalLine))).typeErased
                .transformEnvironment(\.timelineNowIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TimelineNowIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TimelineNowIndicator(.init(nowIndicatorNode: .init(self.nowIndicatorNode), trailingHorizontalLine: .init(self.trailingHorizontalLine)))
            .shouldApplyDefaultStyle(false)
            .timelineNowIndicatorStyle(TimelineNowIndicatorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
