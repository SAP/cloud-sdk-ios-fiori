// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: ActionTitleStyle

struct ResolvedActionTitleStyle<Style: ActionTitleStyle>: View {
    let style: Style
    let configuration: ActionTitleConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension ActionTitleStyle {
    func resolve(configuration: ActionTitleConfiguration) -> some View {
        ResolvedActionTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: AvatarsStyle

struct ResolvedAvatarsStyle<Style: AvatarsStyle>: View {
    let style: Style
    let configuration: AvatarsConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension AvatarsStyle {
    func resolve(configuration: AvatarsConfiguration) -> some View {
        ResolvedAvatarsStyle(style: self, configuration: configuration)
    }
}

// MARK: DescriptionStyle

struct ResolvedDescriptionStyle<Style: DescriptionStyle>: View {
    let style: Style
    let configuration: DescriptionConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension DescriptionStyle {
    func resolve(configuration: DescriptionConfiguration) -> some View {
        ResolvedDescriptionStyle(style: self, configuration: configuration)
    }
}

// MARK: DetailImageStyle

struct ResolvedDetailImageStyle<Style: DetailImageStyle>: View {
    let style: Style
    let configuration: DetailImageConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension DetailImageStyle {
    func resolve(configuration: DetailImageConfiguration) -> some View {
        ResolvedDetailImageStyle(style: self, configuration: configuration)
    }
}

// MARK: FootnoteStyle

struct ResolvedFootnoteStyle<Style: FootnoteStyle>: View {
    let style: Style
    let configuration: FootnoteConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension FootnoteStyle {
    func resolve(configuration: FootnoteConfiguration) -> some View {
        ResolvedFootnoteStyle(style: self, configuration: configuration)
    }
}

// MARK: FootnoteIconsStyle

struct ResolvedFootnoteIconsStyle<Style: FootnoteIconsStyle>: View {
    let style: Style
    let configuration: FootnoteIconsConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension FootnoteIconsStyle {
    func resolve(configuration: FootnoteIconsConfiguration) -> some View {
        ResolvedFootnoteIconsStyle(style: self, configuration: configuration)
    }
}

// MARK: IconsStyle

struct ResolvedIconsStyle<Style: IconsStyle>: View {
    let style: Style
    let configuration: IconsConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension IconsStyle {
    func resolve(configuration: IconsConfiguration) -> some View {
        ResolvedIconsStyle(style: self, configuration: configuration)
    }
}

// MARK: NewActionStyle

struct ResolvedNewActionStyle<Style: NewActionStyle>: View {
    let style: Style
    let configuration: NewActionConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension NewActionStyle {
    func resolve(configuration: NewActionConfiguration) -> some View {
        ResolvedNewActionStyle(style: self, configuration: configuration)
    }
}

// MARK: NewObjectItemStyle

struct ResolvedNewObjectItemStyle<Style: NewObjectItemStyle>: View {
    let style: Style
    let configuration: NewObjectItemConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension NewObjectItemStyle {
    func resolve(configuration: NewObjectItemConfiguration) -> some View {
        ResolvedNewObjectItemStyle(style: self, configuration: configuration)
    }
}

// MARK: StatusStyle

struct ResolvedStatusStyle<Style: StatusStyle>: View {
    let style: Style
    let configuration: StatusConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension StatusStyle {
    func resolve(configuration: StatusConfiguration) -> some View {
        ResolvedStatusStyle(style: self, configuration: configuration)
    }
}

// MARK: SubstatusStyle

struct ResolvedSubstatusStyle<Style: SubstatusStyle>: View {
    let style: Style
    let configuration: SubstatusConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension SubstatusStyle {
    func resolve(configuration: SubstatusConfiguration) -> some View {
        ResolvedSubstatusStyle(style: self, configuration: configuration)
    }
}

// MARK: SubtitleStyle

struct ResolvedSubtitleStyle<Style: SubtitleStyle>: View {
    let style: Style
    let configuration: SubtitleConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension SubtitleStyle {
    func resolve(configuration: SubtitleConfiguration) -> some View {
        ResolvedSubtitleStyle(style: self, configuration: configuration)
    }
}

// MARK: TagsStyle

struct ResolvedTagsStyle<Style: TagsStyle>: View {
    let style: Style
    let configuration: TagsConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension TagsStyle {
    func resolve(configuration: TagsConfiguration) -> some View {
        ResolvedTagsStyle(style: self, configuration: configuration)
    }
}

// MARK: TitleStyle

struct ResolvedTitleStyle<Style: TitleStyle>: View {
    let style: Style
    let configuration: TitleConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension TitleStyle {
    func resolve(configuration: TitleConfiguration) -> some View {
        ResolvedTitleStyle(style: self, configuration: configuration)
    }
}
