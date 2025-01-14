// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SideBarListItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SideBarListItemConfiguration) -> Body
}

struct AnySideBarListItemStyle: SideBarListItemStyle {
    let content: (SideBarListItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SideBarListItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SideBarListItemConfiguration {
    public let contentIdentifier = "FioriSideBarListItem_content"
    public let iconIdentifier = "FioriSideBarListItem_icon"
    public let filledIconIdentifier = "FioriSideBarListItem_filledIcon"
    public let titleIdentifier = "FioriSideBarListItem_title"
    public let subtitleIdentifier = "FioriSideBarListItem_subtitle"
    public let accessoryIconIdentifier = "FioriSideBarListItem_accessoryIcon"
    public let switchIdentifier = "FioriSideBarListItem_switch"

    public var componentIdentifier: String = "fiori_sidebarlistitem_component"
    public let icon: Icon
    public let filledIcon: FilledIcon
    public let title: Title
    public let subtitle: Subtitle
    public let accessoryIcon: AccessoryIcon
    @Binding public var isOn: Bool
    public let data: SideBarItemModel
    @Binding public var isSelected: Bool

    public typealias Icon = ConfigurationViewWrapper
    public typealias FilledIcon = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias AccessoryIcon = ConfigurationViewWrapper
}

extension SideBarListItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct SideBarListItemFioriStyle: SideBarListItemStyle {
    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .iconStyle(IconFioriStyle(sideBarListItemConfiguration: configuration))
            .filledIconStyle(FilledIconFioriStyle(sideBarListItemConfiguration: configuration))
            .titleStyle(TitleFioriStyle(sideBarListItemConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(sideBarListItemConfiguration: configuration))
            .accessoryIconStyle(AccessoryIconFioriStyle(sideBarListItemConfiguration: configuration))
            .switchStyle(SwitchFioriStyle(sideBarListItemConfiguration: configuration))
    }
}

public struct SideBarListItemNSSStyle: SideBarListItemStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .iconStyle(IconNSSStyle(sideBarListItemConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .filledIconStyle(FilledIconNSSStyle(sideBarListItemConfiguration: configuration, nssData: self.data.value(configuration.filledIconIdentifier)))
            .titleStyle(TitleNSSStyle(sideBarListItemConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(sideBarListItemConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .accessoryIconStyle(AccessoryIconNSSStyle(sideBarListItemConfiguration: configuration, nssData: self.data.value(configuration.accessoryIconIdentifier)))
            .switchStyle(SwitchNSSStyle(sideBarListItemConfiguration: configuration, nssData: self.data.value(configuration.switchIdentifier)))
            .sideBarListItemStyle(ContentNSSStyle(sideBarListItemConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
