// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ActivityItems` provides a view that shows several items with action.
///
/// ## Usage
/// ```swift
/// ActivityItems(activityItems: [.init(type: .phone), .init(type: .email), .init(type: .message), .init(type: .videoCall), .init(type: .detail)]) { dataType in
///     print("\(dataType)")
/// }
/// ```
public struct ActivityItems {
    let activityItems: any View

    @Environment(\.activityItemsStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ActivityItemsBuilder activityItems: () -> any View = { EmptyView() }) {
        self.activityItems = activityItems()
    }
}

public extension ActivityItems {
    init(activityItems: [ActivityItemDataType] = []) {
        self.init(activityItems: { ActivityItemsListStack(activityItems) })
    }
}

public extension ActivityItems {
    init(_ configuration: ActivityItemsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ActivityItemsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.activityItems = configuration.activityItems
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ActivityItems: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(activityItems: .init(self.activityItems))).typeErased
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
        ActivityItems(.init(activityItems: .init(self.activityItems)))
            .shouldApplyDefaultStyle(false)
            .activityItemsStyle(.fiori)
            .typeErased
    }
}
