// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

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

// MARK: CardBodyStyle

struct ResolvedCardBodyStyle<Style: CardBodyStyle>: View {
    let style: Style
    let configuration: CardBodyConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension CardBodyStyle {
    func resolve(configuration: CardBodyConfiguration) -> some View {
        ResolvedCardBodyStyle(style: self, configuration: configuration)
    }
}

// MARK: CardStyle

struct ResolvedCardStyle<Style: CardStyle>: View {
    let style: Style
    let configuration: CardConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension CardStyle {
    func resolve(configuration: CardConfiguration) -> some View {
        ResolvedCardStyle(style: self, configuration: configuration)
    }
}

// MARK: CardExtHeaderStyle

struct ResolvedCardExtHeaderStyle<Style: CardExtHeaderStyle>: View {
    let style: Style
    let configuration: CardExtHeaderConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension CardExtHeaderStyle {
    func resolve(configuration: CardExtHeaderConfiguration) -> some View {
        ResolvedCardExtHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: CardFooterStyle

struct ResolvedCardFooterStyle<Style: CardFooterStyle>: View {
    let style: Style
    let configuration: CardFooterConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension CardFooterStyle {
    func resolve(configuration: CardFooterConfiguration) -> some View {
        ResolvedCardFooterStyle(style: self, configuration: configuration)
    }
}

// MARK: CardHeaderStyle

struct ResolvedCardHeaderStyle<Style: CardHeaderStyle>: View {
    let style: Style
    let configuration: CardHeaderConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension CardHeaderStyle {
    func resolve(configuration: CardHeaderConfiguration) -> some View {
        ResolvedCardHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: CardMainHeaderStyle

struct ResolvedCardMainHeaderStyle<Style: CardMainHeaderStyle>: View {
    let style: Style
    let configuration: CardMainHeaderConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension CardMainHeaderStyle {
    func resolve(configuration: CardMainHeaderConfiguration) -> some View {
        ResolvedCardMainHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: CardMediaStyle

struct ResolvedCardMediaStyle<Style: CardMediaStyle>: View {
    let style: Style
    let configuration: CardMediaConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension CardMediaStyle {
    func resolve(configuration: CardMediaConfiguration) -> some View {
        ResolvedCardMediaStyle(style: self, configuration: configuration)
    }
}

// MARK: CounterStyle

struct ResolvedCounterStyle<Style: CounterStyle>: View {
    let style: Style
    let configuration: CounterConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension CounterStyle {
    func resolve(configuration: CounterConfiguration) -> some View {
        ResolvedCounterStyle(style: self, configuration: configuration)
    }
}

// MARK: DemoViewStyle

struct ResolvedDemoViewStyle<Style: DemoViewStyle>: View {
    let style: Style
    let configuration: DemoViewConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension DemoViewStyle {
    func resolve(configuration: DemoViewConfiguration) -> some View {
        ResolvedDemoViewStyle(style: self, configuration: configuration)
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

// MARK: IconStyle

struct ResolvedIconStyle<Style: IconStyle>: View {
    let style: Style
    let configuration: IconConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension IconStyle {
    func resolve(configuration: IconConfiguration) -> some View {
        ResolvedIconStyle(style: self, configuration: configuration)
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

// MARK: InformationViewStyle

struct ResolvedInformationViewStyle<Style: InformationViewStyle>: View {
    let style: Style
    let configuration: InformationViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension InformationViewStyle {
    func resolve(configuration: InformationViewConfiguration) -> some View {
        ResolvedInformationViewStyle(style: self, configuration: configuration)
    }
}

// MARK: MediaImageStyle

struct ResolvedMediaImageStyle<Style: MediaImageStyle>: View {
    let style: Style
    let configuration: MediaImageConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension MediaImageStyle {
    func resolve(configuration: MediaImageConfiguration) -> some View {
        ResolvedMediaImageStyle(style: self, configuration: configuration)
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

// MARK: Row1Style

struct ResolvedRow1Style<Style: Row1Style>: View {
    let style: Style
    let configuration: Row1Configuration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension Row1Style {
    func resolve(configuration: Row1Configuration) -> some View {
        ResolvedRow1Style(style: self, configuration: configuration)
    }
}

// MARK: Row2Style

struct ResolvedRow2Style<Style: Row2Style>: View {
    let style: Style
    let configuration: Row2Configuration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension Row2Style {
    func resolve(configuration: Row2Configuration) -> some View {
        ResolvedRow2Style(style: self, configuration: configuration)
    }
}

// MARK: Row3Style

struct ResolvedRow3Style<Style: Row3Style>: View {
    let style: Style
    let configuration: Row3Configuration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension Row3Style {
    func resolve(configuration: Row3Configuration) -> some View {
        ResolvedRow3Style(style: self, configuration: configuration)
    }
}

// MARK: SecondaryActionStyle

struct ResolvedSecondaryActionStyle<Style: SecondaryActionStyle>: View {
    let style: Style
    let configuration: SecondaryActionConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension SecondaryActionStyle {
    func resolve(configuration: SecondaryActionConfiguration) -> some View {
        ResolvedSecondaryActionStyle(style: self, configuration: configuration)
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

// MARK: SwitchStyle

struct ResolvedSwitchStyle<Style: SwitchStyle>: View {
    let style: Style
    let configuration: SwitchConfiguration
    var body: some View {
        style.makeBody(configuration)
    }
}

extension SwitchStyle {
    func resolve(configuration: SwitchConfiguration) -> some View {
        ResolvedSwitchStyle(style: self, configuration: configuration)
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
