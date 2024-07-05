// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `TimelineMarker` is a non-selectable view intended for timelineMarkers that require beforeStart, start, beforeEnd and end status that displays timelineMarker details.
/// It uses a vertical line and `nodeImage` as a separator. To the left of the vertical line is the timeline timestamp stack view that contains `timestampLabel` and `secondaryTimestampLabel` or ‘secondaryTimestampImage’. To the right of the vertical line is the main stack view that contains  `title`. There is a divider line as separator under main stack.
///
/// ## Notes
/// ### Separator between TimelineMarker Items in the List
/// SwiftUI all list styles include separators by default. Because of this default setting, there can be a divider line or a separator in between each item on the timelineMarker in the list. This is not an issue in timelineMarker. To get rid of the separator, set ‘listRowSeparator’ modifier to hidden.
///
/// ## Usage
/// ```swift
/// TimelineMarker(timestampLabel: "06/20/24", secondaryTimestampImage: { Image(systemName: "sun.max")}(), nodeImage: .predefine(TimelineNodeStatus.beforeStart), showUpperVerticalLine: false, title: "Before Start", isPast: true)
/// TimelineMarker(timestampLabel: "06/04/24", secondaryTimestampLabel: "Sunny", nodeImage: .custom(Image(systemName: "s.circle")), title: "Project Start", isPresent: true)
/// ```
public struct TimelineMarker {
    let timestampLabel: any View
    let secondaryTimestampLabel: any View
    let secondaryTimestampImage: any View
    let upperVerticalLine: any View
    let nodeImage: any View
    let lowerVerticalLine: any View
    /// check if show upper vertical line
    let showUpperVerticalLine: Bool
    /// check if show lower vertical line
    let showLowerVerticalLine: Bool
    let title: any View
    /// check if event is past
    let isPast: Bool
    /// check if event is present
    let isPresent: Bool

    @Environment(\.timelineMarkerStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder timestampLabel: () -> any View = { EmptyView() },
                @ViewBuilder secondaryTimestampLabel: () -> any View = { EmptyView() },
                @ViewBuilder secondaryTimestampImage: () -> any View = { EmptyView() },
                @ViewBuilder upperVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
                @ViewBuilder nodeImage: () -> any View,
                @ViewBuilder lowerVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
                showUpperVerticalLine: Bool = true,
                showLowerVerticalLine: Bool = true,
                @ViewBuilder title: () -> any View,
                isPast: Bool = false,
                isPresent: Bool = false)
    {
        self.timestampLabel = TimestampLabel { timestampLabel() }
        self.secondaryTimestampLabel = SecondaryTimestampLabel { secondaryTimestampLabel() }
        self.secondaryTimestampImage = SecondaryTimestampImage { secondaryTimestampImage() }
        self.upperVerticalLine = UpperVerticalLine { upperVerticalLine() }
        self.nodeImage = NodeImage { nodeImage() }
        self.lowerVerticalLine = LowerVerticalLine { lowerVerticalLine() }
        self.showUpperVerticalLine = showUpperVerticalLine
        self.showLowerVerticalLine = showLowerVerticalLine
        self.title = Title { title() }
        self.isPast = isPast
        self.isPresent = isPresent
    }
}

public extension TimelineMarker {
    init(timestampLabel: AttributedString? = nil,
         secondaryTimestampLabel: AttributedString? = nil,
         secondaryTimestampImage: Image? = nil,
         @ViewBuilder upperVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
         nodeImage: TimelineNodeType,
         @ViewBuilder lowerVerticalLine: () -> any View = { Rectangle().fill(Color.clear) },
         showUpperVerticalLine: Bool = true,
         showLowerVerticalLine: Bool = true,
         title: AttributedString,
         isPast: Bool = false,
         isPresent: Bool = false)
    {
        self.init(timestampLabel: { OptionalText(timestampLabel) }, secondaryTimestampLabel: { OptionalText(secondaryTimestampLabel) }, secondaryTimestampImage: { secondaryTimestampImage }, upperVerticalLine: upperVerticalLine, nodeImage: { TimelineNodeView(nodeImage) }, lowerVerticalLine: lowerVerticalLine, showUpperVerticalLine: showUpperVerticalLine, showLowerVerticalLine: showLowerVerticalLine, title: { Text(title) }, isPast: isPast, isPresent: isPresent)
    }
}

public extension TimelineMarker {
    init(_ configuration: TimelineMarkerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineMarkerConfiguration, shouldApplyDefaultStyle: Bool) {
        self.timestampLabel = configuration.timestampLabel
        self.secondaryTimestampLabel = configuration.secondaryTimestampLabel
        self.secondaryTimestampImage = configuration.secondaryTimestampImage
        self.upperVerticalLine = configuration.upperVerticalLine
        self.nodeImage = configuration.nodeImage
        self.lowerVerticalLine = configuration.lowerVerticalLine
        self.showUpperVerticalLine = configuration.showUpperVerticalLine
        self.showLowerVerticalLine = configuration.showLowerVerticalLine
        self.title = configuration.title
        self.isPast = configuration.isPast
        self.isPresent = configuration.isPresent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TimelineMarker: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(timestampLabel: .init(self.timestampLabel), secondaryTimestampLabel: .init(self.secondaryTimestampLabel), secondaryTimestampImage: .init(self.secondaryTimestampImage), upperVerticalLine: .init(self.upperVerticalLine), nodeImage: .init(self.nodeImage), lowerVerticalLine: .init(self.lowerVerticalLine), showUpperVerticalLine: self.showUpperVerticalLine, showLowerVerticalLine: self.showLowerVerticalLine, title: .init(self.title), isPast: self.isPast, isPresent: self.isPresent)).typeErased
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
        TimelineMarker(.init(timestampLabel: .init(self.timestampLabel), secondaryTimestampLabel: .init(self.secondaryTimestampLabel), secondaryTimestampImage: .init(self.secondaryTimestampImage), upperVerticalLine: .init(self.upperVerticalLine), nodeImage: .init(self.nodeImage), lowerVerticalLine: .init(self.lowerVerticalLine), showUpperVerticalLine: self.showUpperVerticalLine, showLowerVerticalLine: self.showLowerVerticalLine, title: .init(self.title), isPast: self.isPast, isPresent: self.isPresent))
            .shouldApplyDefaultStyle(false)
            .timelineMarkerStyle(TimelineMarkerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
