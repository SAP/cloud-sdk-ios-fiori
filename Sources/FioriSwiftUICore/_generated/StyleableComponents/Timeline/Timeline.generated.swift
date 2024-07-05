// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `Timeline` is a selectable view intended for timelines that require open, inProgress and complete status that displays timeline details.
///  It uses a vertical line and `nodeImage` as a separator. To the left of the vertical line is the timeline timestamp stack view that contains `timestampLabel` and `secondaryTimestampLabel` or ‘secondaryTimestampImage’. To the right of the vertical line is the main stack view that contains  title view and attribute view. Title view contains `title`, ‘subtitle’, ‘status’, ‘substatus’, below the title view is an attribute view with ‘ attribute’ and ‘subAttribute’. There is a divider line as separator under main stack.
///
///  ## Notes
/// ### Separator between Timeline Items in the List
/// SwiftUI all list styles include separators by default. Because of this default setting, there can be a divider line or a separator in between each item on the timeline in the list. This is not an issue in timeline. To get rid of the separator, set ‘listRowSeparator’ modifier to hidden.
///
/// ## Usage
/// ```swift
/// Timeline(timestampLabel: "06/21/24", secondaryTimestampImage: { Image(systemName: "sun.max")}(), nodeImage: .predefine(TimelineNodeStatus.inProgress), title: "Inprogress Event", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr", isPresent: true)
/// Timeline(timestampLabel: "06/23/24", secondaryTimestampLabel: "Sunny", nodeImage: .custom(Image(systemName: "timer")), title: "Title", subtitle: "subTitle", attribute: "attr", status: .text("Pending"), substatus: .icon(Image(systemName: "p.circle")), subAttribute: "subAttr")
/// ```
public struct Timeline {
    let timestampLabel: any View
    let secondaryTimestampLabel: any View
    let secondaryTimestampImage: any View
    let upperVerticalLine: any View
    let nodeImage: any View
    let lowerVerticalLine: any View
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

    public init(@ViewBuilder timestampLabel: () -> any View = { EmptyView() },
                @ViewBuilder secondaryTimestampLabel: () -> any View = { EmptyView() },
                @ViewBuilder secondaryTimestampImage: () -> any View = { EmptyView() },
                @ViewBuilder upperVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
                @ViewBuilder nodeImage: () -> any View,
                @ViewBuilder lowerVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder attribute: () -> any View = { EmptyView() },
                @ViewBuilder status: () -> any View = { EmptyView() },
                @ViewBuilder substatus: () -> any View = { EmptyView() },
                @ViewBuilder subAttribute: () -> any View = { EmptyView() },
                isPast: Bool = false,
                isPresent: Bool = false)
    {
        self.timestampLabel = TimestampLabel { timestampLabel() }
        self.secondaryTimestampLabel = SecondaryTimestampLabel { secondaryTimestampLabel() }
        self.secondaryTimestampImage = SecondaryTimestampImage { secondaryTimestampImage() }
        self.upperVerticalLine = UpperVerticalLine { upperVerticalLine() }
        self.nodeImage = NodeImage { nodeImage() }
        self.lowerVerticalLine = LowerVerticalLine { lowerVerticalLine() }
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
    init(timestampLabel: AttributedString? = nil,
         secondaryTimestampLabel: AttributedString? = nil,
         secondaryTimestampImage: Image? = nil,
         @ViewBuilder upperVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
         nodeImage: TimelineNodeType,
         @ViewBuilder lowerVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
         title: AttributedString,
         subtitle: AttributedString? = nil,
         attribute: AttributedString? = nil,
         status: TextOrIcon? = nil,
         substatus: TextOrIcon? = nil,
         subAttribute: AttributedString? = nil,
         isPast: Bool = false,
         isPresent: Bool = false)
    {
        self.init(timestampLabel: { OptionalText(timestampLabel) }, secondaryTimestampLabel: { OptionalText(secondaryTimestampLabel) }, secondaryTimestampImage: { secondaryTimestampImage }, upperVerticalLine: upperVerticalLine, nodeImage: { TimelineNodeView(nodeImage) }, lowerVerticalLine: lowerVerticalLine, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, attribute: { OptionalText(attribute) }, status: { TextOrIconView(status) }, substatus: { TextOrIconView(substatus) }, subAttribute: { OptionalText(subAttribute) }, isPast: isPast, isPresent: isPresent)
    }
}

public extension Timeline {
    init(_ configuration: TimelineConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineConfiguration, shouldApplyDefaultStyle: Bool) {
        self.timestampLabel = configuration.timestampLabel
        self.secondaryTimestampLabel = configuration.secondaryTimestampLabel
        self.secondaryTimestampImage = configuration.secondaryTimestampImage
        self.upperVerticalLine = configuration.upperVerticalLine
        self.nodeImage = configuration.nodeImage
        self.lowerVerticalLine = configuration.lowerVerticalLine
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
            self.style.resolve(configuration: .init(timestampLabel: .init(self.timestampLabel), secondaryTimestampLabel: .init(self.secondaryTimestampLabel), secondaryTimestampImage: .init(self.secondaryTimestampImage), upperVerticalLine: .init(self.upperVerticalLine), nodeImage: .init(self.nodeImage), lowerVerticalLine: .init(self.lowerVerticalLine), title: .init(self.title), subtitle: .init(self.subtitle), attribute: .init(self.attribute), status: .init(self.status), substatus: .init(self.substatus), subAttribute: .init(self.subAttribute), isPast: self.isPast, isPresent: self.isPresent)).typeErased
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
        Timeline(.init(timestampLabel: .init(self.timestampLabel), secondaryTimestampLabel: .init(self.secondaryTimestampLabel), secondaryTimestampImage: .init(self.secondaryTimestampImage), upperVerticalLine: .init(self.upperVerticalLine), nodeImage: .init(self.nodeImage), lowerVerticalLine: .init(self.lowerVerticalLine), title: .init(self.title), subtitle: .init(self.subtitle), attribute: .init(self.attribute), status: .init(self.status), substatus: .init(self.substatus), subAttribute: .init(self.subAttribute), isPast: self.isPast, isPresent: self.isPresent))
            .shouldApplyDefaultStyle(false)
            .timelineStyle(TimelineFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
