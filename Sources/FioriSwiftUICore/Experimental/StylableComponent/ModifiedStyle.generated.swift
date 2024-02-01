// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ModifiedStyle<Style, Modifier: ViewModifier>: DynamicProperty {
    var style: Style
    var modifier: Modifier
}

// MARK: AvatarsStyle

extension ModifiedStyle: AvatarsStyle where Style: AvatarsStyle {
    public func makeBody(_ configuration: AvatarsConfiguration) -> some View {
        Avatars(configuration)
            .avatarsStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct AvatarsStyleModifier<Style: AvatarsStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.avatarsStyle(self.style)
    }
}

public extension AvatarsStyle {
    func modifier(_ modifier: some ViewModifier) -> some AvatarsStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some AvatarsStyle) -> some AvatarsStyle {
        style.modifier(AvatarsStyleModifier(style: self))
    }
}

// MARK: DescriptionStyle

extension ModifiedStyle: DescriptionStyle where Style: DescriptionStyle {
    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        Description(configuration)
            .descriptionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct DescriptionStyleModifier<Style: DescriptionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.descriptionStyle(self.style)
    }
}

public extension DescriptionStyle {
    func modifier(_ modifier: some ViewModifier) -> some DescriptionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some DescriptionStyle) -> some DescriptionStyle {
        style.modifier(DescriptionStyleModifier(style: self))
    }
}

// MARK: DetailImageStyle

extension ModifiedStyle: DetailImageStyle where Style: DetailImageStyle {
    public func makeBody(_ configuration: DetailImageConfiguration) -> some View {
        DetailImage(configuration)
            .detailImageStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct DetailImageStyleModifier<Style: DetailImageStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.detailImageStyle(self.style)
    }
}

public extension DetailImageStyle {
    func modifier(_ modifier: some ViewModifier) -> some DetailImageStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some DetailImageStyle) -> some DetailImageStyle {
        style.modifier(DetailImageStyleModifier(style: self))
    }
}

// MARK: FootnoteStyle

extension ModifiedStyle: FootnoteStyle where Style: FootnoteStyle {
    public func makeBody(_ configuration: FootnoteConfiguration) -> some View {
        Footnote(configuration)
            .footnoteStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct FootnoteStyleModifier<Style: FootnoteStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.footnoteStyle(self.style)
    }
}

public extension FootnoteStyle {
    func modifier(_ modifier: some ViewModifier) -> some FootnoteStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some FootnoteStyle) -> some FootnoteStyle {
        style.modifier(FootnoteStyleModifier(style: self))
    }
}

// MARK: FootnoteIconsStyle

extension ModifiedStyle: FootnoteIconsStyle where Style: FootnoteIconsStyle {
    public func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
        FootnoteIcons(configuration)
            .footnoteIconsStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct FootnoteIconsStyleModifier<Style: FootnoteIconsStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.footnoteIconsStyle(self.style)
    }
}

public extension FootnoteIconsStyle {
    func modifier(_ modifier: some ViewModifier) -> some FootnoteIconsStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some FootnoteIconsStyle) -> some FootnoteIconsStyle {
        style.modifier(FootnoteIconsStyleModifier(style: self))
    }
}

// MARK: IconsStyle

extension ModifiedStyle: IconsStyle where Style: IconsStyle {
    public func makeBody(_ configuration: IconsConfiguration) -> some View {
        Icons(configuration)
            .iconsStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct IconsStyleModifier<Style: IconsStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.iconsStyle(self.style)
    }
}

public extension IconsStyle {
    func modifier(_ modifier: some ViewModifier) -> some IconsStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some IconsStyle) -> some IconsStyle {
        style.modifier(IconsStyleModifier(style: self))
    }
}

// MARK: NewActionStyle

extension ModifiedStyle: NewActionStyle where Style: NewActionStyle {
    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        NewAction(configuration)
            .newActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct NewActionStyleModifier<Style: NewActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.newActionStyle(self.style)
    }
}

public extension NewActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some NewActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some NewActionStyle) -> some NewActionStyle {
        style.modifier(NewActionStyleModifier(style: self))
    }
}

// MARK: NewObjectItemStyle

extension ModifiedStyle: NewObjectItemStyle where Style: NewObjectItemStyle {
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .newObjectItemStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct NewObjectItemStyleModifier<Style: NewObjectItemStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.newObjectItemStyle(self.style)
    }
}

public extension NewObjectItemStyle {
    func modifier(_ modifier: some ViewModifier) -> some NewObjectItemStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some NewObjectItemStyle) -> some NewObjectItemStyle {
        style.modifier(NewObjectItemStyleModifier(style: self))
    }
}

// MARK: StatusStyle

extension ModifiedStyle: StatusStyle where Style: StatusStyle {
    public func makeBody(_ configuration: StatusConfiguration) -> some View {
        Status(configuration)
            .statusStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct StatusStyleModifier<Style: StatusStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.statusStyle(self.style)
    }
}

public extension StatusStyle {
    func modifier(_ modifier: some ViewModifier) -> some StatusStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some StatusStyle) -> some StatusStyle {
        style.modifier(StatusStyleModifier(style: self))
    }
}

// MARK: SubstatusStyle

extension ModifiedStyle: SubstatusStyle where Style: SubstatusStyle {
    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
        Substatus(configuration)
            .substatusStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SubstatusStyleModifier<Style: SubstatusStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.substatusStyle(self.style)
    }
}

public extension SubstatusStyle {
    func modifier(_ modifier: some ViewModifier) -> some SubstatusStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SubstatusStyle) -> some SubstatusStyle {
        style.modifier(SubstatusStyleModifier(style: self))
    }
}

// MARK: SubtitleStyle

extension ModifiedStyle: SubtitleStyle where Style: SubtitleStyle {
    public func makeBody(_ configuration: SubtitleConfiguration) -> some View {
        Subtitle(configuration)
            .subtitleStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SubtitleStyleModifier<Style: SubtitleStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.subtitleStyle(self.style)
    }
}

public extension SubtitleStyle {
    func modifier(_ modifier: some ViewModifier) -> some SubtitleStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SubtitleStyle) -> some SubtitleStyle {
        style.modifier(SubtitleStyleModifier(style: self))
    }
}

// MARK: TagsStyle

extension ModifiedStyle: TagsStyle where Style: TagsStyle {
    public func makeBody(_ configuration: TagsConfiguration) -> some View {
        Tags(configuration)
            .tagsStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TagsStyleModifier<Style: TagsStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.tagsStyle(self.style)
    }
}

public extension TagsStyle {
    func modifier(_ modifier: some ViewModifier) -> some TagsStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TagsStyle) -> some TagsStyle {
        style.modifier(TagsStyleModifier(style: self))
    }
}

// MARK: TitleStyle

extension ModifiedStyle: TitleStyle where Style: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        Title(configuration)
            .titleStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TitleStyleModifier<Style: TitleStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.titleStyle(self.style)
    }
}

public extension TitleStyle {
    func modifier(_ modifier: some ViewModifier) -> some TitleStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TitleStyle) -> some TitleStyle {
        style.modifier(TitleStyleModifier(style: self))
    }
}
