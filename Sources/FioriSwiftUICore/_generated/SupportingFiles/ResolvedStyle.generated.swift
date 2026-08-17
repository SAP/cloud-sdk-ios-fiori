// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: AINoticeStyle

@MainActor struct ResolvedAINoticeStyle<Style: AINoticeStyle>: View {
    let style: Style
    let configuration: AINoticeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AINoticeStyle {
    func resolve(configuration: AINoticeConfiguration) -> some View {
        ResolvedAINoticeStyle(style: self, configuration: configuration)
    }
}

// MARK: AIUserFeedbackStyle

@MainActor struct ResolvedAIUserFeedbackStyle<Style: AIUserFeedbackStyle>: View {
    let style: Style
    let configuration: AIUserFeedbackConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AIUserFeedbackStyle {
    func resolve(configuration: AIUserFeedbackConfiguration) -> some View {
        ResolvedAIUserFeedbackStyle(style: self, configuration: configuration)
    }
}

// MARK: AccessoryIconStyle

@MainActor struct ResolvedAccessoryIconStyle<Style: AccessoryIconStyle>: View {
    let style: Style
    let configuration: AccessoryIconConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AccessoryIconStyle {
    func resolve(configuration: AccessoryIconConfiguration) -> some View {
        ResolvedAccessoryIconStyle(style: self, configuration: configuration)
    }
}

// MARK: AccessoryViewStyle

@MainActor struct ResolvedAccessoryViewStyle<Style: AccessoryViewStyle>: View {
    let style: Style
    let configuration: AccessoryViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AccessoryViewStyle {
    func resolve(configuration: AccessoryViewConfiguration) -> some View {
        ResolvedAccessoryViewStyle(style: self, configuration: configuration)
    }
}

// MARK: ActionStyle

@MainActor struct ResolvedActionStyle<Style: ActionStyle>: View {
    let style: Style
    let configuration: ActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ActionStyle {
    func resolve(configuration: ActionConfiguration) -> some View {
        ResolvedActionStyle(style: self, configuration: configuration)
    }
}

// MARK: ActivationScreenStyle

@MainActor struct ResolvedActivationScreenStyle<Style: ActivationScreenStyle>: View {
    let style: Style
    let configuration: ActivationScreenConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ActivationScreenStyle {
    func resolve(configuration: ActivationScreenConfiguration) -> some View {
        ResolvedActivationScreenStyle(style: self, configuration: configuration)
    }
}

// MARK: ActiveTrackStyle

@MainActor struct ResolvedActiveTrackStyle<Style: ActiveTrackStyle>: View {
    let style: Style
    let configuration: ActiveTrackConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ActiveTrackStyle {
    func resolve(configuration: ActiveTrackConfiguration) -> some View {
        ResolvedActiveTrackStyle(style: self, configuration: configuration)
    }
}

// MARK: ActivityItemStyle

@MainActor struct ResolvedActivityItemStyle<Style: ActivityItemStyle>: View {
    let style: Style
    let configuration: ActivityItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ActivityItemStyle {
    func resolve(configuration: ActivityItemConfiguration) -> some View {
        ResolvedActivityItemStyle(style: self, configuration: configuration)
    }
}

// MARK: ActivityItemsStyle

@MainActor struct ResolvedActivityItemsStyle<Style: ActivityItemsStyle>: View {
    let style: Style
    let configuration: ActivityItemsConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ActivityItemsStyle {
    func resolve(configuration: ActivityItemsConfiguration) -> some View {
        ResolvedActivityItemsStyle(style: self, configuration: configuration)
    }
}

// MARK: AgreeActionStyle

@MainActor struct ResolvedAgreeActionStyle<Style: AgreeActionStyle>: View {
    let style: Style
    let configuration: AgreeActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AgreeActionStyle {
    func resolve(configuration: AgreeActionConfiguration) -> some View {
        ResolvedAgreeActionStyle(style: self, configuration: configuration)
    }
}

// MARK: AllEntriesSectionTitleStyle

@MainActor struct ResolvedAllEntriesSectionTitleStyle<Style: AllEntriesSectionTitleStyle>: View {
    let style: Style
    let configuration: AllEntriesSectionTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AllEntriesSectionTitleStyle {
    func resolve(configuration: AllEntriesSectionTitleConfiguration) -> some View {
        ResolvedAllEntriesSectionTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: AllowActionStyle

@MainActor struct ResolvedAllowActionStyle<Style: AllowActionStyle>: View {
    let style: Style
    let configuration: AllowActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AllowActionStyle {
    func resolve(configuration: AllowActionConfiguration) -> some View {
        ResolvedAllowActionStyle(style: self, configuration: configuration)
    }
}

// MARK: ApplyActionStyle

@MainActor struct ResolvedApplyActionStyle<Style: ApplyActionStyle>: View {
    let style: Style
    let configuration: ApplyActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ApplyActionStyle {
    func resolve(configuration: ApplyActionConfiguration) -> some View {
        ResolvedApplyActionStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentButtonImageStyle

@MainActor struct ResolvedAttachmentButtonImageStyle<Style: AttachmentButtonImageStyle>: View {
    let style: Style
    let configuration: AttachmentButtonImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentButtonImageStyle {
    func resolve(configuration: AttachmentButtonImageConfiguration) -> some View {
        ResolvedAttachmentButtonImageStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentStyle

@MainActor struct ResolvedAttachmentStyle<Style: AttachmentStyle>: View {
    let style: Style
    let configuration: AttachmentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentStyle {
    func resolve(configuration: AttachmentConfiguration) -> some View {
        ResolvedAttachmentStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentElementStyle

@MainActor struct ResolvedAttachmentElementStyle<Style: AttachmentElementStyle>: View {
    let style: Style
    let configuration: AttachmentElementConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentElementStyle {
    func resolve(configuration: AttachmentElementConfiguration) -> some View {
        ResolvedAttachmentElementStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentErrorTitleStyle

@MainActor struct ResolvedAttachmentErrorTitleStyle<Style: AttachmentErrorTitleStyle>: View {
    let style: Style
    let configuration: AttachmentErrorTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentErrorTitleStyle {
    func resolve(configuration: AttachmentErrorTitleConfiguration) -> some View {
        ResolvedAttachmentErrorTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentFootnoteStyle

@MainActor struct ResolvedAttachmentFootnoteStyle<Style: AttachmentFootnoteStyle>: View {
    let style: Style
    let configuration: AttachmentFootnoteConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentFootnoteStyle {
    func resolve(configuration: AttachmentFootnoteConfiguration) -> some View {
        ResolvedAttachmentFootnoteStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentGroupStyle

@MainActor struct ResolvedAttachmentGroupStyle<Style: AttachmentGroupStyle>: View {
    let style: Style
    let configuration: AttachmentGroupConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentGroupStyle {
    func resolve(configuration: AttachmentGroupConfiguration) -> some View {
        ResolvedAttachmentGroupStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentInProgressStyle

@MainActor struct ResolvedAttachmentInProgressStyle<Style: AttachmentInProgressStyle>: View {
    let style: Style
    let configuration: AttachmentInProgressConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentInProgressStyle {
    func resolve(configuration: AttachmentInProgressConfiguration) -> some View {
        ResolvedAttachmentInProgressStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentInProgressTitleStyle

@MainActor struct ResolvedAttachmentInProgressTitleStyle<Style: AttachmentInProgressTitleStyle>: View {
    let style: Style
    let configuration: AttachmentInProgressTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentInProgressTitleStyle {
    func resolve(configuration: AttachmentInProgressTitleConfiguration) -> some View {
        ResolvedAttachmentInProgressTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentSubtitleStyle

@MainActor struct ResolvedAttachmentSubtitleStyle<Style: AttachmentSubtitleStyle>: View {
    let style: Style
    let configuration: AttachmentSubtitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentSubtitleStyle {
    func resolve(configuration: AttachmentSubtitleConfiguration) -> some View {
        ResolvedAttachmentSubtitleStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentThumbnailStyle

@MainActor struct ResolvedAttachmentThumbnailStyle<Style: AttachmentThumbnailStyle>: View {
    let style: Style
    let configuration: AttachmentThumbnailConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentThumbnailStyle {
    func resolve(configuration: AttachmentThumbnailConfiguration) -> some View {
        ResolvedAttachmentThumbnailStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentTitleStyle

@MainActor struct ResolvedAttachmentTitleStyle<Style: AttachmentTitleStyle>: View {
    let style: Style
    let configuration: AttachmentTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentTitleStyle {
    func resolve(configuration: AttachmentTitleConfiguration) -> some View {
        ResolvedAttachmentTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: AttachmentWithErrorStyle

@MainActor struct ResolvedAttachmentWithErrorStyle<Style: AttachmentWithErrorStyle>: View {
    let style: Style
    let configuration: AttachmentWithErrorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttachmentWithErrorStyle {
    func resolve(configuration: AttachmentWithErrorConfiguration) -> some View {
        ResolvedAttachmentWithErrorStyle(style: self, configuration: configuration)
    }
}

// MARK: AttributeStyle

@MainActor struct ResolvedAttributeStyle<Style: AttributeStyle>: View {
    let style: Style
    let configuration: AttributeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AttributeStyle {
    func resolve(configuration: AttributeConfiguration) -> some View {
        ResolvedAttributeStyle(style: self, configuration: configuration)
    }
}

// MARK: AuthInputStyle

@MainActor struct ResolvedAuthInputStyle<Style: AuthInputStyle>: View {
    let style: Style
    let configuration: AuthInputConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AuthInputStyle {
    func resolve(configuration: AuthInputConfiguration) -> some View {
        ResolvedAuthInputStyle(style: self, configuration: configuration)
    }
}

// MARK: AuthenticationStyle

@MainActor struct ResolvedAuthenticationStyle<Style: AuthenticationStyle>: View {
    let style: Style
    let configuration: AuthenticationConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AuthenticationStyle {
    func resolve(configuration: AuthenticationConfiguration) -> some View {
        ResolvedAuthenticationStyle(style: self, configuration: configuration)
    }
}

// MARK: AvatarStackStyle

@MainActor struct ResolvedAvatarStackStyle<Style: AvatarStackStyle>: View {
    let style: Style
    let configuration: AvatarStackConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AvatarStackStyle {
    func resolve(configuration: AvatarStackConfiguration) -> some View {
        ResolvedAvatarStackStyle(style: self, configuration: configuration)
    }
}

// MARK: AvatarsStyle

@MainActor struct ResolvedAvatarsStyle<Style: AvatarsStyle>: View {
    let style: Style
    let configuration: AvatarsConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AvatarsStyle {
    func resolve(configuration: AvatarsConfiguration) -> some View {
        ResolvedAvatarsStyle(style: self, configuration: configuration)
    }
}

// MARK: AvatarsTitleStyle

@MainActor struct ResolvedAvatarsTitleStyle<Style: AvatarsTitleStyle>: View {
    let style: Style
    let configuration: AvatarsTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension AvatarsTitleStyle {
    func resolve(configuration: AvatarsTitleConfiguration) -> some View {
        ResolvedAvatarsTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: BackActionStyle

@MainActor struct ResolvedBackActionStyle<Style: BackActionStyle>: View {
    let style: Style
    let configuration: BackActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension BackActionStyle {
    func resolve(configuration: BackActionConfiguration) -> some View {
        ResolvedBackActionStyle(style: self, configuration: configuration)
    }
}

// MARK: BannerMessageStyle

@MainActor struct ResolvedBannerMessageStyle<Style: BannerMessageStyle>: View {
    let style: Style
    let configuration: BannerMessageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension BannerMessageStyle {
    func resolve(configuration: BannerMessageConfiguration) -> some View {
        ResolvedBannerMessageStyle(style: self, configuration: configuration)
    }
}

// MARK: BannerMultiMessageSheetStyle

@MainActor struct ResolvedBannerMultiMessageSheetStyle<Style: BannerMultiMessageSheetStyle>: View {
    let style: Style
    let configuration: BannerMultiMessageSheetConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension BannerMultiMessageSheetStyle {
    func resolve(configuration: BannerMultiMessageSheetConfiguration) -> some View {
        ResolvedBannerMultiMessageSheetStyle(style: self, configuration: configuration)
    }
}

// MARK: BodyTextStyle

@MainActor struct ResolvedBodyTextStyle<Style: BodyTextStyle>: View {
    let style: Style
    let configuration: BodyTextConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension BodyTextStyle {
    func resolve(configuration: BodyTextConfiguration) -> some View {
        ResolvedBodyTextStyle(style: self, configuration: configuration)
    }
}

// MARK: CalendarDayViewStyle

@MainActor struct ResolvedCalendarDayViewStyle<Style: CalendarDayViewStyle>: View {
    let style: Style
    let configuration: CalendarDayViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CalendarDayViewStyle {
    func resolve(configuration: CalendarDayViewConfiguration) -> some View {
        ResolvedCalendarDayViewStyle(style: self, configuration: configuration)
    }
}

// MARK: CalendarMonthViewStyle

@MainActor struct ResolvedCalendarMonthViewStyle<Style: CalendarMonthViewStyle>: View {
    let style: Style
    let configuration: CalendarMonthViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CalendarMonthViewStyle {
    func resolve(configuration: CalendarMonthViewConfiguration) -> some View {
        ResolvedCalendarMonthViewStyle(style: self, configuration: configuration)
    }
}

// MARK: CalendarViewStyle

@MainActor struct ResolvedCalendarViewStyle<Style: CalendarViewStyle>: View {
    let style: Style
    let configuration: CalendarViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CalendarViewStyle {
    func resolve(configuration: CalendarViewConfiguration) -> some View {
        ResolvedCalendarViewStyle(style: self, configuration: configuration)
    }
}

// MARK: CalendarWeekViewStyle

@MainActor struct ResolvedCalendarWeekViewStyle<Style: CalendarWeekViewStyle>: View {
    let style: Style
    let configuration: CalendarWeekViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CalendarWeekViewStyle {
    func resolve(configuration: CalendarWeekViewConfiguration) -> some View {
        ResolvedCalendarWeekViewStyle(style: self, configuration: configuration)
    }
}

// MARK: CancelActionStyle

@MainActor struct ResolvedCancelActionStyle<Style: CancelActionStyle>: View {
    let style: Style
    let configuration: CancelActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CancelActionStyle {
    func resolve(configuration: CancelActionConfiguration) -> some View {
        ResolvedCancelActionStyle(style: self, configuration: configuration)
    }
}

// MARK: CardBodyStyle

@MainActor struct ResolvedCardBodyStyle<Style: CardBodyStyle>: View {
    let style: Style
    let configuration: CardBodyConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CardBodyStyle {
    func resolve(configuration: CardBodyConfiguration) -> some View {
        ResolvedCardBodyStyle(style: self, configuration: configuration)
    }
}

// MARK: CardStyle

@MainActor struct ResolvedCardStyle<Style: CardStyle>: View {
    let style: Style
    let configuration: CardConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CardStyle {
    func resolve(configuration: CardConfiguration) -> some View {
        ResolvedCardStyle(style: self, configuration: configuration)
    }
}

// MARK: CardExtHeaderStyle

@MainActor struct ResolvedCardExtHeaderStyle<Style: CardExtHeaderStyle>: View {
    let style: Style
    let configuration: CardExtHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CardExtHeaderStyle {
    func resolve(configuration: CardExtHeaderConfiguration) -> some View {
        ResolvedCardExtHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: CardFooterStyle

@MainActor struct ResolvedCardFooterStyle<Style: CardFooterStyle>: View {
    let style: Style
    let configuration: CardFooterConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CardFooterStyle {
    func resolve(configuration: CardFooterConfiguration) -> some View {
        ResolvedCardFooterStyle(style: self, configuration: configuration)
    }
}

// MARK: CardHeaderStyle

@MainActor struct ResolvedCardHeaderStyle<Style: CardHeaderStyle>: View {
    let style: Style
    let configuration: CardHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CardHeaderStyle {
    func resolve(configuration: CardHeaderConfiguration) -> some View {
        ResolvedCardHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: CardMainHeaderStyle

@MainActor struct ResolvedCardMainHeaderStyle<Style: CardMainHeaderStyle>: View {
    let style: Style
    let configuration: CardMainHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CardMainHeaderStyle {
    func resolve(configuration: CardMainHeaderConfiguration) -> some View {
        ResolvedCardMainHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: CardMediaStyle

@MainActor struct ResolvedCardMediaStyle<Style: CardMediaStyle>: View {
    let style: Style
    let configuration: CardMediaConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CardMediaStyle {
    func resolve(configuration: CardMediaConfiguration) -> some View {
        ResolvedCardMediaStyle(style: self, configuration: configuration)
    }
}

// MARK: CheckmarkStyle

@MainActor struct ResolvedCheckmarkStyle<Style: CheckmarkStyle>: View {
    let style: Style
    let configuration: CheckmarkConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CheckmarkStyle {
    func resolve(configuration: CheckmarkConfiguration) -> some View {
        ResolvedCheckmarkStyle(style: self, configuration: configuration)
    }
}

// MARK: CheckoutIndicatorStyle

@MainActor struct ResolvedCheckoutIndicatorStyle<Style: CheckoutIndicatorStyle>: View {
    let style: Style
    let configuration: CheckoutIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CheckoutIndicatorStyle {
    func resolve(configuration: CheckoutIndicatorConfiguration) -> some View {
        ResolvedCheckoutIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: ClearActionStyle

@MainActor struct ResolvedClearActionStyle<Style: ClearActionStyle>: View {
    let style: Style
    let configuration: ClearActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ClearActionStyle {
    func resolve(configuration: ClearActionConfiguration) -> some View {
        ResolvedClearActionStyle(style: self, configuration: configuration)
    }
}

// MARK: CloseActionStyle

@MainActor struct ResolvedCloseActionStyle<Style: CloseActionStyle>: View {
    let style: Style
    let configuration: CloseActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CloseActionStyle {
    func resolve(configuration: CloseActionConfiguration) -> some View {
        ResolvedCloseActionStyle(style: self, configuration: configuration)
    }
}

// MARK: ContactItemStyle

@MainActor struct ResolvedContactItemStyle<Style: ContactItemStyle>: View {
    let style: Style
    let configuration: ContactItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ContactItemStyle {
    func resolve(configuration: ContactItemConfiguration) -> some View {
        ResolvedContactItemStyle(style: self, configuration: configuration)
    }
}

// MARK: CounterStyle

@MainActor struct ResolvedCounterStyle<Style: CounterStyle>: View {
    let style: Style
    let configuration: CounterConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension CounterStyle {
    func resolve(configuration: CounterConfiguration) -> some View {
        ResolvedCounterStyle(style: self, configuration: configuration)
    }
}

// MARK: DateRangePickerStyle

@MainActor struct ResolvedDateRangePickerStyle<Style: DateRangePickerStyle>: View {
    let style: Style
    let configuration: DateRangePickerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DateRangePickerStyle {
    func resolve(configuration: DateRangePickerConfiguration) -> some View {
        ResolvedDateRangePickerStyle(style: self, configuration: configuration)
    }
}

// MARK: DateTimePickerStyle

@MainActor struct ResolvedDateTimePickerStyle<Style: DateTimePickerStyle>: View {
    let style: Style
    let configuration: DateTimePickerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DateTimePickerStyle {
    func resolve(configuration: DateTimePickerConfiguration) -> some View {
        ResolvedDateTimePickerStyle(style: self, configuration: configuration)
    }
}

// MARK: DecrementActionStyle

@MainActor struct ResolvedDecrementActionStyle<Style: DecrementActionStyle>: View {
    let style: Style
    let configuration: DecrementActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DecrementActionStyle {
    func resolve(configuration: DecrementActionConfiguration) -> some View {
        ResolvedDecrementActionStyle(style: self, configuration: configuration)
    }
}

// MARK: DemoViewStyle

@MainActor struct ResolvedDemoViewStyle<Style: DemoViewStyle>: View {
    let style: Style
    let configuration: DemoViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DemoViewStyle {
    func resolve(configuration: DemoViewConfiguration) -> some View {
        ResolvedDemoViewStyle(style: self, configuration: configuration)
    }
}

// MARK: DenyActionStyle

@MainActor struct ResolvedDenyActionStyle<Style: DenyActionStyle>: View {
    let style: Style
    let configuration: DenyActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DenyActionStyle {
    func resolve(configuration: DenyActionConfiguration) -> some View {
        ResolvedDenyActionStyle(style: self, configuration: configuration)
    }
}

// MARK: DescriptionStyle

@MainActor struct ResolvedDescriptionStyle<Style: DescriptionStyle>: View {
    let style: Style
    let configuration: DescriptionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DescriptionStyle {
    func resolve(configuration: DescriptionConfiguration) -> some View {
        ResolvedDescriptionStyle(style: self, configuration: configuration)
    }
}

// MARK: DescriptionTextStyle

@MainActor struct ResolvedDescriptionTextStyle<Style: DescriptionTextStyle>: View {
    let style: Style
    let configuration: DescriptionTextConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DescriptionTextStyle {
    func resolve(configuration: DescriptionTextConfiguration) -> some View {
        ResolvedDescriptionTextStyle(style: self, configuration: configuration)
    }
}

// MARK: DeselectAllActionStyle

@MainActor struct ResolvedDeselectAllActionStyle<Style: DeselectAllActionStyle>: View {
    let style: Style
    let configuration: DeselectAllActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DeselectAllActionStyle {
    func resolve(configuration: DeselectAllActionConfiguration) -> some View {
        ResolvedDeselectAllActionStyle(style: self, configuration: configuration)
    }
}

// MARK: DetailContentStyle

@MainActor struct ResolvedDetailContentStyle<Style: DetailContentStyle>: View {
    let style: Style
    let configuration: DetailContentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DetailContentStyle {
    func resolve(configuration: DetailContentConfiguration) -> some View {
        ResolvedDetailContentStyle(style: self, configuration: configuration)
    }
}

// MARK: DetailImageStyle

@MainActor struct ResolvedDetailImageStyle<Style: DetailImageStyle>: View {
    let style: Style
    let configuration: DetailImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DetailImageStyle {
    func resolve(configuration: DetailImageConfiguration) -> some View {
        ResolvedDetailImageStyle(style: self, configuration: configuration)
    }
}

// MARK: DimensionSegmentStyle

@MainActor struct ResolvedDimensionSegmentStyle<Style: DimensionSegmentStyle>: View {
    let style: Style
    let configuration: DimensionSegmentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DimensionSegmentStyle {
    func resolve(configuration: DimensionSegmentConfiguration) -> some View {
        ResolvedDimensionSegmentStyle(style: self, configuration: configuration)
    }
}

// MARK: DimensionSelectorStyle

@MainActor struct ResolvedDimensionSelectorStyle<Style: DimensionSelectorStyle>: View {
    let style: Style
    let configuration: DimensionSelectorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DimensionSelectorStyle {
    func resolve(configuration: DimensionSelectorConfiguration) -> some View {
        ResolvedDimensionSelectorStyle(style: self, configuration: configuration)
    }
}

// MARK: DisagreeActionStyle

@MainActor struct ResolvedDisagreeActionStyle<Style: DisagreeActionStyle>: View {
    let style: Style
    let configuration: DisagreeActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DisagreeActionStyle {
    func resolve(configuration: DisagreeActionConfiguration) -> some View {
        ResolvedDisagreeActionStyle(style: self, configuration: configuration)
    }
}

// MARK: DoneActionStyle

@MainActor struct ResolvedDoneActionStyle<Style: DoneActionStyle>: View {
    let style: Style
    let configuration: DoneActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DoneActionStyle {
    func resolve(configuration: DoneActionConfiguration) -> some View {
        ResolvedDoneActionStyle(style: self, configuration: configuration)
    }
}

// MARK: DownVoteActionStyle

@MainActor struct ResolvedDownVoteActionStyle<Style: DownVoteActionStyle>: View {
    let style: Style
    let configuration: DownVoteActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DownVoteActionStyle {
    func resolve(configuration: DownVoteActionConfiguration) -> some View {
        ResolvedDownVoteActionStyle(style: self, configuration: configuration)
    }
}

// MARK: DurationPickerStyle

@MainActor struct ResolvedDurationPickerStyle<Style: DurationPickerStyle>: View {
    let style: Style
    let configuration: DurationPickerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension DurationPickerStyle {
    func resolve(configuration: DurationPickerConfiguration) -> some View {
        ResolvedDurationPickerStyle(style: self, configuration: configuration)
    }
}

// MARK: EULAViewStyle

@MainActor struct ResolvedEULAViewStyle<Style: EULAViewStyle>: View {
    let style: Style
    let configuration: EULAViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension EULAViewStyle {
    func resolve(configuration: EULAViewConfiguration) -> some View {
        ResolvedEULAViewStyle(style: self, configuration: configuration)
    }
}

// MARK: FilledIconStyle

@MainActor struct ResolvedFilledIconStyle<Style: FilledIconStyle>: View {
    let style: Style
    let configuration: FilledIconConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FilledIconStyle {
    func resolve(configuration: FilledIconConfiguration) -> some View {
        ResolvedFilledIconStyle(style: self, configuration: configuration)
    }
}

// MARK: FilterFeedbackBarButtonStyle

@MainActor struct ResolvedFilterFeedbackBarButtonStyle<Style: FilterFeedbackBarButtonStyle>: View {
    let style: Style
    let configuration: FilterFeedbackBarButtonConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FilterFeedbackBarButtonStyle {
    func resolve(configuration: FilterFeedbackBarButtonConfiguration) -> some View {
        ResolvedFilterFeedbackBarButtonStyle(style: self, configuration: configuration)
    }
}

// MARK: FilterFeedbackBarStyle

@MainActor struct ResolvedFilterFeedbackBarStyle<Style: FilterFeedbackBarStyle>: View {
    let style: Style
    let configuration: FilterFeedbackBarConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FilterFeedbackBarStyle {
    func resolve(configuration: FilterFeedbackBarConfiguration) -> some View {
        ResolvedFilterFeedbackBarStyle(style: self, configuration: configuration)
    }
}

// MARK: FilterFeedbackBarItemStyle

@MainActor struct ResolvedFilterFeedbackBarItemStyle<Style: FilterFeedbackBarItemStyle>: View {
    let style: Style
    let configuration: FilterFeedbackBarItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FilterFeedbackBarItemStyle {
    func resolve(configuration: FilterFeedbackBarItemConfiguration) -> some View {
        ResolvedFilterFeedbackBarItemStyle(style: self, configuration: configuration)
    }
}

// MARK: FilterFormViewStyle

@MainActor struct ResolvedFilterFormViewStyle<Style: FilterFormViewStyle>: View {
    let style: Style
    let configuration: FilterFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FilterFormViewStyle {
    func resolve(configuration: FilterFormViewConfiguration) -> some View {
        ResolvedFilterFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: FioriSliderStyle

@MainActor struct ResolvedFioriSliderStyle<Style: FioriSliderStyle>: View {
    let style: Style
    let configuration: FioriSliderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FioriSliderStyle {
    func resolve(configuration: FioriSliderConfiguration) -> some View {
        ResolvedFioriSliderStyle(style: self, configuration: configuration)
    }
}

// MARK: FlexItemStyle

@MainActor struct ResolvedFlexItemStyle<Style: FlexItemStyle>: View {
    let style: Style
    let configuration: FlexItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FlexItemStyle {
    func resolve(configuration: FlexItemConfiguration) -> some View {
        ResolvedFlexItemStyle(style: self, configuration: configuration)
    }
}

// MARK: FootnoteStyle

@MainActor struct ResolvedFootnoteStyle<Style: FootnoteStyle>: View {
    let style: Style
    let configuration: FootnoteConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FootnoteStyle {
    func resolve(configuration: FootnoteConfiguration) -> some View {
        ResolvedFootnoteStyle(style: self, configuration: configuration)
    }
}

// MARK: FootnoteIconsStyle

@MainActor struct ResolvedFootnoteIconsStyle<Style: FootnoteIconsStyle>: View {
    let style: Style
    let configuration: FootnoteIconsConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FootnoteIconsStyle {
    func resolve(configuration: FootnoteIconsConfiguration) -> some View {
        ResolvedFootnoteIconsStyle(style: self, configuration: configuration)
    }
}

// MARK: FootnoteIconsTextStyle

@MainActor struct ResolvedFootnoteIconsTextStyle<Style: FootnoteIconsTextStyle>: View {
    let style: Style
    let configuration: FootnoteIconsTextConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FootnoteIconsTextStyle {
    func resolve(configuration: FootnoteIconsTextConfiguration) -> some View {
        ResolvedFootnoteIconsTextStyle(style: self, configuration: configuration)
    }
}

// MARK: FormViewStyle

@MainActor struct ResolvedFormViewStyle<Style: FormViewStyle>: View {
    let style: Style
    let configuration: FormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension FormViewStyle {
    func resolve(configuration: FormViewConfiguration) -> some View {
        ResolvedFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: GreetingTextStyle

@MainActor struct ResolvedGreetingTextStyle<Style: GreetingTextStyle>: View {
    let style: Style
    let configuration: GreetingTextConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension GreetingTextStyle {
    func resolve(configuration: GreetingTextConfiguration) -> some View {
        ResolvedGreetingTextStyle(style: self, configuration: configuration)
    }
}

// MARK: HalfStarImageStyle

@MainActor struct ResolvedHalfStarImageStyle<Style: HalfStarImageStyle>: View {
    let style: Style
    let configuration: HalfStarImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension HalfStarImageStyle {
    func resolve(configuration: HalfStarImageConfiguration) -> some View {
        ResolvedHalfStarImageStyle(style: self, configuration: configuration)
    }
}

// MARK: HeaderActionStyle

@MainActor struct ResolvedHeaderActionStyle<Style: HeaderActionStyle>: View {
    let style: Style
    let configuration: HeaderActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension HeaderActionStyle {
    func resolve(configuration: HeaderActionConfiguration) -> some View {
        ResolvedHeaderActionStyle(style: self, configuration: configuration)
    }
}

// MARK: HeaderChartStyle

@MainActor struct ResolvedHeaderChartStyle<Style: HeaderChartStyle>: View {
    let style: Style
    let configuration: HeaderChartConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension HeaderChartStyle {
    func resolve(configuration: HeaderChartConfiguration) -> some View {
        ResolvedHeaderChartStyle(style: self, configuration: configuration)
    }
}

// MARK: HelperTextStyle

@MainActor struct ResolvedHelperTextStyle<Style: HelperTextStyle>: View {
    let style: Style
    let configuration: HelperTextConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension HelperTextStyle {
    func resolve(configuration: HelperTextConfiguration) -> some View {
        ResolvedHelperTextStyle(style: self, configuration: configuration)
    }
}

// MARK: HierarchyIndicatorStyle

@MainActor struct ResolvedHierarchyIndicatorStyle<Style: HierarchyIndicatorStyle>: View {
    let style: Style
    let configuration: HierarchyIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension HierarchyIndicatorStyle {
    func resolve(configuration: HierarchyIndicatorConfiguration) -> some View {
        ResolvedHierarchyIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: HierarchyItemViewStyle

@MainActor struct ResolvedHierarchyItemViewStyle<Style: HierarchyItemViewStyle>: View {
    let style: Style
    let configuration: HierarchyItemViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension HierarchyItemViewStyle {
    func resolve(configuration: HierarchyItemViewConfiguration) -> some View {
        ResolvedHierarchyItemViewStyle(style: self, configuration: configuration)
    }
}

// MARK: HierarchyViewStyle

@MainActor struct ResolvedHierarchyViewStyle<Style: HierarchyViewStyle>: View {
    let style: Style
    let configuration: HierarchyViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension HierarchyViewStyle {
    func resolve(configuration: HierarchyViewConfiguration) -> some View {
        ResolvedHierarchyViewStyle(style: self, configuration: configuration)
    }
}

// MARK: HierarchyViewHeaderStyle

@MainActor struct ResolvedHierarchyViewHeaderStyle<Style: HierarchyViewHeaderStyle>: View {
    let style: Style
    let configuration: HierarchyViewHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension HierarchyViewHeaderStyle {
    func resolve(configuration: HierarchyViewHeaderConfiguration) -> some View {
        ResolvedHierarchyViewHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: IconStyle

@MainActor struct ResolvedIconStyle<Style: IconStyle>: View {
    let style: Style
    let configuration: IconConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension IconStyle {
    func resolve(configuration: IconConfiguration) -> some View {
        ResolvedIconStyle(style: self, configuration: configuration)
    }
}

// MARK: IconsStyle

@MainActor struct ResolvedIconsStyle<Style: IconsStyle>: View {
    let style: Style
    let configuration: IconsConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension IconsStyle {
    func resolve(configuration: IconsConfiguration) -> some View {
        ResolvedIconsStyle(style: self, configuration: configuration)
    }
}

// MARK: IllustratedMessageStyle

@MainActor struct ResolvedIllustratedMessageStyle<Style: IllustratedMessageStyle>: View {
    let style: Style
    let configuration: IllustratedMessageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension IllustratedMessageStyle {
    func resolve(configuration: IllustratedMessageConfiguration) -> some View {
        ResolvedIllustratedMessageStyle(style: self, configuration: configuration)
    }
}

// MARK: InactiveTrackStyle

@MainActor struct ResolvedInactiveTrackStyle<Style: InactiveTrackStyle>: View {
    let style: Style
    let configuration: InactiveTrackConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension InactiveTrackStyle {
    func resolve(configuration: InactiveTrackConfiguration) -> some View {
        ResolvedInactiveTrackStyle(style: self, configuration: configuration)
    }
}

// MARK: IncrementActionStyle

@MainActor struct ResolvedIncrementActionStyle<Style: IncrementActionStyle>: View {
    let style: Style
    let configuration: IncrementActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension IncrementActionStyle {
    func resolve(configuration: IncrementActionConfiguration) -> some View {
        ResolvedIncrementActionStyle(style: self, configuration: configuration)
    }
}

// MARK: InfoViewStyle

@MainActor struct ResolvedInfoViewStyle<Style: InfoViewStyle>: View {
    let style: Style
    let configuration: InfoViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension InfoViewStyle {
    func resolve(configuration: InfoViewConfiguration) -> some View {
        ResolvedInfoViewStyle(style: self, configuration: configuration)
    }
}

// MARK: InformationViewStyle

@MainActor struct ResolvedInformationViewStyle<Style: InformationViewStyle>: View {
    let style: Style
    let configuration: InformationViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension InformationViewStyle {
    func resolve(configuration: InformationViewConfiguration) -> some View {
        ResolvedInformationViewStyle(style: self, configuration: configuration)
    }
}

// MARK: InnerCircleStyle

@MainActor struct ResolvedInnerCircleStyle<Style: InnerCircleStyle>: View {
    let style: Style
    let configuration: InnerCircleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension InnerCircleStyle {
    func resolve(configuration: InnerCircleConfiguration) -> some View {
        ResolvedInnerCircleStyle(style: self, configuration: configuration)
    }
}

// MARK: JouleWelcomeScreenStyle

@MainActor struct ResolvedJouleWelcomeScreenStyle<Style: JouleWelcomeScreenStyle>: View {
    let style: Style
    let configuration: JouleWelcomeScreenConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension JouleWelcomeScreenStyle {
    func resolve(configuration: JouleWelcomeScreenConfiguration) -> some View {
        ResolvedJouleWelcomeScreenStyle(style: self, configuration: configuration)
    }
}

// MARK: KPIContentStyle

@MainActor struct ResolvedKPIContentStyle<Style: KPIContentStyle>: View {
    let style: Style
    let configuration: KPIContentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension KPIContentStyle {
    func resolve(configuration: KPIContentConfiguration) -> some View {
        ResolvedKPIContentStyle(style: self, configuration: configuration)
    }
}

// MARK: KPIHeaderStyle

@MainActor struct ResolvedKPIHeaderStyle<Style: KPIHeaderStyle>: View {
    let style: Style
    let configuration: KPIHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension KPIHeaderStyle {
    func resolve(configuration: KPIHeaderConfiguration) -> some View {
        ResolvedKPIHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: KPIItemStyle

@MainActor struct ResolvedKPIItemStyle<Style: KPIItemStyle>: View {
    let style: Style
    let configuration: KPIItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension KPIItemStyle {
    func resolve(configuration: KPIItemConfiguration) -> some View {
        ResolvedKPIItemStyle(style: self, configuration: configuration)
    }
}

// MARK: KPIProgressItemStyle

@MainActor struct ResolvedKPIProgressItemStyle<Style: KPIProgressItemStyle>: View {
    let style: Style
    let configuration: KPIProgressItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension KPIProgressItemStyle {
    func resolve(configuration: KPIProgressItemConfiguration) -> some View {
        ResolvedKPIProgressItemStyle(style: self, configuration: configuration)
    }
}

// MARK: KPISubItemStyle

@MainActor struct ResolvedKPISubItemStyle<Style: KPISubItemStyle>: View {
    let style: Style
    let configuration: KPISubItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension KPISubItemStyle {
    func resolve(configuration: KPISubItemConfiguration) -> some View {
        ResolvedKPISubItemStyle(style: self, configuration: configuration)
    }
}

// MARK: KeyStyle

@MainActor struct ResolvedKeyStyle<Style: KeyStyle>: View {
    let style: Style
    let configuration: KeyConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension KeyStyle {
    func resolve(configuration: KeyConfiguration) -> some View {
        ResolvedKeyStyle(style: self, configuration: configuration)
    }
}

// MARK: KeyValueFormViewStyle

@MainActor struct ResolvedKeyValueFormViewStyle<Style: KeyValueFormViewStyle>: View {
    let style: Style
    let configuration: KeyValueFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension KeyValueFormViewStyle {
    func resolve(configuration: KeyValueFormViewConfiguration) -> some View {
        ResolvedKeyValueFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: KeyValueItemStyle

@MainActor struct ResolvedKeyValueItemStyle<Style: KeyValueItemStyle>: View {
    let style: Style
    let configuration: KeyValueItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension KeyValueItemStyle {
    func resolve(configuration: KeyValueItemConfiguration) -> some View {
        ResolvedKeyValueItemStyle(style: self, configuration: configuration)
    }
}

// MARK: KpiCaptionStyle

@MainActor struct ResolvedKpiCaptionStyle<Style: KpiCaptionStyle>: View {
    let style: Style
    let configuration: KpiCaptionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension KpiCaptionStyle {
    func resolve(configuration: KpiCaptionConfiguration) -> some View {
        ResolvedKpiCaptionStyle(style: self, configuration: configuration)
    }
}

// MARK: KpiStyle

@MainActor struct ResolvedKpiStyle<Style: KpiStyle>: View {
    let style: Style
    let configuration: KpiConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension KpiStyle {
    func resolve(configuration: KpiConfiguration) -> some View {
        ResolvedKpiStyle(style: self, configuration: configuration)
    }
}

// MARK: LabelItemStyle

@MainActor struct ResolvedLabelItemStyle<Style: LabelItemStyle>: View {
    let style: Style
    let configuration: LabelItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension LabelItemStyle {
    func resolve(configuration: LabelItemConfiguration) -> some View {
        ResolvedLabelItemStyle(style: self, configuration: configuration)
    }
}

// MARK: LeadingAccessoryStyle

@MainActor struct ResolvedLeadingAccessoryStyle<Style: LeadingAccessoryStyle>: View {
    let style: Style
    let configuration: LeadingAccessoryConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension LeadingAccessoryStyle {
    func resolve(configuration: LeadingAccessoryConfiguration) -> some View {
        ResolvedLeadingAccessoryStyle(style: self, configuration: configuration)
    }
}

// MARK: LineStyle

@MainActor struct ResolvedLineStyle<Style: LineStyle>: View {
    let style: Style
    let configuration: LineConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension LineStyle {
    func resolve(configuration: LineConfiguration) -> some View {
        ResolvedLineStyle(style: self, configuration: configuration)
    }
}

// MARK: LinearProgressIndicatorStyle

@MainActor struct ResolvedLinearProgressIndicatorStyle<Style: LinearProgressIndicatorStyle>: View {
    let style: Style
    let configuration: LinearProgressIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension LinearProgressIndicatorStyle {
    func resolve(configuration: LinearProgressIndicatorConfiguration) -> some View {
        ResolvedLinearProgressIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: LinearProgressIndicatorViewStyle

@MainActor struct ResolvedLinearProgressIndicatorViewStyle<Style: LinearProgressIndicatorViewStyle>: View {
    let style: Style
    let configuration: LinearProgressIndicatorViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension LinearProgressIndicatorViewStyle {
    func resolve(configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        ResolvedLinearProgressIndicatorViewStyle(style: self, configuration: configuration)
    }
}

// MARK: ListPickerContentStyle

@MainActor struct ResolvedListPickerContentStyle<Style: ListPickerContentStyle>: View {
    let style: Style
    let configuration: ListPickerContentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ListPickerContentStyle {
    func resolve(configuration: ListPickerContentConfiguration) -> some View {
        ResolvedListPickerContentStyle(style: self, configuration: configuration)
    }
}

// MARK: ListPickerDestinationStyle

@MainActor struct ResolvedListPickerDestinationStyle<Style: ListPickerDestinationStyle>: View {
    let style: Style
    let configuration: ListPickerDestinationConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ListPickerDestinationStyle {
    func resolve(configuration: ListPickerDestinationConfiguration) -> some View {
        ResolvedListPickerDestinationStyle(style: self, configuration: configuration)
    }
}

// MARK: ListPickerItemStyle

@MainActor struct ResolvedListPickerItemStyle<Style: ListPickerItemStyle>: View {
    let style: Style
    let configuration: ListPickerItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ListPickerItemStyle {
    func resolve(configuration: ListPickerItemConfiguration) -> some View {
        ResolvedListPickerItemStyle(style: self, configuration: configuration)
    }
}

// MARK: LoadingIndicatorStyle

@MainActor struct ResolvedLoadingIndicatorStyle<Style: LoadingIndicatorStyle>: View {
    let style: Style
    let configuration: LoadingIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension LoadingIndicatorStyle {
    func resolve(configuration: LoadingIndicatorConfiguration) -> some View {
        ResolvedLoadingIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: LowerThumbStyle

@MainActor struct ResolvedLowerThumbStyle<Style: LowerThumbStyle>: View {
    let style: Style
    let configuration: LowerThumbConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension LowerThumbStyle {
    func resolve(configuration: LowerThumbConfiguration) -> some View {
        ResolvedLowerThumbStyle(style: self, configuration: configuration)
    }
}

// MARK: MediaImageStyle

@MainActor struct ResolvedMediaImageStyle<Style: MediaImageStyle>: View {
    let style: Style
    let configuration: MediaImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension MediaImageStyle {
    func resolve(configuration: MediaImageConfiguration) -> some View {
        ResolvedMediaImageStyle(style: self, configuration: configuration)
    }
}

// MARK: MenuSelectionStyle

@MainActor struct ResolvedMenuSelectionStyle<Style: MenuSelectionStyle>: View {
    let style: Style
    let configuration: MenuSelectionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension MenuSelectionStyle {
    func resolve(configuration: MenuSelectionConfiguration) -> some View {
        ResolvedMenuSelectionStyle(style: self, configuration: configuration)
    }
}

// MARK: MenuSelectionItemStyle

@MainActor struct ResolvedMenuSelectionItemStyle<Style: MenuSelectionItemStyle>: View {
    let style: Style
    let configuration: MenuSelectionItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension MenuSelectionItemStyle {
    func resolve(configuration: MenuSelectionItemConfiguration) -> some View {
        ResolvedMenuSelectionItemStyle(style: self, configuration: configuration)
    }
}

// MARK: MessageContentStyle

@MainActor struct ResolvedMessageContentStyle<Style: MessageContentStyle>: View {
    let style: Style
    let configuration: MessageContentConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension MessageContentStyle {
    func resolve(configuration: MessageContentConfiguration) -> some View {
        ResolvedMessageContentStyle(style: self, configuration: configuration)
    }
}

// MARK: MoreActionOverflowStyle

@MainActor struct ResolvedMoreActionOverflowStyle<Style: MoreActionOverflowStyle>: View {
    let style: Style
    let configuration: MoreActionOverflowConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension MoreActionOverflowStyle {
    func resolve(configuration: MoreActionOverflowConfiguration) -> some View {
        ResolvedMoreActionOverflowStyle(style: self, configuration: configuration)
    }
}

// MARK: NextActionStyle

@MainActor struct ResolvedNextActionStyle<Style: NextActionStyle>: View {
    let style: Style
    let configuration: NextActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension NextActionStyle {
    func resolve(configuration: NextActionConfiguration) -> some View {
        ResolvedNextActionStyle(style: self, configuration: configuration)
    }
}

// MARK: NodeStyle

@MainActor struct ResolvedNodeStyle<Style: NodeStyle>: View {
    let style: Style
    let configuration: NodeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension NodeStyle {
    func resolve(configuration: NodeConfiguration) -> some View {
        ResolvedNodeStyle(style: self, configuration: configuration)
    }
}

// MARK: NotNowActionStyle

@MainActor struct ResolvedNotNowActionStyle<Style: NotNowActionStyle>: View {
    let style: Style
    let configuration: NotNowActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension NotNowActionStyle {
    func resolve(configuration: NotNowActionConfiguration) -> some View {
        ResolvedNotNowActionStyle(style: self, configuration: configuration)
    }
}

// MARK: NoteFormViewStyle

@MainActor struct ResolvedNoteFormViewStyle<Style: NoteFormViewStyle>: View {
    let style: Style
    let configuration: NoteFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension NoteFormViewStyle {
    func resolve(configuration: NoteFormViewConfiguration) -> some View {
        ResolvedNoteFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: NowIndicatorNodeStyle

@MainActor struct ResolvedNowIndicatorNodeStyle<Style: NowIndicatorNodeStyle>: View {
    let style: Style
    let configuration: NowIndicatorNodeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension NowIndicatorNodeStyle {
    func resolve(configuration: NowIndicatorNodeConfiguration) -> some View {
        ResolvedNowIndicatorNodeStyle(style: self, configuration: configuration)
    }
}

// MARK: ObjectHeaderStyle

@MainActor struct ResolvedObjectHeaderStyle<Style: ObjectHeaderStyle>: View {
    let style: Style
    let configuration: ObjectHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ObjectHeaderStyle {
    func resolve(configuration: ObjectHeaderConfiguration) -> some View {
        ResolvedObjectHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: ObjectItemStyle

@MainActor struct ResolvedObjectItemStyle<Style: ObjectItemStyle>: View {
    let style: Style
    let configuration: ObjectItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ObjectItemStyle {
    func resolve(configuration: ObjectItemConfiguration) -> some View {
        ResolvedObjectItemStyle(style: self, configuration: configuration)
    }
}

// MARK: OffStarImageStyle

@MainActor struct ResolvedOffStarImageStyle<Style: OffStarImageStyle>: View {
    let style: Style
    let configuration: OffStarImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension OffStarImageStyle {
    func resolve(configuration: OffStarImageConfiguration) -> some View {
        ResolvedOffStarImageStyle(style: self, configuration: configuration)
    }
}

// MARK: OnStarImageStyle

@MainActor struct ResolvedOnStarImageStyle<Style: OnStarImageStyle>: View {
    let style: Style
    let configuration: OnStarImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension OnStarImageStyle {
    func resolve(configuration: OnStarImageConfiguration) -> some View {
        ResolvedOnStarImageStyle(style: self, configuration: configuration)
    }
}

// MARK: OnboardingScanViewStyle

@MainActor struct ResolvedOnboardingScanViewStyle<Style: OnboardingScanViewStyle>: View {
    let style: Style
    let configuration: OnboardingScanViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension OnboardingScanViewStyle {
    func resolve(configuration: OnboardingScanViewConfiguration) -> some View {
        ResolvedOnboardingScanViewStyle(style: self, configuration: configuration)
    }
}

// MARK: OptionalTitleStyle

@MainActor struct ResolvedOptionalTitleStyle<Style: OptionalTitleStyle>: View {
    let style: Style
    let configuration: OptionalTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension OptionalTitleStyle {
    func resolve(configuration: OptionalTitleConfiguration) -> some View {
        ResolvedOptionalTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: OptionsStyle

@MainActor struct ResolvedOptionsStyle<Style: OptionsStyle>: View {
    let style: Style
    let configuration: OptionsConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension OptionsStyle {
    func resolve(configuration: OptionsConfiguration) -> some View {
        ResolvedOptionsStyle(style: self, configuration: configuration)
    }
}

// MARK: OrderPickerStyle

@MainActor struct ResolvedOrderPickerStyle<Style: OrderPickerStyle>: View {
    let style: Style
    let configuration: OrderPickerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension OrderPickerStyle {
    func resolve(configuration: OrderPickerConfiguration) -> some View {
        ResolvedOrderPickerStyle(style: self, configuration: configuration)
    }
}

// MARK: OuterCircleStyle

@MainActor struct ResolvedOuterCircleStyle<Style: OuterCircleStyle>: View {
    let style: Style
    let configuration: OuterCircleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension OuterCircleStyle {
    func resolve(configuration: OuterCircleConfiguration) -> some View {
        ResolvedOuterCircleStyle(style: self, configuration: configuration)
    }
}

// MARK: OverflowActionStyle

@MainActor struct ResolvedOverflowActionStyle<Style: OverflowActionStyle>: View {
    let style: Style
    let configuration: OverflowActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension OverflowActionStyle {
    func resolve(configuration: OverflowActionConfiguration) -> some View {
        ResolvedOverflowActionStyle(style: self, configuration: configuration)
    }
}

// MARK: PlaceholderStyle

@MainActor struct ResolvedPlaceholderStyle<Style: PlaceholderStyle>: View {
    let style: Style
    let configuration: PlaceholderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension PlaceholderStyle {
    func resolve(configuration: PlaceholderConfiguration) -> some View {
        ResolvedPlaceholderStyle(style: self, configuration: configuration)
    }
}

// MARK: PlaceholderTextEditorStyle

@MainActor struct ResolvedPlaceholderTextEditorStyle<Style: PlaceholderTextEditorStyle>: View {
    let style: Style
    let configuration: PlaceholderTextEditorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension PlaceholderTextEditorStyle {
    func resolve(configuration: PlaceholderTextEditorConfiguration) -> some View {
        ResolvedPlaceholderTextEditorStyle(style: self, configuration: configuration)
    }
}

// MARK: PlaceholderTextFieldStyle

@MainActor struct ResolvedPlaceholderTextFieldStyle<Style: PlaceholderTextFieldStyle>: View {
    let style: Style
    let configuration: PlaceholderTextFieldConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension PlaceholderTextFieldStyle {
    func resolve(configuration: PlaceholderTextFieldConfiguration) -> some View {
        ResolvedPlaceholderTextFieldStyle(style: self, configuration: configuration)
    }
}

// MARK: ProcessingIndicatorStyle

@MainActor struct ResolvedProcessingIndicatorStyle<Style: ProcessingIndicatorStyle>: View {
    let style: Style
    let configuration: ProcessingIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ProcessingIndicatorStyle {
    func resolve(configuration: ProcessingIndicatorConfiguration) -> some View {
        ResolvedProcessingIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: ProfileHeaderStyle

@MainActor struct ResolvedProfileHeaderStyle<Style: ProfileHeaderStyle>: View {
    let style: Style
    let configuration: ProfileHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ProfileHeaderStyle {
    func resolve(configuration: ProfileHeaderConfiguration) -> some View {
        ResolvedProfileHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: ProgressStyle

@MainActor struct ResolvedProgressStyle<Style: ProgressStyle>: View {
    let style: Style
    let configuration: ProgressConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ProgressStyle {
    func resolve(configuration: ProgressConfiguration) -> some View {
        ResolvedProgressStyle(style: self, configuration: configuration)
    }
}

// MARK: ProgressIndicatorStyle

@MainActor struct ResolvedProgressIndicatorStyle<Style: ProgressIndicatorStyle>: View {
    let style: Style
    let configuration: ProgressIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ProgressIndicatorStyle {
    func resolve(configuration: ProgressIndicatorConfiguration) -> some View {
        ResolvedProgressIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: ProgressIndicatorProtocolStyle

@MainActor struct ResolvedProgressIndicatorProtocolStyle<Style: ProgressIndicatorProtocolStyle>: View {
    let style: Style
    let configuration: ProgressIndicatorProtocolConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ProgressIndicatorProtocolStyle {
    func resolve(configuration: ProgressIndicatorProtocolConfiguration) -> some View {
        ResolvedProgressIndicatorProtocolStyle(style: self, configuration: configuration)
    }
}

// MARK: PromptStyle

@MainActor struct ResolvedPromptStyle<Style: PromptStyle>: View {
    let style: Style
    let configuration: PromptConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension PromptStyle {
    func resolve(configuration: PromptConfiguration) -> some View {
        ResolvedPromptStyle(style: self, configuration: configuration)
    }
}

// MARK: RangeSliderControlStyle

@MainActor struct ResolvedRangeSliderControlStyle<Style: RangeSliderControlStyle>: View {
    let style: Style
    let configuration: RangeSliderControlConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension RangeSliderControlStyle {
    func resolve(configuration: RangeSliderControlConfiguration) -> some View {
        ResolvedRangeSliderControlStyle(style: self, configuration: configuration)
    }
}

// MARK: RatingControlStyle

@MainActor struct ResolvedRatingControlStyle<Style: RatingControlStyle>: View {
    let style: Style
    let configuration: RatingControlConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension RatingControlStyle {
    func resolve(configuration: RatingControlConfiguration) -> some View {
        ResolvedRatingControlStyle(style: self, configuration: configuration)
    }
}

// MARK: RatingControlFormViewStyle

@MainActor struct ResolvedRatingControlFormViewStyle<Style: RatingControlFormViewStyle>: View {
    let style: Style
    let configuration: RatingControlFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension RatingControlFormViewStyle {
    func resolve(configuration: RatingControlFormViewConfiguration) -> some View {
        ResolvedRatingControlFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: RedoActionStyle

@MainActor struct ResolvedRedoActionStyle<Style: RedoActionStyle>: View {
    let style: Style
    let configuration: RedoActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension RedoActionStyle {
    func resolve(configuration: RedoActionConfiguration) -> some View {
        ResolvedRedoActionStyle(style: self, configuration: configuration)
    }
}

// MARK: ReenterSignatureActionStyle

@MainActor struct ResolvedReenterSignatureActionStyle<Style: ReenterSignatureActionStyle>: View {
    let style: Style
    let configuration: ReenterSignatureActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ReenterSignatureActionStyle {
    func resolve(configuration: ReenterSignatureActionConfiguration) -> some View {
        ResolvedReenterSignatureActionStyle(style: self, configuration: configuration)
    }
}

// MARK: ResetActionStyle

@MainActor struct ResolvedResetActionStyle<Style: ResetActionStyle>: View {
    let style: Style
    let configuration: ResetActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ResetActionStyle {
    func resolve(configuration: ResetActionConfiguration) -> some View {
        ResolvedResetActionStyle(style: self, configuration: configuration)
    }
}

// MARK: ReviewCountLabelStyle

@MainActor struct ResolvedReviewCountLabelStyle<Style: ReviewCountLabelStyle>: View {
    let style: Style
    let configuration: ReviewCountLabelConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ReviewCountLabelStyle {
    func resolve(configuration: ReviewCountLabelConfiguration) -> some View {
        ResolvedReviewCountLabelStyle(style: self, configuration: configuration)
    }
}

// MARK: Row1Style

@MainActor struct ResolvedRow1Style<Style: Row1Style>: View {
    let style: Style
    let configuration: Row1Configuration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension Row1Style {
    func resolve(configuration: Row1Configuration) -> some View {
        ResolvedRow1Style(style: self, configuration: configuration)
    }
}

// MARK: Row2Style

@MainActor struct ResolvedRow2Style<Style: Row2Style>: View {
    let style: Style
    let configuration: Row2Configuration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension Row2Style {
    func resolve(configuration: Row2Configuration) -> some View {
        ResolvedRow2Style(style: self, configuration: configuration)
    }
}

// MARK: Row3Style

@MainActor struct ResolvedRow3Style<Style: Row3Style>: View {
    let style: Style
    let configuration: Row3Configuration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension Row3Style {
    func resolve(configuration: Row3Configuration) -> some View {
        ResolvedRow3Style(style: self, configuration: configuration)
    }
}

// MARK: SaveActionStyle

@MainActor struct ResolvedSaveActionStyle<Style: SaveActionStyle>: View {
    let style: Style
    let configuration: SaveActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SaveActionStyle {
    func resolve(configuration: SaveActionConfiguration) -> some View {
        ResolvedSaveActionStyle(style: self, configuration: configuration)
    }
}

// MARK: SecondaryActionStyle

@MainActor struct ResolvedSecondaryActionStyle<Style: SecondaryActionStyle>: View {
    let style: Style
    let configuration: SecondaryActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SecondaryActionStyle {
    func resolve(configuration: SecondaryActionConfiguration) -> some View {
        ResolvedSecondaryActionStyle(style: self, configuration: configuration)
    }
}

// MARK: SecondaryTimestampStyle

@MainActor struct ResolvedSecondaryTimestampStyle<Style: SecondaryTimestampStyle>: View {
    let style: Style
    let configuration: SecondaryTimestampConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SecondaryTimestampStyle {
    func resolve(configuration: SecondaryTimestampConfiguration) -> some View {
        ResolvedSecondaryTimestampStyle(style: self, configuration: configuration)
    }
}

// MARK: SectionFooterStyle

@MainActor struct ResolvedSectionFooterStyle<Style: SectionFooterStyle>: View {
    let style: Style
    let configuration: SectionFooterConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SectionFooterStyle {
    func resolve(configuration: SectionFooterConfiguration) -> some View {
        ResolvedSectionFooterStyle(style: self, configuration: configuration)
    }
}

// MARK: SectionHeaderStyle

@MainActor struct ResolvedSectionHeaderStyle<Style: SectionHeaderStyle>: View {
    let style: Style
    let configuration: SectionHeaderConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SectionHeaderStyle {
    func resolve(configuration: SectionHeaderConfiguration) -> some View {
        ResolvedSectionHeaderStyle(style: self, configuration: configuration)
    }
}

// MARK: SegmentedControlPickerStyle

@MainActor struct ResolvedSegmentedControlPickerStyle<Style: SegmentedControlPickerStyle>: View {
    let style: Style
    let configuration: SegmentedControlPickerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SegmentedControlPickerStyle {
    func resolve(configuration: SegmentedControlPickerConfiguration) -> some View {
        ResolvedSegmentedControlPickerStyle(style: self, configuration: configuration)
    }
}

// MARK: SelectAllActionStyle

@MainActor struct ResolvedSelectAllActionStyle<Style: SelectAllActionStyle>: View {
    let style: Style
    let configuration: SelectAllActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SelectAllActionStyle {
    func resolve(configuration: SelectAllActionConfiguration) -> some View {
        ResolvedSelectAllActionStyle(style: self, configuration: configuration)
    }
}

// MARK: SelectedEntriesSectionTitleStyle

@MainActor struct ResolvedSelectedEntriesSectionTitleStyle<Style: SelectedEntriesSectionTitleStyle>: View {
    let style: Style
    let configuration: SelectedEntriesSectionTitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SelectedEntriesSectionTitleStyle {
    func resolve(configuration: SelectedEntriesSectionTitleConfiguration) -> some View {
        ResolvedSelectedEntriesSectionTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: SideBarStyle

@MainActor struct ResolvedSideBarStyle<Style: SideBarStyle>: View {
    let style: Style
    let configuration: SideBarConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SideBarStyle {
    func resolve(configuration: SideBarConfiguration) -> some View {
        ResolvedSideBarStyle(style: self, configuration: configuration)
    }
}

// MARK: SideBarListItemStyle

@MainActor struct ResolvedSideBarListItemStyle<Style: SideBarListItemStyle>: View {
    let style: Style
    let configuration: SideBarListItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SideBarListItemStyle {
    func resolve(configuration: SideBarListItemConfiguration) -> some View {
        ResolvedSideBarListItemStyle(style: self, configuration: configuration)
    }
}

// MARK: SignInActionStyle

@MainActor struct ResolvedSignInActionStyle<Style: SignInActionStyle>: View {
    let style: Style
    let configuration: SignInActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SignInActionStyle {
    func resolve(configuration: SignInActionConfiguration) -> some View {
        ResolvedSignInActionStyle(style: self, configuration: configuration)
    }
}

// MARK: SignatureCaptureViewStyle

@MainActor struct ResolvedSignatureCaptureViewStyle<Style: SignatureCaptureViewStyle>: View {
    let style: Style
    let configuration: SignatureCaptureViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SignatureCaptureViewStyle {
    func resolve(configuration: SignatureCaptureViewConfiguration) -> some View {
        ResolvedSignatureCaptureViewStyle(style: self, configuration: configuration)
    }
}

// MARK: SingleStepStyle

@MainActor struct ResolvedSingleStepStyle<Style: SingleStepStyle>: View {
    let style: Style
    let configuration: SingleStepConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SingleStepStyle {
    func resolve(configuration: SingleStepConfiguration) -> some View {
        ResolvedSingleStepStyle(style: self, configuration: configuration)
    }
}

// MARK: SortCriterionStyle

@MainActor struct ResolvedSortCriterionStyle<Style: SortCriterionStyle>: View {
    let style: Style
    let configuration: SortCriterionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SortCriterionStyle {
    func resolve(configuration: SortCriterionConfiguration) -> some View {
        ResolvedSortCriterionStyle(style: self, configuration: configuration)
    }
}

// MARK: SortFilterViewStyle

@MainActor struct ResolvedSortFilterViewStyle<Style: SortFilterViewStyle>: View {
    let style: Style
    let configuration: SortFilterViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SortFilterViewStyle {
    func resolve(configuration: SortFilterViewConfiguration) -> some View {
        ResolvedSortFilterViewStyle(style: self, configuration: configuration)
    }
}

// MARK: StartSignatureActionStyle

@MainActor struct ResolvedStartSignatureActionStyle<Style: StartSignatureActionStyle>: View {
    let style: Style
    let configuration: StartSignatureActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension StartSignatureActionStyle {
    func resolve(configuration: StartSignatureActionConfiguration) -> some View {
        ResolvedStartSignatureActionStyle(style: self, configuration: configuration)
    }
}

// MARK: StateLabelStyle

@MainActor struct ResolvedStateLabelStyle<Style: StateLabelStyle>: View {
    let style: Style
    let configuration: StateLabelConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension StateLabelStyle {
    func resolve(configuration: StateLabelConfiguration) -> some View {
        ResolvedStateLabelStyle(style: self, configuration: configuration)
    }
}

// MARK: StatusStyle

@MainActor struct ResolvedStatusStyle<Style: StatusStyle>: View {
    let style: Style
    let configuration: StatusConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension StatusStyle {
    func resolve(configuration: StatusConfiguration) -> some View {
        ResolvedStatusStyle(style: self, configuration: configuration)
    }
}

// MARK: StepProgressIndicatorStyle

@MainActor struct ResolvedStepProgressIndicatorStyle<Style: StepProgressIndicatorStyle>: View {
    let style: Style
    let configuration: StepProgressIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension StepProgressIndicatorStyle {
    func resolve(configuration: StepProgressIndicatorConfiguration) -> some View {
        ResolvedStepProgressIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: StepperFieldStyle

@MainActor struct ResolvedStepperFieldStyle<Style: StepperFieldStyle>: View {
    let style: Style
    let configuration: StepperFieldConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension StepperFieldStyle {
    func resolve(configuration: StepperFieldConfiguration) -> some View {
        ResolvedStepperFieldStyle(style: self, configuration: configuration)
    }
}

// MARK: StepperViewStyle

@MainActor struct ResolvedStepperViewStyle<Style: StepperViewStyle>: View {
    let style: Style
    let configuration: StepperViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension StepperViewStyle {
    func resolve(configuration: StepperViewConfiguration) -> some View {
        ResolvedStepperViewStyle(style: self, configuration: configuration)
    }
}

// MARK: SubAttributeStyle

@MainActor struct ResolvedSubAttributeStyle<Style: SubAttributeStyle>: View {
    let style: Style
    let configuration: SubAttributeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SubAttributeStyle {
    func resolve(configuration: SubAttributeConfiguration) -> some View {
        ResolvedSubAttributeStyle(style: self, configuration: configuration)
    }
}

// MARK: SubmitActionStyle

@MainActor struct ResolvedSubmitActionStyle<Style: SubmitActionStyle>: View {
    let style: Style
    let configuration: SubmitActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SubmitActionStyle {
    func resolve(configuration: SubmitActionConfiguration) -> some View {
        ResolvedSubmitActionStyle(style: self, configuration: configuration)
    }
}

// MARK: SubstatusStyle

@MainActor struct ResolvedSubstatusStyle<Style: SubstatusStyle>: View {
    let style: Style
    let configuration: SubstatusConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SubstatusStyle {
    func resolve(configuration: SubstatusConfiguration) -> some View {
        ResolvedSubstatusStyle(style: self, configuration: configuration)
    }
}

// MARK: SubtitleStyle

@MainActor struct ResolvedSubtitleStyle<Style: SubtitleStyle>: View {
    let style: Style
    let configuration: SubtitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SubtitleStyle {
    func resolve(configuration: SubtitleConfiguration) -> some View {
        ResolvedSubtitleStyle(style: self, configuration: configuration)
    }
}

// MARK: SwitchStyle

@MainActor struct ResolvedSwitchStyle<Style: SwitchStyle>: View {
    let style: Style
    let configuration: SwitchConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SwitchStyle {
    func resolve(configuration: SwitchConfiguration) -> some View {
        ResolvedSwitchStyle(style: self, configuration: configuration)
    }
}

// MARK: SwitchViewStyle

@MainActor struct ResolvedSwitchViewStyle<Style: SwitchViewStyle>: View {
    let style: Style
    let configuration: SwitchViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension SwitchViewStyle {
    func resolve(configuration: SwitchViewConfiguration) -> some View {
        ResolvedSwitchViewStyle(style: self, configuration: configuration)
    }
}

// MARK: TagStyle

@MainActor struct ResolvedTagStyle<Style: TagStyle>: View {
    let style: Style
    let configuration: TagConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TagStyle {
    func resolve(configuration: TagConfiguration) -> some View {
        ResolvedTagStyle(style: self, configuration: configuration)
    }
}

// MARK: TagsStyle

@MainActor struct ResolvedTagsStyle<Style: TagsStyle>: View {
    let style: Style
    let configuration: TagsConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TagsStyle {
    func resolve(configuration: TagsConfiguration) -> some View {
        ResolvedTagsStyle(style: self, configuration: configuration)
    }
}

// MARK: TertiaryActionStyle

@MainActor struct ResolvedTertiaryActionStyle<Style: TertiaryActionStyle>: View {
    let style: Style
    let configuration: TertiaryActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TertiaryActionStyle {
    func resolve(configuration: TertiaryActionConfiguration) -> some View {
        ResolvedTertiaryActionStyle(style: self, configuration: configuration)
    }
}

// MARK: TextFieldFormViewStyle

@MainActor struct ResolvedTextFieldFormViewStyle<Style: TextFieldFormViewStyle>: View {
    let style: Style
    let configuration: TextFieldFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TextFieldFormViewStyle {
    func resolve(configuration: TextFieldFormViewConfiguration) -> some View {
        ResolvedTextFieldFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: TextInputStyle

@MainActor struct ResolvedTextInputStyle<Style: TextInputStyle>: View {
    let style: Style
    let configuration: TextInputConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TextInputStyle {
    func resolve(configuration: TextInputConfiguration) -> some View {
        ResolvedTextInputStyle(style: self, configuration: configuration)
    }
}

// MARK: TextInputFieldStyle

@MainActor struct ResolvedTextInputFieldStyle<Style: TextInputFieldStyle>: View {
    let style: Style
    let configuration: TextInputFieldConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TextInputFieldStyle {
    func resolve(configuration: TextInputFieldConfiguration) -> some View {
        ResolvedTextInputFieldStyle(style: self, configuration: configuration)
    }
}

// MARK: TextInputInfoViewStyle

@MainActor struct ResolvedTextInputInfoViewStyle<Style: TextInputInfoViewStyle>: View {
    let style: Style
    let configuration: TextInputInfoViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TextInputInfoViewStyle {
    func resolve(configuration: TextInputInfoViewConfiguration) -> some View {
        ResolvedTextInputInfoViewStyle(style: self, configuration: configuration)
    }
}

// MARK: TextViewStyle

@MainActor struct ResolvedTextViewStyle<Style: TextViewStyle>: View {
    let style: Style
    let configuration: TextViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TextViewStyle {
    func resolve(configuration: TextViewConfiguration) -> some View {
        ResolvedTextViewStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelineStyle

@MainActor struct ResolvedTimelineStyle<Style: TimelineStyle>: View {
    let style: Style
    let configuration: TimelineConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TimelineStyle {
    func resolve(configuration: TimelineConfiguration) -> some View {
        ResolvedTimelineStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelineMarkerStyle

@MainActor struct ResolvedTimelineMarkerStyle<Style: TimelineMarkerStyle>: View {
    let style: Style
    let configuration: TimelineMarkerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TimelineMarkerStyle {
    func resolve(configuration: TimelineMarkerConfiguration) -> some View {
        ResolvedTimelineMarkerStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelineNodeStyle

@MainActor struct ResolvedTimelineNodeStyle<Style: TimelineNodeStyle>: View {
    let style: Style
    let configuration: TimelineNodeConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TimelineNodeStyle {
    func resolve(configuration: TimelineNodeConfiguration) -> some View {
        ResolvedTimelineNodeStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelineNowIndicatorStyle

@MainActor struct ResolvedTimelineNowIndicatorStyle<Style: TimelineNowIndicatorStyle>: View {
    let style: Style
    let configuration: TimelineNowIndicatorConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TimelineNowIndicatorStyle {
    func resolve(configuration: TimelineNowIndicatorConfiguration) -> some View {
        ResolvedTimelineNowIndicatorStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelinePreviewStyle

@MainActor struct ResolvedTimelinePreviewStyle<Style: TimelinePreviewStyle>: View {
    let style: Style
    let configuration: TimelinePreviewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TimelinePreviewStyle {
    func resolve(configuration: TimelinePreviewConfiguration) -> some View {
        ResolvedTimelinePreviewStyle(style: self, configuration: configuration)
    }
}

// MARK: TimelinePreviewItemStyle

@MainActor struct ResolvedTimelinePreviewItemStyle<Style: TimelinePreviewItemStyle>: View {
    let style: Style
    let configuration: TimelinePreviewItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TimelinePreviewItemStyle {
    func resolve(configuration: TimelinePreviewItemConfiguration) -> some View {
        ResolvedTimelinePreviewItemStyle(style: self, configuration: configuration)
    }
}

// MARK: TimestampStyle

@MainActor struct ResolvedTimestampStyle<Style: TimestampStyle>: View {
    let style: Style
    let configuration: TimestampConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TimestampStyle {
    func resolve(configuration: TimestampConfiguration) -> some View {
        ResolvedTimestampStyle(style: self, configuration: configuration)
    }
}

// MARK: TitleStyle

@MainActor struct ResolvedTitleStyle<Style: TitleStyle>: View {
    let style: Style
    let configuration: TitleConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TitleStyle {
    func resolve(configuration: TitleConfiguration) -> some View {
        ResolvedTitleStyle(style: self, configuration: configuration)
    }
}

// MARK: TitleFormViewStyle

@MainActor struct ResolvedTitleFormViewStyle<Style: TitleFormViewStyle>: View {
    let style: Style
    let configuration: TitleFormViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TitleFormViewStyle {
    func resolve(configuration: TitleFormViewConfiguration) -> some View {
        ResolvedTitleFormViewStyle(style: self, configuration: configuration)
    }
}

// MARK: ToastMessageStyle

@MainActor struct ResolvedToastMessageStyle<Style: ToastMessageStyle>: View {
    let style: Style
    let configuration: ToastMessageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ToastMessageStyle {
    func resolve(configuration: ToastMessageConfiguration) -> some View {
        ResolvedToastMessageStyle(style: self, configuration: configuration)
    }
}

// MARK: TopDividerStyle

@MainActor struct ResolvedTopDividerStyle<Style: TopDividerStyle>: View {
    let style: Style
    let configuration: TopDividerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TopDividerStyle {
    func resolve(configuration: TopDividerConfiguration) -> some View {
        ResolvedTopDividerStyle(style: self, configuration: configuration)
    }
}

// MARK: TrailingAccessoryStyle

@MainActor struct ResolvedTrailingAccessoryStyle<Style: TrailingAccessoryStyle>: View {
    let style: Style
    let configuration: TrailingAccessoryConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TrailingAccessoryStyle {
    func resolve(configuration: TrailingAccessoryConfiguration) -> some View {
        ResolvedTrailingAccessoryStyle(style: self, configuration: configuration)
    }
}

// MARK: TrendStyle

@MainActor struct ResolvedTrendStyle<Style: TrendStyle>: View {
    let style: Style
    let configuration: TrendConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TrendStyle {
    func resolve(configuration: TrendConfiguration) -> some View {
        ResolvedTrendStyle(style: self, configuration: configuration)
    }
}

// MARK: TrendImageStyle

@MainActor struct ResolvedTrendImageStyle<Style: TrendImageStyle>: View {
    let style: Style
    let configuration: TrendImageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension TrendImageStyle {
    func resolve(configuration: TrendImageConfiguration) -> some View {
        ResolvedTrendImageStyle(style: self, configuration: configuration)
    }
}

// MARK: UndoActionStyle

@MainActor struct ResolvedUndoActionStyle<Style: UndoActionStyle>: View {
    let style: Style
    let configuration: UndoActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension UndoActionStyle {
    func resolve(configuration: UndoActionConfiguration) -> some View {
        ResolvedUndoActionStyle(style: self, configuration: configuration)
    }
}

// MARK: UpVoteActionStyle

@MainActor struct ResolvedUpVoteActionStyle<Style: UpVoteActionStyle>: View {
    let style: Style
    let configuration: UpVoteActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension UpVoteActionStyle {
    func resolve(configuration: UpVoteActionConfiguration) -> some View {
        ResolvedUpVoteActionStyle(style: self, configuration: configuration)
    }
}

// MARK: UpperThumbStyle

@MainActor struct ResolvedUpperThumbStyle<Style: UpperThumbStyle>: View {
    let style: Style
    let configuration: UpperThumbConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension UpperThumbStyle {
    func resolve(configuration: UpperThumbConfiguration) -> some View {
        ResolvedUpperThumbStyle(style: self, configuration: configuration)
    }
}

// MARK: UserConsentFormStyle

@MainActor struct ResolvedUserConsentFormStyle<Style: UserConsentFormStyle>: View {
    let style: Style
    let configuration: UserConsentFormConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension UserConsentFormStyle {
    func resolve(configuration: UserConsentFormConfiguration) -> some View {
        ResolvedUserConsentFormStyle(style: self, configuration: configuration)
    }
}

// MARK: UserConsentPageStyle

@MainActor struct ResolvedUserConsentPageStyle<Style: UserConsentPageStyle>: View {
    let style: Style
    let configuration: UserConsentPageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension UserConsentPageStyle {
    func resolve(configuration: UserConsentPageConfiguration) -> some View {
        ResolvedUserConsentPageStyle(style: self, configuration: configuration)
    }
}

// MARK: UserConsentViewStyle

@MainActor struct ResolvedUserConsentViewStyle<Style: UserConsentViewStyle>: View {
    let style: Style
    let configuration: UserConsentViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension UserConsentViewStyle {
    func resolve(configuration: UserConsentViewConfiguration) -> some View {
        ResolvedUserConsentViewStyle(style: self, configuration: configuration)
    }
}

// MARK: ValueStyle

@MainActor struct ResolvedValueStyle<Style: ValueStyle>: View {
    let style: Style
    let configuration: ValueConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ValueStyle {
    func resolve(configuration: ValueConfiguration) -> some View {
        ResolvedValueStyle(style: self, configuration: configuration)
    }
}

// MARK: ValueLabelStyle

@MainActor struct ResolvedValueLabelStyle<Style: ValueLabelStyle>: View {
    let style: Style
    let configuration: ValueLabelConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ValueLabelStyle {
    func resolve(configuration: ValueLabelConfiguration) -> some View {
        ResolvedValueLabelStyle(style: self, configuration: configuration)
    }
}

// MARK: ValuePickerStyle

@MainActor struct ResolvedValuePickerStyle<Style: ValuePickerStyle>: View {
    let style: Style
    let configuration: ValuePickerConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension ValuePickerStyle {
    func resolve(configuration: ValuePickerConfiguration) -> some View {
        ResolvedValuePickerStyle(style: self, configuration: configuration)
    }
}

// MARK: WatermarkStyle

@MainActor struct ResolvedWatermarkStyle<Style: WatermarkStyle>: View {
    let style: Style
    let configuration: WatermarkConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension WatermarkStyle {
    func resolve(configuration: WatermarkConfiguration) -> some View {
        ResolvedWatermarkStyle(style: self, configuration: configuration)
    }
}

// MARK: WelcomeScreenStyle

@MainActor struct ResolvedWelcomeScreenStyle<Style: WelcomeScreenStyle>: View {
    let style: Style
    let configuration: WelcomeScreenConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension WelcomeScreenStyle {
    func resolve(configuration: WelcomeScreenConfiguration) -> some View {
        ResolvedWelcomeScreenStyle(style: self, configuration: configuration)
    }
}

// MARK: WhatsNewListItemStyle

@MainActor struct ResolvedWhatsNewListItemStyle<Style: WhatsNewListItemStyle>: View {
    let style: Style
    let configuration: WhatsNewListItemConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension WhatsNewListItemStyle {
    func resolve(configuration: WhatsNewListItemConfiguration) -> some View {
        ResolvedWhatsNewListItemStyle(style: self, configuration: configuration)
    }
}

// MARK: WhatsNewListViewStyle

@MainActor struct ResolvedWhatsNewListViewStyle<Style: WhatsNewListViewStyle>: View {
    let style: Style
    let configuration: WhatsNewListViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension WhatsNewListViewStyle {
    func resolve(configuration: WhatsNewListViewConfiguration) -> some View {
        ResolvedWhatsNewListViewStyle(style: self, configuration: configuration)
    }
}

// MARK: WhatsNewPageStyle

@MainActor struct ResolvedWhatsNewPageStyle<Style: WhatsNewPageStyle>: View {
    let style: Style
    let configuration: WhatsNewPageConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension WhatsNewPageStyle {
    func resolve(configuration: WhatsNewPageConfiguration) -> some View {
        ResolvedWhatsNewPageStyle(style: self, configuration: configuration)
    }
}

// MARK: WhatsNewPageViewStyle

@MainActor struct ResolvedWhatsNewPageViewStyle<Style: WhatsNewPageViewStyle>: View {
    let style: Style
    let configuration: WhatsNewPageViewConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension WhatsNewPageViewStyle {
    func resolve(configuration: WhatsNewPageViewConfiguration) -> some View {
        ResolvedWhatsNewPageViewStyle(style: self, configuration: configuration)
    }
}

// MARK: WritingAssistantActionStyle

@MainActor struct ResolvedWritingAssistantActionStyle<Style: WritingAssistantActionStyle>: View {
    let style: Style
    let configuration: WritingAssistantActionConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension WritingAssistantActionStyle {
    func resolve(configuration: WritingAssistantActionConfiguration) -> some View {
        ResolvedWritingAssistantActionStyle(style: self, configuration: configuration)
    }
}

// MARK: WritingAssistantFormStyle

@MainActor struct ResolvedWritingAssistantFormStyle<Style: WritingAssistantFormStyle>: View {
    let style: Style
    let configuration: WritingAssistantFormConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension WritingAssistantFormStyle {
    func resolve(configuration: WritingAssistantFormConfiguration) -> some View {
        ResolvedWritingAssistantFormStyle(style: self, configuration: configuration)
    }
}

// MARK: XmarkStyle

@MainActor struct ResolvedXmarkStyle<Style: XmarkStyle>: View {
    let style: Style
    let configuration: XmarkConfiguration
    var body: some View {
        self.style.makeBody(self.configuration)
    }
}

@MainActor extension XmarkStyle {
    func resolve(configuration: XmarkConfiguration) -> some View {
        ResolvedXmarkStyle(style: self, configuration: configuration)
    }
}
