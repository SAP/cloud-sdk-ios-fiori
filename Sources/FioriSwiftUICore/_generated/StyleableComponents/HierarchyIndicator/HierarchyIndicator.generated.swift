// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `HierarchyIndicator` is a stack view including an icon and the specific title text. It is intended to be used with `HierarchItemView`.
///
/// ### Overview
/// Use HierarchyIndicator to convey an item's relationship or navigability within a hierarchy. It is typically embedded in a HierarchyItemView and, when used inside a HierarchyView, can facilitate forward navigation by returning a child item ID from its onClick action. The indicator can also be used standalone to represent contextual information outside of a hierarchy.
///
/// ## Usage
/// The indicator is typically used with `HierarchyItemView` within a `HierarchyView`to provide context about the item's status within the hierarchy. It can also be employed
/// independently to represent information outside of a structured view. Consumers of this component should initialize the indicator based on their specific use cases,
/// ensuring that it accurately represents the appropriate data and state depending on whether it is used in conjunction with `HierarchyItemView` and `HierarchyView`, or as a standalone component.
///
/// Within a `HierarchyView`, consumers should provide the `onClick` event handler that returns the item's UUID. This ensures that the data can be navigated correctly when the next button in the `HierarchyHeader` is clicked.
/// ```swift
///
/// @State var activeChildItem: String?
/// HierarchyView(
///     dataSource: dataSource,
///     hierarchyItem: { id in
///         hierarchyIndicator: {
///             let childrenCount = dataSource.numberOfChildren(for: id)
///             HierarchyIndicator(
///                 title: AttributedString(String("\(id)")),
///                 isMultiline: self.isMultiline,
///                 isSelected: activeChildItem == id,
///                 isClickable: childrenCount > 0
///          ){
///             id
///          }
///    },
///    activeChildItem: self.$activeChildItem
/// )
/// ```
///
/// ### See Also
/// HierarchyView, HierarchyItemView.
public struct HierarchyIndicator {
    let title: any View
    let icon: any View
    /// A Boolean value indicating whether the indicator should support multiline content.
    ///
    /// The default value is `true`, meaning that the indicator will display content in multiple lines if necessary.
    let isMultiline: Bool
    /// A Boolean value indicating whether the indicator represents a selected hierarchy item.
    ///
    /// The default value is `false`, meaning the indicator will not display the item as selected by default.
    let isSelected: Bool
    /// A Boolean value indicating whether the hierarchy indicator is interactive (clickable).
    ///
    /// The default value is `true`, but the indicator may be set to non-clickable if the item does not have any child items in the `HierarchyView`.
    let isClickable: Bool
    /// The action that will be performed be performed when the clickable indicator is clicked.
    ///
    /// Returning a non-empty hierarchy child item ID is mandatory when the indicator is used with `HierarchyItemView` in the `HierarchyView`;
    /// the selected item will be set as the current item displayed in the hierarchy header view.
    ///
    /// However, if it is used with `HierarchyItemView` independently, without `HierarchyView`, the returned ID is not mandatory.
    /// Consumers may provide event handling according to their specific use case.
    let onClick: (() -> String?)?

    @Environment(\.hierarchyIndicatorStyle) var style

    var componentIdentifier: String = HierarchyIndicator.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder icon: () -> any View = { EmptyView() },
                isMultiline: Bool = true,
                isSelected: Bool = false,
                isClickable: Bool = true,
                onClick: (() -> String?)? = nil,
                componentIdentifier: String? = HierarchyIndicator.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.isMultiline = isMultiline
        self.isSelected = isSelected
        self.isClickable = isClickable
        self.onClick = onClick
        self.componentIdentifier = componentIdentifier ?? HierarchyIndicator.identifier
    }
}

public extension HierarchyIndicator {
    static let identifier = "fiori_hierarchyindicator_component"
}

public extension HierarchyIndicator {
    init(title: AttributedString,
         icon: Image? = nil,
         isMultiline: Bool = true,
         isSelected: Bool = false,
         isClickable: Bool = true,
         onClick: (() -> String?)? = nil)
    {
        self.init(title: { Text(title) }, icon: { icon }, isMultiline: isMultiline, isSelected: isSelected, isClickable: isClickable, onClick: onClick)
    }
}

public extension HierarchyIndicator {
    init(_ configuration: HierarchyIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: HierarchyIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.icon = configuration.icon
        self.isMultiline = configuration.isMultiline
        self.isSelected = configuration.isSelected
        self.isClickable = configuration.isClickable
        self.onClick = configuration.onClick
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension HierarchyIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), icon: .init(self.icon), isMultiline: self.isMultiline, isSelected: self.isSelected, isClickable: self.isClickable, onClick: self.onClick)).typeErased
                .transformEnvironment(\.hierarchyIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension HierarchyIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        HierarchyIndicator(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), icon: .init(self.icon), isMultiline: self.isMultiline, isSelected: self.isSelected, isClickable: self.isClickable, onClick: self.onClick))
            .shouldApplyDefaultStyle(false)
            .hierarchyIndicatorStyle(HierarchyIndicatorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
