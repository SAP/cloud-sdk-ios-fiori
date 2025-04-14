// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    public let showsDescriptionInCompact: Bool

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
