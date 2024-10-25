// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: AccessoryIconStyle

public extension AccessoryIconStyle where Self == AccessoryIconBaseStyle {
    static var base: AccessoryIconBaseStyle {
        AccessoryIconBaseStyle()
    }
}

public extension AccessoryIconStyle where Self == AccessoryIconFioriStyle {
    static var fiori: AccessoryIconFioriStyle {
        AccessoryIconFioriStyle()
    }
}

// MARK: ActionStyle

public extension ActionStyle where Self == ActionBaseStyle {
    static var base: ActionBaseStyle {
        ActionBaseStyle()
    }
}

public extension ActionStyle where Self == ActionFioriStyle {
    static var fiori: ActionFioriStyle {
        ActionFioriStyle()
    }
}

// MARK: AllEntriesSectionTitleStyle

public extension AllEntriesSectionTitleStyle where Self == AllEntriesSectionTitleBaseStyle {
    static var base: AllEntriesSectionTitleBaseStyle {
        AllEntriesSectionTitleBaseStyle()
    }
}

public extension AllEntriesSectionTitleStyle where Self == AllEntriesSectionTitleFioriStyle {
    static var fiori: AllEntriesSectionTitleFioriStyle {
        AllEntriesSectionTitleFioriStyle()
    }
}

// MARK: ApplyActionStyle

public extension ApplyActionStyle where Self == ApplyActionBaseStyle {
    static var base: ApplyActionBaseStyle {
        ApplyActionBaseStyle()
    }
}

public extension ApplyActionStyle where Self == ApplyActionFioriStyle {
    static var fiori: ApplyActionFioriStyle {
        ApplyActionFioriStyle()
    }
}

// MARK: AttributeStyle

public extension AttributeStyle where Self == AttributeBaseStyle {
    static var base: AttributeBaseStyle {
        AttributeBaseStyle()
    }
}

public extension AttributeStyle where Self == AttributeFioriStyle {
    static var fiori: AttributeFioriStyle {
        AttributeFioriStyle()
    }
}

// MARK: AvatarStackStyle

public extension AvatarStackStyle where Self == AvatarStackBaseStyle {
    static var base: AvatarStackBaseStyle {
        AvatarStackBaseStyle()
    }
}

public extension AvatarStackStyle where Self == AvatarStackFioriStyle {
    static var fiori: AvatarStackFioriStyle {
        AvatarStackFioriStyle()
    }
}

public struct AvatarStackAvatarsStyle: AvatarStackStyle {
    let style: any AvatarsStyle

    public func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
        AvatarStack(configuration)
            .avatarsStyle(self.style)
            .typeErased
    }
}

public extension AvatarStackStyle where Self == AvatarStackAvatarsStyle {
    static func avatarsStyle(_ style: some AvatarsStyle) -> AvatarStackAvatarsStyle {
        AvatarStackAvatarsStyle(style: style)
    }

    static func avatarsStyle(@ViewBuilder content: @escaping (AvatarsConfiguration) -> some View) -> AvatarStackAvatarsStyle {
        let style = AnyAvatarsStyle(content)
        return AvatarStackAvatarsStyle(style: style)
    }
}

public struct AvatarStackAvatarsTitleStyle: AvatarStackStyle {
    let style: any AvatarsTitleStyle

    public func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
        AvatarStack(configuration)
            .avatarsTitleStyle(self.style)
            .typeErased
    }
}

public extension AvatarStackStyle where Self == AvatarStackAvatarsTitleStyle {
    static func avatarsTitleStyle(_ style: some AvatarsTitleStyle) -> AvatarStackAvatarsTitleStyle {
        AvatarStackAvatarsTitleStyle(style: style)
    }

    static func avatarsTitleStyle(@ViewBuilder content: @escaping (AvatarsTitleConfiguration) -> some View) -> AvatarStackAvatarsTitleStyle {
        let style = AnyAvatarsTitleStyle(content)
        return AvatarStackAvatarsTitleStyle(style: style)
    }
}

// MARK: AvatarsStyle

public extension AvatarsStyle where Self == AvatarsBaseStyle {
    static var base: AvatarsBaseStyle {
        AvatarsBaseStyle()
    }
}

public extension AvatarsStyle where Self == AvatarsFioriStyle {
    static var fiori: AvatarsFioriStyle {
        AvatarsFioriStyle()
    }
}

// MARK: AvatarsTitleStyle

public extension AvatarsTitleStyle where Self == AvatarsTitleBaseStyle {
    static var base: AvatarsTitleBaseStyle {
        AvatarsTitleBaseStyle()
    }
}

public extension AvatarsTitleStyle where Self == AvatarsTitleFioriStyle {
    static var fiori: AvatarsTitleFioriStyle {
        AvatarsTitleFioriStyle()
    }
}

// MARK: BannerMessageStyle

public extension BannerMessageStyle where Self == BannerMessageBaseStyle {
    static var base: BannerMessageBaseStyle {
        BannerMessageBaseStyle()
    }
}

public extension BannerMessageStyle where Self == BannerMessageFioriStyle {
    static var fiori: BannerMessageFioriStyle {
        BannerMessageFioriStyle()
    }
}

public struct BannerMessageIconStyle: BannerMessageStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension BannerMessageStyle where Self == BannerMessageIconStyle {
    static func iconStyle(_ style: some IconStyle) -> BannerMessageIconStyle {
        BannerMessageIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> BannerMessageIconStyle {
        let style = AnyIconStyle(content)
        return BannerMessageIconStyle(style: style)
    }
}

public struct BannerMessageTitleStyle: BannerMessageStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension BannerMessageStyle where Self == BannerMessageTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> BannerMessageTitleStyle {
        BannerMessageTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> BannerMessageTitleStyle {
        let style = AnyTitleStyle(content)
        return BannerMessageTitleStyle(style: style)
    }
}

public struct BannerMessageCloseActionStyle: BannerMessageStyle {
    let style: any CloseActionStyle

    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .closeActionStyle(self.style)
            .typeErased
    }
}

public extension BannerMessageStyle where Self == BannerMessageCloseActionStyle {
    static func closeActionStyle(_ style: some CloseActionStyle) -> BannerMessageCloseActionStyle {
        BannerMessageCloseActionStyle(style: style)
    }

    static func closeActionStyle(@ViewBuilder content: @escaping (CloseActionConfiguration) -> some View) -> BannerMessageCloseActionStyle {
        let style = AnyCloseActionStyle(content)
        return BannerMessageCloseActionStyle(style: style)
    }
}

public struct BannerMessageTopDividerStyle: BannerMessageStyle {
    let style: any TopDividerStyle

    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .topDividerStyle(self.style)
            .typeErased
    }
}

public extension BannerMessageStyle where Self == BannerMessageTopDividerStyle {
    static func topDividerStyle(_ style: some TopDividerStyle) -> BannerMessageTopDividerStyle {
        BannerMessageTopDividerStyle(style: style)
    }

    static func topDividerStyle(@ViewBuilder content: @escaping (TopDividerConfiguration) -> some View) -> BannerMessageTopDividerStyle {
        let style = AnyTopDividerStyle(content)
        return BannerMessageTopDividerStyle(style: style)
    }
}

// MARK: CancelActionStyle

public extension CancelActionStyle where Self == CancelActionBaseStyle {
    static var base: CancelActionBaseStyle {
        CancelActionBaseStyle()
    }
}

public extension CancelActionStyle where Self == CancelActionFioriStyle {
    static var fiori: CancelActionFioriStyle {
        CancelActionFioriStyle()
    }
}

// MARK: CardBodyStyle

public extension CardBodyStyle where Self == CardBodyBaseStyle {
    static var base: CardBodyBaseStyle {
        CardBodyBaseStyle()
    }
}

public extension CardBodyStyle where Self == CardBodyFioriStyle {
    static var fiori: CardBodyFioriStyle {
        CardBodyFioriStyle()
    }
}

// MARK: CardStyle

public extension CardStyle where Self == CardBaseStyle {
    static var base: CardBaseStyle {
        CardBaseStyle()
    }
}

public extension CardStyle where Self == CardFioriStyle {
    static var fiori: CardFioriStyle {
        CardFioriStyle()
    }
}

public struct CardMediaImageStyle: CardStyle {
    let style: any MediaImageStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .mediaImageStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardMediaImageStyle {
    static func mediaImageStyle(_ style: some MediaImageStyle) -> CardMediaImageStyle {
        CardMediaImageStyle(style: style)
    }

    static func mediaImageStyle(@ViewBuilder content: @escaping (MediaImageConfiguration) -> some View) -> CardMediaImageStyle {
        let style = AnyMediaImageStyle(content)
        return CardMediaImageStyle(style: style)
    }
}

public struct CardDescriptionStyle: CardStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> CardDescriptionStyle {
        CardDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> CardDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return CardDescriptionStyle(style: style)
    }
}

public struct CardTitleStyle: CardStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> CardTitleStyle {
        CardTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> CardTitleStyle {
        let style = AnyTitleStyle(content)
        return CardTitleStyle(style: style)
    }
}

public struct CardSubtitleStyle: CardStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> CardSubtitleStyle {
        CardSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> CardSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return CardSubtitleStyle(style: style)
    }
}

public struct CardIconsStyle: CardStyle {
    let style: any IconsStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .iconsStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardIconsStyle {
    static func iconsStyle(_ style: some IconsStyle) -> CardIconsStyle {
        CardIconsStyle(style: style)
    }

    static func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> CardIconsStyle {
        let style = AnyIconsStyle(content)
        return CardIconsStyle(style: style)
    }
}

public struct CardDetailImageStyle: CardStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> CardDetailImageStyle {
        CardDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> CardDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return CardDetailImageStyle(style: style)
    }
}

public struct CardHeaderActionStyle: CardStyle {
    let style: any HeaderActionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .headerActionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardHeaderActionStyle {
    static func headerActionStyle(_ style: some HeaderActionStyle) -> CardHeaderActionStyle {
        CardHeaderActionStyle(style: style)
    }

    static func headerActionStyle(@ViewBuilder content: @escaping (HeaderActionConfiguration) -> some View) -> CardHeaderActionStyle {
        let style = AnyHeaderActionStyle(content)
        return CardHeaderActionStyle(style: style)
    }
}

public struct CardCounterStyle: CardStyle {
    let style: any CounterStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .counterStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardCounterStyle {
    static func counterStyle(_ style: some CounterStyle) -> CardCounterStyle {
        CardCounterStyle(style: style)
    }

    static func counterStyle(@ViewBuilder content: @escaping (CounterConfiguration) -> some View) -> CardCounterStyle {
        let style = AnyCounterStyle(content)
        return CardCounterStyle(style: style)
    }
}

public struct CardRow1Style: CardStyle {
    let style: any Row1Style

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .row1Style(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardRow1Style {
    static func row1Style(_ style: some Row1Style) -> CardRow1Style {
        CardRow1Style(style: style)
    }

    static func row1Style(@ViewBuilder content: @escaping (Row1Configuration) -> some View) -> CardRow1Style {
        let style = AnyRow1Style(content)
        return CardRow1Style(style: style)
    }
}

public struct CardRow2Style: CardStyle {
    let style: any Row2Style

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .row2Style(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardRow2Style {
    static func row2Style(_ style: some Row2Style) -> CardRow2Style {
        CardRow2Style(style: style)
    }

    static func row2Style(@ViewBuilder content: @escaping (Row2Configuration) -> some View) -> CardRow2Style {
        let style = AnyRow2Style(content)
        return CardRow2Style(style: style)
    }
}

public struct CardRow3Style: CardStyle {
    let style: any Row3Style

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .row3Style(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardRow3Style {
    static func row3Style(_ style: some Row3Style) -> CardRow3Style {
        CardRow3Style(style: style)
    }

    static func row3Style(@ViewBuilder content: @escaping (Row3Configuration) -> some View) -> CardRow3Style {
        let style = AnyRow3Style(content)
        return CardRow3Style(style: style)
    }
}

public struct CardKpiStyle: CardStyle {
    let style: any KpiStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .kpiStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardKpiStyle {
    static func kpiStyle(_ style: some KpiStyle) -> CardKpiStyle {
        CardKpiStyle(style: style)
    }

    static func kpiStyle(@ViewBuilder content: @escaping (KpiConfiguration) -> some View) -> CardKpiStyle {
        let style = AnyKpiStyle(content)
        return CardKpiStyle(style: style)
    }
}

public struct CardKpiCaptionStyle: CardStyle {
    let style: any KpiCaptionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .kpiCaptionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardKpiCaptionStyle {
    static func kpiCaptionStyle(_ style: some KpiCaptionStyle) -> CardKpiCaptionStyle {
        CardKpiCaptionStyle(style: style)
    }

    static func kpiCaptionStyle(@ViewBuilder content: @escaping (KpiCaptionConfiguration) -> some View) -> CardKpiCaptionStyle {
        let style = AnyKpiCaptionStyle(content)
        return CardKpiCaptionStyle(style: style)
    }
}

public struct CardCardBodyStyle: CardStyle {
    let style: any CardBodyStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .cardBodyStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardCardBodyStyle {
    static func cardBodyStyle(_ style: some CardBodyStyle) -> CardCardBodyStyle {
        CardCardBodyStyle(style: style)
    }

    static func cardBodyStyle(@ViewBuilder content: @escaping (CardBodyConfiguration) -> some View) -> CardCardBodyStyle {
        let style = AnyCardBodyStyle(content)
        return CardCardBodyStyle(style: style)
    }
}

public struct CardActionStyle: CardStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> CardActionStyle {
        CardActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> CardActionStyle {
        let style = AnyActionStyle(content)
        return CardActionStyle(style: style)
    }
}

public struct CardSecondaryActionStyle: CardStyle {
    let style: any SecondaryActionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .secondaryActionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardSecondaryActionStyle {
    static func secondaryActionStyle(_ style: some SecondaryActionStyle) -> CardSecondaryActionStyle {
        CardSecondaryActionStyle(style: style)
    }

    static func secondaryActionStyle(@ViewBuilder content: @escaping (SecondaryActionConfiguration) -> some View) -> CardSecondaryActionStyle {
        let style = AnySecondaryActionStyle(content)
        return CardSecondaryActionStyle(style: style)
    }
}

public struct CardTertiaryActionStyle: CardStyle {
    let style: any TertiaryActionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .tertiaryActionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardTertiaryActionStyle {
    static func tertiaryActionStyle(_ style: some TertiaryActionStyle) -> CardTertiaryActionStyle {
        CardTertiaryActionStyle(style: style)
    }

    static func tertiaryActionStyle(@ViewBuilder content: @escaping (TertiaryActionConfiguration) -> some View) -> CardTertiaryActionStyle {
        let style = AnyTertiaryActionStyle(content)
        return CardTertiaryActionStyle(style: style)
    }
}

public struct CardOverflowActionStyle: CardStyle {
    let style: any OverflowActionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .overflowActionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardOverflowActionStyle {
    static func overflowActionStyle(_ style: some OverflowActionStyle) -> CardOverflowActionStyle {
        CardOverflowActionStyle(style: style)
    }

    static func overflowActionStyle(@ViewBuilder content: @escaping (OverflowActionConfiguration) -> some View) -> CardOverflowActionStyle {
        let style = AnyOverflowActionStyle(content)
        return CardOverflowActionStyle(style: style)
    }
}

public struct CardCardHeaderStyle: CardStyle {
    let style: any CardHeaderStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .cardHeaderStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardCardHeaderStyle {
    static func cardHeaderStyle(_ style: some CardHeaderStyle) -> CardCardHeaderStyle {
        CardCardHeaderStyle(style: style)
    }

    static func cardHeaderStyle(@ViewBuilder content: @escaping (CardHeaderConfiguration) -> some View) -> CardCardHeaderStyle {
        let style = AnyCardHeaderStyle(content)
        return CardCardHeaderStyle(style: style)
    }
}

public struct CardCardFooterStyle: CardStyle {
    let style: any CardFooterStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .cardFooterStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardCardFooterStyle {
    static func cardFooterStyle(_ style: some CardFooterStyle) -> CardCardFooterStyle {
        CardCardFooterStyle(style: style)
    }

    static func cardFooterStyle(@ViewBuilder content: @escaping (CardFooterConfiguration) -> some View) -> CardCardFooterStyle {
        let style = AnyCardFooterStyle(content)
        return CardCardFooterStyle(style: style)
    }
}

// MARK: CardExtHeaderStyle

public extension CardExtHeaderStyle where Self == CardExtHeaderBaseStyle {
    static var base: CardExtHeaderBaseStyle {
        CardExtHeaderBaseStyle()
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderFioriStyle {
    static var fiori: CardExtHeaderFioriStyle {
        CardExtHeaderFioriStyle()
    }
}

public struct CardExtHeaderRow1Style: CardExtHeaderStyle {
    let style: any Row1Style

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .row1Style(self.style)
            .typeErased
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderRow1Style {
    static func row1Style(_ style: some Row1Style) -> CardExtHeaderRow1Style {
        CardExtHeaderRow1Style(style: style)
    }

    static func row1Style(@ViewBuilder content: @escaping (Row1Configuration) -> some View) -> CardExtHeaderRow1Style {
        let style = AnyRow1Style(content)
        return CardExtHeaderRow1Style(style: style)
    }
}

public struct CardExtHeaderRow2Style: CardExtHeaderStyle {
    let style: any Row2Style

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .row2Style(self.style)
            .typeErased
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderRow2Style {
    static func row2Style(_ style: some Row2Style) -> CardExtHeaderRow2Style {
        CardExtHeaderRow2Style(style: style)
    }

    static func row2Style(@ViewBuilder content: @escaping (Row2Configuration) -> some View) -> CardExtHeaderRow2Style {
        let style = AnyRow2Style(content)
        return CardExtHeaderRow2Style(style: style)
    }
}

public struct CardExtHeaderRow3Style: CardExtHeaderStyle {
    let style: any Row3Style

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .row3Style(self.style)
            .typeErased
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderRow3Style {
    static func row3Style(_ style: some Row3Style) -> CardExtHeaderRow3Style {
        CardExtHeaderRow3Style(style: style)
    }

    static func row3Style(@ViewBuilder content: @escaping (Row3Configuration) -> some View) -> CardExtHeaderRow3Style {
        let style = AnyRow3Style(content)
        return CardExtHeaderRow3Style(style: style)
    }
}

public struct CardExtHeaderKpiStyle: CardExtHeaderStyle {
    let style: any KpiStyle

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .kpiStyle(self.style)
            .typeErased
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderKpiStyle {
    static func kpiStyle(_ style: some KpiStyle) -> CardExtHeaderKpiStyle {
        CardExtHeaderKpiStyle(style: style)
    }

    static func kpiStyle(@ViewBuilder content: @escaping (KpiConfiguration) -> some View) -> CardExtHeaderKpiStyle {
        let style = AnyKpiStyle(content)
        return CardExtHeaderKpiStyle(style: style)
    }
}

public struct CardExtHeaderKpiCaptionStyle: CardExtHeaderStyle {
    let style: any KpiCaptionStyle

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .kpiCaptionStyle(self.style)
            .typeErased
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderKpiCaptionStyle {
    static func kpiCaptionStyle(_ style: some KpiCaptionStyle) -> CardExtHeaderKpiCaptionStyle {
        CardExtHeaderKpiCaptionStyle(style: style)
    }

    static func kpiCaptionStyle(@ViewBuilder content: @escaping (KpiCaptionConfiguration) -> some View) -> CardExtHeaderKpiCaptionStyle {
        let style = AnyKpiCaptionStyle(content)
        return CardExtHeaderKpiCaptionStyle(style: style)
    }
}

// MARK: CardFooterStyle

public extension CardFooterStyle where Self == CardFooterBaseStyle {
    static var base: CardFooterBaseStyle {
        CardFooterBaseStyle()
    }
}

public extension CardFooterStyle where Self == CardFooterFioriStyle {
    static var fiori: CardFooterFioriStyle {
        CardFooterFioriStyle()
    }
}

public struct CardFooterActionStyle: CardFooterStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension CardFooterStyle where Self == CardFooterActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> CardFooterActionStyle {
        CardFooterActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> CardFooterActionStyle {
        let style = AnyActionStyle(content)
        return CardFooterActionStyle(style: style)
    }
}

public struct CardFooterSecondaryActionStyle: CardFooterStyle {
    let style: any SecondaryActionStyle

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .secondaryActionStyle(self.style)
            .typeErased
    }
}

public extension CardFooterStyle where Self == CardFooterSecondaryActionStyle {
    static func secondaryActionStyle(_ style: some SecondaryActionStyle) -> CardFooterSecondaryActionStyle {
        CardFooterSecondaryActionStyle(style: style)
    }

    static func secondaryActionStyle(@ViewBuilder content: @escaping (SecondaryActionConfiguration) -> some View) -> CardFooterSecondaryActionStyle {
        let style = AnySecondaryActionStyle(content)
        return CardFooterSecondaryActionStyle(style: style)
    }
}

public struct CardFooterTertiaryActionStyle: CardFooterStyle {
    let style: any TertiaryActionStyle

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .tertiaryActionStyle(self.style)
            .typeErased
    }
}

public extension CardFooterStyle where Self == CardFooterTertiaryActionStyle {
    static func tertiaryActionStyle(_ style: some TertiaryActionStyle) -> CardFooterTertiaryActionStyle {
        CardFooterTertiaryActionStyle(style: style)
    }

    static func tertiaryActionStyle(@ViewBuilder content: @escaping (TertiaryActionConfiguration) -> some View) -> CardFooterTertiaryActionStyle {
        let style = AnyTertiaryActionStyle(content)
        return CardFooterTertiaryActionStyle(style: style)
    }
}

public struct CardFooterOverflowActionStyle: CardFooterStyle {
    let style: any OverflowActionStyle

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .overflowActionStyle(self.style)
            .typeErased
    }
}

public extension CardFooterStyle where Self == CardFooterOverflowActionStyle {
    static func overflowActionStyle(_ style: some OverflowActionStyle) -> CardFooterOverflowActionStyle {
        CardFooterOverflowActionStyle(style: style)
    }

    static func overflowActionStyle(@ViewBuilder content: @escaping (OverflowActionConfiguration) -> some View) -> CardFooterOverflowActionStyle {
        let style = AnyOverflowActionStyle(content)
        return CardFooterOverflowActionStyle(style: style)
    }
}

// MARK: CardHeaderStyle

public extension CardHeaderStyle where Self == CardHeaderBaseStyle {
    static var base: CardHeaderBaseStyle {
        CardHeaderBaseStyle()
    }
}

public extension CardHeaderStyle where Self == CardHeaderFioriStyle {
    static var fiori: CardHeaderFioriStyle {
        CardHeaderFioriStyle()
    }
}

public struct CardHeaderMediaImageStyle: CardHeaderStyle {
    let style: any MediaImageStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .mediaImageStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderMediaImageStyle {
    static func mediaImageStyle(_ style: some MediaImageStyle) -> CardHeaderMediaImageStyle {
        CardHeaderMediaImageStyle(style: style)
    }

    static func mediaImageStyle(@ViewBuilder content: @escaping (MediaImageConfiguration) -> some View) -> CardHeaderMediaImageStyle {
        let style = AnyMediaImageStyle(content)
        return CardHeaderMediaImageStyle(style: style)
    }
}

public struct CardHeaderDescriptionStyle: CardHeaderStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> CardHeaderDescriptionStyle {
        CardHeaderDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> CardHeaderDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return CardHeaderDescriptionStyle(style: style)
    }
}

public struct CardHeaderTitleStyle: CardHeaderStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> CardHeaderTitleStyle {
        CardHeaderTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> CardHeaderTitleStyle {
        let style = AnyTitleStyle(content)
        return CardHeaderTitleStyle(style: style)
    }
}

public struct CardHeaderSubtitleStyle: CardHeaderStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> CardHeaderSubtitleStyle {
        CardHeaderSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> CardHeaderSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return CardHeaderSubtitleStyle(style: style)
    }
}

public struct CardHeaderIconsStyle: CardHeaderStyle {
    let style: any IconsStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .iconsStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderIconsStyle {
    static func iconsStyle(_ style: some IconsStyle) -> CardHeaderIconsStyle {
        CardHeaderIconsStyle(style: style)
    }

    static func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> CardHeaderIconsStyle {
        let style = AnyIconsStyle(content)
        return CardHeaderIconsStyle(style: style)
    }
}

public struct CardHeaderDetailImageStyle: CardHeaderStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> CardHeaderDetailImageStyle {
        CardHeaderDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> CardHeaderDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return CardHeaderDetailImageStyle(style: style)
    }
}

public struct CardHeaderHeaderActionStyle: CardHeaderStyle {
    let style: any HeaderActionStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .headerActionStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderHeaderActionStyle {
    static func headerActionStyle(_ style: some HeaderActionStyle) -> CardHeaderHeaderActionStyle {
        CardHeaderHeaderActionStyle(style: style)
    }

    static func headerActionStyle(@ViewBuilder content: @escaping (HeaderActionConfiguration) -> some View) -> CardHeaderHeaderActionStyle {
        let style = AnyHeaderActionStyle(content)
        return CardHeaderHeaderActionStyle(style: style)
    }
}

public struct CardHeaderCounterStyle: CardHeaderStyle {
    let style: any CounterStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .counterStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderCounterStyle {
    static func counterStyle(_ style: some CounterStyle) -> CardHeaderCounterStyle {
        CardHeaderCounterStyle(style: style)
    }

    static func counterStyle(@ViewBuilder content: @escaping (CounterConfiguration) -> some View) -> CardHeaderCounterStyle {
        let style = AnyCounterStyle(content)
        return CardHeaderCounterStyle(style: style)
    }
}

public struct CardHeaderRow1Style: CardHeaderStyle {
    let style: any Row1Style

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .row1Style(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderRow1Style {
    static func row1Style(_ style: some Row1Style) -> CardHeaderRow1Style {
        CardHeaderRow1Style(style: style)
    }

    static func row1Style(@ViewBuilder content: @escaping (Row1Configuration) -> some View) -> CardHeaderRow1Style {
        let style = AnyRow1Style(content)
        return CardHeaderRow1Style(style: style)
    }
}

public struct CardHeaderRow2Style: CardHeaderStyle {
    let style: any Row2Style

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .row2Style(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderRow2Style {
    static func row2Style(_ style: some Row2Style) -> CardHeaderRow2Style {
        CardHeaderRow2Style(style: style)
    }

    static func row2Style(@ViewBuilder content: @escaping (Row2Configuration) -> some View) -> CardHeaderRow2Style {
        let style = AnyRow2Style(content)
        return CardHeaderRow2Style(style: style)
    }
}

public struct CardHeaderRow3Style: CardHeaderStyle {
    let style: any Row3Style

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .row3Style(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderRow3Style {
    static func row3Style(_ style: some Row3Style) -> CardHeaderRow3Style {
        CardHeaderRow3Style(style: style)
    }

    static func row3Style(@ViewBuilder content: @escaping (Row3Configuration) -> some View) -> CardHeaderRow3Style {
        let style = AnyRow3Style(content)
        return CardHeaderRow3Style(style: style)
    }
}

public struct CardHeaderKpiStyle: CardHeaderStyle {
    let style: any KpiStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .kpiStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderKpiStyle {
    static func kpiStyle(_ style: some KpiStyle) -> CardHeaderKpiStyle {
        CardHeaderKpiStyle(style: style)
    }

    static func kpiStyle(@ViewBuilder content: @escaping (KpiConfiguration) -> some View) -> CardHeaderKpiStyle {
        let style = AnyKpiStyle(content)
        return CardHeaderKpiStyle(style: style)
    }
}

public struct CardHeaderKpiCaptionStyle: CardHeaderStyle {
    let style: any KpiCaptionStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .kpiCaptionStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderKpiCaptionStyle {
    static func kpiCaptionStyle(_ style: some KpiCaptionStyle) -> CardHeaderKpiCaptionStyle {
        CardHeaderKpiCaptionStyle(style: style)
    }

    static func kpiCaptionStyle(@ViewBuilder content: @escaping (KpiCaptionConfiguration) -> some View) -> CardHeaderKpiCaptionStyle {
        let style = AnyKpiCaptionStyle(content)
        return CardHeaderKpiCaptionStyle(style: style)
    }
}

public struct CardHeaderCardMediaStyle: CardHeaderStyle {
    let style: any CardMediaStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .cardMediaStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderCardMediaStyle {
    static func cardMediaStyle(_ style: some CardMediaStyle) -> CardHeaderCardMediaStyle {
        CardHeaderCardMediaStyle(style: style)
    }

    static func cardMediaStyle(@ViewBuilder content: @escaping (CardMediaConfiguration) -> some View) -> CardHeaderCardMediaStyle {
        let style = AnyCardMediaStyle(content)
        return CardHeaderCardMediaStyle(style: style)
    }
}

public struct CardHeaderCardMainHeaderStyle: CardHeaderStyle {
    let style: any CardMainHeaderStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .cardMainHeaderStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderCardMainHeaderStyle {
    static func cardMainHeaderStyle(_ style: some CardMainHeaderStyle) -> CardHeaderCardMainHeaderStyle {
        CardHeaderCardMainHeaderStyle(style: style)
    }

    static func cardMainHeaderStyle(@ViewBuilder content: @escaping (CardMainHeaderConfiguration) -> some View) -> CardHeaderCardMainHeaderStyle {
        let style = AnyCardMainHeaderStyle(content)
        return CardHeaderCardMainHeaderStyle(style: style)
    }
}

public struct CardHeaderCardExtHeaderStyle: CardHeaderStyle {
    let style: any CardExtHeaderStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .cardExtHeaderStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderCardExtHeaderStyle {
    static func cardExtHeaderStyle(_ style: some CardExtHeaderStyle) -> CardHeaderCardExtHeaderStyle {
        CardHeaderCardExtHeaderStyle(style: style)
    }

    static func cardExtHeaderStyle(@ViewBuilder content: @escaping (CardExtHeaderConfiguration) -> some View) -> CardHeaderCardExtHeaderStyle {
        let style = AnyCardExtHeaderStyle(content)
        return CardHeaderCardExtHeaderStyle(style: style)
    }
}

// MARK: CardMainHeaderStyle

public extension CardMainHeaderStyle where Self == CardMainHeaderBaseStyle {
    static var base: CardMainHeaderBaseStyle {
        CardMainHeaderBaseStyle()
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderFioriStyle {
    static var fiori: CardMainHeaderFioriStyle {
        CardMainHeaderFioriStyle()
    }
}

public struct CardMainHeaderTitleStyle: CardMainHeaderStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> CardMainHeaderTitleStyle {
        CardMainHeaderTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> CardMainHeaderTitleStyle {
        let style = AnyTitleStyle(content)
        return CardMainHeaderTitleStyle(style: style)
    }
}

public struct CardMainHeaderSubtitleStyle: CardMainHeaderStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> CardMainHeaderSubtitleStyle {
        CardMainHeaderSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> CardMainHeaderSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return CardMainHeaderSubtitleStyle(style: style)
    }
}

public struct CardMainHeaderIconsStyle: CardMainHeaderStyle {
    let style: any IconsStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .iconsStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderIconsStyle {
    static func iconsStyle(_ style: some IconsStyle) -> CardMainHeaderIconsStyle {
        CardMainHeaderIconsStyle(style: style)
    }

    static func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> CardMainHeaderIconsStyle {
        let style = AnyIconsStyle(content)
        return CardMainHeaderIconsStyle(style: style)
    }
}

public struct CardMainHeaderDetailImageStyle: CardMainHeaderStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> CardMainHeaderDetailImageStyle {
        CardMainHeaderDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> CardMainHeaderDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return CardMainHeaderDetailImageStyle(style: style)
    }
}

public struct CardMainHeaderHeaderActionStyle: CardMainHeaderStyle {
    let style: any HeaderActionStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .headerActionStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderHeaderActionStyle {
    static func headerActionStyle(_ style: some HeaderActionStyle) -> CardMainHeaderHeaderActionStyle {
        CardMainHeaderHeaderActionStyle(style: style)
    }

    static func headerActionStyle(@ViewBuilder content: @escaping (HeaderActionConfiguration) -> some View) -> CardMainHeaderHeaderActionStyle {
        let style = AnyHeaderActionStyle(content)
        return CardMainHeaderHeaderActionStyle(style: style)
    }
}

public struct CardMainHeaderCounterStyle: CardMainHeaderStyle {
    let style: any CounterStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .counterStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderCounterStyle {
    static func counterStyle(_ style: some CounterStyle) -> CardMainHeaderCounterStyle {
        CardMainHeaderCounterStyle(style: style)
    }

    static func counterStyle(@ViewBuilder content: @escaping (CounterConfiguration) -> some View) -> CardMainHeaderCounterStyle {
        let style = AnyCounterStyle(content)
        return CardMainHeaderCounterStyle(style: style)
    }
}

// MARK: CardMediaStyle

public extension CardMediaStyle where Self == CardMediaBaseStyle {
    static var base: CardMediaBaseStyle {
        CardMediaBaseStyle()
    }
}

public extension CardMediaStyle where Self == CardMediaFioriStyle {
    static var fiori: CardMediaFioriStyle {
        CardMediaFioriStyle()
    }
}

public struct CardMediaMediaImageStyle: CardMediaStyle {
    let style: any MediaImageStyle

    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        CardMedia(configuration)
            .mediaImageStyle(self.style)
            .typeErased
    }
}

public extension CardMediaStyle where Self == CardMediaMediaImageStyle {
    static func mediaImageStyle(_ style: some MediaImageStyle) -> CardMediaMediaImageStyle {
        CardMediaMediaImageStyle(style: style)
    }

    static func mediaImageStyle(@ViewBuilder content: @escaping (MediaImageConfiguration) -> some View) -> CardMediaMediaImageStyle {
        let style = AnyMediaImageStyle(content)
        return CardMediaMediaImageStyle(style: style)
    }
}

public struct CardMediaDescriptionStyle: CardMediaStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        CardMedia(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension CardMediaStyle where Self == CardMediaDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> CardMediaDescriptionStyle {
        CardMediaDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> CardMediaDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return CardMediaDescriptionStyle(style: style)
    }
}

// MARK: CloseActionStyle

public extension CloseActionStyle where Self == CloseActionBaseStyle {
    static var base: CloseActionBaseStyle {
        CloseActionBaseStyle()
    }
}

public extension CloseActionStyle where Self == CloseActionFioriStyle {
    static var fiori: CloseActionFioriStyle {
        CloseActionFioriStyle()
    }
}

// MARK: CounterStyle

public extension CounterStyle where Self == CounterBaseStyle {
    static var base: CounterBaseStyle {
        CounterBaseStyle()
    }
}

public extension CounterStyle where Self == CounterFioriStyle {
    static var fiori: CounterFioriStyle {
        CounterFioriStyle()
    }
}

// MARK: DateTimePickerStyle

public extension DateTimePickerStyle where Self == DateTimePickerBaseStyle {
    static var base: DateTimePickerBaseStyle {
        DateTimePickerBaseStyle()
    }
}

public extension DateTimePickerStyle where Self == DateTimePickerFioriStyle {
    static var fiori: DateTimePickerFioriStyle {
        DateTimePickerFioriStyle()
    }
}

public struct DateTimePickerTitleStyle: DateTimePickerStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        DateTimePicker(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension DateTimePickerStyle where Self == DateTimePickerTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> DateTimePickerTitleStyle {
        DateTimePickerTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> DateTimePickerTitleStyle {
        let style = AnyTitleStyle(content)
        return DateTimePickerTitleStyle(style: style)
    }
}

public struct DateTimePickerValueLabelStyle: DateTimePickerStyle {
    let style: any ValueLabelStyle

    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        DateTimePicker(configuration)
            .valueLabelStyle(self.style)
            .typeErased
    }
}

public extension DateTimePickerStyle where Self == DateTimePickerValueLabelStyle {
    static func valueLabelStyle(_ style: some ValueLabelStyle) -> DateTimePickerValueLabelStyle {
        DateTimePickerValueLabelStyle(style: style)
    }

    static func valueLabelStyle(@ViewBuilder content: @escaping (ValueLabelConfiguration) -> some View) -> DateTimePickerValueLabelStyle {
        let style = AnyValueLabelStyle(content)
        return DateTimePickerValueLabelStyle(style: style)
    }
}

public struct DateTimePickerMandatoryFieldIndicatorStyle: DateTimePickerStyle {
    let style: any MandatoryFieldIndicatorStyle

    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        DateTimePicker(configuration)
            .mandatoryFieldIndicatorStyle(self.style)
            .typeErased
    }
}

public extension DateTimePickerStyle where Self == DateTimePickerMandatoryFieldIndicatorStyle {
    static func mandatoryFieldIndicatorStyle(_ style: some MandatoryFieldIndicatorStyle) -> DateTimePickerMandatoryFieldIndicatorStyle {
        DateTimePickerMandatoryFieldIndicatorStyle(style: style)
    }

    static func mandatoryFieldIndicatorStyle(@ViewBuilder content: @escaping (MandatoryFieldIndicatorConfiguration) -> some View) -> DateTimePickerMandatoryFieldIndicatorStyle {
        let style = AnyMandatoryFieldIndicatorStyle(content)
        return DateTimePickerMandatoryFieldIndicatorStyle(style: style)
    }
}

public struct DateTimePickerFormViewStyle: DateTimePickerStyle {
    let style: any FormViewStyle

    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        DateTimePicker(configuration)
            .formViewStyle(self.style)
            .typeErased
    }
}

public extension DateTimePickerStyle where Self == DateTimePickerFormViewStyle {
    static func formViewStyle(_ style: some FormViewStyle) -> DateTimePickerFormViewStyle {
        DateTimePickerFormViewStyle(style: style)
    }

    static func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> DateTimePickerFormViewStyle {
        let style = AnyFormViewStyle(content)
        return DateTimePickerFormViewStyle(style: style)
    }
}

// MARK: DecrementActionStyle

public extension DecrementActionStyle where Self == DecrementActionBaseStyle {
    static var base: DecrementActionBaseStyle {
        DecrementActionBaseStyle()
    }
}

public extension DecrementActionStyle where Self == DecrementActionFioriStyle {
    static var fiori: DecrementActionFioriStyle {
        DecrementActionFioriStyle()
    }
}

// MARK: DemoViewStyle

extension DemoViewStyle where Self == DemoViewBaseStyle {
    static var base: DemoViewBaseStyle {
        DemoViewBaseStyle()
    }
}

extension DemoViewStyle where Self == DemoViewFioriStyle {
    static var fiori: DemoViewFioriStyle {
        DemoViewFioriStyle()
    }
}

struct DemoViewTitleStyle: DemoViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

extension DemoViewStyle where Self == DemoViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> DemoViewTitleStyle {
        DemoViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> DemoViewTitleStyle {
        let style = AnyTitleStyle(content)
        return DemoViewTitleStyle(style: style)
    }
}

struct DemoViewSubtitleStyle: DemoViewStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

extension DemoViewStyle where Self == DemoViewSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> DemoViewSubtitleStyle {
        DemoViewSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> DemoViewSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return DemoViewSubtitleStyle(style: style)
    }
}

struct DemoViewStatusStyle: DemoViewStyle {
    let style: any StatusStyle

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .statusStyle(self.style)
            .typeErased
    }
}

extension DemoViewStyle where Self == DemoViewStatusStyle {
    static func statusStyle(_ style: some StatusStyle) -> DemoViewStatusStyle {
        DemoViewStatusStyle(style: style)
    }

    static func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> DemoViewStatusStyle {
        let style = AnyStatusStyle(content)
        return DemoViewStatusStyle(style: style)
    }
}

struct DemoViewActionStyle: DemoViewStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

extension DemoViewStyle where Self == DemoViewActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> DemoViewActionStyle {
        DemoViewActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> DemoViewActionStyle {
        let style = AnyActionStyle(content)
        return DemoViewActionStyle(style: style)
    }
}

struct DemoViewSwitchStyle: DemoViewStyle {
    let style: any SwitchStyle

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .switchStyle(self.style)
            .typeErased
    }
}

extension DemoViewStyle where Self == DemoViewSwitchStyle {
    static func switchStyle(_ style: some SwitchStyle) -> DemoViewSwitchStyle {
        DemoViewSwitchStyle(style: style)
    }

    static func switchStyle(@ViewBuilder content: @escaping (SwitchConfiguration) -> some View) -> DemoViewSwitchStyle {
        let style = AnySwitchStyle(content)
        return DemoViewSwitchStyle(style: style)
    }
}

// MARK: DescriptionStyle

public extension DescriptionStyle where Self == DescriptionBaseStyle {
    static var base: DescriptionBaseStyle {
        DescriptionBaseStyle()
    }
}

public extension DescriptionStyle where Self == DescriptionFioriStyle {
    static var fiori: DescriptionFioriStyle {
        DescriptionFioriStyle()
    }
}

// MARK: DeselectAllActionStyle

public extension DeselectAllActionStyle where Self == DeselectAllActionBaseStyle {
    static var base: DeselectAllActionBaseStyle {
        DeselectAllActionBaseStyle()
    }
}

public extension DeselectAllActionStyle where Self == DeselectAllActionFioriStyle {
    static var fiori: DeselectAllActionFioriStyle {
        DeselectAllActionFioriStyle()
    }
}

// MARK: DetailImageStyle

public extension DetailImageStyle where Self == DetailImageBaseStyle {
    static var base: DetailImageBaseStyle {
        DetailImageBaseStyle()
    }
}

public extension DetailImageStyle where Self == DetailImageFioriStyle {
    static var fiori: DetailImageFioriStyle {
        DetailImageFioriStyle()
    }
}

// MARK: FilledIconStyle

public extension FilledIconStyle where Self == FilledIconBaseStyle {
    static var base: FilledIconBaseStyle {
        FilledIconBaseStyle()
    }
}

public extension FilledIconStyle where Self == FilledIconFioriStyle {
    static var fiori: FilledIconFioriStyle {
        FilledIconFioriStyle()
    }
}

// MARK: FootnoteStyle

public extension FootnoteStyle where Self == FootnoteBaseStyle {
    static var base: FootnoteBaseStyle {
        FootnoteBaseStyle()
    }
}

public extension FootnoteStyle where Self == FootnoteFioriStyle {
    static var fiori: FootnoteFioriStyle {
        FootnoteFioriStyle()
    }
}

// MARK: FootnoteIconsStyle

public extension FootnoteIconsStyle where Self == FootnoteIconsBaseStyle {
    static var base: FootnoteIconsBaseStyle {
        FootnoteIconsBaseStyle()
    }
}

public extension FootnoteIconsStyle where Self == FootnoteIconsFioriStyle {
    static var fiori: FootnoteIconsFioriStyle {
        FootnoteIconsFioriStyle()
    }
}

// MARK: FootnoteIconsTextStyle

public extension FootnoteIconsTextStyle where Self == FootnoteIconsTextBaseStyle {
    static var base: FootnoteIconsTextBaseStyle {
        FootnoteIconsTextBaseStyle()
    }
}

public extension FootnoteIconsTextStyle where Self == FootnoteIconsTextFioriStyle {
    static var fiori: FootnoteIconsTextFioriStyle {
        FootnoteIconsTextFioriStyle()
    }
}

// MARK: FormViewStyle

public extension FormViewStyle where Self == FormViewBaseStyle {
    static var base: FormViewBaseStyle {
        FormViewBaseStyle()
    }
}

public extension FormViewStyle where Self == FormViewFioriStyle {
    static var fiori: FormViewFioriStyle {
        FormViewFioriStyle()
    }
}

// MARK: GreetingTextStyle

public extension GreetingTextStyle where Self == GreetingTextBaseStyle {
    static var base: GreetingTextBaseStyle {
        GreetingTextBaseStyle()
    }
}

public extension GreetingTextStyle where Self == GreetingTextFioriStyle {
    static var fiori: GreetingTextFioriStyle {
        GreetingTextFioriStyle()
    }
}

// MARK: HalfStarImageStyle

public extension HalfStarImageStyle where Self == HalfStarImageBaseStyle {
    static var base: HalfStarImageBaseStyle {
        HalfStarImageBaseStyle()
    }
}

public extension HalfStarImageStyle where Self == HalfStarImageFioriStyle {
    static var fiori: HalfStarImageFioriStyle {
        HalfStarImageFioriStyle()
    }
}

// MARK: HeaderActionStyle

public extension HeaderActionStyle where Self == HeaderActionBaseStyle {
    static var base: HeaderActionBaseStyle {
        HeaderActionBaseStyle()
    }
}

public extension HeaderActionStyle where Self == HeaderActionFioriStyle {
    static var fiori: HeaderActionFioriStyle {
        HeaderActionFioriStyle()
    }
}

// MARK: HelperTextStyle

public extension HelperTextStyle where Self == HelperTextBaseStyle {
    static var base: HelperTextBaseStyle {
        HelperTextBaseStyle()
    }
}

public extension HelperTextStyle where Self == HelperTextFioriStyle {
    static var fiori: HelperTextFioriStyle {
        HelperTextFioriStyle()
    }
}

// MARK: IconStyle

public extension IconStyle where Self == IconBaseStyle {
    static var base: IconBaseStyle {
        IconBaseStyle()
    }
}

public extension IconStyle where Self == IconFioriStyle {
    static var fiori: IconFioriStyle {
        IconFioriStyle()
    }
}

// MARK: IconsStyle

public extension IconsStyle where Self == IconsBaseStyle {
    static var base: IconsBaseStyle {
        IconsBaseStyle()
    }
}

public extension IconsStyle where Self == IconsFioriStyle {
    static var fiori: IconsFioriStyle {
        IconsFioriStyle()
    }
}

// MARK: IllustratedMessageStyle

public extension IllustratedMessageStyle where Self == IllustratedMessageBaseStyle {
    static var base: IllustratedMessageBaseStyle {
        IllustratedMessageBaseStyle()
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageFioriStyle {
    static var fiori: IllustratedMessageFioriStyle {
        IllustratedMessageFioriStyle()
    }
}

public struct IllustratedMessageDetailImageStyle: IllustratedMessageStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> IllustratedMessageDetailImageStyle {
        IllustratedMessageDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> IllustratedMessageDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return IllustratedMessageDetailImageStyle(style: style)
    }
}

public struct IllustratedMessageTitleStyle: IllustratedMessageStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> IllustratedMessageTitleStyle {
        IllustratedMessageTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> IllustratedMessageTitleStyle {
        let style = AnyTitleStyle(content)
        return IllustratedMessageTitleStyle(style: style)
    }
}

public struct IllustratedMessageDescriptionStyle: IllustratedMessageStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> IllustratedMessageDescriptionStyle {
        IllustratedMessageDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> IllustratedMessageDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return IllustratedMessageDescriptionStyle(style: style)
    }
}

public struct IllustratedMessageActionStyle: IllustratedMessageStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> IllustratedMessageActionStyle {
        IllustratedMessageActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> IllustratedMessageActionStyle {
        let style = AnyActionStyle(content)
        return IllustratedMessageActionStyle(style: style)
    }
}

public struct IllustratedMessageSecondaryActionStyle: IllustratedMessageStyle {
    let style: any SecondaryActionStyle

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .secondaryActionStyle(self.style)
            .typeErased
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageSecondaryActionStyle {
    static func secondaryActionStyle(_ style: some SecondaryActionStyle) -> IllustratedMessageSecondaryActionStyle {
        IllustratedMessageSecondaryActionStyle(style: style)
    }

    static func secondaryActionStyle(@ViewBuilder content: @escaping (SecondaryActionConfiguration) -> some View) -> IllustratedMessageSecondaryActionStyle {
        let style = AnySecondaryActionStyle(content)
        return IllustratedMessageSecondaryActionStyle(style: style)
    }
}

// MARK: IncrementActionStyle

public extension IncrementActionStyle where Self == IncrementActionBaseStyle {
    static var base: IncrementActionBaseStyle {
        IncrementActionBaseStyle()
    }
}

public extension IncrementActionStyle where Self == IncrementActionFioriStyle {
    static var fiori: IncrementActionFioriStyle {
        IncrementActionFioriStyle()
    }
}

// MARK: InformationViewStyle

public extension InformationViewStyle where Self == InformationViewBaseStyle {
    static var base: InformationViewBaseStyle {
        InformationViewBaseStyle()
    }
}

public extension InformationViewStyle where Self == InformationViewFioriStyle {
    static var fiori: InformationViewFioriStyle {
        InformationViewFioriStyle()
    }
}

public struct InformationViewIconStyle: InformationViewStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension InformationViewStyle where Self == InformationViewIconStyle {
    static func iconStyle(_ style: some IconStyle) -> InformationViewIconStyle {
        InformationViewIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> InformationViewIconStyle {
        let style = AnyIconStyle(content)
        return InformationViewIconStyle(style: style)
    }
}

public struct InformationViewDescriptionStyle: InformationViewStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension InformationViewStyle where Self == InformationViewDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> InformationViewDescriptionStyle {
        InformationViewDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> InformationViewDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return InformationViewDescriptionStyle(style: style)
    }
}

// MARK: JouleWelcomeScreenStyle

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenBaseStyle {
    static var base: JouleWelcomeScreenBaseStyle {
        JouleWelcomeScreenBaseStyle()
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenFioriStyle {
    static var fiori: JouleWelcomeScreenFioriStyle {
        JouleWelcomeScreenFioriStyle()
    }
}

public struct JouleWelcomeScreenMediaImageStyle: JouleWelcomeScreenStyle {
    let style: any MediaImageStyle

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .mediaImageStyle(self.style)
            .typeErased
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenMediaImageStyle {
    static func mediaImageStyle(_ style: some MediaImageStyle) -> JouleWelcomeScreenMediaImageStyle {
        JouleWelcomeScreenMediaImageStyle(style: style)
    }

    static func mediaImageStyle(@ViewBuilder content: @escaping (MediaImageConfiguration) -> some View) -> JouleWelcomeScreenMediaImageStyle {
        let style = AnyMediaImageStyle(content)
        return JouleWelcomeScreenMediaImageStyle(style: style)
    }
}

public struct JouleWelcomeScreenGreetingTextStyle: JouleWelcomeScreenStyle {
    let style: any GreetingTextStyle

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .greetingTextStyle(self.style)
            .typeErased
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenGreetingTextStyle {
    static func greetingTextStyle(_ style: some GreetingTextStyle) -> JouleWelcomeScreenGreetingTextStyle {
        JouleWelcomeScreenGreetingTextStyle(style: style)
    }

    static func greetingTextStyle(@ViewBuilder content: @escaping (GreetingTextConfiguration) -> some View) -> JouleWelcomeScreenGreetingTextStyle {
        let style = AnyGreetingTextStyle(content)
        return JouleWelcomeScreenGreetingTextStyle(style: style)
    }
}

public struct JouleWelcomeScreenTitleStyle: JouleWelcomeScreenStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> JouleWelcomeScreenTitleStyle {
        JouleWelcomeScreenTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> JouleWelcomeScreenTitleStyle {
        let style = AnyTitleStyle(content)
        return JouleWelcomeScreenTitleStyle(style: style)
    }
}

public struct JouleWelcomeScreenFootnoteStyle: JouleWelcomeScreenStyle {
    let style: any FootnoteStyle

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .footnoteStyle(self.style)
            .typeErased
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenFootnoteStyle {
    static func footnoteStyle(_ style: some FootnoteStyle) -> JouleWelcomeScreenFootnoteStyle {
        JouleWelcomeScreenFootnoteStyle(style: style)
    }

    static func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> JouleWelcomeScreenFootnoteStyle {
        let style = AnyFootnoteStyle(content)
        return JouleWelcomeScreenFootnoteStyle(style: style)
    }
}

public struct JouleWelcomeScreenMessageContentStyle: JouleWelcomeScreenStyle {
    let style: any MessageContentStyle

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .messageContentStyle(self.style)
            .typeErased
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenMessageContentStyle {
    static func messageContentStyle(_ style: some MessageContentStyle) -> JouleWelcomeScreenMessageContentStyle {
        JouleWelcomeScreenMessageContentStyle(style: style)
    }

    static func messageContentStyle(@ViewBuilder content: @escaping (MessageContentConfiguration) -> some View) -> JouleWelcomeScreenMessageContentStyle {
        let style = AnyMessageContentStyle(content)
        return JouleWelcomeScreenMessageContentStyle(style: style)
    }
}

// MARK: KeyValueFormViewStyle

public extension KeyValueFormViewStyle where Self == KeyValueFormViewBaseStyle {
    static var base: KeyValueFormViewBaseStyle {
        KeyValueFormViewBaseStyle()
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewFioriStyle {
    static var fiori: KeyValueFormViewFioriStyle {
        KeyValueFormViewFioriStyle()
    }
}

public struct KeyValueFormViewTitleStyle: KeyValueFormViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> KeyValueFormViewTitleStyle {
        KeyValueFormViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> KeyValueFormViewTitleStyle {
        let style = AnyTitleStyle(content)
        return KeyValueFormViewTitleStyle(style: style)
    }
}

public struct KeyValueFormViewTextViewStyle: KeyValueFormViewStyle {
    let style: any TextViewStyle

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .textViewStyle(self.style)
            .typeErased
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewTextViewStyle {
    static func textViewStyle(_ style: some TextViewStyle) -> KeyValueFormViewTextViewStyle {
        KeyValueFormViewTextViewStyle(style: style)
    }

    static func textViewStyle(@ViewBuilder content: @escaping (TextViewConfiguration) -> some View) -> KeyValueFormViewTextViewStyle {
        let style = AnyTextViewStyle(content)
        return KeyValueFormViewTextViewStyle(style: style)
    }
}

public struct KeyValueFormViewPlaceholderStyle: KeyValueFormViewStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> KeyValueFormViewPlaceholderStyle {
        KeyValueFormViewPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> KeyValueFormViewPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return KeyValueFormViewPlaceholderStyle(style: style)
    }
}

public struct KeyValueFormViewMandatoryFieldIndicatorStyle: KeyValueFormViewStyle {
    let style: any MandatoryFieldIndicatorStyle

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .mandatoryFieldIndicatorStyle(self.style)
            .typeErased
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewMandatoryFieldIndicatorStyle {
    static func mandatoryFieldIndicatorStyle(_ style: some MandatoryFieldIndicatorStyle) -> KeyValueFormViewMandatoryFieldIndicatorStyle {
        KeyValueFormViewMandatoryFieldIndicatorStyle(style: style)
    }

    static func mandatoryFieldIndicatorStyle(@ViewBuilder content: @escaping (MandatoryFieldIndicatorConfiguration) -> some View) -> KeyValueFormViewMandatoryFieldIndicatorStyle {
        let style = AnyMandatoryFieldIndicatorStyle(content)
        return KeyValueFormViewMandatoryFieldIndicatorStyle(style: style)
    }
}

public struct KeyValueFormViewNoteFormViewStyle: KeyValueFormViewStyle {
    let style: any NoteFormViewStyle

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .noteFormViewStyle(self.style)
            .typeErased
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewNoteFormViewStyle {
    static func noteFormViewStyle(_ style: some NoteFormViewStyle) -> KeyValueFormViewNoteFormViewStyle {
        KeyValueFormViewNoteFormViewStyle(style: style)
    }

    static func noteFormViewStyle(@ViewBuilder content: @escaping (NoteFormViewConfiguration) -> some View) -> KeyValueFormViewNoteFormViewStyle {
        let style = AnyNoteFormViewStyle(content)
        return KeyValueFormViewNoteFormViewStyle(style: style)
    }
}

// MARK: KpiCaptionStyle

public extension KpiCaptionStyle where Self == KpiCaptionBaseStyle {
    static var base: KpiCaptionBaseStyle {
        KpiCaptionBaseStyle()
    }
}

public extension KpiCaptionStyle where Self == KpiCaptionFioriStyle {
    static var fiori: KpiCaptionFioriStyle {
        KpiCaptionFioriStyle()
    }
}

// MARK: KpiStyle

public extension KpiStyle where Self == KpiBaseStyle {
    static var base: KpiBaseStyle {
        KpiBaseStyle()
    }
}

public extension KpiStyle where Self == KpiFioriStyle {
    static var fiori: KpiFioriStyle {
        KpiFioriStyle()
    }
}

// MARK: LabelItemStyle

public extension LabelItemStyle where Self == LabelItemBaseStyle {
    static var base: LabelItemBaseStyle {
        LabelItemBaseStyle()
    }
}

public extension LabelItemStyle where Self == LabelItemFioriStyle {
    static var fiori: LabelItemFioriStyle {
        LabelItemFioriStyle()
    }
}

public struct LabelItemIconStyle: LabelItemStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: LabelItemConfiguration) -> some View {
        LabelItem(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension LabelItemStyle where Self == LabelItemIconStyle {
    static func iconStyle(_ style: some IconStyle) -> LabelItemIconStyle {
        LabelItemIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> LabelItemIconStyle {
        let style = AnyIconStyle(content)
        return LabelItemIconStyle(style: style)
    }
}

public struct LabelItemTitleStyle: LabelItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: LabelItemConfiguration) -> some View {
        LabelItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension LabelItemStyle where Self == LabelItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> LabelItemTitleStyle {
        LabelItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> LabelItemTitleStyle {
        let style = AnyTitleStyle(content)
        return LabelItemTitleStyle(style: style)
    }
}

// MARK: LinearProgressIndicatorStyle

public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorBaseStyle {
    static var base: LinearProgressIndicatorBaseStyle {
        LinearProgressIndicatorBaseStyle()
    }
}

public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorFioriStyle {
    static var fiori: LinearProgressIndicatorFioriStyle {
        LinearProgressIndicatorFioriStyle()
    }
}

// MARK: LinearProgressIndicatorViewStyle

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewBaseStyle {
    static var base: LinearProgressIndicatorViewBaseStyle {
        LinearProgressIndicatorViewBaseStyle()
    }
}

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewFioriStyle {
    static var fiori: LinearProgressIndicatorViewFioriStyle {
        LinearProgressIndicatorViewFioriStyle()
    }
}

public struct LinearProgressIndicatorViewLinearProgressIndicatorStyle: LinearProgressIndicatorViewStyle {
    let style: any LinearProgressIndicatorStyle

    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(self.style)
            .typeErased
    }
}

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewLinearProgressIndicatorStyle {
    static func linearProgressIndicatorStyle(_ style: some LinearProgressIndicatorStyle) -> LinearProgressIndicatorViewLinearProgressIndicatorStyle {
        LinearProgressIndicatorViewLinearProgressIndicatorStyle(style: style)
    }

    static func linearProgressIndicatorStyle(@ViewBuilder content: @escaping (LinearProgressIndicatorConfiguration) -> some View) -> LinearProgressIndicatorViewLinearProgressIndicatorStyle {
        let style = AnyLinearProgressIndicatorStyle(content)
        return LinearProgressIndicatorViewLinearProgressIndicatorStyle(style: style)
    }
}

public struct LinearProgressIndicatorViewIconStyle: LinearProgressIndicatorViewStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewIconStyle {
    static func iconStyle(_ style: some IconStyle) -> LinearProgressIndicatorViewIconStyle {
        LinearProgressIndicatorViewIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> LinearProgressIndicatorViewIconStyle {
        let style = AnyIconStyle(content)
        return LinearProgressIndicatorViewIconStyle(style: style)
    }
}

public struct LinearProgressIndicatorViewDescriptionStyle: LinearProgressIndicatorViewStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> LinearProgressIndicatorViewDescriptionStyle {
        LinearProgressIndicatorViewDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> LinearProgressIndicatorViewDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return LinearProgressIndicatorViewDescriptionStyle(style: style)
    }
}

// MARK: ListPickerContentStyle

public extension ListPickerContentStyle where Self == ListPickerContentBaseStyle {
    static var base: ListPickerContentBaseStyle {
        ListPickerContentBaseStyle()
    }
}

public extension ListPickerContentStyle where Self == ListPickerContentFioriStyle {
    static var fiori: ListPickerContentFioriStyle {
        ListPickerContentFioriStyle()
    }
}

// MARK: ListPickerDestinationStyle

public extension ListPickerDestinationStyle where Self == ListPickerDestinationBaseStyle {
    static var base: ListPickerDestinationBaseStyle {
        ListPickerDestinationBaseStyle()
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationFioriStyle {
    static var fiori: ListPickerDestinationFioriStyle {
        ListPickerDestinationFioriStyle()
    }
}

public struct ListPickerDestinationCancelActionStyle: ListPickerDestinationStyle {
    let style: any CancelActionStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .cancelActionStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationCancelActionStyle {
    static func cancelActionStyle(_ style: some CancelActionStyle) -> ListPickerDestinationCancelActionStyle {
        ListPickerDestinationCancelActionStyle(style: style)
    }

    static func cancelActionStyle(@ViewBuilder content: @escaping (CancelActionConfiguration) -> some View) -> ListPickerDestinationCancelActionStyle {
        let style = AnyCancelActionStyle(content)
        return ListPickerDestinationCancelActionStyle(style: style)
    }
}

public struct ListPickerDestinationApplyActionStyle: ListPickerDestinationStyle {
    let style: any ApplyActionStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .applyActionStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationApplyActionStyle {
    static func applyActionStyle(_ style: some ApplyActionStyle) -> ListPickerDestinationApplyActionStyle {
        ListPickerDestinationApplyActionStyle(style: style)
    }

    static func applyActionStyle(@ViewBuilder content: @escaping (ApplyActionConfiguration) -> some View) -> ListPickerDestinationApplyActionStyle {
        let style = AnyApplyActionStyle(content)
        return ListPickerDestinationApplyActionStyle(style: style)
    }
}

public struct ListPickerDestinationSelectedEntriesSectionTitleStyle: ListPickerDestinationStyle {
    let style: any SelectedEntriesSectionTitleStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .selectedEntriesSectionTitleStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationSelectedEntriesSectionTitleStyle {
    static func selectedEntriesSectionTitleStyle(_ style: some SelectedEntriesSectionTitleStyle) -> ListPickerDestinationSelectedEntriesSectionTitleStyle {
        ListPickerDestinationSelectedEntriesSectionTitleStyle(style: style)
    }

    static func selectedEntriesSectionTitleStyle(@ViewBuilder content: @escaping (SelectedEntriesSectionTitleConfiguration) -> some View) -> ListPickerDestinationSelectedEntriesSectionTitleStyle {
        let style = AnySelectedEntriesSectionTitleStyle(content)
        return ListPickerDestinationSelectedEntriesSectionTitleStyle(style: style)
    }
}

public struct ListPickerDestinationSelectAllActionStyle: ListPickerDestinationStyle {
    let style: any SelectAllActionStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .selectAllActionStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationSelectAllActionStyle {
    static func selectAllActionStyle(_ style: some SelectAllActionStyle) -> ListPickerDestinationSelectAllActionStyle {
        ListPickerDestinationSelectAllActionStyle(style: style)
    }

    static func selectAllActionStyle(@ViewBuilder content: @escaping (SelectAllActionConfiguration) -> some View) -> ListPickerDestinationSelectAllActionStyle {
        let style = AnySelectAllActionStyle(content)
        return ListPickerDestinationSelectAllActionStyle(style: style)
    }
}

public struct ListPickerDestinationDeselectAllActionStyle: ListPickerDestinationStyle {
    let style: any DeselectAllActionStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .deselectAllActionStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationDeselectAllActionStyle {
    static func deselectAllActionStyle(_ style: some DeselectAllActionStyle) -> ListPickerDestinationDeselectAllActionStyle {
        ListPickerDestinationDeselectAllActionStyle(style: style)
    }

    static func deselectAllActionStyle(@ViewBuilder content: @escaping (DeselectAllActionConfiguration) -> some View) -> ListPickerDestinationDeselectAllActionStyle {
        let style = AnyDeselectAllActionStyle(content)
        return ListPickerDestinationDeselectAllActionStyle(style: style)
    }
}

public struct ListPickerDestinationAllEntriesSectionTitleStyle: ListPickerDestinationStyle {
    let style: any AllEntriesSectionTitleStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .allEntriesSectionTitleStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationAllEntriesSectionTitleStyle {
    static func allEntriesSectionTitleStyle(_ style: some AllEntriesSectionTitleStyle) -> ListPickerDestinationAllEntriesSectionTitleStyle {
        ListPickerDestinationAllEntriesSectionTitleStyle(style: style)
    }

    static func allEntriesSectionTitleStyle(@ViewBuilder content: @escaping (AllEntriesSectionTitleConfiguration) -> some View) -> ListPickerDestinationAllEntriesSectionTitleStyle {
        let style = AnyAllEntriesSectionTitleStyle(content)
        return ListPickerDestinationAllEntriesSectionTitleStyle(style: style)
    }
}

public struct ListPickerDestinationListPickerContentStyle: ListPickerDestinationStyle {
    let style: any ListPickerContentStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .listPickerContentStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationListPickerContentStyle {
    static func listPickerContentStyle(_ style: some ListPickerContentStyle) -> ListPickerDestinationListPickerContentStyle {
        ListPickerDestinationListPickerContentStyle(style: style)
    }

    static func listPickerContentStyle(@ViewBuilder content: @escaping (ListPickerContentConfiguration) -> some View) -> ListPickerDestinationListPickerContentStyle {
        let style = AnyListPickerContentStyle(content)
        return ListPickerDestinationListPickerContentStyle(style: style)
    }
}

// MARK: ListPickerItemStyle

public extension ListPickerItemStyle where Self == ListPickerItemBaseStyle {
    static var base: ListPickerItemBaseStyle {
        ListPickerItemBaseStyle()
    }
}

public extension ListPickerItemStyle where Self == ListPickerItemFioriStyle {
    static var fiori: ListPickerItemFioriStyle {
        ListPickerItemFioriStyle()
    }
}

public struct ListPickerItemTitleStyle: ListPickerItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        ListPickerItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ListPickerItemStyle where Self == ListPickerItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ListPickerItemTitleStyle {
        ListPickerItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ListPickerItemTitleStyle {
        let style = AnyTitleStyle(content)
        return ListPickerItemTitleStyle(style: style)
    }
}

public struct ListPickerItemValueStyle: ListPickerItemStyle {
    let style: any ValueStyle

    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        ListPickerItem(configuration)
            .valueStyle(self.style)
            .typeErased
    }
}

public extension ListPickerItemStyle where Self == ListPickerItemValueStyle {
    static func valueStyle(_ style: some ValueStyle) -> ListPickerItemValueStyle {
        ListPickerItemValueStyle(style: style)
    }

    static func valueStyle(@ViewBuilder content: @escaping (ValueConfiguration) -> some View) -> ListPickerItemValueStyle {
        let style = AnyValueStyle(content)
        return ListPickerItemValueStyle(style: style)
    }
}

// MARK: MandatoryFieldIndicatorStyle

public extension MandatoryFieldIndicatorStyle where Self == MandatoryFieldIndicatorBaseStyle {
    static var base: MandatoryFieldIndicatorBaseStyle {
        MandatoryFieldIndicatorBaseStyle()
    }
}

public extension MandatoryFieldIndicatorStyle where Self == MandatoryFieldIndicatorFioriStyle {
    static var fiori: MandatoryFieldIndicatorFioriStyle {
        MandatoryFieldIndicatorFioriStyle()
    }
}

// MARK: MediaImageStyle

public extension MediaImageStyle where Self == MediaImageBaseStyle {
    static var base: MediaImageBaseStyle {
        MediaImageBaseStyle()
    }
}

public extension MediaImageStyle where Self == MediaImageFioriStyle {
    static var fiori: MediaImageFioriStyle {
        MediaImageFioriStyle()
    }
}

// MARK: MenuSelectionStyle

public extension MenuSelectionStyle where Self == MenuSelectionBaseStyle {
    static var base: MenuSelectionBaseStyle {
        MenuSelectionBaseStyle()
    }
}

public extension MenuSelectionStyle where Self == MenuSelectionFioriStyle {
    static var fiori: MenuSelectionFioriStyle {
        MenuSelectionFioriStyle()
    }
}

public struct MenuSelectionActionStyle: MenuSelectionStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
        MenuSelection(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension MenuSelectionStyle where Self == MenuSelectionActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> MenuSelectionActionStyle {
        MenuSelectionActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> MenuSelectionActionStyle {
        let style = AnyActionStyle(content)
        return MenuSelectionActionStyle(style: style)
    }
}

// MARK: MenuSelectionItemStyle

public extension MenuSelectionItemStyle where Self == MenuSelectionItemBaseStyle {
    static var base: MenuSelectionItemBaseStyle {
        MenuSelectionItemBaseStyle()
    }
}

public extension MenuSelectionItemStyle where Self == MenuSelectionItemFioriStyle {
    static var fiori: MenuSelectionItemFioriStyle {
        MenuSelectionItemFioriStyle()
    }
}

public struct MenuSelectionItemIconStyle: MenuSelectionItemStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        MenuSelectionItem(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension MenuSelectionItemStyle where Self == MenuSelectionItemIconStyle {
    static func iconStyle(_ style: some IconStyle) -> MenuSelectionItemIconStyle {
        MenuSelectionItemIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> MenuSelectionItemIconStyle {
        let style = AnyIconStyle(content)
        return MenuSelectionItemIconStyle(style: style)
    }
}

public struct MenuSelectionItemTitleStyle: MenuSelectionItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        MenuSelectionItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension MenuSelectionItemStyle where Self == MenuSelectionItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> MenuSelectionItemTitleStyle {
        MenuSelectionItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> MenuSelectionItemTitleStyle {
        let style = AnyTitleStyle(content)
        return MenuSelectionItemTitleStyle(style: style)
    }
}

// MARK: MessageContentStyle

public extension MessageContentStyle where Self == MessageContentBaseStyle {
    static var base: MessageContentBaseStyle {
        MessageContentBaseStyle()
    }
}

public extension MessageContentStyle where Self == MessageContentFioriStyle {
    static var fiori: MessageContentFioriStyle {
        MessageContentFioriStyle()
    }
}

// MARK: MoreActionOverflowStyle

public extension MoreActionOverflowStyle where Self == MoreActionOverflowBaseStyle {
    static var base: MoreActionOverflowBaseStyle {
        MoreActionOverflowBaseStyle()
    }
}

public extension MoreActionOverflowStyle where Self == MoreActionOverflowFioriStyle {
    static var fiori: MoreActionOverflowFioriStyle {
        MoreActionOverflowFioriStyle()
    }
}

// MARK: NoteFormViewStyle

public extension NoteFormViewStyle where Self == NoteFormViewBaseStyle {
    static var base: NoteFormViewBaseStyle {
        NoteFormViewBaseStyle()
    }
}

public extension NoteFormViewStyle where Self == NoteFormViewFioriStyle {
    static var fiori: NoteFormViewFioriStyle {
        NoteFormViewFioriStyle()
    }
}

public struct NoteFormViewTextViewStyle: NoteFormViewStyle {
    let style: any TextViewStyle

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .textViewStyle(self.style)
            .typeErased
    }
}

public extension NoteFormViewStyle where Self == NoteFormViewTextViewStyle {
    static func textViewStyle(_ style: some TextViewStyle) -> NoteFormViewTextViewStyle {
        NoteFormViewTextViewStyle(style: style)
    }

    static func textViewStyle(@ViewBuilder content: @escaping (TextViewConfiguration) -> some View) -> NoteFormViewTextViewStyle {
        let style = AnyTextViewStyle(content)
        return NoteFormViewTextViewStyle(style: style)
    }
}

public struct NoteFormViewPlaceholderStyle: NoteFormViewStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension NoteFormViewStyle where Self == NoteFormViewPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> NoteFormViewPlaceholderStyle {
        NoteFormViewPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> NoteFormViewPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return NoteFormViewPlaceholderStyle(style: style)
    }
}

public struct NoteFormViewPlaceholderTextEditorStyle: NoteFormViewStyle {
    let style: any PlaceholderTextEditorStyle

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .placeholderTextEditorStyle(self.style)
            .typeErased
    }
}

public extension NoteFormViewStyle where Self == NoteFormViewPlaceholderTextEditorStyle {
    static func placeholderTextEditorStyle(_ style: some PlaceholderTextEditorStyle) -> NoteFormViewPlaceholderTextEditorStyle {
        NoteFormViewPlaceholderTextEditorStyle(style: style)
    }

    static func placeholderTextEditorStyle(@ViewBuilder content: @escaping (PlaceholderTextEditorConfiguration) -> some View) -> NoteFormViewPlaceholderTextEditorStyle {
        let style = AnyPlaceholderTextEditorStyle(content)
        return NoteFormViewPlaceholderTextEditorStyle(style: style)
    }
}

public struct NoteFormViewFormViewStyle: NoteFormViewStyle {
    let style: any FormViewStyle

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .formViewStyle(self.style)
            .typeErased
    }
}

public extension NoteFormViewStyle where Self == NoteFormViewFormViewStyle {
    static func formViewStyle(_ style: some FormViewStyle) -> NoteFormViewFormViewStyle {
        NoteFormViewFormViewStyle(style: style)
    }

    static func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> NoteFormViewFormViewStyle {
        let style = AnyFormViewStyle(content)
        return NoteFormViewFormViewStyle(style: style)
    }
}

// MARK: NowIndicatorNodeStyle

public extension NowIndicatorNodeStyle where Self == NowIndicatorNodeBaseStyle {
    static var base: NowIndicatorNodeBaseStyle {
        NowIndicatorNodeBaseStyle()
    }
}

public extension NowIndicatorNodeStyle where Self == NowIndicatorNodeFioriStyle {
    static var fiori: NowIndicatorNodeFioriStyle {
        NowIndicatorNodeFioriStyle()
    }
}

// MARK: ObjectItemStyle

public extension ObjectItemStyle where Self == ObjectItemBaseStyle {
    static var base: ObjectItemBaseStyle {
        ObjectItemBaseStyle()
    }
}

public extension ObjectItemStyle where Self == ObjectItemFioriStyle {
    static var fiori: ObjectItemFioriStyle {
        ObjectItemFioriStyle()
    }
}

public struct ObjectItemTitleStyle: ObjectItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ObjectItemTitleStyle {
        ObjectItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ObjectItemTitleStyle {
        let style = AnyTitleStyle(content)
        return ObjectItemTitleStyle(style: style)
    }
}

public struct ObjectItemSubtitleStyle: ObjectItemStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> ObjectItemSubtitleStyle {
        ObjectItemSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> ObjectItemSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return ObjectItemSubtitleStyle(style: style)
    }
}

public struct ObjectItemFootnoteStyle: ObjectItemStyle {
    let style: any FootnoteStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .footnoteStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemFootnoteStyle {
    static func footnoteStyle(_ style: some FootnoteStyle) -> ObjectItemFootnoteStyle {
        ObjectItemFootnoteStyle(style: style)
    }

    static func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> ObjectItemFootnoteStyle {
        let style = AnyFootnoteStyle(content)
        return ObjectItemFootnoteStyle(style: style)
    }
}

public struct ObjectItemDescriptionStyle: ObjectItemStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> ObjectItemDescriptionStyle {
        ObjectItemDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> ObjectItemDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return ObjectItemDescriptionStyle(style: style)
    }
}

public struct ObjectItemStatusStyle: ObjectItemStyle {
    let style: any StatusStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .statusStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemStatusStyle {
    static func statusStyle(_ style: some StatusStyle) -> ObjectItemStatusStyle {
        ObjectItemStatusStyle(style: style)
    }

    static func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> ObjectItemStatusStyle {
        let style = AnyStatusStyle(content)
        return ObjectItemStatusStyle(style: style)
    }
}

public struct ObjectItemSubstatusStyle: ObjectItemStyle {
    let style: any SubstatusStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .substatusStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemSubstatusStyle {
    static func substatusStyle(_ style: some SubstatusStyle) -> ObjectItemSubstatusStyle {
        ObjectItemSubstatusStyle(style: style)
    }

    static func substatusStyle(@ViewBuilder content: @escaping (SubstatusConfiguration) -> some View) -> ObjectItemSubstatusStyle {
        let style = AnySubstatusStyle(content)
        return ObjectItemSubstatusStyle(style: style)
    }
}

public struct ObjectItemDetailImageStyle: ObjectItemStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> ObjectItemDetailImageStyle {
        ObjectItemDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> ObjectItemDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return ObjectItemDetailImageStyle(style: style)
    }
}

public struct ObjectItemIconsStyle: ObjectItemStyle {
    let style: any IconsStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .iconsStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemIconsStyle {
    static func iconsStyle(_ style: some IconsStyle) -> ObjectItemIconsStyle {
        ObjectItemIconsStyle(style: style)
    }

    static func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> ObjectItemIconsStyle {
        let style = AnyIconsStyle(content)
        return ObjectItemIconsStyle(style: style)
    }
}

public struct ObjectItemAvatarsStyle: ObjectItemStyle {
    let style: any AvatarsStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .avatarsStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemAvatarsStyle {
    static func avatarsStyle(_ style: some AvatarsStyle) -> ObjectItemAvatarsStyle {
        ObjectItemAvatarsStyle(style: style)
    }

    static func avatarsStyle(@ViewBuilder content: @escaping (AvatarsConfiguration) -> some View) -> ObjectItemAvatarsStyle {
        let style = AnyAvatarsStyle(content)
        return ObjectItemAvatarsStyle(style: style)
    }
}

public struct ObjectItemFootnoteIconsStyle: ObjectItemStyle {
    let style: any FootnoteIconsStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .footnoteIconsStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemFootnoteIconsStyle {
    static func footnoteIconsStyle(_ style: some FootnoteIconsStyle) -> ObjectItemFootnoteIconsStyle {
        ObjectItemFootnoteIconsStyle(style: style)
    }

    static func footnoteIconsStyle(@ViewBuilder content: @escaping (FootnoteIconsConfiguration) -> some View) -> ObjectItemFootnoteIconsStyle {
        let style = AnyFootnoteIconsStyle(content)
        return ObjectItemFootnoteIconsStyle(style: style)
    }
}

public struct ObjectItemFootnoteIconsTextStyle: ObjectItemStyle {
    let style: any FootnoteIconsTextStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .footnoteIconsTextStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemFootnoteIconsTextStyle {
    static func footnoteIconsTextStyle(_ style: some FootnoteIconsTextStyle) -> ObjectItemFootnoteIconsTextStyle {
        ObjectItemFootnoteIconsTextStyle(style: style)
    }

    static func footnoteIconsTextStyle(@ViewBuilder content: @escaping (FootnoteIconsTextConfiguration) -> some View) -> ObjectItemFootnoteIconsTextStyle {
        let style = AnyFootnoteIconsTextStyle(content)
        return ObjectItemFootnoteIconsTextStyle(style: style)
    }
}

public struct ObjectItemTagsStyle: ObjectItemStyle {
    let style: any TagsStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .tagsStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemTagsStyle {
    static func tagsStyle(_ style: some TagsStyle) -> ObjectItemTagsStyle {
        ObjectItemTagsStyle(style: style)
    }

    static func tagsStyle(@ViewBuilder content: @escaping (TagsConfiguration) -> some View) -> ObjectItemTagsStyle {
        let style = AnyTagsStyle(content)
        return ObjectItemTagsStyle(style: style)
    }
}

public struct ObjectItemActionStyle: ObjectItemStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> ObjectItemActionStyle {
        ObjectItemActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> ObjectItemActionStyle {
        let style = AnyActionStyle(content)
        return ObjectItemActionStyle(style: style)
    }
}

// MARK: OffStarImageStyle

public extension OffStarImageStyle where Self == OffStarImageBaseStyle {
    static var base: OffStarImageBaseStyle {
        OffStarImageBaseStyle()
    }
}

public extension OffStarImageStyle where Self == OffStarImageFioriStyle {
    static var fiori: OffStarImageFioriStyle {
        OffStarImageFioriStyle()
    }
}

// MARK: OnStarImageStyle

public extension OnStarImageStyle where Self == OnStarImageBaseStyle {
    static var base: OnStarImageBaseStyle {
        OnStarImageBaseStyle()
    }
}

public extension OnStarImageStyle where Self == OnStarImageFioriStyle {
    static var fiori: OnStarImageFioriStyle {
        OnStarImageFioriStyle()
    }
}

// MARK: OptionalTitleStyle

public extension OptionalTitleStyle where Self == OptionalTitleBaseStyle {
    static var base: OptionalTitleBaseStyle {
        OptionalTitleBaseStyle()
    }
}

public extension OptionalTitleStyle where Self == OptionalTitleFioriStyle {
    static var fiori: OptionalTitleFioriStyle {
        OptionalTitleFioriStyle()
    }
}

// MARK: OptionsStyle

public extension OptionsStyle where Self == OptionsBaseStyle {
    static var base: OptionsBaseStyle {
        OptionsBaseStyle()
    }
}

public extension OptionsStyle where Self == OptionsFioriStyle {
    static var fiori: OptionsFioriStyle {
        OptionsFioriStyle()
    }
}

// MARK: OverflowActionStyle

public extension OverflowActionStyle where Self == OverflowActionBaseStyle {
    static var base: OverflowActionBaseStyle {
        OverflowActionBaseStyle()
    }
}

public extension OverflowActionStyle where Self == OverflowActionFioriStyle {
    static var fiori: OverflowActionFioriStyle {
        OverflowActionFioriStyle()
    }
}

// MARK: PlaceholderStyle

public extension PlaceholderStyle where Self == PlaceholderBaseStyle {
    static var base: PlaceholderBaseStyle {
        PlaceholderBaseStyle()
    }
}

public extension PlaceholderStyle where Self == PlaceholderFioriStyle {
    static var fiori: PlaceholderFioriStyle {
        PlaceholderFioriStyle()
    }
}

// MARK: PlaceholderTextEditorStyle

public extension PlaceholderTextEditorStyle where Self == PlaceholderTextEditorBaseStyle {
    static var base: PlaceholderTextEditorBaseStyle {
        PlaceholderTextEditorBaseStyle()
    }
}

public extension PlaceholderTextEditorStyle where Self == PlaceholderTextEditorFioriStyle {
    static var fiori: PlaceholderTextEditorFioriStyle {
        PlaceholderTextEditorFioriStyle()
    }
}

public struct PlaceholderTextEditorTextViewStyle: PlaceholderTextEditorStyle {
    let style: any TextViewStyle

    public func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
        PlaceholderTextEditor(configuration)
            .textViewStyle(self.style)
            .typeErased
    }
}

public extension PlaceholderTextEditorStyle where Self == PlaceholderTextEditorTextViewStyle {
    static func textViewStyle(_ style: some TextViewStyle) -> PlaceholderTextEditorTextViewStyle {
        PlaceholderTextEditorTextViewStyle(style: style)
    }

    static func textViewStyle(@ViewBuilder content: @escaping (TextViewConfiguration) -> some View) -> PlaceholderTextEditorTextViewStyle {
        let style = AnyTextViewStyle(content)
        return PlaceholderTextEditorTextViewStyle(style: style)
    }
}

public struct PlaceholderTextEditorPlaceholderStyle: PlaceholderTextEditorStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
        PlaceholderTextEditor(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension PlaceholderTextEditorStyle where Self == PlaceholderTextEditorPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> PlaceholderTextEditorPlaceholderStyle {
        PlaceholderTextEditorPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> PlaceholderTextEditorPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return PlaceholderTextEditorPlaceholderStyle(style: style)
    }
}

// MARK: PlaceholderTextFieldStyle

public extension PlaceholderTextFieldStyle where Self == PlaceholderTextFieldBaseStyle {
    static var base: PlaceholderTextFieldBaseStyle {
        PlaceholderTextFieldBaseStyle()
    }
}

public extension PlaceholderTextFieldStyle where Self == PlaceholderTextFieldFioriStyle {
    static var fiori: PlaceholderTextFieldFioriStyle {
        PlaceholderTextFieldFioriStyle()
    }
}

public struct PlaceholderTextFieldTextInputFieldStyle: PlaceholderTextFieldStyle {
    let style: any TextInputFieldStyle

    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        PlaceholderTextField(configuration)
            .textInputFieldStyle(self.style)
            .typeErased
    }
}

public extension PlaceholderTextFieldStyle where Self == PlaceholderTextFieldTextInputFieldStyle {
    static func textInputFieldStyle(_ style: some TextInputFieldStyle) -> PlaceholderTextFieldTextInputFieldStyle {
        PlaceholderTextFieldTextInputFieldStyle(style: style)
    }

    static func textInputFieldStyle(@ViewBuilder content: @escaping (TextInputFieldConfiguration) -> some View) -> PlaceholderTextFieldTextInputFieldStyle {
        let style = AnyTextInputFieldStyle(content)
        return PlaceholderTextFieldTextInputFieldStyle(style: style)
    }
}

public struct PlaceholderTextFieldPlaceholderStyle: PlaceholderTextFieldStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        PlaceholderTextField(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension PlaceholderTextFieldStyle where Self == PlaceholderTextFieldPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> PlaceholderTextFieldPlaceholderStyle {
        PlaceholderTextFieldPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> PlaceholderTextFieldPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return PlaceholderTextFieldPlaceholderStyle(style: style)
    }
}

// MARK: ProfileHeaderStyle

public extension ProfileHeaderStyle where Self == ProfileHeaderBaseStyle {
    static var base: ProfileHeaderBaseStyle {
        ProfileHeaderBaseStyle()
    }
}

public extension ProfileHeaderStyle where Self == ProfileHeaderFioriStyle {
    static var fiori: ProfileHeaderFioriStyle {
        ProfileHeaderFioriStyle()
    }
}

public struct ProfileHeaderDetailImageStyle: ProfileHeaderStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension ProfileHeaderStyle where Self == ProfileHeaderDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> ProfileHeaderDetailImageStyle {
        ProfileHeaderDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> ProfileHeaderDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return ProfileHeaderDetailImageStyle(style: style)
    }
}

public struct ProfileHeaderTitleStyle: ProfileHeaderStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ProfileHeaderStyle where Self == ProfileHeaderTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ProfileHeaderTitleStyle {
        ProfileHeaderTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ProfileHeaderTitleStyle {
        let style = AnyTitleStyle(content)
        return ProfileHeaderTitleStyle(style: style)
    }
}

public struct ProfileHeaderSubtitleStyle: ProfileHeaderStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension ProfileHeaderStyle where Self == ProfileHeaderSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> ProfileHeaderSubtitleStyle {
        ProfileHeaderSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> ProfileHeaderSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return ProfileHeaderSubtitleStyle(style: style)
    }
}

public struct ProfileHeaderDescriptionStyle: ProfileHeaderStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension ProfileHeaderStyle where Self == ProfileHeaderDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> ProfileHeaderDescriptionStyle {
        ProfileHeaderDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> ProfileHeaderDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return ProfileHeaderDescriptionStyle(style: style)
    }
}

// MARK: RatingControlStyle

public extension RatingControlStyle where Self == RatingControlBaseStyle {
    static var base: RatingControlBaseStyle {
        RatingControlBaseStyle()
    }
}

public extension RatingControlStyle where Self == RatingControlFioriStyle {
    static var fiori: RatingControlFioriStyle {
        RatingControlFioriStyle()
    }
}

public struct RatingControlValueLabelStyle: RatingControlStyle {
    let style: any ValueLabelStyle

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .valueLabelStyle(self.style)
            .typeErased
    }
}

public extension RatingControlStyle where Self == RatingControlValueLabelStyle {
    static func valueLabelStyle(_ style: some ValueLabelStyle) -> RatingControlValueLabelStyle {
        RatingControlValueLabelStyle(style: style)
    }

    static func valueLabelStyle(@ViewBuilder content: @escaping (ValueLabelConfiguration) -> some View) -> RatingControlValueLabelStyle {
        let style = AnyValueLabelStyle(content)
        return RatingControlValueLabelStyle(style: style)
    }
}

public struct RatingControlOnStarImageStyle: RatingControlStyle {
    let style: any OnStarImageStyle

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .onStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlStyle where Self == RatingControlOnStarImageStyle {
    static func onStarImageStyle(_ style: some OnStarImageStyle) -> RatingControlOnStarImageStyle {
        RatingControlOnStarImageStyle(style: style)
    }

    static func onStarImageStyle(@ViewBuilder content: @escaping (OnStarImageConfiguration) -> some View) -> RatingControlOnStarImageStyle {
        let style = AnyOnStarImageStyle(content)
        return RatingControlOnStarImageStyle(style: style)
    }
}

public struct RatingControlOffStarImageStyle: RatingControlStyle {
    let style: any OffStarImageStyle

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .offStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlStyle where Self == RatingControlOffStarImageStyle {
    static func offStarImageStyle(_ style: some OffStarImageStyle) -> RatingControlOffStarImageStyle {
        RatingControlOffStarImageStyle(style: style)
    }

    static func offStarImageStyle(@ViewBuilder content: @escaping (OffStarImageConfiguration) -> some View) -> RatingControlOffStarImageStyle {
        let style = AnyOffStarImageStyle(content)
        return RatingControlOffStarImageStyle(style: style)
    }
}

public struct RatingControlHalfStarImageStyle: RatingControlStyle {
    let style: any HalfStarImageStyle

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .halfStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlStyle where Self == RatingControlHalfStarImageStyle {
    static func halfStarImageStyle(_ style: some HalfStarImageStyle) -> RatingControlHalfStarImageStyle {
        RatingControlHalfStarImageStyle(style: style)
    }

    static func halfStarImageStyle(@ViewBuilder content: @escaping (HalfStarImageConfiguration) -> some View) -> RatingControlHalfStarImageStyle {
        let style = AnyHalfStarImageStyle(content)
        return RatingControlHalfStarImageStyle(style: style)
    }
}

public struct RatingControlReviewCountLabelStyle: RatingControlStyle {
    let style: any ReviewCountLabelStyle

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .reviewCountLabelStyle(self.style)
            .typeErased
    }
}

public extension RatingControlStyle where Self == RatingControlReviewCountLabelStyle {
    static func reviewCountLabelStyle(_ style: some ReviewCountLabelStyle) -> RatingControlReviewCountLabelStyle {
        RatingControlReviewCountLabelStyle(style: style)
    }

    static func reviewCountLabelStyle(@ViewBuilder content: @escaping (ReviewCountLabelConfiguration) -> some View) -> RatingControlReviewCountLabelStyle {
        let style = AnyReviewCountLabelStyle(content)
        return RatingControlReviewCountLabelStyle(style: style)
    }
}

// MARK: RatingControlFormViewStyle

public extension RatingControlFormViewStyle where Self == RatingControlFormViewBaseStyle {
    static var base: RatingControlFormViewBaseStyle {
        RatingControlFormViewBaseStyle()
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewFioriStyle {
    static var fiori: RatingControlFormViewFioriStyle {
        RatingControlFormViewFioriStyle()
    }
}

public struct RatingControlFormViewTitleStyle: RatingControlFormViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> RatingControlFormViewTitleStyle {
        RatingControlFormViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> RatingControlFormViewTitleStyle {
        let style = AnyTitleStyle(content)
        return RatingControlFormViewTitleStyle(style: style)
    }
}

public struct RatingControlFormViewValueLabelStyle: RatingControlFormViewStyle {
    let style: any ValueLabelStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .valueLabelStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewValueLabelStyle {
    static func valueLabelStyle(_ style: some ValueLabelStyle) -> RatingControlFormViewValueLabelStyle {
        RatingControlFormViewValueLabelStyle(style: style)
    }

    static func valueLabelStyle(@ViewBuilder content: @escaping (ValueLabelConfiguration) -> some View) -> RatingControlFormViewValueLabelStyle {
        let style = AnyValueLabelStyle(content)
        return RatingControlFormViewValueLabelStyle(style: style)
    }
}

public struct RatingControlFormViewOnStarImageStyle: RatingControlFormViewStyle {
    let style: any OnStarImageStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .onStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewOnStarImageStyle {
    static func onStarImageStyle(_ style: some OnStarImageStyle) -> RatingControlFormViewOnStarImageStyle {
        RatingControlFormViewOnStarImageStyle(style: style)
    }

    static func onStarImageStyle(@ViewBuilder content: @escaping (OnStarImageConfiguration) -> some View) -> RatingControlFormViewOnStarImageStyle {
        let style = AnyOnStarImageStyle(content)
        return RatingControlFormViewOnStarImageStyle(style: style)
    }
}

public struct RatingControlFormViewOffStarImageStyle: RatingControlFormViewStyle {
    let style: any OffStarImageStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .offStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewOffStarImageStyle {
    static func offStarImageStyle(_ style: some OffStarImageStyle) -> RatingControlFormViewOffStarImageStyle {
        RatingControlFormViewOffStarImageStyle(style: style)
    }

    static func offStarImageStyle(@ViewBuilder content: @escaping (OffStarImageConfiguration) -> some View) -> RatingControlFormViewOffStarImageStyle {
        let style = AnyOffStarImageStyle(content)
        return RatingControlFormViewOffStarImageStyle(style: style)
    }
}

public struct RatingControlFormViewHalfStarImageStyle: RatingControlFormViewStyle {
    let style: any HalfStarImageStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .halfStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewHalfStarImageStyle {
    static func halfStarImageStyle(_ style: some HalfStarImageStyle) -> RatingControlFormViewHalfStarImageStyle {
        RatingControlFormViewHalfStarImageStyle(style: style)
    }

    static func halfStarImageStyle(@ViewBuilder content: @escaping (HalfStarImageConfiguration) -> some View) -> RatingControlFormViewHalfStarImageStyle {
        let style = AnyHalfStarImageStyle(content)
        return RatingControlFormViewHalfStarImageStyle(style: style)
    }
}

public struct RatingControlFormViewReviewCountLabelStyle: RatingControlFormViewStyle {
    let style: any ReviewCountLabelStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .reviewCountLabelStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewReviewCountLabelStyle {
    static func reviewCountLabelStyle(_ style: some ReviewCountLabelStyle) -> RatingControlFormViewReviewCountLabelStyle {
        RatingControlFormViewReviewCountLabelStyle(style: style)
    }

    static func reviewCountLabelStyle(@ViewBuilder content: @escaping (ReviewCountLabelConfiguration) -> some View) -> RatingControlFormViewReviewCountLabelStyle {
        let style = AnyReviewCountLabelStyle(content)
        return RatingControlFormViewReviewCountLabelStyle(style: style)
    }
}

public struct RatingControlFormViewSubtitleStyle: RatingControlFormViewStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> RatingControlFormViewSubtitleStyle {
        RatingControlFormViewSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> RatingControlFormViewSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return RatingControlFormViewSubtitleStyle(style: style)
    }
}

public struct RatingControlFormViewRatingControlStyle: RatingControlFormViewStyle {
    let style: any RatingControlStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .ratingControlStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewRatingControlStyle {
    static func ratingControlStyle(_ style: some RatingControlStyle) -> RatingControlFormViewRatingControlStyle {
        RatingControlFormViewRatingControlStyle(style: style)
    }

    static func ratingControlStyle(@ViewBuilder content: @escaping (RatingControlConfiguration) -> some View) -> RatingControlFormViewRatingControlStyle {
        let style = AnyRatingControlStyle(content)
        return RatingControlFormViewRatingControlStyle(style: style)
    }
}

// MARK: ReviewCountLabelStyle

public extension ReviewCountLabelStyle where Self == ReviewCountLabelBaseStyle {
    static var base: ReviewCountLabelBaseStyle {
        ReviewCountLabelBaseStyle()
    }
}

public extension ReviewCountLabelStyle where Self == ReviewCountLabelFioriStyle {
    static var fiori: ReviewCountLabelFioriStyle {
        ReviewCountLabelFioriStyle()
    }
}

// MARK: Row1Style

public extension Row1Style where Self == Row1BaseStyle {
    static var base: Row1BaseStyle {
        Row1BaseStyle()
    }
}

public extension Row1Style where Self == Row1FioriStyle {
    static var fiori: Row1FioriStyle {
        Row1FioriStyle()
    }
}

// MARK: Row2Style

public extension Row2Style where Self == Row2BaseStyle {
    static var base: Row2BaseStyle {
        Row2BaseStyle()
    }
}

public extension Row2Style where Self == Row2FioriStyle {
    static var fiori: Row2FioriStyle {
        Row2FioriStyle()
    }
}

// MARK: Row3Style

public extension Row3Style where Self == Row3BaseStyle {
    static var base: Row3BaseStyle {
        Row3BaseStyle()
    }
}

public extension Row3Style where Self == Row3FioriStyle {
    static var fiori: Row3FioriStyle {
        Row3FioriStyle()
    }
}

// MARK: SecondaryActionStyle

public extension SecondaryActionStyle where Self == SecondaryActionBaseStyle {
    static var base: SecondaryActionBaseStyle {
        SecondaryActionBaseStyle()
    }
}

public extension SecondaryActionStyle where Self == SecondaryActionFioriStyle {
    static var fiori: SecondaryActionFioriStyle {
        SecondaryActionFioriStyle()
    }
}

// MARK: SecondaryTimestampStyle

public extension SecondaryTimestampStyle where Self == SecondaryTimestampBaseStyle {
    static var base: SecondaryTimestampBaseStyle {
        SecondaryTimestampBaseStyle()
    }
}

public extension SecondaryTimestampStyle where Self == SecondaryTimestampFioriStyle {
    static var fiori: SecondaryTimestampFioriStyle {
        SecondaryTimestampFioriStyle()
    }
}

// MARK: SegmentedControlPickerStyle

public extension SegmentedControlPickerStyle where Self == SegmentedControlPickerBaseStyle {
    static var base: SegmentedControlPickerBaseStyle {
        SegmentedControlPickerBaseStyle()
    }
}

public extension SegmentedControlPickerStyle where Self == SegmentedControlPickerFioriStyle {
    static var fiori: SegmentedControlPickerFioriStyle {
        SegmentedControlPickerFioriStyle()
    }
}

public struct SegmentedControlPickerOptionsStyle: SegmentedControlPickerStyle {
    let style: any OptionsStyle

    public func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
        SegmentedControlPicker(configuration)
            .optionsStyle(self.style)
            .typeErased
    }
}

public extension SegmentedControlPickerStyle where Self == SegmentedControlPickerOptionsStyle {
    static func optionsStyle(_ style: some OptionsStyle) -> SegmentedControlPickerOptionsStyle {
        SegmentedControlPickerOptionsStyle(style: style)
    }

    static func optionsStyle(@ViewBuilder content: @escaping (OptionsConfiguration) -> some View) -> SegmentedControlPickerOptionsStyle {
        let style = AnyOptionsStyle(content)
        return SegmentedControlPickerOptionsStyle(style: style)
    }
}

// MARK: SelectAllActionStyle

public extension SelectAllActionStyle where Self == SelectAllActionBaseStyle {
    static var base: SelectAllActionBaseStyle {
        SelectAllActionBaseStyle()
    }
}

public extension SelectAllActionStyle where Self == SelectAllActionFioriStyle {
    static var fiori: SelectAllActionFioriStyle {
        SelectAllActionFioriStyle()
    }
}

// MARK: SelectedEntriesSectionTitleStyle

public extension SelectedEntriesSectionTitleStyle where Self == SelectedEntriesSectionTitleBaseStyle {
    static var base: SelectedEntriesSectionTitleBaseStyle {
        SelectedEntriesSectionTitleBaseStyle()
    }
}

public extension SelectedEntriesSectionTitleStyle where Self == SelectedEntriesSectionTitleFioriStyle {
    static var fiori: SelectedEntriesSectionTitleFioriStyle {
        SelectedEntriesSectionTitleFioriStyle()
    }
}

// MARK: SideBarStyle

public extension SideBarStyle where Self == SideBarBaseStyle {
    static var base: SideBarBaseStyle {
        SideBarBaseStyle()
    }
}

public extension SideBarStyle where Self == SideBarFioriStyle {
    static var fiori: SideBarFioriStyle {
        SideBarFioriStyle()
    }
}

// MARK: SideBarListItemStyle

public extension SideBarListItemStyle where Self == SideBarListItemBaseStyle {
    static var base: SideBarListItemBaseStyle {
        SideBarListItemBaseStyle()
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemFioriStyle {
    static var fiori: SideBarListItemFioriStyle {
        SideBarListItemFioriStyle()
    }
}

public struct SideBarListItemIconStyle: SideBarListItemStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemIconStyle {
    static func iconStyle(_ style: some IconStyle) -> SideBarListItemIconStyle {
        SideBarListItemIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> SideBarListItemIconStyle {
        let style = AnyIconStyle(content)
        return SideBarListItemIconStyle(style: style)
    }
}

public struct SideBarListItemFilledIconStyle: SideBarListItemStyle {
    let style: any FilledIconStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .filledIconStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemFilledIconStyle {
    static func filledIconStyle(_ style: some FilledIconStyle) -> SideBarListItemFilledIconStyle {
        SideBarListItemFilledIconStyle(style: style)
    }

    static func filledIconStyle(@ViewBuilder content: @escaping (FilledIconConfiguration) -> some View) -> SideBarListItemFilledIconStyle {
        let style = AnyFilledIconStyle(content)
        return SideBarListItemFilledIconStyle(style: style)
    }
}

public struct SideBarListItemTitleStyle: SideBarListItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> SideBarListItemTitleStyle {
        SideBarListItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> SideBarListItemTitleStyle {
        let style = AnyTitleStyle(content)
        return SideBarListItemTitleStyle(style: style)
    }
}

public struct SideBarListItemSubtitleStyle: SideBarListItemStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> SideBarListItemSubtitleStyle {
        SideBarListItemSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> SideBarListItemSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return SideBarListItemSubtitleStyle(style: style)
    }
}

public struct SideBarListItemAccessoryIconStyle: SideBarListItemStyle {
    let style: any AccessoryIconStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .accessoryIconStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemAccessoryIconStyle {
    static func accessoryIconStyle(_ style: some AccessoryIconStyle) -> SideBarListItemAccessoryIconStyle {
        SideBarListItemAccessoryIconStyle(style: style)
    }

    static func accessoryIconStyle(@ViewBuilder content: @escaping (AccessoryIconConfiguration) -> some View) -> SideBarListItemAccessoryIconStyle {
        let style = AnyAccessoryIconStyle(content)
        return SideBarListItemAccessoryIconStyle(style: style)
    }
}

public struct SideBarListItemSwitchStyle: SideBarListItemStyle {
    let style: any SwitchStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .switchStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemSwitchStyle {
    static func switchStyle(_ style: some SwitchStyle) -> SideBarListItemSwitchStyle {
        SideBarListItemSwitchStyle(style: style)
    }

    static func switchStyle(@ViewBuilder content: @escaping (SwitchConfiguration) -> some View) -> SideBarListItemSwitchStyle {
        let style = AnySwitchStyle(content)
        return SideBarListItemSwitchStyle(style: style)
    }
}

// MARK: StatusStyle

public extension StatusStyle where Self == StatusBaseStyle {
    static var base: StatusBaseStyle {
        StatusBaseStyle()
    }
}

public extension StatusStyle where Self == StatusFioriStyle {
    static var fiori: StatusFioriStyle {
        StatusFioriStyle()
    }
}

// MARK: StepperFieldStyle

public extension StepperFieldStyle where Self == StepperFieldBaseStyle {
    static var base: StepperFieldBaseStyle {
        StepperFieldBaseStyle()
    }
}

public extension StepperFieldStyle where Self == StepperFieldFioriStyle {
    static var fiori: StepperFieldFioriStyle {
        StepperFieldFioriStyle()
    }
}

public struct StepperFieldDecrementActionStyle: StepperFieldStyle {
    let style: any DecrementActionStyle

    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        StepperField(configuration)
            .decrementActionStyle(self.style)
            .typeErased
    }
}

public extension StepperFieldStyle where Self == StepperFieldDecrementActionStyle {
    static func decrementActionStyle(_ style: some DecrementActionStyle) -> StepperFieldDecrementActionStyle {
        StepperFieldDecrementActionStyle(style: style)
    }

    static func decrementActionStyle(@ViewBuilder content: @escaping (DecrementActionConfiguration) -> some View) -> StepperFieldDecrementActionStyle {
        let style = AnyDecrementActionStyle(content)
        return StepperFieldDecrementActionStyle(style: style)
    }
}

public struct StepperFieldTextInputFieldStyle: StepperFieldStyle {
    let style: any TextInputFieldStyle

    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        StepperField(configuration)
            .textInputFieldStyle(self.style)
            .typeErased
    }
}

public extension StepperFieldStyle where Self == StepperFieldTextInputFieldStyle {
    static func textInputFieldStyle(_ style: some TextInputFieldStyle) -> StepperFieldTextInputFieldStyle {
        StepperFieldTextInputFieldStyle(style: style)
    }

    static func textInputFieldStyle(@ViewBuilder content: @escaping (TextInputFieldConfiguration) -> some View) -> StepperFieldTextInputFieldStyle {
        let style = AnyTextInputFieldStyle(content)
        return StepperFieldTextInputFieldStyle(style: style)
    }
}

public struct StepperFieldIncrementActionStyle: StepperFieldStyle {
    let style: any IncrementActionStyle

    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        StepperField(configuration)
            .incrementActionStyle(self.style)
            .typeErased
    }
}

public extension StepperFieldStyle where Self == StepperFieldIncrementActionStyle {
    static func incrementActionStyle(_ style: some IncrementActionStyle) -> StepperFieldIncrementActionStyle {
        StepperFieldIncrementActionStyle(style: style)
    }

    static func incrementActionStyle(@ViewBuilder content: @escaping (IncrementActionConfiguration) -> some View) -> StepperFieldIncrementActionStyle {
        let style = AnyIncrementActionStyle(content)
        return StepperFieldIncrementActionStyle(style: style)
    }
}

// MARK: StepperViewStyle

public extension StepperViewStyle where Self == StepperViewBaseStyle {
    static var base: StepperViewBaseStyle {
        StepperViewBaseStyle()
    }
}

public extension StepperViewStyle where Self == StepperViewFioriStyle {
    static var fiori: StepperViewFioriStyle {
        StepperViewFioriStyle()
    }
}

public struct StepperViewTitleStyle: StepperViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> StepperViewTitleStyle {
        StepperViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> StepperViewTitleStyle {
        let style = AnyTitleStyle(content)
        return StepperViewTitleStyle(style: style)
    }
}

public struct StepperViewDecrementActionStyle: StepperViewStyle {
    let style: any DecrementActionStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .decrementActionStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewDecrementActionStyle {
    static func decrementActionStyle(_ style: some DecrementActionStyle) -> StepperViewDecrementActionStyle {
        StepperViewDecrementActionStyle(style: style)
    }

    static func decrementActionStyle(@ViewBuilder content: @escaping (DecrementActionConfiguration) -> some View) -> StepperViewDecrementActionStyle {
        let style = AnyDecrementActionStyle(content)
        return StepperViewDecrementActionStyle(style: style)
    }
}

public struct StepperViewTextInputFieldStyle: StepperViewStyle {
    let style: any TextInputFieldStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .textInputFieldStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewTextInputFieldStyle {
    static func textInputFieldStyle(_ style: some TextInputFieldStyle) -> StepperViewTextInputFieldStyle {
        StepperViewTextInputFieldStyle(style: style)
    }

    static func textInputFieldStyle(@ViewBuilder content: @escaping (TextInputFieldConfiguration) -> some View) -> StepperViewTextInputFieldStyle {
        let style = AnyTextInputFieldStyle(content)
        return StepperViewTextInputFieldStyle(style: style)
    }
}

public struct StepperViewIncrementActionStyle: StepperViewStyle {
    let style: any IncrementActionStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .incrementActionStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewIncrementActionStyle {
    static func incrementActionStyle(_ style: some IncrementActionStyle) -> StepperViewIncrementActionStyle {
        StepperViewIncrementActionStyle(style: style)
    }

    static func incrementActionStyle(@ViewBuilder content: @escaping (IncrementActionConfiguration) -> some View) -> StepperViewIncrementActionStyle {
        let style = AnyIncrementActionStyle(content)
        return StepperViewIncrementActionStyle(style: style)
    }
}

public struct StepperViewIconStyle: StepperViewStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewIconStyle {
    static func iconStyle(_ style: some IconStyle) -> StepperViewIconStyle {
        StepperViewIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> StepperViewIconStyle {
        let style = AnyIconStyle(content)
        return StepperViewIconStyle(style: style)
    }
}

public struct StepperViewDescriptionStyle: StepperViewStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> StepperViewDescriptionStyle {
        StepperViewDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> StepperViewDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return StepperViewDescriptionStyle(style: style)
    }
}

public struct StepperViewStepperFieldStyle: StepperViewStyle {
    let style: any StepperFieldStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .stepperFieldStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewStepperFieldStyle {
    static func stepperFieldStyle(_ style: some StepperFieldStyle) -> StepperViewStepperFieldStyle {
        StepperViewStepperFieldStyle(style: style)
    }

    static func stepperFieldStyle(@ViewBuilder content: @escaping (StepperFieldConfiguration) -> some View) -> StepperViewStepperFieldStyle {
        let style = AnyStepperFieldStyle(content)
        return StepperViewStepperFieldStyle(style: style)
    }
}

public struct StepperViewInformationViewStyle: StepperViewStyle {
    let style: any InformationViewStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .informationViewStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewInformationViewStyle {
    static func informationViewStyle(_ style: some InformationViewStyle) -> StepperViewInformationViewStyle {
        StepperViewInformationViewStyle(style: style)
    }

    static func informationViewStyle(@ViewBuilder content: @escaping (InformationViewConfiguration) -> some View) -> StepperViewInformationViewStyle {
        let style = AnyInformationViewStyle(content)
        return StepperViewInformationViewStyle(style: style)
    }
}

// MARK: SubAttributeStyle

public extension SubAttributeStyle where Self == SubAttributeBaseStyle {
    static var base: SubAttributeBaseStyle {
        SubAttributeBaseStyle()
    }
}

public extension SubAttributeStyle where Self == SubAttributeFioriStyle {
    static var fiori: SubAttributeFioriStyle {
        SubAttributeFioriStyle()
    }
}

// MARK: SubstatusStyle

public extension SubstatusStyle where Self == SubstatusBaseStyle {
    static var base: SubstatusBaseStyle {
        SubstatusBaseStyle()
    }
}

public extension SubstatusStyle where Self == SubstatusFioriStyle {
    static var fiori: SubstatusFioriStyle {
        SubstatusFioriStyle()
    }
}

// MARK: SubtitleStyle

public extension SubtitleStyle where Self == SubtitleBaseStyle {
    static var base: SubtitleBaseStyle {
        SubtitleBaseStyle()
    }
}

public extension SubtitleStyle where Self == SubtitleFioriStyle {
    static var fiori: SubtitleFioriStyle {
        SubtitleFioriStyle()
    }
}

// MARK: SwitchStyle

public extension SwitchStyle where Self == SwitchBaseStyle {
    static var base: SwitchBaseStyle {
        SwitchBaseStyle()
    }
}

public extension SwitchStyle where Self == SwitchFioriStyle {
    static var fiori: SwitchFioriStyle {
        SwitchFioriStyle()
    }
}

// MARK: SwitchViewStyle

public extension SwitchViewStyle where Self == SwitchViewBaseStyle {
    static var base: SwitchViewBaseStyle {
        SwitchViewBaseStyle()
    }
}

public extension SwitchViewStyle where Self == SwitchViewFioriStyle {
    static var fiori: SwitchViewFioriStyle {
        SwitchViewFioriStyle()
    }
}

public struct SwitchViewTitleStyle: SwitchViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        SwitchView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension SwitchViewStyle where Self == SwitchViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> SwitchViewTitleStyle {
        SwitchViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> SwitchViewTitleStyle {
        let style = AnyTitleStyle(content)
        return SwitchViewTitleStyle(style: style)
    }
}

public struct SwitchViewSwitchStyle: SwitchViewStyle {
    let style: any SwitchStyle

    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        SwitchView(configuration)
            .switchStyle(self.style)
            .typeErased
    }
}

public extension SwitchViewStyle where Self == SwitchViewSwitchStyle {
    static func switchStyle(_ style: some SwitchStyle) -> SwitchViewSwitchStyle {
        SwitchViewSwitchStyle(style: style)
    }

    static func switchStyle(@ViewBuilder content: @escaping (SwitchConfiguration) -> some View) -> SwitchViewSwitchStyle {
        let style = AnySwitchStyle(content)
        return SwitchViewSwitchStyle(style: style)
    }
}

// MARK: TagsStyle

public extension TagsStyle where Self == TagsBaseStyle {
    static var base: TagsBaseStyle {
        TagsBaseStyle()
    }
}

public extension TagsStyle where Self == TagsFioriStyle {
    static var fiori: TagsFioriStyle {
        TagsFioriStyle()
    }
}

// MARK: TertiaryActionStyle

public extension TertiaryActionStyle where Self == TertiaryActionBaseStyle {
    static var base: TertiaryActionBaseStyle {
        TertiaryActionBaseStyle()
    }
}

public extension TertiaryActionStyle where Self == TertiaryActionFioriStyle {
    static var fiori: TertiaryActionFioriStyle {
        TertiaryActionFioriStyle()
    }
}

// MARK: TextFieldFormViewStyle

public extension TextFieldFormViewStyle where Self == TextFieldFormViewBaseStyle {
    static var base: TextFieldFormViewBaseStyle {
        TextFieldFormViewBaseStyle()
    }
}

public extension TextFieldFormViewStyle where Self == TextFieldFormViewFioriStyle {
    static var fiori: TextFieldFormViewFioriStyle {
        TextFieldFormViewFioriStyle()
    }
}

public struct TextFieldFormViewTitleStyle: TextFieldFormViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension TextFieldFormViewStyle where Self == TextFieldFormViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> TextFieldFormViewTitleStyle {
        TextFieldFormViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> TextFieldFormViewTitleStyle {
        let style = AnyTitleStyle(content)
        return TextFieldFormViewTitleStyle(style: style)
    }
}

public struct TextFieldFormViewTextInputFieldStyle: TextFieldFormViewStyle {
    let style: any TextInputFieldStyle

    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .textInputFieldStyle(self.style)
            .typeErased
    }
}

public extension TextFieldFormViewStyle where Self == TextFieldFormViewTextInputFieldStyle {
    static func textInputFieldStyle(_ style: some TextInputFieldStyle) -> TextFieldFormViewTextInputFieldStyle {
        TextFieldFormViewTextInputFieldStyle(style: style)
    }

    static func textInputFieldStyle(@ViewBuilder content: @escaping (TextInputFieldConfiguration) -> some View) -> TextFieldFormViewTextInputFieldStyle {
        let style = AnyTextInputFieldStyle(content)
        return TextFieldFormViewTextInputFieldStyle(style: style)
    }
}

public struct TextFieldFormViewPlaceholderStyle: TextFieldFormViewStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension TextFieldFormViewStyle where Self == TextFieldFormViewPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> TextFieldFormViewPlaceholderStyle {
        TextFieldFormViewPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> TextFieldFormViewPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return TextFieldFormViewPlaceholderStyle(style: style)
    }
}

public struct TextFieldFormViewMandatoryFieldIndicatorStyle: TextFieldFormViewStyle {
    let style: any MandatoryFieldIndicatorStyle

    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .mandatoryFieldIndicatorStyle(self.style)
            .typeErased
    }
}

public extension TextFieldFormViewStyle where Self == TextFieldFormViewMandatoryFieldIndicatorStyle {
    static func mandatoryFieldIndicatorStyle(_ style: some MandatoryFieldIndicatorStyle) -> TextFieldFormViewMandatoryFieldIndicatorStyle {
        TextFieldFormViewMandatoryFieldIndicatorStyle(style: style)
    }

    static func mandatoryFieldIndicatorStyle(@ViewBuilder content: @escaping (MandatoryFieldIndicatorConfiguration) -> some View) -> TextFieldFormViewMandatoryFieldIndicatorStyle {
        let style = AnyMandatoryFieldIndicatorStyle(content)
        return TextFieldFormViewMandatoryFieldIndicatorStyle(style: style)
    }
}

public struct TextFieldFormViewTitleFormViewStyle: TextFieldFormViewStyle {
    let style: any TitleFormViewStyle

    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .titleFormViewStyle(self.style)
            .typeErased
    }
}

public extension TextFieldFormViewStyle where Self == TextFieldFormViewTitleFormViewStyle {
    static func titleFormViewStyle(_ style: some TitleFormViewStyle) -> TextFieldFormViewTitleFormViewStyle {
        TextFieldFormViewTitleFormViewStyle(style: style)
    }

    static func titleFormViewStyle(@ViewBuilder content: @escaping (TitleFormViewConfiguration) -> some View) -> TextFieldFormViewTitleFormViewStyle {
        let style = AnyTitleFormViewStyle(content)
        return TextFieldFormViewTitleFormViewStyle(style: style)
    }
}

// MARK: TextInputFieldStyle

public extension TextInputFieldStyle where Self == TextInputFieldBaseStyle {
    static var base: TextInputFieldBaseStyle {
        TextInputFieldBaseStyle()
    }
}

public extension TextInputFieldStyle where Self == TextInputFieldFioriStyle {
    static var fiori: TextInputFieldFioriStyle {
        TextInputFieldFioriStyle()
    }
}

// MARK: TextInputInfoViewStyle

extension TextInputInfoViewStyle where Self == TextInputInfoViewBaseStyle {
    static var base: TextInputInfoViewBaseStyle {
        TextInputInfoViewBaseStyle()
    }
}

extension TextInputInfoViewStyle where Self == TextInputInfoViewFioriStyle {
    static var fiori: TextInputInfoViewFioriStyle {
        TextInputInfoViewFioriStyle()
    }
}

struct TextInputInfoViewIconStyle: TextInputInfoViewStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

extension TextInputInfoViewStyle where Self == TextInputInfoViewIconStyle {
    static func iconStyle(_ style: some IconStyle) -> TextInputInfoViewIconStyle {
        TextInputInfoViewIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> TextInputInfoViewIconStyle {
        let style = AnyIconStyle(content)
        return TextInputInfoViewIconStyle(style: style)
    }
}

struct TextInputInfoViewDescriptionStyle: TextInputInfoViewStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

extension TextInputInfoViewStyle where Self == TextInputInfoViewDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> TextInputInfoViewDescriptionStyle {
        TextInputInfoViewDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> TextInputInfoViewDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return TextInputInfoViewDescriptionStyle(style: style)
    }
}

struct TextInputInfoViewCounterStyle: TextInputInfoViewStyle {
    let style: any CounterStyle

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .counterStyle(self.style)
            .typeErased
    }
}

extension TextInputInfoViewStyle where Self == TextInputInfoViewCounterStyle {
    static func counterStyle(_ style: some CounterStyle) -> TextInputInfoViewCounterStyle {
        TextInputInfoViewCounterStyle(style: style)
    }

    static func counterStyle(@ViewBuilder content: @escaping (CounterConfiguration) -> some View) -> TextInputInfoViewCounterStyle {
        let style = AnyCounterStyle(content)
        return TextInputInfoViewCounterStyle(style: style)
    }
}

struct TextInputInfoViewInformationViewStyle: TextInputInfoViewStyle {
    let style: any InformationViewStyle

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .informationViewStyle(self.style)
            .typeErased
    }
}

extension TextInputInfoViewStyle where Self == TextInputInfoViewInformationViewStyle {
    static func informationViewStyle(_ style: some InformationViewStyle) -> TextInputInfoViewInformationViewStyle {
        TextInputInfoViewInformationViewStyle(style: style)
    }

    static func informationViewStyle(@ViewBuilder content: @escaping (InformationViewConfiguration) -> some View) -> TextInputInfoViewInformationViewStyle {
        let style = AnyInformationViewStyle(content)
        return TextInputInfoViewInformationViewStyle(style: style)
    }
}

// MARK: TextViewStyle

public extension TextViewStyle where Self == TextViewBaseStyle {
    static var base: TextViewBaseStyle {
        TextViewBaseStyle()
    }
}

public extension TextViewStyle where Self == TextViewFioriStyle {
    static var fiori: TextViewFioriStyle {
        TextViewFioriStyle()
    }
}

// MARK: TimelineStyle

public extension TimelineStyle where Self == TimelineBaseStyle {
    static var base: TimelineBaseStyle {
        TimelineBaseStyle()
    }
}

public extension TimelineStyle where Self == TimelineFioriStyle {
    static var fiori: TimelineFioriStyle {
        TimelineFioriStyle()
    }
}

public struct TimelineTimestampStyle: TimelineStyle {
    let style: any TimestampStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .timestampStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineTimestampStyle {
    static func timestampStyle(_ style: some TimestampStyle) -> TimelineTimestampStyle {
        TimelineTimestampStyle(style: style)
    }

    static func timestampStyle(@ViewBuilder content: @escaping (TimestampConfiguration) -> some View) -> TimelineTimestampStyle {
        let style = AnyTimestampStyle(content)
        return TimelineTimestampStyle(style: style)
    }
}

public struct TimelineSecondaryTimestampStyle: TimelineStyle {
    let style: any SecondaryTimestampStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .secondaryTimestampStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineSecondaryTimestampStyle {
    static func secondaryTimestampStyle(_ style: some SecondaryTimestampStyle) -> TimelineSecondaryTimestampStyle {
        TimelineSecondaryTimestampStyle(style: style)
    }

    static func secondaryTimestampStyle(@ViewBuilder content: @escaping (SecondaryTimestampConfiguration) -> some View) -> TimelineSecondaryTimestampStyle {
        let style = AnySecondaryTimestampStyle(content)
        return TimelineSecondaryTimestampStyle(style: style)
    }
}

public struct TimelineTimelineNodeStyle: TimelineStyle {
    let style: any TimelineNodeStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .timelineNodeStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineTimelineNodeStyle {
    static func timelineNodeStyle(_ style: some TimelineNodeStyle) -> TimelineTimelineNodeStyle {
        TimelineTimelineNodeStyle(style: style)
    }

    static func timelineNodeStyle(@ViewBuilder content: @escaping (TimelineNodeConfiguration) -> some View) -> TimelineTimelineNodeStyle {
        let style = AnyTimelineNodeStyle(content)
        return TimelineTimelineNodeStyle(style: style)
    }
}

public struct TimelineIconStyle: TimelineStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineIconStyle {
    static func iconStyle(_ style: some IconStyle) -> TimelineIconStyle {
        TimelineIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> TimelineIconStyle {
        let style = AnyIconStyle(content)
        return TimelineIconStyle(style: style)
    }
}

public struct TimelineTitleStyle: TimelineStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> TimelineTitleStyle {
        TimelineTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> TimelineTitleStyle {
        let style = AnyTitleStyle(content)
        return TimelineTitleStyle(style: style)
    }
}

public struct TimelineSubtitleStyle: TimelineStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> TimelineSubtitleStyle {
        TimelineSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> TimelineSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return TimelineSubtitleStyle(style: style)
    }
}

public struct TimelineAttributeStyle: TimelineStyle {
    let style: any AttributeStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .attributeStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineAttributeStyle {
    static func attributeStyle(_ style: some AttributeStyle) -> TimelineAttributeStyle {
        TimelineAttributeStyle(style: style)
    }

    static func attributeStyle(@ViewBuilder content: @escaping (AttributeConfiguration) -> some View) -> TimelineAttributeStyle {
        let style = AnyAttributeStyle(content)
        return TimelineAttributeStyle(style: style)
    }
}

public struct TimelineStatusStyle: TimelineStyle {
    let style: any StatusStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .statusStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineStatusStyle {
    static func statusStyle(_ style: some StatusStyle) -> TimelineStatusStyle {
        TimelineStatusStyle(style: style)
    }

    static func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> TimelineStatusStyle {
        let style = AnyStatusStyle(content)
        return TimelineStatusStyle(style: style)
    }
}

public struct TimelineSubstatusStyle: TimelineStyle {
    let style: any SubstatusStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .substatusStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineSubstatusStyle {
    static func substatusStyle(_ style: some SubstatusStyle) -> TimelineSubstatusStyle {
        TimelineSubstatusStyle(style: style)
    }

    static func substatusStyle(@ViewBuilder content: @escaping (SubstatusConfiguration) -> some View) -> TimelineSubstatusStyle {
        let style = AnySubstatusStyle(content)
        return TimelineSubstatusStyle(style: style)
    }
}

public struct TimelineSubAttributeStyle: TimelineStyle {
    let style: any SubAttributeStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .subAttributeStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineSubAttributeStyle {
    static func subAttributeStyle(_ style: some SubAttributeStyle) -> TimelineSubAttributeStyle {
        TimelineSubAttributeStyle(style: style)
    }

    static func subAttributeStyle(@ViewBuilder content: @escaping (SubAttributeConfiguration) -> some View) -> TimelineSubAttributeStyle {
        let style = AnySubAttributeStyle(content)
        return TimelineSubAttributeStyle(style: style)
    }
}

// MARK: TimelineMarkerStyle

public extension TimelineMarkerStyle where Self == TimelineMarkerBaseStyle {
    static var base: TimelineMarkerBaseStyle {
        TimelineMarkerBaseStyle()
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerFioriStyle {
    static var fiori: TimelineMarkerFioriStyle {
        TimelineMarkerFioriStyle()
    }
}

public struct TimelineMarkerTimestampStyle: TimelineMarkerStyle {
    let style: any TimestampStyle

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .timestampStyle(self.style)
            .typeErased
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerTimestampStyle {
    static func timestampStyle(_ style: some TimestampStyle) -> TimelineMarkerTimestampStyle {
        TimelineMarkerTimestampStyle(style: style)
    }

    static func timestampStyle(@ViewBuilder content: @escaping (TimestampConfiguration) -> some View) -> TimelineMarkerTimestampStyle {
        let style = AnyTimestampStyle(content)
        return TimelineMarkerTimestampStyle(style: style)
    }
}

public struct TimelineMarkerSecondaryTimestampStyle: TimelineMarkerStyle {
    let style: any SecondaryTimestampStyle

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .secondaryTimestampStyle(self.style)
            .typeErased
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerSecondaryTimestampStyle {
    static func secondaryTimestampStyle(_ style: some SecondaryTimestampStyle) -> TimelineMarkerSecondaryTimestampStyle {
        TimelineMarkerSecondaryTimestampStyle(style: style)
    }

    static func secondaryTimestampStyle(@ViewBuilder content: @escaping (SecondaryTimestampConfiguration) -> some View) -> TimelineMarkerSecondaryTimestampStyle {
        let style = AnySecondaryTimestampStyle(content)
        return TimelineMarkerSecondaryTimestampStyle(style: style)
    }
}

public struct TimelineMarkerTimelineNodeStyle: TimelineMarkerStyle {
    let style: any TimelineNodeStyle

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .timelineNodeStyle(self.style)
            .typeErased
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerTimelineNodeStyle {
    static func timelineNodeStyle(_ style: some TimelineNodeStyle) -> TimelineMarkerTimelineNodeStyle {
        TimelineMarkerTimelineNodeStyle(style: style)
    }

    static func timelineNodeStyle(@ViewBuilder content: @escaping (TimelineNodeConfiguration) -> some View) -> TimelineMarkerTimelineNodeStyle {
        let style = AnyTimelineNodeStyle(content)
        return TimelineMarkerTimelineNodeStyle(style: style)
    }
}

public struct TimelineMarkerIconStyle: TimelineMarkerStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerIconStyle {
    static func iconStyle(_ style: some IconStyle) -> TimelineMarkerIconStyle {
        TimelineMarkerIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> TimelineMarkerIconStyle {
        let style = AnyIconStyle(content)
        return TimelineMarkerIconStyle(style: style)
    }
}

public struct TimelineMarkerTitleStyle: TimelineMarkerStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> TimelineMarkerTitleStyle {
        TimelineMarkerTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> TimelineMarkerTitleStyle {
        let style = AnyTitleStyle(content)
        return TimelineMarkerTitleStyle(style: style)
    }
}

// MARK: TimelineNodeStyle

public extension TimelineNodeStyle where Self == TimelineNodeBaseStyle {
    static var base: TimelineNodeBaseStyle {
        TimelineNodeBaseStyle()
    }
}

public extension TimelineNodeStyle where Self == TimelineNodeFioriStyle {
    static var fiori: TimelineNodeFioriStyle {
        TimelineNodeFioriStyle()
    }
}

// MARK: TimelineNowIndicatorStyle

public extension TimelineNowIndicatorStyle where Self == TimelineNowIndicatorBaseStyle {
    static var base: TimelineNowIndicatorBaseStyle {
        TimelineNowIndicatorBaseStyle()
    }
}

public extension TimelineNowIndicatorStyle where Self == TimelineNowIndicatorFioriStyle {
    static var fiori: TimelineNowIndicatorFioriStyle {
        TimelineNowIndicatorFioriStyle()
    }
}

public struct TimelineNowIndicatorNowIndicatorNodeStyle: TimelineNowIndicatorStyle {
    let style: any NowIndicatorNodeStyle

    public func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        TimelineNowIndicator(configuration)
            .nowIndicatorNodeStyle(self.style)
            .typeErased
    }
}

public extension TimelineNowIndicatorStyle where Self == TimelineNowIndicatorNowIndicatorNodeStyle {
    static func nowIndicatorNodeStyle(_ style: some NowIndicatorNodeStyle) -> TimelineNowIndicatorNowIndicatorNodeStyle {
        TimelineNowIndicatorNowIndicatorNodeStyle(style: style)
    }

    static func nowIndicatorNodeStyle(@ViewBuilder content: @escaping (NowIndicatorNodeConfiguration) -> some View) -> TimelineNowIndicatorNowIndicatorNodeStyle {
        let style = AnyNowIndicatorNodeStyle(content)
        return TimelineNowIndicatorNowIndicatorNodeStyle(style: style)
    }
}

// MARK: TimelinePreviewStyle

public extension TimelinePreviewStyle where Self == TimelinePreviewBaseStyle {
    static var base: TimelinePreviewBaseStyle {
        TimelinePreviewBaseStyle()
    }
}

public extension TimelinePreviewStyle where Self == TimelinePreviewFioriStyle {
    static var fiori: TimelinePreviewFioriStyle {
        TimelinePreviewFioriStyle()
    }
}

public struct TimelinePreviewOptionalTitleStyle: TimelinePreviewStyle {
    let style: any OptionalTitleStyle

    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        TimelinePreview(configuration)
            .optionalTitleStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewStyle where Self == TimelinePreviewOptionalTitleStyle {
    static func optionalTitleStyle(_ style: some OptionalTitleStyle) -> TimelinePreviewOptionalTitleStyle {
        TimelinePreviewOptionalTitleStyle(style: style)
    }

    static func optionalTitleStyle(@ViewBuilder content: @escaping (OptionalTitleConfiguration) -> some View) -> TimelinePreviewOptionalTitleStyle {
        let style = AnyOptionalTitleStyle(content)
        return TimelinePreviewOptionalTitleStyle(style: style)
    }
}

public struct TimelinePreviewActionStyle: TimelinePreviewStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        TimelinePreview(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewStyle where Self == TimelinePreviewActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> TimelinePreviewActionStyle {
        TimelinePreviewActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> TimelinePreviewActionStyle {
        let style = AnyActionStyle(content)
        return TimelinePreviewActionStyle(style: style)
    }
}

// MARK: TimelinePreviewItemStyle

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemBaseStyle {
    static var base: TimelinePreviewItemBaseStyle {
        TimelinePreviewItemBaseStyle()
    }
}

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemFioriStyle {
    static var fiori: TimelinePreviewItemFioriStyle {
        TimelinePreviewItemFioriStyle()
    }
}

public struct TimelinePreviewItemTitleStyle: TimelinePreviewItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> TimelinePreviewItemTitleStyle {
        TimelinePreviewItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> TimelinePreviewItemTitleStyle {
        let style = AnyTitleStyle(content)
        return TimelinePreviewItemTitleStyle(style: style)
    }
}

public struct TimelinePreviewItemIconStyle: TimelinePreviewItemStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemIconStyle {
    static func iconStyle(_ style: some IconStyle) -> TimelinePreviewItemIconStyle {
        TimelinePreviewItemIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> TimelinePreviewItemIconStyle {
        let style = AnyIconStyle(content)
        return TimelinePreviewItemIconStyle(style: style)
    }
}

public struct TimelinePreviewItemTimelineNodeStyle: TimelinePreviewItemStyle {
    let style: any TimelineNodeStyle

    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .timelineNodeStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemTimelineNodeStyle {
    static func timelineNodeStyle(_ style: some TimelineNodeStyle) -> TimelinePreviewItemTimelineNodeStyle {
        TimelinePreviewItemTimelineNodeStyle(style: style)
    }

    static func timelineNodeStyle(@ViewBuilder content: @escaping (TimelineNodeConfiguration) -> some View) -> TimelinePreviewItemTimelineNodeStyle {
        let style = AnyTimelineNodeStyle(content)
        return TimelinePreviewItemTimelineNodeStyle(style: style)
    }
}

public struct TimelinePreviewItemTimestampStyle: TimelinePreviewItemStyle {
    let style: any TimestampStyle

    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .timestampStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemTimestampStyle {
    static func timestampStyle(_ style: some TimestampStyle) -> TimelinePreviewItemTimestampStyle {
        TimelinePreviewItemTimestampStyle(style: style)
    }

    static func timestampStyle(@ViewBuilder content: @escaping (TimestampConfiguration) -> some View) -> TimelinePreviewItemTimestampStyle {
        let style = AnyTimestampStyle(content)
        return TimelinePreviewItemTimestampStyle(style: style)
    }
}

// MARK: TimestampStyle

public extension TimestampStyle where Self == TimestampBaseStyle {
    static var base: TimestampBaseStyle {
        TimestampBaseStyle()
    }
}

public extension TimestampStyle where Self == TimestampFioriStyle {
    static var fiori: TimestampFioriStyle {
        TimestampFioriStyle()
    }
}

// MARK: TitleStyle

public extension TitleStyle where Self == TitleBaseStyle {
    static var base: TitleBaseStyle {
        TitleBaseStyle()
    }
}

public extension TitleStyle where Self == TitleFioriStyle {
    static var fiori: TitleFioriStyle {
        TitleFioriStyle()
    }
}

// MARK: TitleFormViewStyle

public extension TitleFormViewStyle where Self == TitleFormViewBaseStyle {
    static var base: TitleFormViewBaseStyle {
        TitleFormViewBaseStyle()
    }
}

public extension TitleFormViewStyle where Self == TitleFormViewFioriStyle {
    static var fiori: TitleFormViewFioriStyle {
        TitleFormViewFioriStyle()
    }
}

public struct TitleFormViewTextInputFieldStyle: TitleFormViewStyle {
    let style: any TextInputFieldStyle

    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .textInputFieldStyle(self.style)
            .typeErased
    }
}

public extension TitleFormViewStyle where Self == TitleFormViewTextInputFieldStyle {
    static func textInputFieldStyle(_ style: some TextInputFieldStyle) -> TitleFormViewTextInputFieldStyle {
        TitleFormViewTextInputFieldStyle(style: style)
    }

    static func textInputFieldStyle(@ViewBuilder content: @escaping (TextInputFieldConfiguration) -> some View) -> TitleFormViewTextInputFieldStyle {
        let style = AnyTextInputFieldStyle(content)
        return TitleFormViewTextInputFieldStyle(style: style)
    }
}

public struct TitleFormViewPlaceholderStyle: TitleFormViewStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension TitleFormViewStyle where Self == TitleFormViewPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> TitleFormViewPlaceholderStyle {
        TitleFormViewPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> TitleFormViewPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return TitleFormViewPlaceholderStyle(style: style)
    }
}

public struct TitleFormViewPlaceholderTextFieldStyle: TitleFormViewStyle {
    let style: any PlaceholderTextFieldStyle

    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .placeholderTextFieldStyle(self.style)
            .typeErased
    }
}

public extension TitleFormViewStyle where Self == TitleFormViewPlaceholderTextFieldStyle {
    static func placeholderTextFieldStyle(_ style: some PlaceholderTextFieldStyle) -> TitleFormViewPlaceholderTextFieldStyle {
        TitleFormViewPlaceholderTextFieldStyle(style: style)
    }

    static func placeholderTextFieldStyle(@ViewBuilder content: @escaping (PlaceholderTextFieldConfiguration) -> some View) -> TitleFormViewPlaceholderTextFieldStyle {
        let style = AnyPlaceholderTextFieldStyle(content)
        return TitleFormViewPlaceholderTextFieldStyle(style: style)
    }
}

public struct TitleFormViewFormViewStyle: TitleFormViewStyle {
    let style: any FormViewStyle

    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .formViewStyle(self.style)
            .typeErased
    }
}

public extension TitleFormViewStyle where Self == TitleFormViewFormViewStyle {
    static func formViewStyle(_ style: some FormViewStyle) -> TitleFormViewFormViewStyle {
        TitleFormViewFormViewStyle(style: style)
    }

    static func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> TitleFormViewFormViewStyle {
        let style = AnyFormViewStyle(content)
        return TitleFormViewFormViewStyle(style: style)
    }
}

// MARK: ToastMessageStyle

public extension ToastMessageStyle where Self == ToastMessageBaseStyle {
    static var base: ToastMessageBaseStyle {
        ToastMessageBaseStyle()
    }
}

public extension ToastMessageStyle where Self == ToastMessageFioriStyle {
    static var fiori: ToastMessageFioriStyle {
        ToastMessageFioriStyle()
    }
}

public struct ToastMessageIconStyle: ToastMessageStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
        ToastMessage(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension ToastMessageStyle where Self == ToastMessageIconStyle {
    static func iconStyle(_ style: some IconStyle) -> ToastMessageIconStyle {
        ToastMessageIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> ToastMessageIconStyle {
        let style = AnyIconStyle(content)
        return ToastMessageIconStyle(style: style)
    }
}

public struct ToastMessageTitleStyle: ToastMessageStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
        ToastMessage(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ToastMessageStyle where Self == ToastMessageTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ToastMessageTitleStyle {
        ToastMessageTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ToastMessageTitleStyle {
        let style = AnyTitleStyle(content)
        return ToastMessageTitleStyle(style: style)
    }
}

// MARK: TopDividerStyle

public extension TopDividerStyle where Self == TopDividerBaseStyle {
    static var base: TopDividerBaseStyle {
        TopDividerBaseStyle()
    }
}

public extension TopDividerStyle where Self == TopDividerFioriStyle {
    static var fiori: TopDividerFioriStyle {
        TopDividerFioriStyle()
    }
}

// MARK: ValueStyle

public extension ValueStyle where Self == ValueBaseStyle {
    static var base: ValueBaseStyle {
        ValueBaseStyle()
    }
}

public extension ValueStyle where Self == ValueFioriStyle {
    static var fiori: ValueFioriStyle {
        ValueFioriStyle()
    }
}

// MARK: ValueLabelStyle

public extension ValueLabelStyle where Self == ValueLabelBaseStyle {
    static var base: ValueLabelBaseStyle {
        ValueLabelBaseStyle()
    }
}

public extension ValueLabelStyle where Self == ValueLabelFioriStyle {
    static var fiori: ValueLabelFioriStyle {
        ValueLabelFioriStyle()
    }
}
