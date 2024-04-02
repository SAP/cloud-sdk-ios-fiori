// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

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
