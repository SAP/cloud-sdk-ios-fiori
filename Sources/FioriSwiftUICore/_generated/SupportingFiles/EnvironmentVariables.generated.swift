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

// MARK: AllEntriesSectionTitleStyle

struct AllEntriesSectionTitleStyleStackKey: EnvironmentKey {
    static let defaultValue: [any AllEntriesSectionTitleStyle] = []
}

extension EnvironmentValues {
    var allEntriesSectionTitleStyle: any AllEntriesSectionTitleStyle {
        self.allEntriesSectionTitleStyleStack.last ?? .base
    }

    var allEntriesSectionTitleStyleStack: [any AllEntriesSectionTitleStyle] {
        get {
            self[AllEntriesSectionTitleStyleStackKey.self]
        }
        set {
            self[AllEntriesSectionTitleStyleStackKey.self] = newValue
        }
    }
}

// MARK: ApplyActionStyle

struct ApplyActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ApplyActionStyle] = []
}

extension EnvironmentValues {
    var applyActionStyle: any ApplyActionStyle {
        self.applyActionStyleStack.last ?? .base
    }

    var applyActionStyleStack: [any ApplyActionStyle] {
        get {
            self[ApplyActionStyleStackKey.self]
        }
        set {
            self[ApplyActionStyleStackKey.self] = newValue
        }
    }
}

// MARK: AttributeStyle

struct AttributeStyleStackKey: EnvironmentKey {
    static let defaultValue: [any AttributeStyle] = []
}

extension EnvironmentValues {
    var attributeStyle: any AttributeStyle {
        self.attributeStyleStack.last ?? .base
    }

    var attributeStyleStack: [any AttributeStyle] {
        get {
            self[AttributeStyleStackKey.self]
        }
        set {
            self[AttributeStyleStackKey.self] = newValue
        }
    }
}

// MARK: AvatarStackStyle

struct AvatarStackStyleStackKey: EnvironmentKey {
    static let defaultValue: [any AvatarStackStyle] = []
}

extension EnvironmentValues {
    var avatarStackStyle: any AvatarStackStyle {
        self.avatarStackStyleStack.last ?? .base.concat(.fiori)
    }

    var avatarStackStyleStack: [any AvatarStackStyle] {
        get {
            self[AvatarStackStyleStackKey.self]
        }
        set {
            self[AvatarStackStyleStackKey.self] = newValue
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

// MARK: AvatarsTitleStyle

struct AvatarsTitleStyleStackKey: EnvironmentKey {
    static let defaultValue: [any AvatarsTitleStyle] = []
}

extension EnvironmentValues {
    var avatarsTitleStyle: any AvatarsTitleStyle {
        self.avatarsTitleStyleStack.last ?? .base
    }

    var avatarsTitleStyleStack: [any AvatarsTitleStyle] {
        get {
            self[AvatarsTitleStyleStackKey.self]
        }
        set {
            self[AvatarsTitleStyleStackKey.self] = newValue
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

// MARK: CancelActionStyle

struct CancelActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any CancelActionStyle] = []
}

extension EnvironmentValues {
    var cancelActionStyle: any CancelActionStyle {
        self.cancelActionStyleStack.last ?? .base
    }

    var cancelActionStyleStack: [any CancelActionStyle] {
        get {
            self[CancelActionStyleStackKey.self]
        }
        set {
            self[CancelActionStyleStackKey.self] = newValue
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

// MARK: DateTimePickerStyle

struct DateTimePickerStyleStackKey: EnvironmentKey {
    static let defaultValue: [any DateTimePickerStyle] = []
}

extension EnvironmentValues {
    var dateTimePickerStyle: any DateTimePickerStyle {
        self.dateTimePickerStyleStack.last ?? .base.concat(.fiori)
    }

    var dateTimePickerStyleStack: [any DateTimePickerStyle] {
        get {
            self[DateTimePickerStyleStackKey.self]
        }
        set {
            self[DateTimePickerStyleStackKey.self] = newValue
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

// MARK: DeselectAllActionStyle

struct DeselectAllActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any DeselectAllActionStyle] = []
}

extension EnvironmentValues {
    var deselectAllActionStyle: any DeselectAllActionStyle {
        self.deselectAllActionStyleStack.last ?? .base
    }

    var deselectAllActionStyleStack: [any DeselectAllActionStyle] {
        get {
            self[DeselectAllActionStyleStackKey.self]
        }
        set {
            self[DeselectAllActionStyleStackKey.self] = newValue
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

// MARK: FootnoteIconsTextStyle

struct FootnoteIconsTextStyleStackKey: EnvironmentKey {
    static let defaultValue: [any FootnoteIconsTextStyle] = []
}

extension EnvironmentValues {
    var footnoteIconsTextStyle: any FootnoteIconsTextStyle {
        self.footnoteIconsTextStyleStack.last ?? .base
    }

    var footnoteIconsTextStyleStack: [any FootnoteIconsTextStyle] {
        get {
            self[FootnoteIconsTextStyleStackKey.self]
        }
        set {
            self[FootnoteIconsTextStyleStackKey.self] = newValue
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

// MARK: HalfStarImageStyle

struct HalfStarImageStyleStackKey: EnvironmentKey {
    static let defaultValue: [any HalfStarImageStyle] = []
}

extension EnvironmentValues {
    var halfStarImageStyle: any HalfStarImageStyle {
        self.halfStarImageStyleStack.last ?? .base
    }

    var halfStarImageStyleStack: [any HalfStarImageStyle] {
        get {
            self[HalfStarImageStyleStackKey.self]
        }
        set {
            self[HalfStarImageStyleStackKey.self] = newValue
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

// MARK: ListPickerContentStyle

struct ListPickerContentStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ListPickerContentStyle] = []
}

extension EnvironmentValues {
    var listPickerContentStyle: any ListPickerContentStyle {
        self.listPickerContentStyleStack.last ?? .base
    }

    var listPickerContentStyleStack: [any ListPickerContentStyle] {
        get {
            self[ListPickerContentStyleStackKey.self]
        }
        set {
            self[ListPickerContentStyleStackKey.self] = newValue
        }
    }
}

// MARK: ListPickerDestinationStyle

struct ListPickerDestinationStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ListPickerDestinationStyle] = []
}

extension EnvironmentValues {
    var listPickerDestinationStyle: any ListPickerDestinationStyle {
        self.listPickerDestinationStyleStack.last ?? .base.concat(.fiori)
    }

    var listPickerDestinationStyleStack: [any ListPickerDestinationStyle] {
        get {
            self[ListPickerDestinationStyleStackKey.self]
        }
        set {
            self[ListPickerDestinationStyleStackKey.self] = newValue
        }
    }
}

// MARK: ListPickerItemStyle

struct ListPickerItemStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ListPickerItemStyle] = []
}

extension EnvironmentValues {
    var listPickerItemStyle: any ListPickerItemStyle {
        self.listPickerItemStyleStack.last ?? .base.concat(.fiori)
    }

    var listPickerItemStyleStack: [any ListPickerItemStyle] {
        get {
            self[ListPickerItemStyleStackKey.self]
        }
        set {
            self[ListPickerItemStyleStackKey.self] = newValue
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

// MARK: NowIndicatorNodeStyle

struct NowIndicatorNodeStyleStackKey: EnvironmentKey {
    static let defaultValue: [any NowIndicatorNodeStyle] = []
}

extension EnvironmentValues {
    var nowIndicatorNodeStyle: any NowIndicatorNodeStyle {
        self.nowIndicatorNodeStyleStack.last ?? .base
    }

    var nowIndicatorNodeStyleStack: [any NowIndicatorNodeStyle] {
        get {
            self[NowIndicatorNodeStyleStackKey.self]
        }
        set {
            self[NowIndicatorNodeStyleStackKey.self] = newValue
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

// MARK: OffStarImageStyle

struct OffStarImageStyleStackKey: EnvironmentKey {
    static let defaultValue: [any OffStarImageStyle] = []
}

extension EnvironmentValues {
    var offStarImageStyle: any OffStarImageStyle {
        self.offStarImageStyleStack.last ?? .base
    }

    var offStarImageStyleStack: [any OffStarImageStyle] {
        get {
            self[OffStarImageStyleStackKey.self]
        }
        set {
            self[OffStarImageStyleStackKey.self] = newValue
        }
    }
}

// MARK: OnStarImageStyle

struct OnStarImageStyleStackKey: EnvironmentKey {
    static let defaultValue: [any OnStarImageStyle] = []
}

extension EnvironmentValues {
    var onStarImageStyle: any OnStarImageStyle {
        self.onStarImageStyleStack.last ?? .base
    }

    var onStarImageStyleStack: [any OnStarImageStyle] {
        get {
            self[OnStarImageStyleStackKey.self]
        }
        set {
            self[OnStarImageStyleStackKey.self] = newValue
        }
    }
}

// MARK: OptionalTitleStyle

struct OptionalTitleStyleStackKey: EnvironmentKey {
    static let defaultValue: [any OptionalTitleStyle] = []
}

extension EnvironmentValues {
    var optionalTitleStyle: any OptionalTitleStyle {
        self.optionalTitleStyleStack.last ?? .base
    }

    var optionalTitleStyleStack: [any OptionalTitleStyle] {
        get {
            self[OptionalTitleStyleStackKey.self]
        }
        set {
            self[OptionalTitleStyleStackKey.self] = newValue
        }
    }
}

// MARK: OptionsStyle

struct OptionsStyleStackKey: EnvironmentKey {
    static let defaultValue: [any OptionsStyle] = []
}

extension EnvironmentValues {
    var optionsStyle: any OptionsStyle {
        self.optionsStyleStack.last ?? .base
    }

    var optionsStyleStack: [any OptionsStyle] {
        get {
            self[OptionsStyleStackKey.self]
        }
        set {
            self[OptionsStyleStackKey.self] = newValue
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

// MARK: ProfileHeaderStyle

struct ProfileHeaderStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ProfileHeaderStyle] = []
}

extension EnvironmentValues {
    var profileHeaderStyle: any ProfileHeaderStyle {
        self.profileHeaderStyleStack.last ?? .base.concat(.fiori)
    }

    var profileHeaderStyleStack: [any ProfileHeaderStyle] {
        get {
            self[ProfileHeaderStyleStackKey.self]
        }
        set {
            self[ProfileHeaderStyleStackKey.self] = newValue
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

// MARK: ReviewCountLabelStyle

struct ReviewCountLabelStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ReviewCountLabelStyle] = []
}

extension EnvironmentValues {
    var reviewCountLabelStyle: any ReviewCountLabelStyle {
        self.reviewCountLabelStyleStack.last ?? .base
    }

    var reviewCountLabelStyleStack: [any ReviewCountLabelStyle] {
        get {
            self[ReviewCountLabelStyleStackKey.self]
        }
        set {
            self[ReviewCountLabelStyleStackKey.self] = newValue
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

// MARK: SecondaryTimestampStyle

struct SecondaryTimestampStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SecondaryTimestampStyle] = []
}

extension EnvironmentValues {
    var secondaryTimestampStyle: any SecondaryTimestampStyle {
        self.secondaryTimestampStyleStack.last ?? .base
    }

    var secondaryTimestampStyleStack: [any SecondaryTimestampStyle] {
        get {
            self[SecondaryTimestampStyleStackKey.self]
        }
        set {
            self[SecondaryTimestampStyleStackKey.self] = newValue
        }
    }
}

// MARK: SegmentedControlPickerStyle

struct SegmentedControlPickerStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SegmentedControlPickerStyle] = []
}

extension EnvironmentValues {
    var segmentedControlPickerStyle: any SegmentedControlPickerStyle {
        self.segmentedControlPickerStyleStack.last ?? .base.concat(.fiori)
    }

    var segmentedControlPickerStyleStack: [any SegmentedControlPickerStyle] {
        get {
            self[SegmentedControlPickerStyleStackKey.self]
        }
        set {
            self[SegmentedControlPickerStyleStackKey.self] = newValue
        }
    }
}

// MARK: SelectAllActionStyle

struct SelectAllActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SelectAllActionStyle] = []
}

extension EnvironmentValues {
    var selectAllActionStyle: any SelectAllActionStyle {
        self.selectAllActionStyleStack.last ?? .base
    }

    var selectAllActionStyleStack: [any SelectAllActionStyle] {
        get {
            self[SelectAllActionStyleStackKey.self]
        }
        set {
            self[SelectAllActionStyleStackKey.self] = newValue
        }
    }
}

// MARK: SelectedEntriesSectionTitleStyle

struct SelectedEntriesSectionTitleStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SelectedEntriesSectionTitleStyle] = []
}

extension EnvironmentValues {
    var selectedEntriesSectionTitleStyle: any SelectedEntriesSectionTitleStyle {
        self.selectedEntriesSectionTitleStyleStack.last ?? .base
    }

    var selectedEntriesSectionTitleStyleStack: [any SelectedEntriesSectionTitleStyle] {
        get {
            self[SelectedEntriesSectionTitleStyleStackKey.self]
        }
        set {
            self[SelectedEntriesSectionTitleStyleStackKey.self] = newValue
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

// MARK: SubAttributeStyle

struct SubAttributeStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SubAttributeStyle] = []
}

extension EnvironmentValues {
    var subAttributeStyle: any SubAttributeStyle {
        self.subAttributeStyleStack.last ?? .base
    }

    var subAttributeStyleStack: [any SubAttributeStyle] {
        get {
            self[SubAttributeStyleStackKey.self]
        }
        set {
            self[SubAttributeStyleStackKey.self] = newValue
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

// MARK: SwitchViewStyle

struct SwitchViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any SwitchViewStyle] = []
}

extension EnvironmentValues {
    var switchViewStyle: any SwitchViewStyle {
        self.switchViewStyleStack.last ?? .base.concat(.fiori)
    }

    var switchViewStyleStack: [any SwitchViewStyle] {
        get {
            self[SwitchViewStyleStackKey.self]
        }
        set {
            self[SwitchViewStyleStackKey.self] = newValue
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

// MARK: TimelineStyle

struct TimelineStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TimelineStyle] = []
}

extension EnvironmentValues {
    var timelineStyle: any TimelineStyle {
        self.timelineStyleStack.last ?? .base.concat(.fiori)
    }

    var timelineStyleStack: [any TimelineStyle] {
        get {
            self[TimelineStyleStackKey.self]
        }
        set {
            self[TimelineStyleStackKey.self] = newValue
        }
    }
}

// MARK: TimelineMarkerStyle

struct TimelineMarkerStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TimelineMarkerStyle] = []
}

extension EnvironmentValues {
    var timelineMarkerStyle: any TimelineMarkerStyle {
        self.timelineMarkerStyleStack.last ?? .base.concat(.fiori)
    }

    var timelineMarkerStyleStack: [any TimelineMarkerStyle] {
        get {
            self[TimelineMarkerStyleStackKey.self]
        }
        set {
            self[TimelineMarkerStyleStackKey.self] = newValue
        }
    }
}

// MARK: TimelineNodeStyle

struct TimelineNodeStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TimelineNodeStyle] = []
}

extension EnvironmentValues {
    var timelineNodeStyle: any TimelineNodeStyle {
        self.timelineNodeStyleStack.last ?? .base
    }

    var timelineNodeStyleStack: [any TimelineNodeStyle] {
        get {
            self[TimelineNodeStyleStackKey.self]
        }
        set {
            self[TimelineNodeStyleStackKey.self] = newValue
        }
    }
}

// MARK: TimelineNowIndicatorStyle

struct TimelineNowIndicatorStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TimelineNowIndicatorStyle] = []
}

extension EnvironmentValues {
    var timelineNowIndicatorStyle: any TimelineNowIndicatorStyle {
        self.timelineNowIndicatorStyleStack.last ?? .base.concat(.fiori)
    }

    var timelineNowIndicatorStyleStack: [any TimelineNowIndicatorStyle] {
        get {
            self[TimelineNowIndicatorStyleStackKey.self]
        }
        set {
            self[TimelineNowIndicatorStyleStackKey.self] = newValue
        }
    }
}

// MARK: TimelinePreviewStyle

struct TimelinePreviewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TimelinePreviewStyle] = []
}

extension EnvironmentValues {
    var timelinePreviewStyle: any TimelinePreviewStyle {
        self.timelinePreviewStyleStack.last ?? .base.concat(.fiori)
    }

    var timelinePreviewStyleStack: [any TimelinePreviewStyle] {
        get {
            self[TimelinePreviewStyleStackKey.self]
        }
        set {
            self[TimelinePreviewStyleStackKey.self] = newValue
        }
    }
}

// MARK: TimelinePreviewItemStyle

struct TimelinePreviewItemStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TimelinePreviewItemStyle] = []
}

extension EnvironmentValues {
    var timelinePreviewItemStyle: any TimelinePreviewItemStyle {
        self.timelinePreviewItemStyleStack.last ?? .base.concat(.fiori)
    }

    var timelinePreviewItemStyleStack: [any TimelinePreviewItemStyle] {
        get {
            self[TimelinePreviewItemStyleStackKey.self]
        }
        set {
            self[TimelinePreviewItemStyleStackKey.self] = newValue
        }
    }
}

// MARK: TimestampStyle

struct TimestampStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TimestampStyle] = []
}

extension EnvironmentValues {
    var timestampStyle: any TimestampStyle {
        self.timestampStyleStack.last ?? .base
    }

    var timestampStyleStack: [any TimestampStyle] {
        get {
            self[TimestampStyleStackKey.self]
        }
        set {
            self[TimestampStyleStackKey.self] = newValue
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

// MARK: ToastMessageStyle

struct ToastMessageStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ToastMessageStyle] = []
}

extension EnvironmentValues {
    var toastMessageStyle: any ToastMessageStyle {
        self.toastMessageStyleStack.last ?? .base.concat(.fiori)
    }

    var toastMessageStyleStack: [any ToastMessageStyle] {
        get {
            self[ToastMessageStyleStackKey.self]
        }
        set {
            self[ToastMessageStyleStackKey.self] = newValue
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

// MARK: ValueStyle

struct ValueStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ValueStyle] = []
}

extension EnvironmentValues {
    var valueStyle: any ValueStyle {
        self.valueStyleStack.last ?? .base
    }

    var valueStyleStack: [any ValueStyle] {
        get {
            self[ValueStyleStackKey.self]
        }
        set {
            self[ValueStyleStackKey.self] = newValue
        }
    }
}

// MARK: ValueLabelStyle

struct ValueLabelStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ValueLabelStyle] = []
}

extension EnvironmentValues {
    var valueLabelStyle: any ValueLabelStyle {
        self.valueLabelStyleStack.last ?? .base
    }

    var valueLabelStyleStack: [any ValueLabelStyle] {
        get {
            self[ValueLabelStyleStackKey.self]
        }
        set {
            self[ValueLabelStyleStackKey.self] = newValue
        }
    }
}
