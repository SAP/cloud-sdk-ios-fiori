// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ActivityItems` provides a view that shows several items with action.
///
/// ## Usage
/// ```swift
/// ActivityItems(actionItems: [
///     .init(type: .phone, didSelectActivityItem: {
///         print("click phone")
///     })
/// ])
/// ```
public struct ActivityItems {
    let actionItems: any View

    @Environment(\.activityItemsStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ActionItemsBuilder actionItems: () -> any View = { EmptyView() }) {
        self.actionItems = ActionItems(actionItems: actionItems)
    }
}

public extension ActivityItems {
    init(actionItems: [ActivityItemDataType] = []) {
        self.init(actionItems: { ActionItemsListStack(actionItems) })
    }
}

public extension ActivityItems {
    init(_ configuration: ActivityItemsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ActivityItemsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.actionItems = configuration.actionItems
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ActivityItems: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(actionItems: .init(self.actionItems))).typeErased
                .transformEnvironment(\.activityItemsStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ActivityItems {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ActivityItems(.init(actionItems: .init(self.actionItems)))
            .shouldApplyDefaultStyle(false)
            .activityItemsStyle(ActivityItemsFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
