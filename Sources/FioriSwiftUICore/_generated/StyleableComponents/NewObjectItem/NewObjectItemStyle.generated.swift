// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol NewObjectItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: NewObjectItemConfiguration) -> Body
}
    
struct AnyNewObjectItemStyle: NewObjectItemStyle {
    let content: (NewObjectItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (NewObjectItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}
    
public struct NewObjectItemConfiguration {
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
    public let tags: Tags
    public let newAction: NewAction

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
    public typealias Tags = ConfigurationViewWrapper
    public typealias NewAction = ConfigurationViewWrapper
}
    
public struct NewObjectItemFioriStyle: NewObjectItemStyle {
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .titleStyle(TitleFioriStyle())
            .subtitleStyle(SubtitleFioriStyle())
            .footnoteStyle(FootnoteFioriStyle())
            .descriptionStyle(DescriptionFioriStyle())
            .statusStyle(StatusFioriStyle())
            .substatusStyle(SubstatusFioriStyle())
            .detailImageStyle(DetailImageFioriStyle())
            .iconsStyle(IconsFioriStyle())
            .avatarsStyle(AvatarsFioriStyle())
            .footnoteIconsStyle(FootnoteIconsFioriStyle())
            .tagsStyle(TagsFioriStyle())
            .newActionStyle(NewActionFioriStyle())
    }
}
