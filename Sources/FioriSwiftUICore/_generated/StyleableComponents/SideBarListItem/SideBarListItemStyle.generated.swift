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

public extension SideBarListItemConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var iconIdentifier: String {
        self.componentIdentifier + "_icon"
    }

    var filledIconIdentifier: String {
        self.componentIdentifier + "_filledIcon"
    }

    var titleIdentifier: String {
        self.componentIdentifier + "_title"
    }

    var subtitleIdentifier: String {
        self.componentIdentifier + "_subtitle"
    }

    var accessoryIconIdentifier: String {
        self.componentIdentifier + "_accessoryIcon"
    }

    var switchIdentifier: String {
        self.componentIdentifier + "_switch"
    }
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
