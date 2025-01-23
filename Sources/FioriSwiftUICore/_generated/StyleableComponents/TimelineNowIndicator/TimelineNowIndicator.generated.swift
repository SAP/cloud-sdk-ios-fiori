// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `TimelineNowIndicator` is used to present now indicator in a Timeline view.
/// It uses a node view and  horizontal line to present now indicator.
///
/// ## Notes
/// ### Minimum list row height between Timeline Items in the List
/// Since the default size of node image on the TimelineNowIndicator is 7 pixels, in order to display TimelineNowIndicator correctly in the List, set the minimum height for all row in a List using the .environment(\.defaultMinListRowHeight, value) modifier on the List, the value should be less than or equal to 7.
public struct TimelineNowIndicator {
    let nowIndicatorNode: any View

    @Environment(\.timelineNowIndicatorStyle) var style

    var componentIdentifier: String = TimelineNowIndicator.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder nowIndicatorNode: () -> any View = { Image(systemName: "circle.fill") },
                componentIdentifier: String? = TimelineNowIndicator.identifier)
    {
        self.nowIndicatorNode = NowIndicatorNode(nowIndicatorNode: nowIndicatorNode, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? TimelineNowIndicator.identifier
    }
}

public extension TimelineNowIndicator {
    static let identifier = "fiori_timelinenowindicator_component"
}

public extension TimelineNowIndicator {
    init(_ configuration: TimelineNowIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TimelineNowIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.nowIndicatorNode = configuration.nowIndicatorNode
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension TimelineNowIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, nowIndicatorNode: .init(self.nowIndicatorNode))).typeErased
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
        TimelineNowIndicator(.init(componentIdentifier: self.componentIdentifier, nowIndicatorNode: .init(self.nowIndicatorNode)))
            .shouldApplyDefaultStyle(false)
            .timelineNowIndicatorStyle(TimelineNowIndicatorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
