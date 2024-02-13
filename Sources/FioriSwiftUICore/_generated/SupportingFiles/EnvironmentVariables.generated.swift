// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: AvatarsStyle

struct AvatarsStyleStackKey: EnvironmentKey {
    static let defaultValue: [any AvatarsStyle] = []
}

extension EnvironmentValues {
    var avatarsStyle: any AvatarsStyle {
        self.avatarsStyleStack.last ?? .base
    }

    var avatarsStyleStack: [any AvatarsStyle] {
        get {
            self[AvatarsStyleStackKey.self]
        }
        set {
            self[AvatarsStyleStackKey.self] = newValue
        }
    }
}

// MARK: CardBodyStyle

struct CardBodyStyleStackKey: EnvironmentKey {
    static let defaultValue: [any CardBodyStyle] = []
}

extension EnvironmentValues {
    var cardBodyStyle: any CardBodyStyle {
        self.cardBodyStyleStack.last ?? .base
    }

    var cardBodyStyleStack: [any CardBodyStyle] {
        get {
            self[CardBodyStyleStackKey.self]
        }
        set {
            self[CardBodyStyleStackKey.self] = newValue
        }
    }
}

// MARK: CardStyle

struct CardStyleStackKey: EnvironmentKey {
    static let defaultValue: [any CardStyle] = []
}

extension EnvironmentValues {
    var cardStyle: any CardStyle {
        self.cardStyleStack.last ?? .base.concat(.fiori)
    }

    var cardStyleStack: [any CardStyle] {
        get {
            self[CardStyleStackKey.self]
        }
        set {
            self[CardStyleStackKey.self] = newValue
        }
    }
}

// MARK: CardExtHeaderStyle

struct CardExtHeaderStyleStackKey: EnvironmentKey {
    static let defaultValue: [any CardExtHeaderStyle] = []
}

extension EnvironmentValues {
    var cardExtHeaderStyle: any CardExtHeaderStyle {
        self.cardExtHeaderStyleStack.last ?? .base.concat(.fiori)
    }

    var cardExtHeaderStyleStack: [any CardExtHeaderStyle] {
        get {
            self[CardExtHeaderStyleStackKey.self]
        }
        set {
            self[CardExtHeaderStyleStackKey.self] = newValue
        }
    }
}

// MARK: CardFooterStyle

struct CardFooterStyleStackKey: EnvironmentKey {
    static let defaultValue: [any CardFooterStyle] = []
}

extension EnvironmentValues {
    var cardFooterStyle: any CardFooterStyle {
        self.cardFooterStyleStack.last ?? .base.concat(.fiori)
    }

    var cardFooterStyleStack: [any CardFooterStyle] {
        get {
            self[CardFooterStyleStackKey.self]
        }
        set {
            self[CardFooterStyleStackKey.self] = newValue
        }
    }
}

// MARK: CardHeaderStyle

struct CardHeaderStyleStackKey: EnvironmentKey {
    static let defaultValue: [any CardHeaderStyle] = []
}

extension EnvironmentValues {
    var cardHeaderStyle: any CardHeaderStyle {
        self.cardHeaderStyleStack.last ?? .base.concat(.fiori)
    }

    var cardHeaderStyleStack: [any CardHeaderStyle] {
        get {
            self[CardHeaderStyleStackKey.self]
        }
        set {
            self[CardHeaderStyleStackKey.self] = newValue
        }
    }
}

// MARK: CardMainHeaderStyle

struct CardMainHeaderStyleStackKey: EnvironmentKey {
    static let defaultValue: [any CardMainHeaderStyle] = []
}

extension EnvironmentValues {
    var cardMainHeaderStyle: any CardMainHeaderStyle {
        self.cardMainHeaderStyleStack.last ?? .base.concat(.fiori)
    }

    var cardMainHeaderStyleStack: [any CardMainHeaderStyle] {
        get {
            self[CardMainHeaderStyleStackKey.self]
        }
        set {
            self[CardMainHeaderStyleStackKey.self] = newValue
        }
    }
}

// MARK: CardMediaStyle

struct CardMediaStyleStackKey: EnvironmentKey {
    static let defaultValue: [any CardMediaStyle] = []
}

extension EnvironmentValues {
    var cardMediaStyle: any CardMediaStyle {
        self.cardMediaStyleStack.last ?? .base.concat(.fiori)
    }

    var cardMediaStyleStack: [any CardMediaStyle] {
        get {
            self[CardMediaStyleStackKey.self]
        }
        set {
            self[CardMediaStyleStackKey.self] = newValue
        }
    }
}

// MARK: CounterStyle

struct CounterStyleStackKey: EnvironmentKey {
    static let defaultValue: [any CounterStyle] = []
}

extension EnvironmentValues {
    var counterStyle: any CounterStyle {
        self.counterStyleStack.last ?? .base
    }

    var counterStyleStack: [any CounterStyle] {
        get {
            self[CounterStyleStackKey.self]
        }
        set {
            self[CounterStyleStackKey.self] = newValue
        }
    }
}

// MARK: DemoViewStyle

struct DemoViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any DemoViewStyle] = []
}

extension EnvironmentValues {
    var demoViewStyle: any DemoViewStyle {
        self.demoViewStyleStack.last ?? .base.concat(.fiori)
    }

    var demoViewStyleStack: [any DemoViewStyle] {
        get {
            self[DemoViewStyleStackKey.self]
        }
        set {
            self[DemoViewStyleStackKey.self] = newValue
        }
    }
}

// MARK: DescriptionStyle

struct DescriptionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any DescriptionStyle] = []
}

extension EnvironmentValues {
    var descriptionStyle: any DescriptionStyle {
        self.descriptionStyleStack.last ?? .base
    }

    var descriptionStyleStack: [any DescriptionStyle] {
        get {
            self[DescriptionStyleStackKey.self]
        }
        set {
            self[DescriptionStyleStackKey.self] = newValue
        }
    }
}

// MARK: DetailImageStyle

struct DetailImageStyleStackKey: EnvironmentKey {
    static let defaultValue: [any DetailImageStyle] = []
}

extension EnvironmentValues {
    var detailImageStyle: any DetailImageStyle {
        self.detailImageStyleStack.last ?? .base
    }

    var detailImageStyleStack: [any DetailImageStyle] {
        get {
            self[DetailImageStyleStackKey.self]
        }
        set {
            self[DetailImageStyleStackKey.self] = newValue
        }
    }
}

// MARK: FootnoteStyle

struct FootnoteStyleStackKey: EnvironmentKey {
    static let defaultValue: [any FootnoteStyle] = []
}

extension EnvironmentValues {
    var footnoteStyle: any FootnoteStyle {
        self.footnoteStyleStack.last ?? .base
    }

    var footnoteStyleStack: [any FootnoteStyle] {
        get {
            self[FootnoteStyleStackKey.self]
        }
        set {
            self[FootnoteStyleStackKey.self] = newValue
        }
    }
}

// MARK: FootnoteIconsStyle

struct FootnoteIconsStyleStackKey: EnvironmentKey {
    static let defaultValue: [any FootnoteIconsStyle] = []
}

extension EnvironmentValues {
    var footnoteIconsStyle: any FootnoteIconsStyle {
        self.footnoteIconsStyleStack.last ?? .base
    }

    var footnoteIconsStyleStack: [any FootnoteIconsStyle] {
        get {
            self[FootnoteIconsStyleStackKey.self]
        }
        set {
            self[FootnoteIconsStyleStackKey.self] = newValue
        }
    }
}

// MARK: IconsStyle

struct IconsStyleStackKey: EnvironmentKey {
    static let defaultValue: [any IconsStyle] = []
}

extension EnvironmentValues {
    var iconsStyle: any IconsStyle {
        self.iconsStyleStack.last ?? .base
    }

    var iconsStyleStack: [any IconsStyle] {
        get {
            self[IconsStyleStackKey.self]
        }
        set {
            self[IconsStyleStackKey.self] = newValue
        }
    }
}

// MARK: InformationViewStyle

struct InformationViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any InformationViewStyle] = []
}

extension EnvironmentValues {
    var informationViewStyle: any InformationViewStyle {
        self.informationViewStyleStack.last ?? .base.concat(.fiori)
    }

    var informationViewStyleStack: [any InformationViewStyle] {
        get {
            self[InformationViewStyleStackKey.self]
        }
        set {
            self[InformationViewStyleStackKey.self] = newValue
        }
    }
}

// MARK: InformationViewContentStyle

struct InformationViewContentStyleStackKey: EnvironmentKey {
    static let defaultValue: [any InformationViewContentStyle] = []
}

extension EnvironmentValues {
    var informationViewContentStyle: any InformationViewContentStyle {
        self.informationViewContentStyleStack.last ?? .base
    }

    var informationViewContentStyleStack: [any InformationViewContentStyle] {
        get {
            self[InformationViewContentStyleStackKey.self]
        }
        set {
            self[InformationViewContentStyleStackKey.self] = newValue
        }
    }
}

// MARK: InformationViewIconStyle

struct InformationViewIconStyleStackKey: EnvironmentKey {
    static let defaultValue: [any InformationViewIconStyle] = []
}

extension EnvironmentValues {
    var informationViewIconStyle: any InformationViewIconStyle {
        self.informationViewIconStyleStack.last ?? .base
    }

    var informationViewIconStyleStack: [any InformationViewIconStyle] {
        get {
            self[InformationViewIconStyleStackKey.self]
        }
        set {
            self[InformationViewIconStyleStackKey.self] = newValue
        }
    }
}

// MARK: InformationViewTextStyle

struct InformationViewTextStyleStackKey: EnvironmentKey {
    static let defaultValue: [any InformationViewTextStyle] = []
}

extension EnvironmentValues {
    var informationViewTextStyle: any InformationViewTextStyle {
        self.informationViewTextStyleStack.last ?? .base
    }

    var informationViewTextStyleStack: [any InformationViewTextStyle] {
        get {
            self[InformationViewTextStyleStackKey.self]
        }
        set {
            self[InformationViewTextStyleStackKey.self] = newValue
        }
    }
}

// MARK: MediaImageStyle

struct MediaImageStyleStackKey: EnvironmentKey {
    static let defaultValue: [any MediaImageStyle] = []
}

extension EnvironmentValues {
    var mediaImageStyle: any MediaImageStyle {
        self.mediaImageStyleStack.last ?? .base
    }

    var mediaImageStyleStack: [any MediaImageStyle] {
        get {
            self[MediaImageStyleStackKey.self]
        }
        set {
            self[MediaImageStyleStackKey.self] = newValue
        }
    }
}

// MARK: NewActionStyle

struct NewActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any NewActionStyle] = []
}

extension EnvironmentValues {
    var newActionStyle: any NewActionStyle {
        self.newActionStyleStack.last ?? .base
    }

    var newActionStyleStack: [any NewActionStyle] {
        get {
            self[NewActionStyleStackKey.self]
        }
        set {
            self[NewActionStyleStackKey.self] = newValue
        }
    }
}

// MARK: NewObjectItemStyle

struct NewObjectItemStyleStackKey: EnvironmentKey {
    static let defaultValue: [any NewObjectItemStyle] = []
}

extension EnvironmentValues {
    var newObjectItemStyle: any NewObjectItemStyle {
        self.newObjectItemStyleStack.last ?? .base.concat(.fiori)
    }

    var newObjectItemStyleStack: [any NewObjectItemStyle] {
        get {
            self[NewObjectItemStyleStackKey.self]
        }
        set {
            self[NewObjectItemStyleStackKey.self] = newValue
        }
    }
}

// MARK: Row1Style

struct Row1StyleStackKey: EnvironmentKey {
    static let defaultValue: [any Row1Style] = []
}

extension EnvironmentValues {
    var row1Style: any Row1Style {
        self.row1StyleStack.last ?? .base
    }

    var row1StyleStack: [any Row1Style] {
        get {
            self[Row1StyleStackKey.self]
        }
        set {
            self[Row1StyleStackKey.self] = newValue
        }
    }
}

// MARK: Row2Style

struct Row2StyleStackKey: EnvironmentKey {
    static let defaultValue: [any Row2Style] = []
}

extension EnvironmentValues {
    var row2Style: any Row2Style {
        self.row2StyleStack.last ?? .base
    }

    var row2StyleStack: [any Row2Style] {
        get {
            self[Row2StyleStackKey.self]
        }
        set {
            self[Row2StyleStackKey.self] = newValue
        }
    }
}

// MARK: Row3Style

struct Row3StyleStackKey: EnvironmentKey {
    static let defaultValue: [any Row3Style] = []
}

extension EnvironmentValues {
    var row3Style: any Row3Style {
        self.row3StyleStack.last ?? .base
    }

    var row3StyleStack: [any Row3Style] {
        get {
            self[Row3StyleStackKey.self]
        }
        set {
            self[Row3StyleStackKey.self] = newValue
        }
    }
}

// MARK: SecondaryActionStyle

struct SecondaryActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SecondaryActionStyle] = []
}

extension EnvironmentValues {
    var secondaryActionStyle: any SecondaryActionStyle {
        self.secondaryActionStyleStack.last ?? .base
    }

    var secondaryActionStyleStack: [any SecondaryActionStyle] {
        get {
            self[SecondaryActionStyleStackKey.self]
        }
        set {
            self[SecondaryActionStyleStackKey.self] = newValue
        }
    }
}

// MARK: StatusStyle

struct StatusStyleStackKey: EnvironmentKey {
    static let defaultValue: [any StatusStyle] = []
}

extension EnvironmentValues {
    var statusStyle: any StatusStyle {
        self.statusStyleStack.last ?? .base
    }

    var statusStyleStack: [any StatusStyle] {
        get {
            self[StatusStyleStackKey.self]
        }
        set {
            self[StatusStyleStackKey.self] = newValue
        }
    }
}

// MARK: SubstatusStyle

struct SubstatusStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SubstatusStyle] = []
}

extension EnvironmentValues {
    var substatusStyle: any SubstatusStyle {
        self.substatusStyleStack.last ?? .base
    }

    var substatusStyleStack: [any SubstatusStyle] {
        get {
            self[SubstatusStyleStackKey.self]
        }
        set {
            self[SubstatusStyleStackKey.self] = newValue
        }
    }
}

// MARK: SubtitleStyle

struct SubtitleStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SubtitleStyle] = []
}

extension EnvironmentValues {
    var subtitleStyle: any SubtitleStyle {
        self.subtitleStyleStack.last ?? .base
    }

    var subtitleStyleStack: [any SubtitleStyle] {
        get {
            self[SubtitleStyleStackKey.self]
        }
        set {
            self[SubtitleStyleStackKey.self] = newValue
        }
    }
}

// MARK: SwitchStyle

struct SwitchStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SwitchStyle] = []
}

extension EnvironmentValues {
    var switchStyle: any SwitchStyle {
        self.switchStyleStack.last ?? .base
    }

    var switchStyleStack: [any SwitchStyle] {
        get {
            self[SwitchStyleStackKey.self]
        }
        set {
            self[SwitchStyleStackKey.self] = newValue
        }
    }
}

// MARK: TagsStyle

struct TagsStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TagsStyle] = []
}

extension EnvironmentValues {
    var tagsStyle: any TagsStyle {
        self.tagsStyleStack.last ?? .base
    }

    var tagsStyleStack: [any TagsStyle] {
        get {
            self[TagsStyleStackKey.self]
        }
        set {
            self[TagsStyleStackKey.self] = newValue
        }
    }
}

// MARK: TitleStyle

struct TitleStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TitleStyle] = []
}

extension EnvironmentValues {
    var titleStyle: any TitleStyle {
        self.titleStyleStack.last ?? .base
    }

    var titleStyleStack: [any TitleStyle] {
        get {
            self[TitleStyleStackKey.self]
        }
        set {
            self[TitleStyleStackKey.self] = newValue
        }
    }
}
