// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// The `FilterFeedbackBarItem` is a SwiftUI component for items in FilterFeedbackBar.
///
/// ## Usage
///
/// The `icon` is leading image in the button.
/// The `title` is button title.
/// The `accessoryIcon` is trailing image.
/// The `isSelected` is the state of the button whether the item has selected value. The style of the button will change.
///
///  ```swift
///  FilterFeedbackBarItem(
///     icon: Image(systemName: "clock"),
///     title: "Item Title",
///     accessoryIcon: Image(systemName: "chevron.down"),
///     isSelected: self.item.isChecked)
///  ```
///
public struct FilterFeedbackBarItem {
    let icon: any View
    let title: any View
    let accessoryIcon: any View
    /// Whether the item is selected or not
    let isSelected: Bool
    /// The custom spacing between icon and title.
    let spacing: CGFloat

    @Environment(\.filterFeedbackBarItemStyle) var style

    var componentIdentifier: String = FilterFeedbackBarItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder accessoryIcon: () -> any View = { EmptyView() },
                isSelected: Bool,
                spacing: CGFloat = 6,
                componentIdentifier: String? = FilterFeedbackBarItem.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.accessoryIcon = AccessoryIcon(accessoryIcon: accessoryIcon, componentIdentifier: componentIdentifier)
        self.isSelected = isSelected
        self.spacing = spacing
        self.componentIdentifier = componentIdentifier ?? FilterFeedbackBarItem.identifier
    }
}

public extension FilterFeedbackBarItem {
    static let identifier = "fiori_filterfeedbackbaritem_component"
}

public extension FilterFeedbackBarItem {
    init(icon: Image? = nil,
         title: AttributedString,
         accessoryIcon: Image? = nil,
         isSelected: Bool,
         spacing: CGFloat = 6)
    {
        self.init(icon: { icon }, title: { Text(title) }, accessoryIcon: { accessoryIcon }, isSelected: isSelected, spacing: spacing)
    }
}

public extension FilterFeedbackBarItem {
    init(_ configuration: FilterFeedbackBarItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FilterFeedbackBarItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.title = configuration.title
        self.accessoryIcon = configuration.accessoryIcon
        self.isSelected = configuration.isSelected
        self.spacing = configuration.spacing
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension FilterFeedbackBarItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), accessoryIcon: .init(self.accessoryIcon), isSelected: self.isSelected, spacing: self.spacing)).typeErased
                .transformEnvironment(\.filterFeedbackBarItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FilterFeedbackBarItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FilterFeedbackBarItem(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), accessoryIcon: .init(self.accessoryIcon), isSelected: self.isSelected, spacing: self.spacing))
            .shouldApplyDefaultStyle(false)
            .filterFeedbackBarItemStyle(FilterFeedbackBarItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
