// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// SideBarListItem: SwiftUI View
///
/// A SwiftUI View that displays a row with title, icon, subtitle and accessory icon in `SideBar` SwiftUI View
///
///
public struct SideBarListItem {
    let icon: any View
    let filledIcon: any View
    let title: any View
    let subtitle: any View
    let accessoryIcon: any View
    @Binding var isOn: Bool
    /// The data of the side bar item
    let data: SideBarItemModel
    /// Whether the item is selected or not
    @Binding var isSelected: Bool

    @Environment(\.sideBarListItemStyle) var style

    var componentIdentifier: String = SideBarListItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder filledIcon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder accessoryIcon: () -> any View = { EmptyView() },
                isOn: Binding<Bool>,
                data: SideBarItemModel,
                isSelected: Binding<Bool>,
                componentIdentifier: String? = SideBarListItem.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.filledIcon = FilledIcon(filledIcon: filledIcon, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.accessoryIcon = AccessoryIcon(accessoryIcon: accessoryIcon, componentIdentifier: componentIdentifier)
        self._isOn = isOn
        self.data = data
        self._isSelected = isSelected
        self.componentIdentifier = componentIdentifier ?? SideBarListItem.identifier
    }
}

public extension SideBarListItem {
    static let identifier = "fiori_sidebarlistitem_component"
}

public extension SideBarListItem {
    init(icon: Image? = nil,
         filledIcon: Image? = nil,
         title: AttributedString,
         subtitle: AttributedString? = nil,
         accessoryIcon: Image? = nil,
         isOn: Binding<Bool>,
         data: SideBarItemModel,
         isSelected: Binding<Bool>,
         componentIdentifier: String? = SideBarListItem.identifier)
    {
        self.init(icon: { icon }, filledIcon: { filledIcon }, title: { Text(title) }, subtitle: { OptionalText(subtitle) }, accessoryIcon: { accessoryIcon }, isOn: isOn, data: data, isSelected: isSelected, componentIdentifier: componentIdentifier)
    }
}

public extension SideBarListItem {
    init(_ configuration: SideBarListItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SideBarListItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.filledIcon = configuration.filledIcon
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.accessoryIcon = configuration.accessoryIcon
        self._isOn = configuration.$isOn
        self.data = configuration.data
        self._isSelected = configuration.$isSelected
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SideBarListItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), filledIcon: .init(self.filledIcon), title: .init(self.title), subtitle: .init(self.subtitle), accessoryIcon: .init(self.accessoryIcon), isOn: self.$isOn, data: self.data, isSelected: self.$isSelected)).typeErased
                .transformEnvironment(\.sideBarListItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SideBarListItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SideBarListItem(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), filledIcon: .init(self.filledIcon), title: .init(self.title), subtitle: .init(self.subtitle), accessoryIcon: .init(self.accessoryIcon), isOn: self.$isOn, data: self.data, isSelected: self.$isSelected))
            .shouldApplyDefaultStyle(false)
            .sideBarListItemStyle(SideBarListItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
