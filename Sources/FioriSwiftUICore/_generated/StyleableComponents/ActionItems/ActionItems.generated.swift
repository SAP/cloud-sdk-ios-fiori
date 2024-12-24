// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ActionItems` provides a view that shows several items with action.
///
/// ## Usage
/// ```swift
/// ActionItems(actionItems: [.init(type: .phone), .init(type: .email), .init(type: .message), .init(type: .videoCall), .init(type: .detail)]) { dataType in
///     print("\(dataType)")
/// }
/// ```
public struct ActionItems {
    let actionItems: any View

    @Environment(\.actionItemsStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ActionItemsBuilder actionItems: () -> any View = { EmptyView() }) {
        self.actionItems = actionItems()
    }
}

public extension ActionItems {
    init(actionItems: [ActivityItemDataType] = []) {
        self.init(actionItems: { ActionItemsListStack(actionItems) })
    }
}

public extension ActionItems {
    init(_ configuration: ActionItemsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ActionItemsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.actionItems = configuration.actionItems
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ActionItems: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(actionItems: .init(self.actionItems))).typeErased
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
        ActionItems(.init(actionItems: .init(self.actionItems)))
            .shouldApplyDefaultStyle(false)
            .actionItemsStyle(.fiori)
            .typeErased
    }
}
