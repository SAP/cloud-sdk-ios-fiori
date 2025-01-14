// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SideBarStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SideBarConfiguration) -> Body
}

struct AnySideBarStyle: SideBarStyle {
    let content: (SideBarConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SideBarConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SideBarConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SideBarConfiguration {
    public let contentIdentifier = "FioriSideBar_content"

    public var componentIdentifier: String = "fiori_sidebar_component"
    @Binding public var isEditing: Bool
    @Binding public var queryString: String?
    @Binding public var data: [SideBarItemModel]
    @Binding public var selection: SideBarItemModel?
    public let title: AttributedString?
    public let footer: Footer
    public let editButton: EditButton
    public let destination: (SideBarItemModel) -> any View
    public let item: (Binding<SideBarItemModel>) -> any View
    public let onDataChange: (([SideBarItemModel]) -> Void)?
    public let isUsedInSplitView: Bool

    public typealias Footer = ConfigurationViewWrapper
    public typealias EditButton = ConfigurationViewWrapper
}

extension SideBarConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct SideBarFioriStyle: SideBarStyle {
    public func makeBody(_ configuration: SideBarConfiguration) -> some View {
        SideBar(configuration)
    }
}

public struct SideBarNSSStyle: SideBarStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: SideBarConfiguration) -> some View {
        SideBar(configuration)
             
            .sideBarStyle(ContentNSSStyle(sideBarConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
