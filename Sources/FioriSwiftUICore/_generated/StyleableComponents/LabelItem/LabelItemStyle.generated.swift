// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol LabelItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: LabelItemConfiguration) -> Body
}

struct AnyLabelItemStyle: LabelItemStyle {
    let content: (LabelItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (LabelItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: LabelItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct LabelItemConfiguration {
    public let contentIdentifier = "FioriLabelItem_content"
    public let iconIdentifier = "FioriLabelItem_icon"
    public let titleIdentifier = "FioriLabelItem_title"

    public var componentIdentifier: String = "fiori_labelitem_component"
    public let icon: Icon
    public let title: Title
    public let alignment: HorizontalAlignment?

    public typealias Icon = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
}

extension LabelItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct LabelItemFioriStyle: LabelItemStyle {
    public func makeBody(_ configuration: LabelItemConfiguration) -> some View {
        LabelItem(configuration)
            .iconStyle(IconFioriStyle(labelItemConfiguration: configuration))
            .titleStyle(TitleFioriStyle(labelItemConfiguration: configuration))
    }
}

public struct LabelItemNSSStyle: LabelItemStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: LabelItemConfiguration) -> some View {
        LabelItem(configuration)
            .iconStyle(IconNSSStyle(labelItemConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .titleStyle(TitleNSSStyle(labelItemConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .labelItemStyle(ContentNSSStyle(labelItemConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
