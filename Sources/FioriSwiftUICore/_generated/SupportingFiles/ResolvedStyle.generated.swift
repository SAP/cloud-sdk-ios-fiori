// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: AccessoryIconStyle

struct ResolvedAccessoryIconStyle<Style: AccessoryIconStyle>: View {
    let style: Style
    let configuration: AccessoryIconConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension AccessoryIconStyle {
    func resolve(configuration: AccessoryIconConfiguration) -> some View {
        ResolvedAccessoryIconStyle(style: self, configuration: configuration)
    }
}

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

// MARK: AllEntriesSectionTitleStyle

struct ResolvedAllEntriesSectionTitleStyle<Style: AllEntriesSectionTitleStyle>: View {
    let style: Style
    let configuration: AllEntriesSectionTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension AllEntriesSectionTitleStyle {
    func resolve(configuration: AllEntriesSectionTitleConfiguration) -> some View {
        ResolvedAllEntriesSectionTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: ApplyActionStyle

struct ResolvedApplyActionStyle<Style: ApplyActionStyle>: View {
    let style: Style
    let configuration: ApplyActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ApplyActionStyle {
    func resolve(configuration: ApplyActionConfiguration) -> some View {
        ResolvedApplyActionStyle(style: self, configuration: configuration)
    }
}

// MARK: AttributeStyle

struct ResolvedAttributeStyle<Style: AttributeStyle>: View {
    let style: Style
    let configuration: AttributeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension AttributeStyle {
    func resolve(configuration: AttributeConfiguration) -> some View {
        ResolvedAttributeStyle(style: self, configuration: configuration)
    }
}

// MARK: AvatarStackStyle

struct ResolvedAvatarStackStyle<Style: AvatarStackStyle>: View {
    let style: Style
    let configuration: AvatarStackConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension AvatarStackStyle {
    func resolve(configuration: AvatarStackConfiguration) -> some View {
        ResolvedAvatarStackStyle(style: self, configuration: configuration)
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

// MARK: AvatarsTitleStyle

struct ResolvedAvatarsTitleStyle<Style: AvatarsTitleStyle>: View {
    let style: Style
    let configuration: AvatarsTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension AvatarsTitleStyle {
    func resolve(configuration: AvatarsTitleConfiguration) -> some View {
        ResolvedAvatarsTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: BannerMessageStyle

struct ResolvedBannerMessageStyle<Style: BannerMessageStyle>: View {
    let style: Style
    let configuration: BannerMessageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension BannerMessageStyle {
    func resolve(configuration: BannerMessageConfiguration) -> some View {
        ResolvedBannerMessageStyle(style: self, configuration: configuration)
    }
}

// MARK: CancelActionStyle

struct ResolvedCancelActionStyle<Style: CancelActionStyle>: View {
    let style: Style
    let configuration: CancelActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension CancelActionStyle {
    func resolve(configuration: CancelActionConfiguration) -> some View {
        ResolvedCancelActionStyle(style: self, configuration: configuration)
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

// MARK: CloseActionStyle

struct ResolvedCloseActionStyle<Style: CloseActionStyle>: View {
    let style: Style
    let configuration: CloseActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension CloseActionStyle {
    func resolve(configuration: CloseActionConfiguration) -> some View {
        ResolvedCloseActionStyle(style: self, configuration: configuration)
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

// MARK: DateTimePickerStyle

struct ResolvedDateTimePickerStyle<Style: DateTimePickerStyle>: View {
    let style: Style
    let configuration: DateTimePickerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension DateTimePickerStyle {
    func resolve(configuration: DateTimePickerConfiguration) -> some View {
        ResolvedDateTimePickerStyle(style: self, configuration: configuration)
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

// MARK: DeselectAllActionStyle

struct ResolvedDeselectAllActionStyle<Style: DeselectAllActionStyle>: View {
    let style: Style
    let configuration: DeselectAllActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension DeselectAllActionStyle {
    func resolve(configuration: DeselectAllActionConfiguration) -> some View {
        ResolvedDeselectAllActionStyle(style: self, configuration: configuration)
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

// MARK: FilledIconStyle

struct ResolvedFilledIconStyle<Style: FilledIconStyle>: View {
    let style: Style
    let configuration: FilledIconConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension FilledIconStyle {
    func resolve(configuration: FilledIconConfiguration) -> some View {
        ResolvedFilledIconStyle(style: self, configuration: configuration)
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

// MARK: FootnoteIconsTextStyle

struct ResolvedFootnoteIconsTextStyle<Style: FootnoteIconsTextStyle>: View {
    let style: Style
    let configuration: FootnoteIconsTextConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension FootnoteIconsTextStyle {
    func resolve(configuration: FootnoteIconsTextConfiguration) -> some View {
        ResolvedFootnoteIconsTextStyle(style: self, configuration: configuration)
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

// MARK: HalfStarImageStyle

struct ResolvedHalfStarImageStyle<Style: HalfStarImageStyle>: View {
    let style: Style
    let configuration: HalfStarImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension HalfStarImageStyle {
    func resolve(configuration: HalfStarImageConfiguration) -> some View {
        ResolvedHalfStarImageStyle(style: self, configuration: configuration)
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

// MARK: ListPickerContentStyle

struct ResolvedListPickerContentStyle<Style: ListPickerContentStyle>: View {
    let style: Style
    let configuration: ListPickerContentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ListPickerContentStyle {
    func resolve(configuration: ListPickerContentConfiguration) -> some View {
        ResolvedListPickerContentStyle(style: self, configuration: configuration)
    }
}

// MARK: ListPickerDestinationStyle

struct ResolvedListPickerDestinationStyle<Style: ListPickerDestinationStyle>: View {
    let style: Style
    let configuration: ListPickerDestinationConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ListPickerDestinationStyle {
    func resolve(configuration: ListPickerDestinationConfiguration) -> some View {
        ResolvedListPickerDestinationStyle(style: self, configuration: configuration)
    }
}

// MARK: ListPickerItemStyle

struct ResolvedListPickerItemStyle<Style: ListPickerItemStyle>: View {
    let style: Style
    let configuration: ListPickerItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ListPickerItemStyle {
    func resolve(configuration: ListPickerItemConfiguration) -> some View {
        ResolvedListPickerItemStyle(style: self, configuration: configuration)
    }
}

// MARK: MandatoryFieldIndicatorStyle

struct ResolvedMandatoryFieldIndicatorStyle<Style: MandatoryFieldIndicatorStyle>: View {
    let style: Style
    let configuration: MandatoryFieldIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension MandatoryFieldIndicatorStyle {
    func resolve(configuration: MandatoryFieldIndicatorConfiguration) -> some View {
        ResolvedMandatoryFieldIndicatorStyle(style: self, configuration: configuration)
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

// MARK: MenuSelectionStyle

struct ResolvedMenuSelectionStyle<Style: MenuSelectionStyle>: View {
    let style: Style
    let configuration: MenuSelectionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension MenuSelectionStyle {
    func resolve(configuration: MenuSelectionConfiguration) -> some View {
        ResolvedMenuSelectionStyle(style: self, configuration: configuration)
    }
}

// MARK: MenuSelectionItemStyle

struct ResolvedMenuSelectionItemStyle<Style: MenuSelectionItemStyle>: View {
    let style: Style
    let configuration: MenuSelectionItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension MenuSelectionItemStyle {
    func resolve(configuration: MenuSelectionItemConfiguration) -> some View {
        ResolvedMenuSelectionItemStyle(style: self, configuration: configuration)
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

// MARK: NowIndicatorNodeStyle

struct ResolvedNowIndicatorNodeStyle<Style: NowIndicatorNodeStyle>: View {
    let style: Style
    let configuration: NowIndicatorNodeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension NowIndicatorNodeStyle {
    func resolve(configuration: NowIndicatorNodeConfiguration) -> some View {
        ResolvedNowIndicatorNodeStyle(style: self, configuration: configuration)
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

// MARK: OffStarImageStyle

struct ResolvedOffStarImageStyle<Style: OffStarImageStyle>: View {
    let style: Style
    let configuration: OffStarImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension OffStarImageStyle {
    func resolve(configuration: OffStarImageConfiguration) -> some View {
        ResolvedOffStarImageStyle(style: self, configuration: configuration)
    }
}

// MARK: OnStarImageStyle

struct ResolvedOnStarImageStyle<Style: OnStarImageStyle>: View {
    let style: Style
    let configuration: OnStarImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension OnStarImageStyle {
    func resolve(configuration: OnStarImageConfiguration) -> some View {
        ResolvedOnStarImageStyle(style: self, configuration: configuration)
    }
}

// MARK: OptionalTitleStyle

struct ResolvedOptionalTitleStyle<Style: OptionalTitleStyle>: View {
    let style: Style
    let configuration: OptionalTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension OptionalTitleStyle {
    func resolve(configuration: OptionalTitleConfiguration) -> some View {
        ResolvedOptionalTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: OptionsStyle

struct ResolvedOptionsStyle<Style: OptionsStyle>: View {
    let style: Style
    let configuration: OptionsConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension OptionsStyle {
    func resolve(configuration: OptionsConfiguration) -> some View {
        ResolvedOptionsStyle(style: self, configuration: configuration)
    }
}

// MARK: OverflowActionStyle

struct ResolvedOverflowActionStyle<Style: OverflowActionStyle>: View {
    let style: Style
    let configuration: OverflowActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension OverflowActionStyle {
    func resolve(configuration: OverflowActionConfiguration) -> some View {
        ResolvedOverflowActionStyle(style: self, configuration: configuration)
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

// MARK: ProfileHeaderStyle

struct ResolvedProfileHeaderStyle<Style: ProfileHeaderStyle>: View {
    let style: Style
    let configuration: ProfileHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ProfileHeaderStyle {
    func resolve(configuration: ProfileHeaderConfiguration) -> some View {
        ResolvedProfileHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: RatingControlStyle

struct ResolvedRatingControlStyle<Style: RatingControlStyle>: View {
    let style: Style
    let configuration: RatingControlConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension RatingControlStyle {
    func resolve(configuration: RatingControlConfiguration) -> some View {
        ResolvedRatingControlStyle(style: self, configuration: configuration)
    }
}

// MARK: RatingControlFormViewStyle

struct ResolvedRatingControlFormViewStyle<Style: RatingControlFormViewStyle>: View {
    let style: Style
    let configuration: RatingControlFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension RatingControlFormViewStyle {
    func resolve(configuration: RatingControlFormViewConfiguration) -> some View {
        ResolvedRatingControlFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: ReviewCountLabelStyle

struct ResolvedReviewCountLabelStyle<Style: ReviewCountLabelStyle>: View {
    let style: Style
    let configuration: ReviewCountLabelConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ReviewCountLabelStyle {
    func resolve(configuration: ReviewCountLabelConfiguration) -> some View {
        ResolvedReviewCountLabelStyle(style: self, configuration: configuration)
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

// MARK: SecondaryTimestampStyle

struct ResolvedSecondaryTimestampStyle<Style: SecondaryTimestampStyle>: View {
    let style: Style
    let configuration: SecondaryTimestampConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SecondaryTimestampStyle {
    func resolve(configuration: SecondaryTimestampConfiguration) -> some View {
        ResolvedSecondaryTimestampStyle(style: self, configuration: configuration)
    }
}

// MARK: SegmentedControlPickerStyle

struct ResolvedSegmentedControlPickerStyle<Style: SegmentedControlPickerStyle>: View {
    let style: Style
    let configuration: SegmentedControlPickerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SegmentedControlPickerStyle {
    func resolve(configuration: SegmentedControlPickerConfiguration) -> some View {
        ResolvedSegmentedControlPickerStyle(style: self, configuration: configuration)
    }
}

// MARK: SelectAllActionStyle

struct ResolvedSelectAllActionStyle<Style: SelectAllActionStyle>: View {
    let style: Style
    let configuration: SelectAllActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SelectAllActionStyle {
    func resolve(configuration: SelectAllActionConfiguration) -> some View {
        ResolvedSelectAllActionStyle(style: self, configuration: configuration)
    }
}

// MARK: SelectedEntriesSectionTitleStyle

struct ResolvedSelectedEntriesSectionTitleStyle<Style: SelectedEntriesSectionTitleStyle>: View {
    let style: Style
    let configuration: SelectedEntriesSectionTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SelectedEntriesSectionTitleStyle {
    func resolve(configuration: SelectedEntriesSectionTitleConfiguration) -> some View {
        ResolvedSelectedEntriesSectionTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: SideBarStyle

struct ResolvedSideBarStyle<Style: SideBarStyle>: View {
    let style: Style
    let configuration: SideBarConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SideBarStyle {
    func resolve(configuration: SideBarConfiguration) -> some View {
        ResolvedSideBarStyle(style: self, configuration: configuration)
    }
}

// MARK: SideBarListItemStyle

struct ResolvedSideBarListItemStyle<Style: SideBarListItemStyle>: View {
    let style: Style
    let configuration: SideBarListItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SideBarListItemStyle {
    func resolve(configuration: SideBarListItemConfiguration) -> some View {
        ResolvedSideBarListItemStyle(style: self, configuration: configuration)
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

// MARK: SubAttributeStyle

struct ResolvedSubAttributeStyle<Style: SubAttributeStyle>: View {
    let style: Style
    let configuration: SubAttributeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SubAttributeStyle {
    func resolve(configuration: SubAttributeConfiguration) -> some View {
        ResolvedSubAttributeStyle(style: self, configuration: configuration)
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

// MARK: SwitchViewStyle

struct ResolvedSwitchViewStyle<Style: SwitchViewStyle>: View {
    let style: Style
    let configuration: SwitchViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SwitchViewStyle {
    func resolve(configuration: SwitchViewConfiguration) -> some View {
        ResolvedSwitchViewStyle(style: self, configuration: configuration)
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

// MARK: TertiaryActionStyle

struct ResolvedTertiaryActionStyle<Style: TertiaryActionStyle>: View {
    let style: Style
    let configuration: TertiaryActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TertiaryActionStyle {
    func resolve(configuration: TertiaryActionConfiguration) -> some View {
        ResolvedTertiaryActionStyle(style: self, configuration: configuration)
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

// MARK: TimelineStyle

struct ResolvedTimelineStyle<Style: TimelineStyle>: View {
    let style: Style
    let configuration: TimelineConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TimelineStyle {
    func resolve(configuration: TimelineConfiguration) -> some View {
        ResolvedTimelineStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelineMarkerStyle

struct ResolvedTimelineMarkerStyle<Style: TimelineMarkerStyle>: View {
    let style: Style
    let configuration: TimelineMarkerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TimelineMarkerStyle {
    func resolve(configuration: TimelineMarkerConfiguration) -> some View {
        ResolvedTimelineMarkerStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelineNodeStyle

struct ResolvedTimelineNodeStyle<Style: TimelineNodeStyle>: View {
    let style: Style
    let configuration: TimelineNodeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TimelineNodeStyle {
    func resolve(configuration: TimelineNodeConfiguration) -> some View {
        ResolvedTimelineNodeStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelineNowIndicatorStyle

struct ResolvedTimelineNowIndicatorStyle<Style: TimelineNowIndicatorStyle>: View {
    let style: Style
    let configuration: TimelineNowIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TimelineNowIndicatorStyle {
    func resolve(configuration: TimelineNowIndicatorConfiguration) -> some View {
        ResolvedTimelineNowIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelinePreviewStyle

struct ResolvedTimelinePreviewStyle<Style: TimelinePreviewStyle>: View {
    let style: Style
    let configuration: TimelinePreviewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TimelinePreviewStyle {
    func resolve(configuration: TimelinePreviewConfiguration) -> some View {
        ResolvedTimelinePreviewStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelinePreviewItemStyle

struct ResolvedTimelinePreviewItemStyle<Style: TimelinePreviewItemStyle>: View {
    let style: Style
    let configuration: TimelinePreviewItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TimelinePreviewItemStyle {
    func resolve(configuration: TimelinePreviewItemConfiguration) -> some View {
        ResolvedTimelinePreviewItemStyle(style: self, configuration: configuration)
    }
}

// MARK: TimestampStyle

struct ResolvedTimestampStyle<Style: TimestampStyle>: View {
    let style: Style
    let configuration: TimestampConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TimestampStyle {
    func resolve(configuration: TimestampConfiguration) -> some View {
        ResolvedTimestampStyle(style: self, configuration: configuration)
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

// MARK: ToastMessageStyle

struct ResolvedToastMessageStyle<Style: ToastMessageStyle>: View {
    let style: Style
    let configuration: ToastMessageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ToastMessageStyle {
    func resolve(configuration: ToastMessageConfiguration) -> some View {
        ResolvedToastMessageStyle(style: self, configuration: configuration)
    }
}

// MARK: TopDividerStyle

struct ResolvedTopDividerStyle<Style: TopDividerStyle>: View {
    let style: Style
    let configuration: TopDividerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TopDividerStyle {
    func resolve(configuration: TopDividerConfiguration) -> some View {
        ResolvedTopDividerStyle(style: self, configuration: configuration)
    }
}

// MARK: ValueStyle

struct ResolvedValueStyle<Style: ValueStyle>: View {
    let style: Style
    let configuration: ValueConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ValueStyle {
    func resolve(configuration: ValueConfiguration) -> some View {
        ResolvedValueStyle(style: self, configuration: configuration)
    }
}

// MARK: ValueLabelStyle

struct ResolvedValueLabelStyle<Style: ValueLabelStyle>: View {
    let style: Style
    let configuration: ValueLabelConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ValueLabelStyle {
    func resolve(configuration: ValueLabelConfiguration) -> some View {
        ResolvedValueLabelStyle(style: self, configuration: configuration)
    }
}
