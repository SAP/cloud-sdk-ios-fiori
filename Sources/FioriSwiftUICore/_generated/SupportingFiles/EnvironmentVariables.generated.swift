// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: AccessoryIconStyle

struct AccessoryIconStyleStackKey: EnvironmentKey {
    static let defaultValue: [any AccessoryIconStyle] = []
}

extension EnvironmentValues {
    var accessoryIconStyle: any AccessoryIconStyle {
        self.accessoryIconStyleStack.last ?? .base
    }

    var accessoryIconStyleStack: [any AccessoryIconStyle] {
        get {
            self[AccessoryIconStyleStackKey.self]
        }
        set {
            self[AccessoryIconStyleStackKey.self] = newValue
        }
    }
}

// MARK: ActionStyle

struct ActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ActionStyle] = []
}

extension EnvironmentValues {
    var actionStyle: any ActionStyle {
        self.actionStyleStack.last ?? .base
    }

    var actionStyleStack: [any ActionStyle] {
        get {
            self[ActionStyleStackKey.self]
        }
        set {
            self[ActionStyleStackKey.self] = newValue
        }
    }
}

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

// MARK: BannerMessageStyle

struct BannerMessageStyleStackKey: EnvironmentKey {
    static let defaultValue: [any BannerMessageStyle] = []
}

extension EnvironmentValues {
    var bannerMessageStyle: any BannerMessageStyle {
        self.bannerMessageStyleStack.last ?? .base.concat(.fiori)
    }

    var bannerMessageStyleStack: [any BannerMessageStyle] {
        get {
            self[BannerMessageStyleStackKey.self]
        }
        set {
            self[BannerMessageStyleStackKey.self] = newValue
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

// MARK: CloseActionStyle

struct CloseActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any CloseActionStyle] = []
}

extension EnvironmentValues {
    var closeActionStyle: any CloseActionStyle {
        self.closeActionStyleStack.last ?? .base
    }

    var closeActionStyleStack: [any CloseActionStyle] {
        get {
            self[CloseActionStyleStackKey.self]
        }
        set {
            self[CloseActionStyleStackKey.self] = newValue
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

// MARK: DecrementActionStyle

struct DecrementActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any DecrementActionStyle] = []
}

extension EnvironmentValues {
    var decrementActionStyle: any DecrementActionStyle {
        self.decrementActionStyleStack.last ?? .base
    }

    var decrementActionStyleStack: [any DecrementActionStyle] {
        get {
            self[DecrementActionStyleStackKey.self]
        }
        set {
            self[DecrementActionStyleStackKey.self] = newValue
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

// MARK: FilledIconStyle

struct FilledIconStyleStackKey: EnvironmentKey {
    static let defaultValue: [any FilledIconStyle] = []
}

extension EnvironmentValues {
    var filledIconStyle: any FilledIconStyle {
        self.filledIconStyleStack.last ?? .base
    }

    var filledIconStyleStack: [any FilledIconStyle] {
        get {
            self[FilledIconStyleStackKey.self]
        }
        set {
            self[FilledIconStyleStackKey.self] = newValue
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

// MARK: FormViewStyle

struct FormViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any FormViewStyle] = []
}

extension EnvironmentValues {
    var formViewStyle: any FormViewStyle {
        self.formViewStyleStack.last ?? .base.concat(.fiori)
    }

    var formViewStyleStack: [any FormViewStyle] {
        get {
            self[FormViewStyleStackKey.self]
        }
        set {
            self[FormViewStyleStackKey.self] = newValue
        }
    }
}

// MARK: GreetingTextStyle

struct GreetingTextStyleStackKey: EnvironmentKey {
    static let defaultValue: [any GreetingTextStyle] = []
}

extension EnvironmentValues {
    var greetingTextStyle: any GreetingTextStyle {
        self.greetingTextStyleStack.last ?? .base
    }

    var greetingTextStyleStack: [any GreetingTextStyle] {
        get {
            self[GreetingTextStyleStackKey.self]
        }
        set {
            self[GreetingTextStyleStackKey.self] = newValue
        }
    }
}

// MARK: HeaderActionStyle

struct HeaderActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any HeaderActionStyle] = []
}

extension EnvironmentValues {
    var headerActionStyle: any HeaderActionStyle {
        self.headerActionStyleStack.last ?? .base
    }

    var headerActionStyleStack: [any HeaderActionStyle] {
        get {
            self[HeaderActionStyleStackKey.self]
        }
        set {
            self[HeaderActionStyleStackKey.self] = newValue
        }
    }
}

// MARK: HelperTextStyle

struct HelperTextStyleStackKey: EnvironmentKey {
    static let defaultValue: [any HelperTextStyle] = []
}

extension EnvironmentValues {
    var helperTextStyle: any HelperTextStyle {
        self.helperTextStyleStack.last ?? .base
    }

    var helperTextStyleStack: [any HelperTextStyle] {
        get {
            self[HelperTextStyleStackKey.self]
        }
        set {
            self[HelperTextStyleStackKey.self] = newValue
        }
    }
}

// MARK: IconStyle

struct IconStyleStackKey: EnvironmentKey {
    static let defaultValue: [any IconStyle] = []
}

extension EnvironmentValues {
    var iconStyle: any IconStyle {
        self.iconStyleStack.last ?? .base
    }

    var iconStyleStack: [any IconStyle] {
        get {
            self[IconStyleStackKey.self]
        }
        set {
            self[IconStyleStackKey.self] = newValue
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

// MARK: IllustratedMessageStyle

struct IllustratedMessageStyleStackKey: EnvironmentKey {
    static let defaultValue: [any IllustratedMessageStyle] = []
}

extension EnvironmentValues {
    var illustratedMessageStyle: any IllustratedMessageStyle {
        self.illustratedMessageStyleStack.last ?? .base.concat(.fiori)
    }

    var illustratedMessageStyleStack: [any IllustratedMessageStyle] {
        get {
            self[IllustratedMessageStyleStackKey.self]
        }
        set {
            self[IllustratedMessageStyleStackKey.self] = newValue
        }
    }
}

// MARK: IncrementActionStyle

struct IncrementActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any IncrementActionStyle] = []
}

extension EnvironmentValues {
    var incrementActionStyle: any IncrementActionStyle {
        self.incrementActionStyleStack.last ?? .base
    }

    var incrementActionStyleStack: [any IncrementActionStyle] {
        get {
            self[IncrementActionStyleStackKey.self]
        }
        set {
            self[IncrementActionStyleStackKey.self] = newValue
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

// MARK: JouleWelcomeScreenStyle

struct JouleWelcomeScreenStyleStackKey: EnvironmentKey {
    static let defaultValue: [any JouleWelcomeScreenStyle] = []
}

extension EnvironmentValues {
    var jouleWelcomeScreenStyle: any JouleWelcomeScreenStyle {
        self.jouleWelcomeScreenStyleStack.last ?? .base.concat(.fiori)
    }

    var jouleWelcomeScreenStyleStack: [any JouleWelcomeScreenStyle] {
        get {
            self[JouleWelcomeScreenStyleStackKey.self]
        }
        set {
            self[JouleWelcomeScreenStyleStackKey.self] = newValue
        }
    }
}

// MARK: KeyValueFormViewStyle

struct KeyValueFormViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any KeyValueFormViewStyle] = []
}

extension EnvironmentValues {
    var keyValueFormViewStyle: any KeyValueFormViewStyle {
        self.keyValueFormViewStyleStack.last ?? .base.concat(.fiori)
    }

    var keyValueFormViewStyleStack: [any KeyValueFormViewStyle] {
        get {
            self[KeyValueFormViewStyleStackKey.self]
        }
        set {
            self[KeyValueFormViewStyleStackKey.self] = newValue
        }
    }
}

// MARK: KpiCaptionStyle

struct KpiCaptionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any KpiCaptionStyle] = []
}

extension EnvironmentValues {
    var kpiCaptionStyle: any KpiCaptionStyle {
        self.kpiCaptionStyleStack.last ?? .base
    }

    var kpiCaptionStyleStack: [any KpiCaptionStyle] {
        get {
            self[KpiCaptionStyleStackKey.self]
        }
        set {
            self[KpiCaptionStyleStackKey.self] = newValue
        }
    }
}

// MARK: KpiStyle

struct KpiStyleStackKey: EnvironmentKey {
    static let defaultValue: [any KpiStyle] = []
}

extension EnvironmentValues {
    var kpiStyle: any KpiStyle {
        self.kpiStyleStack.last ?? .base
    }

    var kpiStyleStack: [any KpiStyle] {
        get {
            self[KpiStyleStackKey.self]
        }
        set {
            self[KpiStyleStackKey.self] = newValue
        }
    }
}

// MARK: LabelItemStyle

struct LabelItemStyleStackKey: EnvironmentKey {
    static let defaultValue: [any LabelItemStyle] = []
}

extension EnvironmentValues {
    var labelItemStyle: any LabelItemStyle {
        self.labelItemStyleStack.last ?? .base.concat(.fiori)
    }

    var labelItemStyleStack: [any LabelItemStyle] {
        get {
            self[LabelItemStyleStackKey.self]
        }
        set {
            self[LabelItemStyleStackKey.self] = newValue
        }
    }
}

// MARK: LinearProgressIndicatorStyle

struct LinearProgressIndicatorStyleStackKey: EnvironmentKey {
    static let defaultValue: [any LinearProgressIndicatorStyle] = []
}

extension EnvironmentValues {
    var linearProgressIndicatorStyle: any LinearProgressIndicatorStyle {
        self.linearProgressIndicatorStyleStack.last ?? .base
    }

    var linearProgressIndicatorStyleStack: [any LinearProgressIndicatorStyle] {
        get {
            self[LinearProgressIndicatorStyleStackKey.self]
        }
        set {
            self[LinearProgressIndicatorStyleStackKey.self] = newValue
        }
    }
}

// MARK: LinearProgressIndicatorViewStyle

struct LinearProgressIndicatorViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any LinearProgressIndicatorViewStyle] = []
}

extension EnvironmentValues {
    var linearProgressIndicatorViewStyle: any LinearProgressIndicatorViewStyle {
        self.linearProgressIndicatorViewStyleStack.last ?? .base.concat(.fiori)
    }

    var linearProgressIndicatorViewStyleStack: [any LinearProgressIndicatorViewStyle] {
        get {
            self[LinearProgressIndicatorViewStyleStackKey.self]
        }
        set {
            self[LinearProgressIndicatorViewStyleStackKey.self] = newValue
        }
    }
}

// MARK: MandatoryFieldIndicatorStyle

struct MandatoryFieldIndicatorStyleStackKey: EnvironmentKey {
    static let defaultValue: [any MandatoryFieldIndicatorStyle] = []
}

extension EnvironmentValues {
    var mandatoryFieldIndicatorStyle: any MandatoryFieldIndicatorStyle {
        self.mandatoryFieldIndicatorStyleStack.last ?? .base
    }

    var mandatoryFieldIndicatorStyleStack: [any MandatoryFieldIndicatorStyle] {
        get {
            self[MandatoryFieldIndicatorStyleStackKey.self]
        }
        set {
            self[MandatoryFieldIndicatorStyleStackKey.self] = newValue
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

// MARK: MenuSelectionStyle

struct MenuSelectionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any MenuSelectionStyle] = []
}

extension EnvironmentValues {
    var menuSelectionStyle: any MenuSelectionStyle {
        self.menuSelectionStyleStack.last ?? .base.concat(.fiori)
    }

    var menuSelectionStyleStack: [any MenuSelectionStyle] {
        get {
            self[MenuSelectionStyleStackKey.self]
        }
        set {
            self[MenuSelectionStyleStackKey.self] = newValue
        }
    }
}

// MARK: MenuSelectionItemStyle

struct MenuSelectionItemStyleStackKey: EnvironmentKey {
    static let defaultValue: [any MenuSelectionItemStyle] = []
}

extension EnvironmentValues {
    var menuSelectionItemStyle: any MenuSelectionItemStyle {
        self.menuSelectionItemStyleStack.last ?? .base.concat(.fiori)
    }

    var menuSelectionItemStyleStack: [any MenuSelectionItemStyle] {
        get {
            self[MenuSelectionItemStyleStackKey.self]
        }
        set {
            self[MenuSelectionItemStyleStackKey.self] = newValue
        }
    }
}

// MARK: MessageContentStyle

struct MessageContentStyleStackKey: EnvironmentKey {
    static let defaultValue: [any MessageContentStyle] = []
}

extension EnvironmentValues {
    var messageContentStyle: any MessageContentStyle {
        self.messageContentStyleStack.last ?? .base
    }

    var messageContentStyleStack: [any MessageContentStyle] {
        get {
            self[MessageContentStyleStackKey.self]
        }
        set {
            self[MessageContentStyleStackKey.self] = newValue
        }
    }
}

// MARK: MoreActionOverflowStyle

struct MoreActionOverflowStyleStackKey: EnvironmentKey {
    static let defaultValue: [any MoreActionOverflowStyle] = []
}

extension EnvironmentValues {
    var moreActionOverflowStyle: any MoreActionOverflowStyle {
        self.moreActionOverflowStyleStack.last ?? .base
    }

    var moreActionOverflowStyleStack: [any MoreActionOverflowStyle] {
        get {
            self[MoreActionOverflowStyleStackKey.self]
        }
        set {
            self[MoreActionOverflowStyleStackKey.self] = newValue
        }
    }
}

// MARK: NoteFormViewStyle

struct NoteFormViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any NoteFormViewStyle] = []
}

extension EnvironmentValues {
    var noteFormViewStyle: any NoteFormViewStyle {
        self.noteFormViewStyleStack.last ?? .base.concat(.fiori)
    }

    var noteFormViewStyleStack: [any NoteFormViewStyle] {
        get {
            self[NoteFormViewStyleStackKey.self]
        }
        set {
            self[NoteFormViewStyleStackKey.self] = newValue
        }
    }
}

// MARK: ObjectItemStyle

struct ObjectItemStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ObjectItemStyle] = []
}

extension EnvironmentValues {
    var objectItemStyle: any ObjectItemStyle {
        self.objectItemStyleStack.last ?? .base.concat(.fiori)
    }

    var objectItemStyleStack: [any ObjectItemStyle] {
        get {
            self[ObjectItemStyleStackKey.self]
        }
        set {
            self[ObjectItemStyleStackKey.self] = newValue
        }
    }
}

// MARK: OverflowActionStyle

struct OverflowActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any OverflowActionStyle] = []
}

extension EnvironmentValues {
    var overflowActionStyle: any OverflowActionStyle {
        self.overflowActionStyleStack.last ?? .base
    }

    var overflowActionStyleStack: [any OverflowActionStyle] {
        get {
            self[OverflowActionStyleStackKey.self]
        }
        set {
            self[OverflowActionStyleStackKey.self] = newValue
        }
    }
}

// MARK: PlaceholderStyle

struct PlaceholderStyleStackKey: EnvironmentKey {
    static let defaultValue: [any PlaceholderStyle] = []
}

extension EnvironmentValues {
    var placeholderStyle: any PlaceholderStyle {
        self.placeholderStyleStack.last ?? .base
    }

    var placeholderStyleStack: [any PlaceholderStyle] {
        get {
            self[PlaceholderStyleStackKey.self]
        }
        set {
            self[PlaceholderStyleStackKey.self] = newValue
        }
    }
}

// MARK: PlaceholderTextEditorStyle

struct PlaceholderTextEditorStyleStackKey: EnvironmentKey {
    static let defaultValue: [any PlaceholderTextEditorStyle] = []
}

extension EnvironmentValues {
    var placeholderTextEditorStyle: any PlaceholderTextEditorStyle {
        self.placeholderTextEditorStyleStack.last ?? .base.concat(.fiori)
    }

    var placeholderTextEditorStyleStack: [any PlaceholderTextEditorStyle] {
        get {
            self[PlaceholderTextEditorStyleStackKey.self]
        }
        set {
            self[PlaceholderTextEditorStyleStackKey.self] = newValue
        }
    }
}

// MARK: PlaceholderTextFieldStyle

struct PlaceholderTextFieldStyleStackKey: EnvironmentKey {
    static let defaultValue: [any PlaceholderTextFieldStyle] = []
}

extension EnvironmentValues {
    var placeholderTextFieldStyle: any PlaceholderTextFieldStyle {
        self.placeholderTextFieldStyleStack.last ?? .base.concat(.fiori)
    }

    var placeholderTextFieldStyleStack: [any PlaceholderTextFieldStyle] {
        get {
            self[PlaceholderTextFieldStyleStackKey.self]
        }
        set {
            self[PlaceholderTextFieldStyleStackKey.self] = newValue
        }
    }
}

// MARK: RatingControlStyle

struct RatingControlStyleStackKey: EnvironmentKey {
    static let defaultValue: [any RatingControlStyle] = []
}

extension EnvironmentValues {
    var ratingControlStyle: any RatingControlStyle {
        self.ratingControlStyleStack.last ?? .base.concat(.fiori)
    }

    var ratingControlStyleStack: [any RatingControlStyle] {
        get {
            self[RatingControlStyleStackKey.self]
        }
        set {
            self[RatingControlStyleStackKey.self] = newValue
        }
    }
}

// MARK: RatingControlFormViewStyle

struct RatingControlFormViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any RatingControlFormViewStyle] = []
}

extension EnvironmentValues {
    var ratingControlFormViewStyle: any RatingControlFormViewStyle {
        self.ratingControlFormViewStyleStack.last ?? .base.concat(.fiori)
    }

    var ratingControlFormViewStyleStack: [any RatingControlFormViewStyle] {
        get {
            self[RatingControlFormViewStyleStackKey.self]
        }
        set {
            self[RatingControlFormViewStyleStackKey.self] = newValue
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

// MARK: SideBarStyle

struct SideBarStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SideBarStyle] = []
}

extension EnvironmentValues {
    var sideBarStyle: any SideBarStyle {
        self.sideBarStyleStack.last ?? .base.concat(.fiori)
    }

    var sideBarStyleStack: [any SideBarStyle] {
        get {
            self[SideBarStyleStackKey.self]
        }
        set {
            self[SideBarStyleStackKey.self] = newValue
        }
    }
}

// MARK: SideBarListItemStyle

struct SideBarListItemStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SideBarListItemStyle] = []
}

extension EnvironmentValues {
    var sideBarListItemStyle: any SideBarListItemStyle {
        self.sideBarListItemStyleStack.last ?? .base.concat(.fiori)
    }

    var sideBarListItemStyleStack: [any SideBarListItemStyle] {
        get {
            self[SideBarListItemStyleStackKey.self]
        }
        set {
            self[SideBarListItemStyleStackKey.self] = newValue
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

// MARK: StepperFieldStyle

struct StepperFieldStyleStackKey: EnvironmentKey {
    static let defaultValue: [any StepperFieldStyle] = []
}

extension EnvironmentValues {
    var stepperFieldStyle: any StepperFieldStyle {
        self.stepperFieldStyleStack.last ?? .base.concat(.fiori)
    }

    var stepperFieldStyleStack: [any StepperFieldStyle] {
        get {
            self[StepperFieldStyleStackKey.self]
        }
        set {
            self[StepperFieldStyleStackKey.self] = newValue
        }
    }
}

// MARK: StepperViewStyle

struct StepperViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any StepperViewStyle] = []
}

extension EnvironmentValues {
    var stepperViewStyle: any StepperViewStyle {
        self.stepperViewStyleStack.last ?? .base.concat(.fiori)
    }

    var stepperViewStyleStack: [any StepperViewStyle] {
        get {
            self[StepperViewStyleStackKey.self]
        }
        set {
            self[StepperViewStyleStackKey.self] = newValue
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

// MARK: TertiaryActionStyle

struct TertiaryActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TertiaryActionStyle] = []
}

extension EnvironmentValues {
    var tertiaryActionStyle: any TertiaryActionStyle {
        self.tertiaryActionStyleStack.last ?? .base
    }

    var tertiaryActionStyleStack: [any TertiaryActionStyle] {
        get {
            self[TertiaryActionStyleStackKey.self]
        }
        set {
            self[TertiaryActionStyleStackKey.self] = newValue
        }
    }
}

// MARK: TextFieldFormViewStyle

struct TextFieldFormViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TextFieldFormViewStyle] = []
}

extension EnvironmentValues {
    var textFieldFormViewStyle: any TextFieldFormViewStyle {
        self.textFieldFormViewStyleStack.last ?? .base.concat(.fiori)
    }

    var textFieldFormViewStyleStack: [any TextFieldFormViewStyle] {
        get {
            self[TextFieldFormViewStyleStackKey.self]
        }
        set {
            self[TextFieldFormViewStyleStackKey.self] = newValue
        }
    }
}

// MARK: TextInputFieldStyle

struct TextInputFieldStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TextInputFieldStyle] = []
}

extension EnvironmentValues {
    var textInputFieldStyle: any TextInputFieldStyle {
        self.textInputFieldStyleStack.last ?? .base
    }

    var textInputFieldStyleStack: [any TextInputFieldStyle] {
        get {
            self[TextInputFieldStyleStackKey.self]
        }
        set {
            self[TextInputFieldStyleStackKey.self] = newValue
        }
    }
}

// MARK: TextInputInfoViewStyle

struct TextInputInfoViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TextInputInfoViewStyle] = []
}

extension EnvironmentValues {
    var textInputInfoViewStyle: any TextInputInfoViewStyle {
        self.textInputInfoViewStyleStack.last ?? .base.concat(.fiori)
    }

    var textInputInfoViewStyleStack: [any TextInputInfoViewStyle] {
        get {
            self[TextInputInfoViewStyleStackKey.self]
        }
        set {
            self[TextInputInfoViewStyleStackKey.self] = newValue
        }
    }
}

// MARK: TextViewStyle

struct TextViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TextViewStyle] = []
}

extension EnvironmentValues {
    var textViewStyle: any TextViewStyle {
        self.textViewStyleStack.last ?? .base
    }

    var textViewStyleStack: [any TextViewStyle] {
        get {
            self[TextViewStyleStackKey.self]
        }
        set {
            self[TextViewStyleStackKey.self] = newValue
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

// MARK: TitleFormViewStyle

struct TitleFormViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TitleFormViewStyle] = []
}

extension EnvironmentValues {
    var titleFormViewStyle: any TitleFormViewStyle {
        self.titleFormViewStyleStack.last ?? .base.concat(.fiori)
    }

    var titleFormViewStyleStack: [any TitleFormViewStyle] {
        get {
            self[TitleFormViewStyleStackKey.self]
        }
        set {
            self[TitleFormViewStyleStackKey.self] = newValue
        }
    }
}

// MARK: TopDividerStyle

struct TopDividerStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TopDividerStyle] = []
}

extension EnvironmentValues {
    var topDividerStyle: any TopDividerStyle {
        self.topDividerStyleStack.last ?? .base
    }

    var topDividerStyleStack: [any TopDividerStyle] {
        get {
            self[TopDividerStyleStackKey.self]
        }
        set {
            self[TopDividerStyleStackKey.self] = newValue
        }
    }
}
