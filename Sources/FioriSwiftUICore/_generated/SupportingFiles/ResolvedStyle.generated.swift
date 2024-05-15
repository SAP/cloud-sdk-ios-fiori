// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: ActionStyle

struct ResolvedActionStyle<Style: ActionStyle>: View {
    let style: Style
    let configuration: ActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ActionStyle {
    func resolve(configuration: ActionConfiguration) -> some View {
        ResolvedActionStyle(style: self, configuration: configuration)
    }
}

// MARK: AvatarsStyle

struct ResolvedAvatarsStyle<Style: AvatarsStyle>: View {
    let style: Style
    let configuration: AvatarsConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
    }
}

extension CounterStyle {
    func resolve(configuration: CounterConfiguration) -> some View {
        ResolvedCounterStyle(style: self, configuration: configuration)
    }
}

// MARK: DecrementActionStyle

struct ResolvedDecrementActionStyle<Style: DecrementActionStyle>: View {
    let style: Style
    let configuration: DecrementActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension DecrementActionStyle {
    func resolve(configuration: DecrementActionConfiguration) -> some View {
        ResolvedDecrementActionStyle(style: self, configuration: configuration)
    }
}

// MARK: DemoViewStyle

struct ResolvedDemoViewStyle<Style: DemoViewStyle>: View {
    let style: Style
    let configuration: DemoViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
    }
}

extension FootnoteIconsStyle {
    func resolve(configuration: FootnoteIconsConfiguration) -> some View {
        ResolvedFootnoteIconsStyle(style: self, configuration: configuration)
    }
}

// MARK: FormViewStyle

struct ResolvedFormViewStyle<Style: FormViewStyle>: View {
    let style: Style
    let configuration: FormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension FormViewStyle {
    func resolve(configuration: FormViewConfiguration) -> some View {
        ResolvedFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: GreetingTextStyle

struct ResolvedGreetingTextStyle<Style: GreetingTextStyle>: View {
    let style: Style
    let configuration: GreetingTextConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension GreetingTextStyle {
    func resolve(configuration: GreetingTextConfiguration) -> some View {
        ResolvedGreetingTextStyle(style: self, configuration: configuration)
    }
}

// MARK: HeaderActionStyle

struct ResolvedHeaderActionStyle<Style: HeaderActionStyle>: View {
    let style: Style
    let configuration: HeaderActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension HeaderActionStyle {
    func resolve(configuration: HeaderActionConfiguration) -> some View {
        ResolvedHeaderActionStyle(style: self, configuration: configuration)
    }
}

// MARK: HelperTextStyle

struct ResolvedHelperTextStyle<Style: HelperTextStyle>: View {
    let style: Style
    let configuration: HelperTextConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension HelperTextStyle {
    func resolve(configuration: HelperTextConfiguration) -> some View {
        ResolvedHelperTextStyle(style: self, configuration: configuration)
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
        self.style.makeBody(self.configuration)
    }
}

extension IconsStyle {
    func resolve(configuration: IconsConfiguration) -> some View {
        ResolvedIconsStyle(style: self, configuration: configuration)
    }
}

// MARK: IllustratedMessageStyle

struct ResolvedIllustratedMessageStyle<Style: IllustratedMessageStyle>: View {
    let style: Style
    let configuration: IllustratedMessageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension IllustratedMessageStyle {
    func resolve(configuration: IllustratedMessageConfiguration) -> some View {
        ResolvedIllustratedMessageStyle(style: self, configuration: configuration)
    }
}

// MARK: IncrementActionStyle

struct ResolvedIncrementActionStyle<Style: IncrementActionStyle>: View {
    let style: Style
    let configuration: IncrementActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension IncrementActionStyle {
    func resolve(configuration: IncrementActionConfiguration) -> some View {
        ResolvedIncrementActionStyle(style: self, configuration: configuration)
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

// MARK: JouleWelcomeScreenStyle

struct ResolvedJouleWelcomeScreenStyle<Style: JouleWelcomeScreenStyle>: View {
    let style: Style
    let configuration: JouleWelcomeScreenConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension JouleWelcomeScreenStyle {
    func resolve(configuration: JouleWelcomeScreenConfiguration) -> some View {
        ResolvedJouleWelcomeScreenStyle(style: self, configuration: configuration)
    }
}

// MARK: KeyValueFormViewStyle

struct ResolvedKeyValueFormViewStyle<Style: KeyValueFormViewStyle>: View {
    let style: Style
    let configuration: KeyValueFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension KeyValueFormViewStyle {
    func resolve(configuration: KeyValueFormViewConfiguration) -> some View {
        ResolvedKeyValueFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: KpiCaptionStyle

struct ResolvedKpiCaptionStyle<Style: KpiCaptionStyle>: View {
    let style: Style
    let configuration: KpiCaptionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension KpiCaptionStyle {
    func resolve(configuration: KpiCaptionConfiguration) -> some View {
        ResolvedKpiCaptionStyle(style: self, configuration: configuration)
    }
}

// MARK: KpiStyle

struct ResolvedKpiStyle<Style: KpiStyle>: View {
    let style: Style
    let configuration: KpiConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension KpiStyle {
    func resolve(configuration: KpiConfiguration) -> some View {
        ResolvedKpiStyle(style: self, configuration: configuration)
    }
}

// MARK: LabelItemStyle

struct ResolvedLabelItemStyle<Style: LabelItemStyle>: View {
    let style: Style
    let configuration: LabelItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension LabelItemStyle {
    func resolve(configuration: LabelItemConfiguration) -> some View {
        ResolvedLabelItemStyle(style: self, configuration: configuration)
    }
}

// MARK: LinearProgressIndicatorStyle

struct ResolvedLinearProgressIndicatorStyle<Style: LinearProgressIndicatorStyle>: View {
    let style: Style
    let configuration: LinearProgressIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension LinearProgressIndicatorStyle {
    func resolve(configuration: LinearProgressIndicatorConfiguration) -> some View {
        ResolvedLinearProgressIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: LinearProgressIndicatorViewStyle

struct ResolvedLinearProgressIndicatorViewStyle<Style: LinearProgressIndicatorViewStyle>: View {
    let style: Style
    let configuration: LinearProgressIndicatorViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension LinearProgressIndicatorViewStyle {
    func resolve(configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        ResolvedLinearProgressIndicatorViewStyle(style: self, configuration: configuration)
    }
}

// MARK: MediaImageStyle

struct ResolvedMediaImageStyle<Style: MediaImageStyle>: View {
    let style: Style
    let configuration: MediaImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension MediaImageStyle {
    func resolve(configuration: MediaImageConfiguration) -> some View {
        ResolvedMediaImageStyle(style: self, configuration: configuration)
    }
}

// MARK: MessageContentStyle

struct ResolvedMessageContentStyle<Style: MessageContentStyle>: View {
    let style: Style
    let configuration: MessageContentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension MessageContentStyle {
    func resolve(configuration: MessageContentConfiguration) -> some View {
        ResolvedMessageContentStyle(style: self, configuration: configuration)
    }
}

// MARK: MoreActionOverflowStyle

struct ResolvedMoreActionOverflowStyle<Style: MoreActionOverflowStyle>: View {
    let style: Style
    let configuration: MoreActionOverflowConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension MoreActionOverflowStyle {
    func resolve(configuration: MoreActionOverflowConfiguration) -> some View {
        ResolvedMoreActionOverflowStyle(style: self, configuration: configuration)
    }
}

// MARK: NoteFormViewStyle

struct ResolvedNoteFormViewStyle<Style: NoteFormViewStyle>: View {
    let style: Style
    let configuration: NoteFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension NoteFormViewStyle {
    func resolve(configuration: NoteFormViewConfiguration) -> some View {
        ResolvedNoteFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: ObjectItemStyle

struct ResolvedObjectItemStyle<Style: ObjectItemStyle>: View {
    let style: Style
    let configuration: ObjectItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ObjectItemStyle {
    func resolve(configuration: ObjectItemConfiguration) -> some View {
        ResolvedObjectItemStyle(style: self, configuration: configuration)
    }
}

// MARK: PlaceholderStyle

struct ResolvedPlaceholderStyle<Style: PlaceholderStyle>: View {
    let style: Style
    let configuration: PlaceholderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension PlaceholderStyle {
    func resolve(configuration: PlaceholderConfiguration) -> some View {
        ResolvedPlaceholderStyle(style: self, configuration: configuration)
    }
}

// MARK: PlaceholderTextEditorStyle

struct ResolvedPlaceholderTextEditorStyle<Style: PlaceholderTextEditorStyle>: View {
    let style: Style
    let configuration: PlaceholderTextEditorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension PlaceholderTextEditorStyle {
    func resolve(configuration: PlaceholderTextEditorConfiguration) -> some View {
        ResolvedPlaceholderTextEditorStyle(style: self, configuration: configuration)
    }
}

// MARK: PlaceholderTextFieldStyle

struct ResolvedPlaceholderTextFieldStyle<Style: PlaceholderTextFieldStyle>: View {
    let style: Style
    let configuration: PlaceholderTextFieldConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension PlaceholderTextFieldStyle {
    func resolve(configuration: PlaceholderTextFieldConfiguration) -> some View {
        ResolvedPlaceholderTextFieldStyle(style: self, configuration: configuration)
    }
}

// MARK: Row1Style

struct ResolvedRow1Style<Style: Row1Style>: View {
    let style: Style
    let configuration: Row1Configuration
    var body: some View {
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
    }
}

extension StatusStyle {
    func resolve(configuration: StatusConfiguration) -> some View {
        ResolvedStatusStyle(style: self, configuration: configuration)
    }
}

// MARK: StepperFieldStyle

struct ResolvedStepperFieldStyle<Style: StepperFieldStyle>: View {
    let style: Style
    let configuration: StepperFieldConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension StepperFieldStyle {
    func resolve(configuration: StepperFieldConfiguration) -> some View {
        ResolvedStepperFieldStyle(style: self, configuration: configuration)
    }
}

// MARK: StepperViewStyle

struct ResolvedStepperViewStyle<Style: StepperViewStyle>: View {
    let style: Style
    let configuration: StepperViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension StepperViewStyle {
    func resolve(configuration: StepperViewConfiguration) -> some View {
        ResolvedStepperViewStyle(style: self, configuration: configuration)
    }
}

// MARK: SubstatusStyle

struct ResolvedSubstatusStyle<Style: SubstatusStyle>: View {
    let style: Style
    let configuration: SubstatusConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
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
        self.style.makeBody(self.configuration)
    }
}

extension TagsStyle {
    func resolve(configuration: TagsConfiguration) -> some View {
        ResolvedTagsStyle(style: self, configuration: configuration)
    }
}

// MARK: TextFieldFormViewStyle

struct ResolvedTextFieldFormViewStyle<Style: TextFieldFormViewStyle>: View {
    let style: Style
    let configuration: TextFieldFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TextFieldFormViewStyle {
    func resolve(configuration: TextFieldFormViewConfiguration) -> some View {
        ResolvedTextFieldFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: TextInputFieldStyle

struct ResolvedTextInputFieldStyle<Style: TextInputFieldStyle>: View {
    let style: Style
    let configuration: TextInputFieldConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TextInputFieldStyle {
    func resolve(configuration: TextInputFieldConfiguration) -> some View {
        ResolvedTextInputFieldStyle(style: self, configuration: configuration)
    }
}

// MARK: TextInputInfoViewStyle

struct ResolvedTextInputInfoViewStyle<Style: TextInputInfoViewStyle>: View {
    let style: Style
    let configuration: TextInputInfoViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TextInputInfoViewStyle {
    func resolve(configuration: TextInputInfoViewConfiguration) -> some View {
        ResolvedTextInputInfoViewStyle(style: self, configuration: configuration)
    }
}

// MARK: TextViewStyle

struct ResolvedTextViewStyle<Style: TextViewStyle>: View {
    let style: Style
    let configuration: TextViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TextViewStyle {
    func resolve(configuration: TextViewConfiguration) -> some View {
        ResolvedTextViewStyle(style: self, configuration: configuration)
    }
}

// MARK: TitleStyle

struct ResolvedTitleStyle<Style: TitleStyle>: View {
    let style: Style
    let configuration: TitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TitleStyle {
    func resolve(configuration: TitleConfiguration) -> some View {
        ResolvedTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: TitleFormViewStyle

struct ResolvedTitleFormViewStyle<Style: TitleFormViewStyle>: View {
    let style: Style
    let configuration: TitleFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TitleFormViewStyle {
    func resolve(configuration: TitleFormViewConfiguration) -> some View {
        ResolvedTitleFormViewStyle(style: self, configuration: configuration)
    }
}
