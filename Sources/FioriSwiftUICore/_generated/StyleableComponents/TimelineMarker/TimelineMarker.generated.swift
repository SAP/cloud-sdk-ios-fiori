// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `TimelineMarker` is a non-selectable view intended for timelineMarkers that require beforeStart, start, beforeEnd and end status that displays timelineMarker details.
/// It uses a vertical line and `timelineNode` as a separator. To the left of the vertical line is the timeline timestamp stack view that contains `timestamp` and `secondaryTimestamp`. To the right of the vertical line is the main stack view that contains  `title`. There is a divider line as separator under main stack.
///
/// ## Notes
/// ### Separator between TimelineMarker Items in the List
/// All list styles in SwiftUI include separators by default. This is why there is a separator between two timelineMarker items in the list. To get rid of the separator, set ‘listRowSeparator’ modifier to hidden.
///
/// ## Usage
/// ```swift
/// TimelineMarker(timestamp: "06/20/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .beforeStart, title: "Before Start", isPast: true, showUpperVerticalLine: false)
/// TimelineMarker(timestamp: "06/20/24", secondaryTimestamp: .text("Sunny"), timelineNode: .beforeEnd, title: "Before End", isPresent: true)
/// ```
public struct TimelineMarker {
    let timestamp: any View
    let secondaryTimestamp: any View
    let timelineNode: any View
    let icon: any View
    let title: any View
    /// check if event is past
    let isPast: Bool
    /// check if event is present
    let isPresent: Bool
    /// Show upper vertical line or not. Default is to show.
    let showUpperVerticalLine: Bool
    /// Show lower vertical line or not. Default is to show.
    let showLowerVerticalLine: Bool

    @Environment(\.timelineMarkerStyle) var style

    var componentIdentifier: String = TimelineMarker.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder timestamp: () -> any View = { EmptyView() },
                @ViewBuilder secondaryTimestamp: () -> any View = { EmptyView() },
                @ViewBuilder timelineNode: () -> any View,
                @ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                isPast: Bool = false,
                isPresent: Bool = false,
                showUpperVerticalLine: Bool = true,
                showLowerVerticalLine: Bool = true,
                componentIdentifier: String? = TimelineMarker.identifier)
    {
        self.timestamp = Timestamp(timestamp: timestamp, componentIdentifier: componentIdentifier)
        self.secondaryTimestamp = SecondaryTimestamp(secondaryTimestamp: secondaryTimestamp, componentIdentifier: componentIdentifier)
        self.timelineNode = TimelineNode(timelineNode: timelineNode, componentIdentifier: componentIdentifier)
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.isPast = isPast
        self.isPresent = isPresent
        self.showUpperVerticalLine = showUpperVerticalLine
        self.showLowerVerticalLine = showLowerVerticalLine
        self.componentIdentifier = componentIdentifier ?? TimelineMarker.identifier
    }
}

public extension TimelineMarker {
    static let identifier = "fiori_timelinemarker_component"
}

public extension TimelineMarker {
    init(timestamp: AttributedString? = nil,
         secondaryTimestamp: TextOrIcon? = nil,
         timelineNode: TimelineNodeType,
         icon: Image? = nil,
         title: AttributedString,
         isPast: Bool = false,
         isPresent: Bool = false,
         showUpperVerticalLine: Bool = true,
         showLowerVerticalLine: Bool = true)
    {
        self.init(timestamp: { OptionalText(timestamp) }, secondaryTimestamp: { TextOrIconView(secondaryTimestamp) }, timelineNode: { TimelineNodeView(timelineNode) }, icon: { icon }, title: { Text(title) }, isPast: isPast, isPresent: isPresent, showUpperVerticalLine: showUpperVerticalLine, showLowerVerticalLine: showLowerVerticalLine)
    }
}

public extension TimelineMarker {
    init(_ configuration: TimelineMarkerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineMarkerConfiguration, shouldApplyDefaultStyle: Bool) {
        self.timestamp = configuration.timestamp
        self.secondaryTimestamp = configuration.secondaryTimestamp
        self.timelineNode = configuration.timelineNode
        self.icon = configuration.icon
        self.title = configuration.title
        self.isPast = configuration.isPast
        self.isPresent = configuration.isPresent
        self.showUpperVerticalLine = configuration.showUpperVerticalLine
        self.showLowerVerticalLine = configuration.showLowerVerticalLine
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TimelineMarker: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, timestamp: .init(self.timestamp), secondaryTimestamp: .init(self.secondaryTimestamp), timelineNode: .init(self.timelineNode), icon: .init(self.icon), title: .init(self.title), isPast: self.isPast, isPresent: self.isPresent, showUpperVerticalLine: self.showUpperVerticalLine, showLowerVerticalLine: self.showLowerVerticalLine)).typeErased
                .transformEnvironment(\.timelineMarkerStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TimelineMarker {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TimelineMarker(.init(componentIdentifier: self.componentIdentifier, timestamp: .init(self.timestamp), secondaryTimestamp: .init(self.secondaryTimestamp), timelineNode: .init(self.timelineNode), icon: .init(self.icon), title: .init(self.title), isPast: self.isPast, isPresent: self.isPresent, showUpperVerticalLine: self.showUpperVerticalLine, showLowerVerticalLine: self.showLowerVerticalLine))
            .shouldApplyDefaultStyle(false)
            .timelineMarkerStyle(TimelineMarkerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
