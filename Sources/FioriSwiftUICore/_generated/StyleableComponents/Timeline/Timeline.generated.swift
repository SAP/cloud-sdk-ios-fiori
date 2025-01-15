// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `Timeline` is a selectable view intended for timelines that require open, inProgress and complete status that displays timeline details.
///  It uses a vertical line and `timelineNode` as a separator. To the left of the vertical line is the timeline timestamp stack view that contains `timestamp` and `secondaryTimestamp`. To the right of the vertical line is the main stack view that contains  title view and attribute view. Title view contains `title`, ‘subtitle’, ‘status’, ‘substatus’, below the title view is an attribute view with ‘ attribute’ and ‘subAttribute’. There is a divider line as separator under main stack.
///
///  ## Notes
/// ### Separator between Timeline Items in the List
/// All list styles in SwiftUI include separators by default. That is why there is a separator between two timeline items in the list. To get rid of the separator, set ‘listRowSeparator’ modifier to hidden.
///
/// ## Usage
/// ```swift
/// Timeline(timestamp: "06/21/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .complete, title: "Complete(Disabled)", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr", isPast: true)
/// Timeline(timestamp: "06/21/24", secondaryTimestamp: .text("Sunny"), timelineNode: .open, title: "Open", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr")
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

    var componentIdentifier: String = Timeline.identifier

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
                isPresent: Bool = false,
                componentIdentifier: String? = Timeline.identifier)
    {
        self.timestamp = Timestamp(timestamp: timestamp, componentIdentifier: componentIdentifier)
        self.secondaryTimestamp = SecondaryTimestamp(secondaryTimestamp: secondaryTimestamp, componentIdentifier: componentIdentifier)
        self.timelineNode = TimelineNode(timelineNode: timelineNode, componentIdentifier: componentIdentifier)
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.attribute = Attribute(attribute: attribute, componentIdentifier: componentIdentifier)
        self.status = Status(status: status, componentIdentifier: componentIdentifier)
        self.substatus = Substatus(substatus: substatus, componentIdentifier: componentIdentifier)
        self.subAttribute = SubAttribute(subAttribute: subAttribute, componentIdentifier: componentIdentifier)
        self.isPast = isPast
        self.isPresent = isPresent
        self.componentIdentifier = componentIdentifier ?? Timeline.identifier
    }
}

public extension Timeline {
    static let identifier = "fiori_timeline_component"
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
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Timeline: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, timestamp: .init(self.timestamp), secondaryTimestamp: .init(self.secondaryTimestamp), timelineNode: .init(self.timelineNode), icon: .init(self.icon), title: .init(self.title), subtitle: .init(self.subtitle), attribute: .init(self.attribute), status: .init(self.status), substatus: .init(self.substatus), subAttribute: .init(self.subAttribute), isPast: self.isPast, isPresent: self.isPresent)).typeErased
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
        Timeline(.init(componentIdentifier: self.componentIdentifier, timestamp: .init(self.timestamp), secondaryTimestamp: .init(self.secondaryTimestamp), timelineNode: .init(self.timelineNode), icon: .init(self.icon), title: .init(self.title), subtitle: .init(self.subtitle), attribute: .init(self.attribute), status: .init(self.status), substatus: .init(self.substatus), subAttribute: .init(self.subAttribute), isPast: self.isPast, isPresent: self.isPresent))
            .shouldApplyDefaultStyle(false)
            .timelineStyle(TimelineFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
