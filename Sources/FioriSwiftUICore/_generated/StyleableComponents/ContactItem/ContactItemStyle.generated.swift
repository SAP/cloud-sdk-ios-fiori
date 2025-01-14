// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol ContactItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ContactItemConfiguration) -> Body
}

struct AnyContactItemStyle: ContactItemStyle {
    let content: (ContactItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ContactItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ContactItemConfiguration {
    public let contentIdentifier = "FioriContactItem_content"
    public let titleIdentifier = "FioriContactItem_title"
    public let subtitleIdentifier = "FioriContactItem_subtitle"
    public let descriptionIdentifier = "FioriContactItem_description"
    public let detailImageIdentifier = "FioriContactItem_detailImage"
    public let activityItemsIdentifier = "FioriContactItem_activityItems"

    public var componentIdentifier: String = "fiori_contactitem_component"
    public let title: Title
    public let subtitle: Subtitle
    public let description: Description
    public let detailImage: DetailImage
    public let activityItems: ActivityItems

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias DetailImage = ConfigurationViewWrapper
    public typealias ActivityItems = ConfigurationViewWrapper
}

extension ContactItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ContactItemFioriStyle: ContactItemStyle {
    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        ContactItem(configuration)
            .titleStyle(TitleFioriStyle(contactItemConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(contactItemConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(contactItemConfiguration: configuration))
            .detailImageStyle(DetailImageFioriStyle(contactItemConfiguration: configuration))
            .activityItemsStyle(ActivityItemsFioriStyle(contactItemConfiguration: configuration))
    }
}

public struct ContactItemNSSStyle: ContactItemStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        ContactItem(configuration)
            .titleStyle(TitleNSSStyle(contactItemConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(contactItemConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .descriptionStyle(DescriptionNSSStyle(contactItemConfiguration: configuration, nssData: self.data.value(configuration.descriptionIdentifier)))
            .detailImageStyle(DetailImageNSSStyle(contactItemConfiguration: configuration, nssData: self.data.value(configuration.detailImageIdentifier)))
            .activityItemsStyle(ActivityItemsNSSStyle(contactItemConfiguration: configuration, nssData: self.data.value(configuration.activityItemsIdentifier)))
            .contactItemStyle(ContentNSSStyle(contactItemConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
