// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `Timeline` is a selectable view intended for timelines that require open, inProgress and complete status that displays timeline details.
///  It uses a vertical line and `nodeImage` as a separator. To the left of the vertical line is the timeline timestamp stack view that contains `timestampLabel` and `secondaryTimestampLabel` or ‘secondaryTimestampImage’. To the right of the vertical line is the main stack view that contains  title view and attribute view. Title view contains `title`, ‘subtitle’, ‘status’, ‘substatus’, below the title view is an attribute view with ‘ attribute’ and ‘subAttribute’. There is a divider line as separator under main stack.
///
///  ## Notes
/// ### Separator between Timeline Items in the List
/// All list styles in SwiftUI include separators by default. That is why there is a separator between two timeline items in the list. To get rid of the separator, set ‘listRowSeparator’ modifier to hidden.
///
/// ## Usage
/// ```swift
/// Timeline(timestampLabel: "06/21/24", secondaryTimestampImage: { Image(systemName: "sun.max")}(), nodeImage: .inProgress(), title: "Inprogress Event", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr", isPresent: true)
/// Timeline(timestampLabel: "06/23/24", secondaryTimestampLabel: "Sunny", nodeImage: .open(Image(systemName: "p.circle")), title: "Title", subtitle: "subTitle", attribute: "attr", status: .text("Pending"), substatus: .icon(Image(systemName: "p.circle")), subAttribute: "subAttr")
/// ```
public struct Timeline {
    let timestamp: any View
    let secondaryTimestamp: any View
    let timelineNode: any View
    let icon: any View
    let title: any View
    let subtitle: any View
    let attribute: any View
    let status: any View
    let substatus: any View
    let subAttribute: any View
    /// check if event is past
    let isPast: Bool
    /// check if event is present
    let isPresent: Bool

    @Environment(\.timelineStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder timestamp: () -> any View = { EmptyView() },
                @ViewBuilder secondaryTimestamp: () -> any View = { EmptyView() },
                @ViewBuilder timelineNode: () -> any View,
                @ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder attribute: () -> any View = { EmptyView() },
                @ViewBuilder status: () -> any View = { EmptyView() },
                @ViewBuilder substatus: () -> any View = { EmptyView() },
                @ViewBuilder subAttribute: () -> any View = { EmptyView() },
                isPast: Bool = false,
                isPresent: Bool = false)
    {
        self.timestamp = Timestamp { timestamp() }
        self.secondaryTimestamp = SecondaryTimestamp { secondaryTimestamp() }
        self.timelineNode = TimelineNode { timelineNode() }
        self.icon = Icon { icon() }
        self.title = Title { title() }
        self.subtitle = Subtitle { subtitle() }
        self.attribute = Attribute { attribute() }
        self.status = Status { status() }
        self.substatus = Substatus { substatus() }
        self.subAttribute = SubAttribute { subAttribute() }
        self.isPast = isPast
        self.isPresent = isPresent
    }
}

public extension Timeline {
    init(timestamp: AttributedString? = nil,
         secondaryTimestamp: TextOrIcon? = nil,
         timelineNode: TimelineNodeType,
         icon: Image? = nil,
         title: AttributedString,
         subtitle: AttributedString? = nil,
         attribute: AttributedString? = nil,
         status: TextOrIcon? = nil,
         substatus: TextOrIcon? = nil,
         subAttribute: AttributedString? = nil,
         isPast: Bool = false,
         isPresent: Bool = false)
    {
        self.init(timestamp: { OptionalText(timestamp) }, secondaryTimestamp: { TextOrIconView(secondaryTimestamp) }, timelineNode: { TimelineNodeView(timelineNode) }, icon: { icon }, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, attribute: { OptionalText(attribute) }, status: { TextOrIconView(status) }, substatus: { TextOrIconView(substatus) }, subAttribute: { OptionalText(subAttribute) }, isPast: isPast, isPresent: isPresent)
    }
}

public extension Timeline {
    init(_ configuration: TimelineConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineConfiguration, shouldApplyDefaultStyle: Bool) {
        self.timestamp = configuration.timestamp
        self.secondaryTimestamp = configuration.secondaryTimestamp
        self.timelineNode = configuration.timelineNode
        self.icon = configuration.icon
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.attribute = configuration.attribute
        self.status = configuration.status
        self.substatus = configuration.substatus
        self.subAttribute = configuration.subAttribute
        self.isPast = configuration.isPast
        self.isPresent = configuration.isPresent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Timeline: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(timestamp: .init(self.timestamp), secondaryTimestamp: .init(self.secondaryTimestamp), timelineNode: .init(self.timelineNode), icon: .init(self.icon), title: .init(self.title), subtitle: .init(self.subtitle), attribute: .init(self.attribute), status: .init(self.status), substatus: .init(self.substatus), subAttribute: .init(self.subAttribute), isPast: self.isPast, isPresent: self.isPresent)).typeErased
                .transformEnvironment(\.timelineStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Timeline {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Timeline(.init(timestamp: .init(self.timestamp), secondaryTimestamp: .init(self.secondaryTimestamp), timelineNode: .init(self.timelineNode), icon: .init(self.icon), title: .init(self.title), subtitle: .init(self.subtitle), attribute: .init(self.attribute), status: .init(self.status), substatus: .init(self.substatus), subAttribute: .init(self.subAttribute), isPast: self.isPast, isPresent: self.isPresent))
            .shouldApplyDefaultStyle(false)
            .timelineStyle(TimelineFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
