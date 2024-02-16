// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ModifiedStyle<Style, Modifier: ViewModifier>: DynamicProperty {
    var style: Style
    var modifier: Modifier
}

// MARK: ActionStyle

extension ModifiedStyle: ActionStyle where Style: ActionStyle {
    public func makeBody(_ configuration: ActionConfiguration) -> some View {
        Action(configuration)
            .actionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ActionStyleModifier<Style: ActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.actionStyle(self.style)
    }
}

public extension ActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some ActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ActionStyle) -> some ActionStyle {
        style.modifier(ActionStyleModifier(style: self))
    }
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

// MARK: CardBodyStyle

extension ModifiedStyle: CardBodyStyle where Style: CardBodyStyle {
    public func makeBody(_ configuration: CardBodyConfiguration) -> some View {
        CardBody(configuration)
            .cardBodyStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardBodyStyleModifier<Style: CardBodyStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardBodyStyle(self.style)
    }
}

public extension CardBodyStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardBodyStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardBodyStyle) -> some CardBodyStyle {
        style.modifier(CardBodyStyleModifier(style: self))
    }
}

// MARK: CardStyle

extension ModifiedStyle: CardStyle where Style: CardStyle {
    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .cardStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardStyleModifier<Style: CardStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardStyle(self.style)
    }
}

public extension CardStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardStyle) -> some CardStyle {
        style.modifier(CardStyleModifier(style: self))
    }
}

// MARK: CardExtHeaderStyle

extension ModifiedStyle: CardExtHeaderStyle where Style: CardExtHeaderStyle {
    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .cardExtHeaderStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardExtHeaderStyleModifier<Style: CardExtHeaderStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardExtHeaderStyle(self.style)
    }
}

public extension CardExtHeaderStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardExtHeaderStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardExtHeaderStyle) -> some CardExtHeaderStyle {
        style.modifier(CardExtHeaderStyleModifier(style: self))
    }
}

// MARK: CardFooterStyle

extension ModifiedStyle: CardFooterStyle where Style: CardFooterStyle {
    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .cardFooterStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardFooterStyleModifier<Style: CardFooterStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardFooterStyle(self.style)
    }
}

public extension CardFooterStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardFooterStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardFooterStyle) -> some CardFooterStyle {
        style.modifier(CardFooterStyleModifier(style: self))
    }
}

// MARK: CardHeaderStyle

extension ModifiedStyle: CardHeaderStyle where Style: CardHeaderStyle {
    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .cardHeaderStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardHeaderStyleModifier<Style: CardHeaderStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardHeaderStyle(self.style)
    }
}

public extension CardHeaderStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardHeaderStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardHeaderStyle) -> some CardHeaderStyle {
        style.modifier(CardHeaderStyleModifier(style: self))
    }
}

// MARK: CardMainHeaderStyle

extension ModifiedStyle: CardMainHeaderStyle where Style: CardMainHeaderStyle {
    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .cardMainHeaderStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardMainHeaderStyleModifier<Style: CardMainHeaderStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardMainHeaderStyle(self.style)
    }
}

public extension CardMainHeaderStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardMainHeaderStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardMainHeaderStyle) -> some CardMainHeaderStyle {
        style.modifier(CardMainHeaderStyleModifier(style: self))
    }
}

// MARK: CardMediaStyle

extension ModifiedStyle: CardMediaStyle where Style: CardMediaStyle {
    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        CardMedia(configuration)
            .cardMediaStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardMediaStyleModifier<Style: CardMediaStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardMediaStyle(self.style)
    }
}

public extension CardMediaStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardMediaStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardMediaStyle) -> some CardMediaStyle {
        style.modifier(CardMediaStyleModifier(style: self))
    }
}

// MARK: CounterStyle

extension ModifiedStyle: CounterStyle where Style: CounterStyle {
    public func makeBody(_ configuration: CounterConfiguration) -> some View {
        Counter(configuration)
            .counterStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CounterStyleModifier<Style: CounterStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.counterStyle(self.style)
    }
}

public extension CounterStyle {
    func modifier(_ modifier: some ViewModifier) -> some CounterStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CounterStyle) -> some CounterStyle {
        style.modifier(CounterStyleModifier(style: self))
    }
}

// MARK: DemoViewStyle

extension ModifiedStyle: DemoViewStyle where Style: DemoViewStyle {
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .demoViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct DemoViewStyleModifier<Style: DemoViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.demoViewStyle(self.style)
    }
}

public extension DemoViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some DemoViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some DemoViewStyle) -> some DemoViewStyle {
        style.modifier(DemoViewStyleModifier(style: self))
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

// MARK: IconStyle

extension ModifiedStyle: IconStyle where Style: IconStyle {
    public func makeBody(_ configuration: IconConfiguration) -> some View {
        Icon(configuration)
            .iconStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct IconStyleModifier<Style: IconStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.iconStyle(self.style)
    }
}

public extension IconStyle {
    func modifier(_ modifier: some ViewModifier) -> some IconStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some IconStyle) -> some IconStyle {
        style.modifier(IconStyleModifier(style: self))
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

// MARK: InformationViewStyle

extension ModifiedStyle: InformationViewStyle where Style: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .informationViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct InformationViewStyleModifier<Style: InformationViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.informationViewStyle(self.style)
    }
}

public extension InformationViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some InformationViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some InformationViewStyle) -> some InformationViewStyle {
        style.modifier(InformationViewStyleModifier(style: self))
    }
}

// MARK: MediaImageStyle

extension ModifiedStyle: MediaImageStyle where Style: MediaImageStyle {
    public func makeBody(_ configuration: MediaImageConfiguration) -> some View {
        MediaImage(configuration)
            .mediaImageStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct MediaImageStyleModifier<Style: MediaImageStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.mediaImageStyle(self.style)
    }
}

public extension MediaImageStyle {
    func modifier(_ modifier: some ViewModifier) -> some MediaImageStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some MediaImageStyle) -> some MediaImageStyle {
        style.modifier(MediaImageStyleModifier(style: self))
    }
}

// MARK: ObjectItemStyle

extension ModifiedStyle: ObjectItemStyle where Style: ObjectItemStyle {
    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .objectItemStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ObjectItemStyleModifier<Style: ObjectItemStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.objectItemStyle(self.style)
    }
}

public extension ObjectItemStyle {
    func modifier(_ modifier: some ViewModifier) -> some ObjectItemStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ObjectItemStyle) -> some ObjectItemStyle {
        style.modifier(ObjectItemStyleModifier(style: self))
    }
}

// MARK: Row1Style

extension ModifiedStyle: Row1Style where Style: Row1Style {
    public func makeBody(_ configuration: Row1Configuration) -> some View {
        Row1(configuration)
            .row1Style(self.style)
            .modifier(self.modifier)
    }
}

public struct Row1StyleModifier<Style: Row1Style>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.row1Style(self.style)
    }
}

public extension Row1Style {
    func modifier(_ modifier: some ViewModifier) -> some Row1Style {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some Row1Style) -> some Row1Style {
        style.modifier(Row1StyleModifier(style: self))
    }
}

// MARK: Row2Style

extension ModifiedStyle: Row2Style where Style: Row2Style {
    public func makeBody(_ configuration: Row2Configuration) -> some View {
        Row2(configuration)
            .row2Style(self.style)
            .modifier(self.modifier)
    }
}

public struct Row2StyleModifier<Style: Row2Style>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.row2Style(self.style)
    }
}

public extension Row2Style {
    func modifier(_ modifier: some ViewModifier) -> some Row2Style {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some Row2Style) -> some Row2Style {
        style.modifier(Row2StyleModifier(style: self))
    }
}

// MARK: Row3Style

extension ModifiedStyle: Row3Style where Style: Row3Style {
    public func makeBody(_ configuration: Row3Configuration) -> some View {
        Row3(configuration)
            .row3Style(self.style)
            .modifier(self.modifier)
    }
}

public struct Row3StyleModifier<Style: Row3Style>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.row3Style(self.style)
    }
}

public extension Row3Style {
    func modifier(_ modifier: some ViewModifier) -> some Row3Style {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some Row3Style) -> some Row3Style {
        style.modifier(Row3StyleModifier(style: self))
    }
}

// MARK: SecondaryActionStyle

extension ModifiedStyle: SecondaryActionStyle where Style: SecondaryActionStyle {
    public func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
        SecondaryAction(configuration)
            .secondaryActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SecondaryActionStyleModifier<Style: SecondaryActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.secondaryActionStyle(self.style)
    }
}

public extension SecondaryActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some SecondaryActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SecondaryActionStyle) -> some SecondaryActionStyle {
        style.modifier(SecondaryActionStyleModifier(style: self))
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

// MARK: SwitchStyle

extension ModifiedStyle: SwitchStyle where Style: SwitchStyle {
    public func makeBody(_ configuration: SwitchConfiguration) -> some View {
        Switch(configuration)
            .switchStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SwitchStyleModifier<Style: SwitchStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.switchStyle(self.style)
    }
}

public extension SwitchStyle {
    func modifier(_ modifier: some ViewModifier) -> some SwitchStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SwitchStyle) -> some SwitchStyle {
        style.modifier(SwitchStyleModifier(style: self))
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
