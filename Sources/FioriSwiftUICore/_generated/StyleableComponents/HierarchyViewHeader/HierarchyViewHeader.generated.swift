// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `HierarchyViewHeader` provides navigation controls and summary context at the top of a HierarchyView.
///
/// ### Overview
/// Use `HierarchyViewHeader` to display the title of the currently focused parent item and to offer backward/forward navigation across the hierarchy. The header can be customized to add leading and trailing accessory views. If no custom header is provided, HierarchyView displays a default HierarchyViewHeader.
///
/// ### Key Features
/// - Title content to reflect current hierarchy context.
/// - Leading and trailing accessory slots for custom navigation controls.
/// - Integrates with HierarchyView’s activeChildItem to drive forward navigation.
///
/// ### See Also
/// HierarchyView, HierarchyIndicator, HierarchyItemView.
public struct HierarchyViewHeader {
    let title: any View
    let leadingAccessory: any View
    let trailingAccessory: any View

    @Environment(\.hierarchyViewHeaderStyle) var style

    var componentIdentifier: String = HierarchyViewHeader.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder leadingAccessory: () -> any View = { EmptyView() },
                @ViewBuilder trailingAccessory: () -> any View = { EmptyView() },
                componentIdentifier: String? = HierarchyViewHeader.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.leadingAccessory = LeadingAccessory(leadingAccessory: leadingAccessory, componentIdentifier: componentIdentifier)
        self.trailingAccessory = TrailingAccessory(trailingAccessory: trailingAccessory, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? HierarchyViewHeader.identifier
    }
}

public extension HierarchyViewHeader {
    static let identifier = "fiori_hierarchyviewheader_component"
}

public extension HierarchyViewHeader {
    init(title: AttributedString,
         @ViewBuilder leadingAccessory: () -> any View = { EmptyView() },
         @ViewBuilder trailingAccessory: () -> any View = { EmptyView() })
    {
        self.init(title: { Text(title) }, leadingAccessory: leadingAccessory, trailingAccessory: trailingAccessory)
    }
}

public extension HierarchyViewHeader {
    init(_ configuration: HierarchyViewHeaderConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: HierarchyViewHeaderConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.leadingAccessory = configuration.leadingAccessory
        self.trailingAccessory = configuration.trailingAccessory
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension HierarchyViewHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), leadingAccessory: .init(self.leadingAccessory), trailingAccessory: .init(self.trailingAccessory))).typeErased
                .transformEnvironment(\.hierarchyViewHeaderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension HierarchyViewHeader {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        HierarchyViewHeader(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), leadingAccessory: .init(self.leadingAccessory), trailingAccessory: .init(self.trailingAccessory)))
            .shouldApplyDefaultStyle(false)
            .hierarchyViewHeaderStyle(HierarchyViewHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
