// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
