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
    /// The node is in future or not. Default is not in future.
    let isFuture: Bool
    /// Timeline node type
    let nodeType: TimelineNodeType

    @Environment(\.timelinePreviewItemStyle) var style

    var componentIdentifier: String = TimelinePreviewItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder timelineNode: () -> any View,
                @ViewBuilder timestamp: () -> any View = { EmptyView() },
                isFuture: Bool = false,
                nodeType: TimelineNodeType,
                componentIdentifier: String? = TimelinePreviewItem.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.timelineNode = TimelineNode(timelineNode: timelineNode, componentIdentifier: componentIdentifier)
        self.timestamp = Timestamp(timestamp: timestamp, componentIdentifier: componentIdentifier)
        self.isFuture = isFuture
        self.nodeType = nodeType
        self.componentIdentifier = componentIdentifier ?? TimelinePreviewItem.identifier
    }
}

public extension TimelinePreviewItem {
    static let identifier = "fiori_timelinepreviewitem_component"
}

public extension TimelinePreviewItem {
    init(title: AttributedString,
         icon: Image? = nil,
         timelineNode: TimelineNodeType,
         timestamp: AttributedString? = nil,
         isFuture: Bool = false,
         nodeType: TimelineNodeType)
    {
        self.init(title: { Text(title) }, icon: { icon }, timelineNode: { TimelineNodeView(timelineNode) }, timestamp: { OptionalText(timestamp) }, isFuture: isFuture, nodeType: nodeType)
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
        self.isFuture = configuration.isFuture
        self.nodeType = configuration.nodeType
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TimelinePreviewItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), icon: .init(self.icon), timelineNode: .init(self.timelineNode), timestamp: .init(self.timestamp), isFuture: self.isFuture, nodeType: self.nodeType)).typeErased
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
        TimelinePreviewItem(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), icon: .init(self.icon), timelineNode: .init(self.timelineNode), timestamp: .init(self.timestamp), isFuture: self.isFuture, nodeType: self.nodeType))
            .shouldApplyDefaultStyle(false)
            .timelinePreviewItemStyle(TimelinePreviewItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
