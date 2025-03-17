// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: AINoticeStyle

struct ResolvedAINoticeStyle<Style: AINoticeStyle>: View {
    let style: Style
    let configuration: AINoticeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension AINoticeStyle {
    func resolve(configuration: AINoticeConfiguration) -> some View {
        ResolvedAINoticeStyle(style: self, configuration: configuration)
    }
}

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

// MARK: ActiveTrackStyle

struct ResolvedActiveTrackStyle<Style: ActiveTrackStyle>: View {
    let style: Style
    let configuration: ActiveTrackConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ActiveTrackStyle {
    func resolve(configuration: ActiveTrackConfiguration) -> some View {
        ResolvedActiveTrackStyle(style: self, configuration: configuration)
    }
}

// MARK: ActivityItemStyle

struct ResolvedActivityItemStyle<Style: ActivityItemStyle>: View {
    let style: Style
    let configuration: ActivityItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ActivityItemStyle {
    func resolve(configuration: ActivityItemConfiguration) -> some View {
        ResolvedActivityItemStyle(style: self, configuration: configuration)
    }
}

// MARK: ActivityItemsStyle

struct ResolvedActivityItemsStyle<Style: ActivityItemsStyle>: View {
    let style: Style
    let configuration: ActivityItemsConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ActivityItemsStyle {
    func resolve(configuration: ActivityItemsConfiguration) -> some View {
        ResolvedActivityItemsStyle(style: self, configuration: configuration)
    }
}

// MARK: AgreeActionStyle

struct ResolvedAgreeActionStyle<Style: AgreeActionStyle>: View {
    let style: Style
    let configuration: AgreeActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension AgreeActionStyle {
    func resolve(configuration: AgreeActionConfiguration) -> some View {
        ResolvedAgreeActionStyle(style: self, configuration: configuration)
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

// MARK: AllowActionStyle

struct ResolvedAllowActionStyle<Style: AllowActionStyle>: View {
    let style: Style
    let configuration: AllowActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension AllowActionStyle {
    func resolve(configuration: AllowActionConfiguration) -> some View {
        ResolvedAllowActionStyle(style: self, configuration: configuration)
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

// MARK: BannerMultiMessageSheetStyle

struct ResolvedBannerMultiMessageSheetStyle<Style: BannerMultiMessageSheetStyle>: View {
    let style: Style
    let configuration: BannerMultiMessageSheetConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension BannerMultiMessageSheetStyle {
    func resolve(configuration: BannerMultiMessageSheetConfiguration) -> some View {
        ResolvedBannerMultiMessageSheetStyle(style: self, configuration: configuration)
    }
}

// MARK: BodyTextStyle

struct ResolvedBodyTextStyle<Style: BodyTextStyle>: View {
    let style: Style
    let configuration: BodyTextConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension BodyTextStyle {
    func resolve(configuration: BodyTextConfiguration) -> some View {
        ResolvedBodyTextStyle(style: self, configuration: configuration)
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

// MARK: CheckoutIndicatorStyle

struct ResolvedCheckoutIndicatorStyle<Style: CheckoutIndicatorStyle>: View {
    let style: Style
    let configuration: CheckoutIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension CheckoutIndicatorStyle {
    func resolve(configuration: CheckoutIndicatorConfiguration) -> some View {
        ResolvedCheckoutIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: ClearActionStyle

struct ResolvedClearActionStyle<Style: ClearActionStyle>: View {
    let style: Style
    let configuration: ClearActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ClearActionStyle {
    func resolve(configuration: ClearActionConfiguration) -> some View {
        ResolvedClearActionStyle(style: self, configuration: configuration)
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

// MARK: ContactItemStyle

struct ResolvedContactItemStyle<Style: ContactItemStyle>: View {
    let style: Style
    let configuration: ContactItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ContactItemStyle {
    func resolve(configuration: ContactItemConfiguration) -> some View {
        ResolvedContactItemStyle(style: self, configuration: configuration)
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

// MARK: DenyActionStyle

struct ResolvedDenyActionStyle<Style: DenyActionStyle>: View {
    let style: Style
    let configuration: DenyActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension DenyActionStyle {
    func resolve(configuration: DenyActionConfiguration) -> some View {
        ResolvedDenyActionStyle(style: self, configuration: configuration)
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

// MARK: DescriptionTextStyle

struct ResolvedDescriptionTextStyle<Style: DescriptionTextStyle>: View {
    let style: Style
    let configuration: DescriptionTextConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension DescriptionTextStyle {
    func resolve(configuration: DescriptionTextConfiguration) -> some View {
        ResolvedDescriptionTextStyle(style: self, configuration: configuration)
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

// MARK: DetailContentStyle

struct ResolvedDetailContentStyle<Style: DetailContentStyle>: View {
    let style: Style
    let configuration: DetailContentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension DetailContentStyle {
    func resolve(configuration: DetailContentConfiguration) -> some View {
        ResolvedDetailContentStyle(style: self, configuration: configuration)
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

// MARK: DimensionSegmentStyle

struct ResolvedDimensionSegmentStyle<Style: DimensionSegmentStyle>: View {
    let style: Style
    let configuration: DimensionSegmentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension DimensionSegmentStyle {
    func resolve(configuration: DimensionSegmentConfiguration) -> some View {
        ResolvedDimensionSegmentStyle(style: self, configuration: configuration)
    }
}

// MARK: DimensionSelectorStyle

struct ResolvedDimensionSelectorStyle<Style: DimensionSelectorStyle>: View {
    let style: Style
    let configuration: DimensionSelectorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension DimensionSelectorStyle {
    func resolve(configuration: DimensionSelectorConfiguration) -> some View {
        ResolvedDimensionSelectorStyle(style: self, configuration: configuration)
    }
}

// MARK: DisagreeActionStyle

struct ResolvedDisagreeActionStyle<Style: DisagreeActionStyle>: View {
    let style: Style
    let configuration: DisagreeActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension DisagreeActionStyle {
    func resolve(configuration: DisagreeActionConfiguration) -> some View {
        ResolvedDisagreeActionStyle(style: self, configuration: configuration)
    }
}

// MARK: EULAViewStyle

struct ResolvedEULAViewStyle<Style: EULAViewStyle>: View {
    let style: Style
    let configuration: EULAViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension EULAViewStyle {
    func resolve(configuration: EULAViewConfiguration) -> some View {
        ResolvedEULAViewStyle(style: self, configuration: configuration)
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

// MARK: FilterFeedbackBarButtonStyle

struct ResolvedFilterFeedbackBarButtonStyle<Style: FilterFeedbackBarButtonStyle>: View {
    let style: Style
    let configuration: FilterFeedbackBarButtonConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension FilterFeedbackBarButtonStyle {
    func resolve(configuration: FilterFeedbackBarButtonConfiguration) -> some View {
        ResolvedFilterFeedbackBarButtonStyle(style: self, configuration: configuration)
    }
}

// MARK: FilterFeedbackBarStyle

struct ResolvedFilterFeedbackBarStyle<Style: FilterFeedbackBarStyle>: View {
    let style: Style
    let configuration: FilterFeedbackBarConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension FilterFeedbackBarStyle {
    func resolve(configuration: FilterFeedbackBarConfiguration) -> some View {
        ResolvedFilterFeedbackBarStyle(style: self, configuration: configuration)
    }
}

// MARK: FilterFeedbackBarItemStyle

struct ResolvedFilterFeedbackBarItemStyle<Style: FilterFeedbackBarItemStyle>: View {
    let style: Style
    let configuration: FilterFeedbackBarItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension FilterFeedbackBarItemStyle {
    func resolve(configuration: FilterFeedbackBarItemConfiguration) -> some View {
        ResolvedFilterFeedbackBarItemStyle(style: self, configuration: configuration)
    }
}

// MARK: FilterFormViewStyle

struct ResolvedFilterFormViewStyle<Style: FilterFormViewStyle>: View {
    let style: Style
    let configuration: FilterFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension FilterFormViewStyle {
    func resolve(configuration: FilterFormViewConfiguration) -> some View {
        ResolvedFilterFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: FioriSliderStyle

struct ResolvedFioriSliderStyle<Style: FioriSliderStyle>: View {
    let style: Style
    let configuration: FioriSliderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension FioriSliderStyle {
    func resolve(configuration: FioriSliderConfiguration) -> some View {
        ResolvedFioriSliderStyle(style: self, configuration: configuration)
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

// MARK: HeaderChartStyle

struct ResolvedHeaderChartStyle<Style: HeaderChartStyle>: View {
    let style: Style
    let configuration: HeaderChartConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension HeaderChartStyle {
    func resolve(configuration: HeaderChartConfiguration) -> some View {
        ResolvedHeaderChartStyle(style: self, configuration: configuration)
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

// MARK: InactiveTrackStyle

struct ResolvedInactiveTrackStyle<Style: InactiveTrackStyle>: View {
    let style: Style
    let configuration: InactiveTrackConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension InactiveTrackStyle {
    func resolve(configuration: InactiveTrackConfiguration) -> some View {
        ResolvedInactiveTrackStyle(style: self, configuration: configuration)
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

// MARK: InnerCircleStyle

struct ResolvedInnerCircleStyle<Style: InnerCircleStyle>: View {
    let style: Style
    let configuration: InnerCircleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension InnerCircleStyle {
    func resolve(configuration: InnerCircleConfiguration) -> some View {
        ResolvedInnerCircleStyle(style: self, configuration: configuration)
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

// MARK: KPIContentStyle

struct ResolvedKPIContentStyle<Style: KPIContentStyle>: View {
    let style: Style
    let configuration: KPIContentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension KPIContentStyle {
    func resolve(configuration: KPIContentConfiguration) -> some View {
        ResolvedKPIContentStyle(style: self, configuration: configuration)
    }
}

// MARK: KPIItemStyle

struct ResolvedKPIItemStyle<Style: KPIItemStyle>: View {
    let style: Style
    let configuration: KPIItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension KPIItemStyle {
    func resolve(configuration: KPIItemConfiguration) -> some View {
        ResolvedKPIItemStyle(style: self, configuration: configuration)
    }
}

// MARK: KPIProgressItemStyle

struct ResolvedKPIProgressItemStyle<Style: KPIProgressItemStyle>: View {
    let style: Style
    let configuration: KPIProgressItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension KPIProgressItemStyle {
    func resolve(configuration: KPIProgressItemConfiguration) -> some View {
        ResolvedKPIProgressItemStyle(style: self, configuration: configuration)
    }
}

// MARK: KPISubItemStyle

struct ResolvedKPISubItemStyle<Style: KPISubItemStyle>: View {
    let style: Style
    let configuration: KPISubItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension KPISubItemStyle {
    func resolve(configuration: KPISubItemConfiguration) -> some View {
        ResolvedKPISubItemStyle(style: self, configuration: configuration)
    }
}

// MARK: KeyStyle

struct ResolvedKeyStyle<Style: KeyStyle>: View {
    let style: Style
    let configuration: KeyConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension KeyStyle {
    func resolve(configuration: KeyConfiguration) -> some View {
        ResolvedKeyStyle(style: self, configuration: configuration)
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

// MARK: KeyValueItemStyle

struct ResolvedKeyValueItemStyle<Style: KeyValueItemStyle>: View {
    let style: Style
    let configuration: KeyValueItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension KeyValueItemStyle {
    func resolve(configuration: KeyValueItemConfiguration) -> some View {
        ResolvedKeyValueItemStyle(style: self, configuration: configuration)
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

// MARK: LeadingAccessoryStyle

struct ResolvedLeadingAccessoryStyle<Style: LeadingAccessoryStyle>: View {
    let style: Style
    let configuration: LeadingAccessoryConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension LeadingAccessoryStyle {
    func resolve(configuration: LeadingAccessoryConfiguration) -> some View {
        ResolvedLeadingAccessoryStyle(style: self, configuration: configuration)
    }
}

// MARK: LineStyle

struct ResolvedLineStyle<Style: LineStyle>: View {
    let style: Style
    let configuration: LineConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension LineStyle {
    func resolve(configuration: LineConfiguration) -> some View {
        ResolvedLineStyle(style: self, configuration: configuration)
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

// MARK: LoadingIndicatorStyle

struct ResolvedLoadingIndicatorStyle<Style: LoadingIndicatorStyle>: View {
    let style: Style
    let configuration: LoadingIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension LoadingIndicatorStyle {
    func resolve(configuration: LoadingIndicatorConfiguration) -> some View {
        ResolvedLoadingIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: LowerThumbStyle

struct ResolvedLowerThumbStyle<Style: LowerThumbStyle>: View {
    let style: Style
    let configuration: LowerThumbConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension LowerThumbStyle {
    func resolve(configuration: LowerThumbConfiguration) -> some View {
        ResolvedLowerThumbStyle(style: self, configuration: configuration)
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

// MARK: NextActionStyle

struct ResolvedNextActionStyle<Style: NextActionStyle>: View {
    let style: Style
    let configuration: NextActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension NextActionStyle {
    func resolve(configuration: NextActionConfiguration) -> some View {
        ResolvedNextActionStyle(style: self, configuration: configuration)
    }
}

// MARK: NodeStyle

struct ResolvedNodeStyle<Style: NodeStyle>: View {
    let style: Style
    let configuration: NodeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension NodeStyle {
    func resolve(configuration: NodeConfiguration) -> some View {
        ResolvedNodeStyle(style: self, configuration: configuration)
    }
}

// MARK: NotNowActionStyle

struct ResolvedNotNowActionStyle<Style: NotNowActionStyle>: View {
    let style: Style
    let configuration: NotNowActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension NotNowActionStyle {
    func resolve(configuration: NotNowActionConfiguration) -> some View {
        ResolvedNotNowActionStyle(style: self, configuration: configuration)
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

// MARK: ObjectHeaderStyle

struct ResolvedObjectHeaderStyle<Style: ObjectHeaderStyle>: View {
    let style: Style
    let configuration: ObjectHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ObjectHeaderStyle {
    func resolve(configuration: ObjectHeaderConfiguration) -> some View {
        ResolvedObjectHeaderStyle(style: self, configuration: configuration)
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

// MARK: OuterCircleStyle

struct ResolvedOuterCircleStyle<Style: OuterCircleStyle>: View {
    let style: Style
    let configuration: OuterCircleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension OuterCircleStyle {
    func resolve(configuration: OuterCircleConfiguration) -> some View {
        ResolvedOuterCircleStyle(style: self, configuration: configuration)
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

// MARK: ProcessingIndicatorStyle

struct ResolvedProcessingIndicatorStyle<Style: ProcessingIndicatorStyle>: View {
    let style: Style
    let configuration: ProcessingIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ProcessingIndicatorStyle {
    func resolve(configuration: ProcessingIndicatorConfiguration) -> some View {
        ResolvedProcessingIndicatorStyle(style: self, configuration: configuration)
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

// MARK: ProgressStyle

struct ResolvedProgressStyle<Style: ProgressStyle>: View {
    let style: Style
    let configuration: ProgressConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ProgressStyle {
    func resolve(configuration: ProgressConfiguration) -> some View {
        ResolvedProgressStyle(style: self, configuration: configuration)
    }
}

// MARK: ProgressIndicatorStyle

struct ResolvedProgressIndicatorStyle<Style: ProgressIndicatorStyle>: View {
    let style: Style
    let configuration: ProgressIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ProgressIndicatorStyle {
    func resolve(configuration: ProgressIndicatorConfiguration) -> some View {
        ResolvedProgressIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: ProgressIndicatorProtocolStyle

struct ResolvedProgressIndicatorProtocolStyle<Style: ProgressIndicatorProtocolStyle>: View {
    let style: Style
    let configuration: ProgressIndicatorProtocolConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ProgressIndicatorProtocolStyle {
    func resolve(configuration: ProgressIndicatorProtocolConfiguration) -> some View {
        ResolvedProgressIndicatorProtocolStyle(style: self, configuration: configuration)
    }
}

// MARK: PromptStyle

struct ResolvedPromptStyle<Style: PromptStyle>: View {
    let style: Style
    let configuration: PromptConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension PromptStyle {
    func resolve(configuration: PromptConfiguration) -> some View {
        ResolvedPromptStyle(style: self, configuration: configuration)
    }
}

// MARK: RangeSliderControlStyle

struct ResolvedRangeSliderControlStyle<Style: RangeSliderControlStyle>: View {
    let style: Style
    let configuration: RangeSliderControlConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension RangeSliderControlStyle {
    func resolve(configuration: RangeSliderControlConfiguration) -> some View {
        ResolvedRangeSliderControlStyle(style: self, configuration: configuration)
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

// MARK: ReenterSignatureActionStyle

struct ResolvedReenterSignatureActionStyle<Style: ReenterSignatureActionStyle>: View {
    let style: Style
    let configuration: ReenterSignatureActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ReenterSignatureActionStyle {
    func resolve(configuration: ReenterSignatureActionConfiguration) -> some View {
        ResolvedReenterSignatureActionStyle(style: self, configuration: configuration)
    }
}

// MARK: ResetActionStyle

struct ResolvedResetActionStyle<Style: ResetActionStyle>: View {
    let style: Style
    let configuration: ResetActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ResetActionStyle {
    func resolve(configuration: ResetActionConfiguration) -> some View {
        ResolvedResetActionStyle(style: self, configuration: configuration)
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

// MARK: SaveActionStyle

struct ResolvedSaveActionStyle<Style: SaveActionStyle>: View {
    let style: Style
    let configuration: SaveActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SaveActionStyle {
    func resolve(configuration: SaveActionConfiguration) -> some View {
        ResolvedSaveActionStyle(style: self, configuration: configuration)
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

// MARK: SectionFooterStyle

struct ResolvedSectionFooterStyle<Style: SectionFooterStyle>: View {
    let style: Style
    let configuration: SectionFooterConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SectionFooterStyle {
    func resolve(configuration: SectionFooterConfiguration) -> some View {
        ResolvedSectionFooterStyle(style: self, configuration: configuration)
    }
}

// MARK: SectionHeaderStyle

struct ResolvedSectionHeaderStyle<Style: SectionHeaderStyle>: View {
    let style: Style
    let configuration: SectionHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SectionHeaderStyle {
    func resolve(configuration: SectionHeaderConfiguration) -> some View {
        ResolvedSectionHeaderStyle(style: self, configuration: configuration)
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

// MARK: SignatureCaptureViewStyle

struct ResolvedSignatureCaptureViewStyle<Style: SignatureCaptureViewStyle>: View {
    let style: Style
    let configuration: SignatureCaptureViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SignatureCaptureViewStyle {
    func resolve(configuration: SignatureCaptureViewConfiguration) -> some View {
        ResolvedSignatureCaptureViewStyle(style: self, configuration: configuration)
    }
}

// MARK: SingleStepStyle

struct ResolvedSingleStepStyle<Style: SingleStepStyle>: View {
    let style: Style
    let configuration: SingleStepConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SingleStepStyle {
    func resolve(configuration: SingleStepConfiguration) -> some View {
        ResolvedSingleStepStyle(style: self, configuration: configuration)
    }
}

// MARK: SortFilterViewStyle

struct ResolvedSortFilterViewStyle<Style: SortFilterViewStyle>: View {
    let style: Style
    let configuration: SortFilterViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension SortFilterViewStyle {
    func resolve(configuration: SortFilterViewConfiguration) -> some View {
        ResolvedSortFilterViewStyle(style: self, configuration: configuration)
    }
}

// MARK: StartSignatureActionStyle

struct ResolvedStartSignatureActionStyle<Style: StartSignatureActionStyle>: View {
    let style: Style
    let configuration: StartSignatureActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension StartSignatureActionStyle {
    func resolve(configuration: StartSignatureActionConfiguration) -> some View {
        ResolvedStartSignatureActionStyle(style: self, configuration: configuration)
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

// MARK: StepProgressIndicatorStyle

struct ResolvedStepProgressIndicatorStyle<Style: StepProgressIndicatorStyle>: View {
    let style: Style
    let configuration: StepProgressIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension StepProgressIndicatorStyle {
    func resolve(configuration: StepProgressIndicatorConfiguration) -> some View {
        ResolvedStepProgressIndicatorStyle(style: self, configuration: configuration)
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

// MARK: TagStyle

struct ResolvedTagStyle<Style: TagStyle>: View {
    let style: Style
    let configuration: TagConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TagStyle {
    func resolve(configuration: TagConfiguration) -> some View {
        ResolvedTagStyle(style: self, configuration: configuration)
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

// MARK: TextInputStyle

struct ResolvedTextInputStyle<Style: TextInputStyle>: View {
    let style: Style
    let configuration: TextInputConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TextInputStyle {
    func resolve(configuration: TextInputConfiguration) -> some View {
        ResolvedTextInputStyle(style: self, configuration: configuration)
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

// MARK: TrailingAccessoryStyle

struct ResolvedTrailingAccessoryStyle<Style: TrailingAccessoryStyle>: View {
    let style: Style
    let configuration: TrailingAccessoryConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TrailingAccessoryStyle {
    func resolve(configuration: TrailingAccessoryConfiguration) -> some View {
        ResolvedTrailingAccessoryStyle(style: self, configuration: configuration)
    }
}

// MARK: TrendStyle

struct ResolvedTrendStyle<Style: TrendStyle>: View {
    let style: Style
    let configuration: TrendConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TrendStyle {
    func resolve(configuration: TrendConfiguration) -> some View {
        ResolvedTrendStyle(style: self, configuration: configuration)
    }
}

// MARK: TrendImageStyle

struct ResolvedTrendImageStyle<Style: TrendImageStyle>: View {
    let style: Style
    let configuration: TrendImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension TrendImageStyle {
    func resolve(configuration: TrendImageConfiguration) -> some View {
        ResolvedTrendImageStyle(style: self, configuration: configuration)
    }
}

// MARK: UpperThumbStyle

struct ResolvedUpperThumbStyle<Style: UpperThumbStyle>: View {
    let style: Style
    let configuration: UpperThumbConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension UpperThumbStyle {
    func resolve(configuration: UpperThumbConfiguration) -> some View {
        ResolvedUpperThumbStyle(style: self, configuration: configuration)
    }
}

// MARK: UserConsentFormStyle

struct ResolvedUserConsentFormStyle<Style: UserConsentFormStyle>: View {
    let style: Style
    let configuration: UserConsentFormConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension UserConsentFormStyle {
    func resolve(configuration: UserConsentFormConfiguration) -> some View {
        ResolvedUserConsentFormStyle(style: self, configuration: configuration)
    }
}

// MARK: UserConsentPageStyle

struct ResolvedUserConsentPageStyle<Style: UserConsentPageStyle>: View {
    let style: Style
    let configuration: UserConsentPageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension UserConsentPageStyle {
    func resolve(configuration: UserConsentPageConfiguration) -> some View {
        ResolvedUserConsentPageStyle(style: self, configuration: configuration)
    }
}

// MARK: UserConsentViewStyle

struct ResolvedUserConsentViewStyle<Style: UserConsentViewStyle>: View {
    let style: Style
    let configuration: UserConsentViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension UserConsentViewStyle {
    func resolve(configuration: UserConsentViewConfiguration) -> some View {
        ResolvedUserConsentViewStyle(style: self, configuration: configuration)
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

// MARK: ValuePickerStyle

struct ResolvedValuePickerStyle<Style: ValuePickerStyle>: View {
    let style: Style
    let configuration: ValuePickerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension ValuePickerStyle {
    func resolve(configuration: ValuePickerConfiguration) -> some View {
        ResolvedValuePickerStyle(style: self, configuration: configuration)
    }
}

// MARK: WatermarkStyle

struct ResolvedWatermarkStyle<Style: WatermarkStyle>: View {
    let style: Style
    let configuration: WatermarkConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension WatermarkStyle {
    func resolve(configuration: WatermarkConfiguration) -> some View {
        ResolvedWatermarkStyle(style: self, configuration: configuration)
    }
}

// MARK: WelcomeScreenStyle

struct ResolvedWelcomeScreenStyle<Style: WelcomeScreenStyle>: View {
    let style: Style
    let configuration: WelcomeScreenConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension WelcomeScreenStyle {
    func resolve(configuration: WelcomeScreenConfiguration) -> some View {
        ResolvedWelcomeScreenStyle(style: self, configuration: configuration)
    }
}

// MARK: XmarkStyle

struct ResolvedXmarkStyle<Style: XmarkStyle>: View {
    let style: Style
    let configuration: XmarkConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

extension XmarkStyle {
    func resolve(configuration: XmarkConfiguration) -> some View {
        ResolvedXmarkStyle(style: self, configuration: configuration)
    }
}
