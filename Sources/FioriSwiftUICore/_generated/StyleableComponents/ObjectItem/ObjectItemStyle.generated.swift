// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol ObjectItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ObjectItemConfiguration) -> Body
}

struct AnyObjectItemStyle: ObjectItemStyle {
    let content: (ObjectItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ObjectItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ObjectItemConfiguration {
    public var componentIdentifier: String = "fiori_objectitem_component"
    public let title: Title
    public let subtitle: Subtitle
    public let footnote: Footnote
    public let description: Description
    public let status: Status
    public let substatus: Substatus
    public let detailImage: DetailImage
    public let icons: Icons
    public let avatars: Avatars
    public let footnoteIcons: FootnoteIcons
    public let footnoteIconsText: FootnoteIconsText
    public let tags: Tags
    public let action: Action
    public let objectItemButton: ObjectItemButton

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Footnote = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Status = ConfigurationViewWrapper
    public typealias Substatus = ConfigurationViewWrapper
    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Icons = ConfigurationViewWrapper
    public typealias Avatars = ConfigurationViewWrapper
    public typealias FootnoteIcons = ConfigurationViewWrapper
    public typealias FootnoteIconsText = ConfigurationViewWrapper
    public typealias Tags = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
    public typealias ObjectItemButton = ConfigurationViewWrapper
}

public extension ObjectItemConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var titleIdentifier: String {
        self.componentIdentifier + "_title"
    }

    var subtitleIdentifier: String {
        self.componentIdentifier + "_subtitle"
    }

    var footnoteIdentifier: String {
        self.componentIdentifier + "_footnote"
    }

    var descriptionIdentifier: String {
        self.componentIdentifier + "_description"
    }

    var statusIdentifier: String {
        self.componentIdentifier + "_status"
    }

    var substatusIdentifier: String {
        self.componentIdentifier + "_substatus"
    }

    var detailImageIdentifier: String {
        self.componentIdentifier + "_detailImage"
    }

    var iconsIdentifier: String {
        self.componentIdentifier + "_icons"
    }

    var avatarsIdentifier: String {
        self.componentIdentifier + "_avatars"
    }

    var footnoteIconsIdentifier: String {
        self.componentIdentifier + "_footnoteIcons"
    }

    var footnoteIconsTextIdentifier: String {
        self.componentIdentifier + "_footnoteIconsText"
    }

    var tagsIdentifier: String {
        self.componentIdentifier + "_tags"
    }

    var actionIdentifier: String {
        self.componentIdentifier + "_action"
    }
}

extension ObjectItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ObjectItemFioriStyle: ObjectItemStyle {
    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .titleStyle(TitleFioriStyle(objectItemConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(objectItemConfiguration: configuration))
            .footnoteStyle(FootnoteFioriStyle(objectItemConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(objectItemConfiguration: configuration))
            .statusStyle(StatusFioriStyle(objectItemConfiguration: configuration))
            .substatusStyle(SubstatusFioriStyle(objectItemConfiguration: configuration))
            .detailImageStyle(DetailImageFioriStyle(objectItemConfiguration: configuration))
            .iconsStyle(IconsFioriStyle(objectItemConfiguration: configuration))
            .avatarsStyle(AvatarsFioriStyle(objectItemConfiguration: configuration))
            .footnoteIconsStyle(FootnoteIconsFioriStyle(objectItemConfiguration: configuration))
            .footnoteIconsTextStyle(FootnoteIconsTextFioriStyle(objectItemConfiguration: configuration))
            .tagsStyle(TagsFioriStyle(objectItemConfiguration: configuration))
            .actionStyle(ActionFioriStyle(objectItemConfiguration: configuration))
    }
}

public struct ObjectItemNSSStyle: ObjectItemStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .titleStyle(TitleNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .footnoteStyle(FootnoteNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.footnoteIdentifier)))
            .descriptionStyle(DescriptionNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.descriptionIdentifier)))
            .statusStyle(StatusNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.statusIdentifier)))
            .substatusStyle(SubstatusNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.substatusIdentifier)))
            .detailImageStyle(DetailImageNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.detailImageIdentifier)))
            .iconsStyle(IconsNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.iconsIdentifier)))
            .avatarsStyle(AvatarsNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.avatarsIdentifier)))
            .footnoteIconsStyle(FootnoteIconsNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.footnoteIconsIdentifier)))
            .footnoteIconsTextStyle(FootnoteIconsTextNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.footnoteIconsTextIdentifier)))
            .tagsStyle(TagsNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.tagsIdentifier)))
            .actionStyle(ActionNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.actionIdentifier)))
            .objectItemStyle(ContentNSSStyle(objectItemConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
