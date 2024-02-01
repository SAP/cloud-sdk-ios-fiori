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
    static func titleStyle<Style: TitleStyle>(_ style: Style) -> DemoViewTitleStyle {
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
    static func subtitleStyle<Style: SubtitleStyle>(_ style: Style) -> DemoViewSubtitleStyle {
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
    static func statusStyle<Style: StatusStyle>(_ style: Style) -> DemoViewStatusStyle {
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
    static func newActionStyle<Style: NewActionStyle>(_ style: Style) -> DemoViewNewActionStyle {
        DemoViewNewActionStyle(style: style)
    }
        
    static func newActionStyle(@ViewBuilder content: @escaping (NewActionConfiguration) -> some View) -> DemoViewNewActionStyle {
        let style = AnyNewActionStyle(content)
        return DemoViewNewActionStyle(style: style)
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
    static func titleStyle<Style: TitleStyle>(_ style: Style) -> NewObjectItemTitleStyle {
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
    static func subtitleStyle<Style: SubtitleStyle>(_ style: Style) -> NewObjectItemSubtitleStyle {
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
    static func footnoteStyle<Style: FootnoteStyle>(_ style: Style) -> NewObjectItemFootnoteStyle {
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
    static func descriptionStyle<Style: DescriptionStyle>(_ style: Style) -> NewObjectItemDescriptionStyle {
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
    static func statusStyle<Style: StatusStyle>(_ style: Style) -> NewObjectItemStatusStyle {
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
    static func substatusStyle<Style: SubstatusStyle>(_ style: Style) -> NewObjectItemSubstatusStyle {
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
    static func detailImageStyle<Style: DetailImageStyle>(_ style: Style) -> NewObjectItemDetailImageStyle {
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
    static func iconsStyle<Style: IconsStyle>(_ style: Style) -> NewObjectItemIconsStyle {
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
    static func avatarsStyle<Style: AvatarsStyle>(_ style: Style) -> NewObjectItemAvatarsStyle {
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
    static func footnoteIconsStyle<Style: FootnoteIconsStyle>(_ style: Style) -> NewObjectItemFootnoteIconsStyle {
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
    static func tagsStyle<Style: TagsStyle>(_ style: Style) -> NewObjectItemTagsStyle {
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
    static func newActionStyle<Style: NewActionStyle>(_ style: Style) -> NewObjectItemNewActionStyle {
        NewObjectItemNewActionStyle(style: style)
    }
        
    static func newActionStyle(@ViewBuilder content: @escaping (NewActionConfiguration) -> some View) -> NewObjectItemNewActionStyle {
        let style = AnyNewActionStyle(content)
        return NewObjectItemNewActionStyle(style: style)
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
