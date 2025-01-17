// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ActivityItems` provides a view that shows several items with action.
///
/// ## Usage
/// ```swift
/// ActivityItems(activityItems: [
///    .init(type: .phone, didSelectActivityItem: {
///        print("click phone")
///    })
/// ])
/// ```
public struct ActivityItems {
    let activityItems: any View

    @Environment(\.activityItemsStyle) var style

    var componentIdentifier: String = ActivityItems.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ActivityItemsBuilder activityItems: () -> any View = { EmptyView() },
                componentIdentifier: String? = ActivityItems.identifier)
    {
        self.activityItems = activityItems()
        self.componentIdentifier = componentIdentifier ?? ActivityItems.identifier
    }
}

public extension ActivityItems {
    static let identifier = "fiori_activityitems_component"
}

public extension ActivityItems {
    init(activityItems: [ActivityItemDataType] = [],
         componentIdentifier: String? = ActivityItems.identifier)
    {
        self.init(activityItems: { ActivityItemsListStack(activityItems) }, componentIdentifier: componentIdentifier)
    }
}

public extension ActivityItems {
    init(_ configuration: ActivityItemsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ActivityItemsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.activityItems = configuration.activityItems
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ActivityItems: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, activityItems: .init(self.activityItems))).typeErased
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
        ActivityItems(.init(componentIdentifier: self.componentIdentifier, activityItems: .init(self.activityItems)))
            .shouldApplyDefaultStyle(false)
            .activityItemsStyle(.fiori)
            .typeErased
    }
}
