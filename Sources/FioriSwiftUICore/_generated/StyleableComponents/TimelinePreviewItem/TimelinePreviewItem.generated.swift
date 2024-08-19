// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// 'TimelinePreviewItem' is an item specialized for placement in TimelinePreview.
public struct TimelinePreviewItem {
    let title: any View
    let icon: any View
    let timelineNode: any View
    let timestamp: any View
    /// the data of timeline preview item
    let data: TimelinePreviewItemModel

    @Environment(\.timelinePreviewItemStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder timelineNode: () -> any View,
                @ViewBuilder timestamp: () -> any View = { EmptyView() },
                data: TimelinePreviewItemModel)
    {
        self.title = Title { title() }
        self.icon = Icon { icon() }
        self.timelineNode = TimelineNode { timelineNode() }
        self.timestamp = Timestamp { timestamp() }
        self.data = data
    }
}

public extension TimelinePreviewItem {
    init(title: AttributedString,
         icon: Image? = nil,
         timelineNode: TimelineNodeType,
         timestamp: AttributedString? = nil,
         data: TimelinePreviewItemModel)
    {
        self.init(title: { Text(title) }, icon: { icon }, timelineNode: { TimelineNodeView(timelineNode) }, timestamp: { OptionalText(timestamp) }, data: data)
    }
}

public extension TimelinePreviewItem {
    init(_ configuration: TimelinePreviewItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelinePreviewItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.icon = configuration.icon
        self.timelineNode = configuration.timelineNode
        self.timestamp = configuration.timestamp
        self.data = configuration.data
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimelinePreviewItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), icon: .init(self.icon), timelineNode: .init(self.timelineNode), timestamp: .init(self.timestamp), data: self.data)).typeErased
                .transformEnvironment(\.timelinePreviewItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TimelinePreviewItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TimelinePreviewItem(.init(title: .init(self.title), icon: .init(self.icon), timelineNode: .init(self.timelineNode), timestamp: .init(self.timestamp), data: self.data))
            .shouldApplyDefaultStyle(false)
            .timelinePreviewItemStyle(TimelinePreviewItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
