// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol MenuSelectionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: MenuSelectionConfiguration) -> Body
}

struct AnyMenuSelectionStyle: MenuSelectionStyle {
    let content: (MenuSelectionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (MenuSelectionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct MenuSelectionConfiguration {
    public var componentIdentifier: String = "fiori_menuselection_component"
    public let action: Action
    @Binding public var isExpanded: Bool
    public let items: Items

    public typealias Action = ConfigurationViewWrapper
    public typealias Items = ConfigurationViewWrapper
}

public extension MenuSelectionConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var actionIdentifier: String {
        self.componentIdentifier + "_action"
    }
}

extension MenuSelectionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct MenuSelectionFioriStyle: MenuSelectionStyle {
    public func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
        MenuSelection(configuration)
            .actionStyle(ActionFioriStyle(menuSelectionConfiguration: configuration))
    }
}

public struct MenuSelectionNSSStyle: MenuSelectionStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
        MenuSelection(configuration)
            .actionStyle(ActionNSSStyle(menuSelectionConfiguration: configuration, nssData: self.data.value(configuration.actionIdentifier)))
            .menuSelectionStyle(ContentNSSStyle(menuSelectionConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
