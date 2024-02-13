// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

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

public struct CardNewActionStyle: CardStyle {
    let style: any NewActionStyle
        
    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .newActionStyle(self.style)
            .typeErased
    }
}
    
public extension CardStyle where Self == CardNewActionStyle {
    static func newActionStyle(_ style: some NewActionStyle) -> CardNewActionStyle {
        CardNewActionStyle(style: style)
    }
        
    static func newActionStyle(@ViewBuilder content: @escaping (NewActionConfiguration) -> some View) -> CardNewActionStyle {
        let style = AnyNewActionStyle(content)
        return CardNewActionStyle(style: style)
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
    
public struct CardFooterNewActionStyle: CardFooterStyle {
    let style: any NewActionStyle
        
    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .newActionStyle(self.style)
            .typeErased
    }
}
    
public extension CardFooterStyle where Self == CardFooterNewActionStyle {
    static func newActionStyle(_ style: some NewActionStyle) -> CardFooterNewActionStyle {
        CardFooterNewActionStyle(style: style)
    }
        
    static func newActionStyle(@ViewBuilder content: @escaping (NewActionConfiguration) -> some View) -> CardFooterNewActionStyle {
        let style = AnyNewActionStyle(content)
        return CardFooterNewActionStyle(style: style)
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
    
public extension DemoViewStyle where Self == DemoViewBaseStyle {
    static var base: DemoViewBaseStyle {
        DemoViewBaseStyle()
    }
}

public extension DemoViewStyle where Self == DemoViewFioriStyle {
    static var fiori: DemoViewFioriStyle {
        DemoViewFioriStyle()
    }
}
    
public struct DemoViewTitleStyle: DemoViewStyle {
    let style: any TitleStyle
        
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}
    
public extension DemoViewStyle where Self == DemoViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> DemoViewTitleStyle {
        DemoViewTitleStyle(style: style)
    }
        
    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> DemoViewTitleStyle {
        let style = AnyTitleStyle(content)
        return DemoViewTitleStyle(style: style)
    }
}

public struct DemoViewSubtitleStyle: DemoViewStyle {
    let style: any SubtitleStyle
        
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}
    
public extension DemoViewStyle where Self == DemoViewSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> DemoViewSubtitleStyle {
        DemoViewSubtitleStyle(style: style)
    }
        
    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> DemoViewSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return DemoViewSubtitleStyle(style: style)
    }
}

public struct DemoViewStatusStyle: DemoViewStyle {
    let style: any StatusStyle
        
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .statusStyle(self.style)
            .typeErased
    }
}
    
public extension DemoViewStyle where Self == DemoViewStatusStyle {
    static func statusStyle(_ style: some StatusStyle) -> DemoViewStatusStyle {
        DemoViewStatusStyle(style: style)
    }
        
    static func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> DemoViewStatusStyle {
        let style = AnyStatusStyle(content)
        return DemoViewStatusStyle(style: style)
    }
}

public struct DemoViewNewActionStyle: DemoViewStyle {
    let style: any NewActionStyle
        
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .newActionStyle(self.style)
            .typeErased
    }
}
    
public extension DemoViewStyle where Self == DemoViewNewActionStyle {
    static func newActionStyle(_ style: some NewActionStyle) -> DemoViewNewActionStyle {
        DemoViewNewActionStyle(style: style)
    }
        
    static func newActionStyle(@ViewBuilder content: @escaping (NewActionConfiguration) -> some View) -> DemoViewNewActionStyle {
        let style = AnyNewActionStyle(content)
        return DemoViewNewActionStyle(style: style)
    }
}

public struct DemoViewSwitchStyle: DemoViewStyle {
    let style: any SwitchStyle
        
    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .switchStyle(self.style)
            .typeErased
    }
}
    
public extension DemoViewStyle where Self == DemoViewSwitchStyle {
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
    
public struct InformationViewInformationViewContentStyle: InformationViewStyle {
    let style: any InformationViewContentStyle
        
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .informationViewContentStyle(self.style)
            .typeErased
    }
}
    
public extension InformationViewStyle where Self == InformationViewInformationViewContentStyle {
    static func informationViewContentStyle(_ style: some InformationViewContentStyle) -> InformationViewInformationViewContentStyle {
        InformationViewInformationViewContentStyle(style: style)
    }
        
    static func informationViewContentStyle(@ViewBuilder content: @escaping (InformationViewContentConfiguration) -> some View) -> InformationViewInformationViewContentStyle {
        let style = AnyInformationViewContentStyle(content)
        return InformationViewInformationViewContentStyle(style: style)
    }
}

public struct InformationViewInformationViewIconStyle: InformationViewStyle {
    let style: any InformationViewIconStyle
        
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .informationViewIconStyle(self.style)
            .typeErased
    }
}
    
public extension InformationViewStyle where Self == InformationViewInformationViewIconStyle {
    static func informationViewIconStyle(_ style: some InformationViewIconStyle) -> InformationViewInformationViewIconStyle {
        InformationViewInformationViewIconStyle(style: style)
    }
        
    static func informationViewIconStyle(@ViewBuilder content: @escaping (InformationViewIconConfiguration) -> some View) -> InformationViewInformationViewIconStyle {
        let style = AnyInformationViewIconStyle(content)
        return InformationViewInformationViewIconStyle(style: style)
    }
}

public struct InformationViewInformationViewTextStyle: InformationViewStyle {
    let style: any InformationViewTextStyle
        
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .informationViewTextStyle(self.style)
            .typeErased
    }
}
    
public extension InformationViewStyle where Self == InformationViewInformationViewTextStyle {
    static func informationViewTextStyle(_ style: some InformationViewTextStyle) -> InformationViewInformationViewTextStyle {
        InformationViewInformationViewTextStyle(style: style)
    }
        
    static func informationViewTextStyle(@ViewBuilder content: @escaping (InformationViewTextConfiguration) -> some View) -> InformationViewInformationViewTextStyle {
        let style = AnyInformationViewTextStyle(content)
        return InformationViewInformationViewTextStyle(style: style)
    }
}

// MARK: InformationViewContentStyle
    
public extension InformationViewContentStyle where Self == InformationViewContentBaseStyle {
    static var base: InformationViewContentBaseStyle {
        InformationViewContentBaseStyle()
    }
}

public extension InformationViewContentStyle where Self == InformationViewContentFioriStyle {
    static var fiori: InformationViewContentFioriStyle {
        InformationViewContentFioriStyle()
    }
}

// MARK: InformationViewIconStyle
    
public extension InformationViewIconStyle where Self == InformationViewIconBaseStyle {
    static var base: InformationViewIconBaseStyle {
        InformationViewIconBaseStyle()
    }
}

public extension InformationViewIconStyle where Self == InformationViewIconFioriStyle {
    static var fiori: InformationViewIconFioriStyle {
        InformationViewIconFioriStyle()
    }
}

// MARK: InformationViewTextStyle
    
public extension InformationViewTextStyle where Self == InformationViewTextBaseStyle {
    static var base: InformationViewTextBaseStyle {
        InformationViewTextBaseStyle()
    }
}

public extension InformationViewTextStyle where Self == InformationViewTextFioriStyle {
    static var fiori: InformationViewTextFioriStyle {
        InformationViewTextFioriStyle()
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

// MARK: NewActionStyle
    
public extension NewActionStyle where Self == NewActionBaseStyle {
    static var base: NewActionBaseStyle {
        NewActionBaseStyle()
    }
}

public extension NewActionStyle where Self == NewActionFioriStyle {
    static var fiori: NewActionFioriStyle {
        NewActionFioriStyle()
    }
}

// MARK: NewObjectItemStyle
    
public extension NewObjectItemStyle where Self == NewObjectItemBaseStyle {
    static var base: NewObjectItemBaseStyle {
        NewObjectItemBaseStyle()
    }
}

public extension NewObjectItemStyle where Self == NewObjectItemFioriStyle {
    static var fiori: NewObjectItemFioriStyle {
        NewObjectItemFioriStyle()
    }
}
    
public struct NewObjectItemTitleStyle: NewObjectItemStyle {
    let style: any TitleStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> NewObjectItemTitleStyle {
        NewObjectItemTitleStyle(style: style)
    }
        
    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> NewObjectItemTitleStyle {
        let style = AnyTitleStyle(content)
        return NewObjectItemTitleStyle(style: style)
    }
}

public struct NewObjectItemSubtitleStyle: NewObjectItemStyle {
    let style: any SubtitleStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> NewObjectItemSubtitleStyle {
        NewObjectItemSubtitleStyle(style: style)
    }
        
    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> NewObjectItemSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return NewObjectItemSubtitleStyle(style: style)
    }
}

public struct NewObjectItemFootnoteStyle: NewObjectItemStyle {
    let style: any FootnoteStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .footnoteStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemFootnoteStyle {
    static func footnoteStyle(_ style: some FootnoteStyle) -> NewObjectItemFootnoteStyle {
        NewObjectItemFootnoteStyle(style: style)
    }
        
    static func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> NewObjectItemFootnoteStyle {
        let style = AnyFootnoteStyle(content)
        return NewObjectItemFootnoteStyle(style: style)
    }
}

public struct NewObjectItemDescriptionStyle: NewObjectItemStyle {
    let style: any DescriptionStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> NewObjectItemDescriptionStyle {
        NewObjectItemDescriptionStyle(style: style)
    }
        
    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> NewObjectItemDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return NewObjectItemDescriptionStyle(style: style)
    }
}

public struct NewObjectItemStatusStyle: NewObjectItemStyle {
    let style: any StatusStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .statusStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemStatusStyle {
    static func statusStyle(_ style: some StatusStyle) -> NewObjectItemStatusStyle {
        NewObjectItemStatusStyle(style: style)
    }
        
    static func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> NewObjectItemStatusStyle {
        let style = AnyStatusStyle(content)
        return NewObjectItemStatusStyle(style: style)
    }
}

public struct NewObjectItemSubstatusStyle: NewObjectItemStyle {
    let style: any SubstatusStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .substatusStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemSubstatusStyle {
    static func substatusStyle(_ style: some SubstatusStyle) -> NewObjectItemSubstatusStyle {
        NewObjectItemSubstatusStyle(style: style)
    }
        
    static func substatusStyle(@ViewBuilder content: @escaping (SubstatusConfiguration) -> some View) -> NewObjectItemSubstatusStyle {
        let style = AnySubstatusStyle(content)
        return NewObjectItemSubstatusStyle(style: style)
    }
}

public struct NewObjectItemDetailImageStyle: NewObjectItemStyle {
    let style: any DetailImageStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> NewObjectItemDetailImageStyle {
        NewObjectItemDetailImageStyle(style: style)
    }
        
    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> NewObjectItemDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return NewObjectItemDetailImageStyle(style: style)
    }
}

public struct NewObjectItemIconsStyle: NewObjectItemStyle {
    let style: any IconsStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .iconsStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemIconsStyle {
    static func iconsStyle(_ style: some IconsStyle) -> NewObjectItemIconsStyle {
        NewObjectItemIconsStyle(style: style)
    }
        
    static func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> NewObjectItemIconsStyle {
        let style = AnyIconsStyle(content)
        return NewObjectItemIconsStyle(style: style)
    }
}

public struct NewObjectItemAvatarsStyle: NewObjectItemStyle {
    let style: any AvatarsStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .avatarsStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemAvatarsStyle {
    static func avatarsStyle(_ style: some AvatarsStyle) -> NewObjectItemAvatarsStyle {
        NewObjectItemAvatarsStyle(style: style)
    }
        
    static func avatarsStyle(@ViewBuilder content: @escaping (AvatarsConfiguration) -> some View) -> NewObjectItemAvatarsStyle {
        let style = AnyAvatarsStyle(content)
        return NewObjectItemAvatarsStyle(style: style)
    }
}

public struct NewObjectItemFootnoteIconsStyle: NewObjectItemStyle {
    let style: any FootnoteIconsStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .footnoteIconsStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemFootnoteIconsStyle {
    static func footnoteIconsStyle(_ style: some FootnoteIconsStyle) -> NewObjectItemFootnoteIconsStyle {
        NewObjectItemFootnoteIconsStyle(style: style)
    }
        
    static func footnoteIconsStyle(@ViewBuilder content: @escaping (FootnoteIconsConfiguration) -> some View) -> NewObjectItemFootnoteIconsStyle {
        let style = AnyFootnoteIconsStyle(content)
        return NewObjectItemFootnoteIconsStyle(style: style)
    }
}

public struct NewObjectItemTagsStyle: NewObjectItemStyle {
    let style: any TagsStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .tagsStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemTagsStyle {
    static func tagsStyle(_ style: some TagsStyle) -> NewObjectItemTagsStyle {
        NewObjectItemTagsStyle(style: style)
    }
        
    static func tagsStyle(@ViewBuilder content: @escaping (TagsConfiguration) -> some View) -> NewObjectItemTagsStyle {
        let style = AnyTagsStyle(content)
        return NewObjectItemTagsStyle(style: style)
    }
}

public struct NewObjectItemNewActionStyle: NewObjectItemStyle {
    let style: any NewActionStyle
        
    public func makeBody(_ configuration: NewObjectItemConfiguration) -> some View {
        NewObjectItem(configuration)
            .newActionStyle(self.style)
            .typeErased
    }
}
    
public extension NewObjectItemStyle where Self == NewObjectItemNewActionStyle {
    static func newActionStyle(_ style: some NewActionStyle) -> NewObjectItemNewActionStyle {
        NewObjectItemNewActionStyle(style: style)
    }
        
    static func newActionStyle(@ViewBuilder content: @escaping (NewActionConfiguration) -> some View) -> NewObjectItemNewActionStyle {
        let style = AnyNewActionStyle(content)
        return NewObjectItemNewActionStyle(style: style)
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
