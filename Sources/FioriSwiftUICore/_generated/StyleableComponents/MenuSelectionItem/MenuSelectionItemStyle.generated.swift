// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol MenuSelectionItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: MenuSelectionItemConfiguration) -> Body
}

struct AnyMenuSelectionItemStyle: MenuSelectionItemStyle {
    let content: (MenuSelectionItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (MenuSelectionItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct MenuSelectionItemConfiguration {
    public var componentIdentifier: String = "fiori_menuselectionitem_component"
    public let icon: Icon
    public let title: Title
    public let action: (() -> Void)?

    public typealias Icon = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
}

public extension MenuSelectionItemConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var iconIdentifier: String {
        self.componentIdentifier + "_icon"
    }

    var titleIdentifier: String {
        self.componentIdentifier + "_title"
    }
}

extension MenuSelectionItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct MenuSelectionItemFioriStyle: MenuSelectionItemStyle {
    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        MenuSelectionItem(configuration)
            .iconStyle(IconFioriStyle(menuSelectionItemConfiguration: configuration))
            .titleStyle(TitleFioriStyle(menuSelectionItemConfiguration: configuration))
    }
}

public struct MenuSelectionItemNSSStyle: MenuSelectionItemStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        MenuSelectionItem(configuration)
            .iconStyle(IconNSSStyle(menuSelectionItemConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .titleStyle(TitleNSSStyle(menuSelectionItemConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .menuSelectionItemStyle(ContentNSSStyle(menuSelectionItemConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
