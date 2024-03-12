// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: ActionStyle

struct ActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any ActionStyle] = []
}

extension EnvironmentValues {
    var actionStyle: any ActionStyle {
        actionStyleStack.last ?? .base
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
        avatarsStyleStack.last ?? .base
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
        cardBodyStyleStack.last ?? .base
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
        cardStyleStack.last ?? .base.concat(.fiori)
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
        cardExtHeaderStyleStack.last ?? .base.concat(.fiori)
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
        cardFooterStyleStack.last ?? .base.concat(.fiori)
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
        cardHeaderStyleStack.last ?? .base.concat(.fiori)
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
        cardMainHeaderStyleStack.last ?? .base.concat(.fiori)
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
        cardMediaStyleStack.last ?? .base.concat(.fiori)
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
        counterStyleStack.last ?? .base
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
        demoViewStyleStack.last ?? .base.concat(.fiori)
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
        descriptionStyleStack.last ?? .base
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
        detailImageStyleStack.last ?? .base
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
        footnoteStyleStack.last ?? .base
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
        footnoteIconsStyleStack.last ?? .base
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
        formViewStyleStack.last ?? .base.concat(.fiori)
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

// MARK: HeaderActionStyle

struct HeaderActionStyleStackKey: EnvironmentKey {
    static let defaultValue: [any HeaderActionStyle] = []
}

extension EnvironmentValues {
    var headerActionStyle: any HeaderActionStyle {
        headerActionStyleStack.last ?? .base
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

// MARK: IconStyle

struct IconStyleStackKey: EnvironmentKey {
    static let defaultValue: [any IconStyle] = []
}

extension EnvironmentValues {
    var iconStyle: any IconStyle {
        iconStyleStack.last ?? .base
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
        iconsStyleStack.last ?? .base
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
        illustratedMessageStyleStack.last ?? .base.concat(.fiori)
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

// MARK: InformationViewStyle

struct InformationViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any InformationViewStyle] = []
}

extension EnvironmentValues {
    var informationViewStyle: any InformationViewStyle {
        informationViewStyleStack.last ?? .base.concat(.fiori)
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

// MARK: KeyValueFormViewStyle

struct KeyValueFormViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any KeyValueFormViewStyle] = []
}

extension EnvironmentValues {
    var keyValueFormViewStyle: any KeyValueFormViewStyle {
        keyValueFormViewStyleStack.last ?? .base.concat(.fiori)
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
        kpiCaptionStyleStack.last ?? .base
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
        kpiStyleStack.last ?? .base
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
        labelItemStyleStack.last ?? .base.concat(.fiori)
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
        linearProgressIndicatorStyleStack.last ?? .base
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
        linearProgressIndicatorViewStyleStack.last ?? .base.concat(.fiori)
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

// MARK: MediaImageStyle

struct MediaImageStyleStackKey: EnvironmentKey {
    static let defaultValue: [any MediaImageStyle] = []
}

extension EnvironmentValues {
    var mediaImageStyle: any MediaImageStyle {
        mediaImageStyleStack.last ?? .base
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

// MARK: NoteFormViewStyle

struct NoteFormViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any NoteFormViewStyle] = []
}

extension EnvironmentValues {
    var noteFormViewStyle: any NoteFormViewStyle {
        noteFormViewStyleStack.last ?? .base.concat(.fiori)
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
        objectItemStyleStack.last ?? .base.concat(.fiori)
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

// MARK: PlaceholderStyle

struct PlaceholderStyleStackKey: EnvironmentKey {
    static let defaultValue: [any PlaceholderStyle] = []
}

extension EnvironmentValues {
    var placeholderStyle: any PlaceholderStyle {
        placeholderStyleStack.last ?? .base
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
        placeholderTextEditorStyleStack.last ?? .base.concat(.fiori)
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

// MARK: Row1Style

struct Row1StyleStackKey: EnvironmentKey {
    static let defaultValue: [any Row1Style] = []
}

extension EnvironmentValues {
    var row1Style: any Row1Style {
        row1StyleStack.last ?? .base
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
        row2StyleStack.last ?? .base
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
        row3StyleStack.last ?? .base
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
        secondaryActionStyleStack.last ?? .base
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
        statusStyleStack.last ?? .base
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
        substatusStyleStack.last ?? .base
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
        subtitleStyleStack.last ?? .base
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
        switchStyleStack.last ?? .base
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
        tagsStyleStack.last ?? .base
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

// MARK: TextInputInfoViewStyle

struct TextInputInfoViewStyleStackKey: EnvironmentKey {
    static let defaultValue: [any TextInputInfoViewStyle] = []
}

extension EnvironmentValues {
    var textInputInfoViewStyle: any TextInputInfoViewStyle {
        textInputInfoViewStyleStack.last ?? .base.concat(.fiori)
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
        textViewStyleStack.last ?? .base
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
        titleStyleStack.last ?? .base
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
