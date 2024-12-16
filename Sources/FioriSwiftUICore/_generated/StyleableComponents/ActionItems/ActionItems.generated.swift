// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ActionItems` provides a view that show serval items with action
///
/// ## Usage
/// ```swift
/// ActionItems(actionItems: [.init(type: .phone), .init(type: .email), .init(type: .message), .init(type: .videoCall), .init(type: .detail)]) { dataType in
///     print("\(dataType)")
/// }
/// ```
public struct ActionItems {
    let actionItems: [ActivityItemDataType]?
    let didSelectActivityItem: ((ActivityItemDataType) -> Void)?

    @Environment(\.actionItemsStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(actionItems: [ActivityItemDataType]? = nil,
                didSelectActivityItem: ((ActivityItemDataType) -> Void)? = nil)
    {
        self.actionItems = actionItems
        self.didSelectActivityItem = didSelectActivityItem
    }
}

public extension ActionItems {
    init(_ configuration: ActionItemsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ActionItemsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.actionItems = configuration.actionItems
        self.didSelectActivityItem = configuration.didSelectActivityItem
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ActionItems: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(actionItems: self.actionItems, didSelectActivityItem: self.didSelectActivityItem)).typeErased
                .transformEnvironment(\.actionItemsStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ActionItems {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ActionItems(.init(actionItems: self.actionItems, didSelectActivityItem: self.didSelectActivityItem))
            .shouldApplyDefaultStyle(false)
            .actionItemsStyle(.fiori)
            .typeErased
    }
}
