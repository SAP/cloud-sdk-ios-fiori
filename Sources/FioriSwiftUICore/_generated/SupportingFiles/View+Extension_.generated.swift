// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: AINoticeStyle

public extension View {
    func aINoticeStyle(_ style: some AINoticeStyle) -> some View {
        self.transformEnvironment(\.aINoticeStyleStack) { stack in
            stack.append(style)
        }
    }

    func aINoticeStyle(@ViewBuilder content: @escaping (AINoticeConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.aINoticeStyleStack) { stack in
            let style = AnyAINoticeStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AccessoryIconStyle

public extension View {
    func accessoryIconStyle(_ style: some AccessoryIconStyle) -> some View {
        self.transformEnvironment(\.accessoryIconStyleStack) { stack in
            stack.append(style)
        }
    }

    func accessoryIconStyle(@ViewBuilder content: @escaping (AccessoryIconConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.accessoryIconStyleStack) { stack in
            let style = AnyAccessoryIconStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ActionStyle

public extension View {
    func actionStyle(_ style: some ActionStyle) -> some View {
        self.transformEnvironment(\.actionStyleStack) { stack in
            stack.append(style)
        }
    }

    func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.actionStyleStack) { stack in
            let style = AnyActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ActiveTrackStyle

public extension View {
    func activeTrackStyle(_ style: some ActiveTrackStyle) -> some View {
        self.transformEnvironment(\.activeTrackStyleStack) { stack in
            stack.append(style)
        }
    }

    func activeTrackStyle(@ViewBuilder content: @escaping (ActiveTrackConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.activeTrackStyleStack) { stack in
            let style = AnyActiveTrackStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ActivityItemStyle

public extension View {
    func activityItemStyle(_ style: some ActivityItemStyle) -> some View {
        self.transformEnvironment(\.activityItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func activityItemStyle(@ViewBuilder content: @escaping (ActivityItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.activityItemStyleStack) { stack in
            let style = AnyActivityItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ActivityItemsStyle

public extension View {
    func activityItemsStyle(_ style: some ActivityItemsStyle) -> some View {
        self.transformEnvironment(\.activityItemsStyleStack) { stack in
            stack.append(style)
        }
    }

    func activityItemsStyle(@ViewBuilder content: @escaping (ActivityItemsConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.activityItemsStyleStack) { stack in
            let style = AnyActivityItemsStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AgreeActionStyle

public extension View {
    func agreeActionStyle(_ style: some AgreeActionStyle) -> some View {
        self.transformEnvironment(\.agreeActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func agreeActionStyle(@ViewBuilder content: @escaping (AgreeActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.agreeActionStyleStack) { stack in
            let style = AnyAgreeActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AllEntriesSectionTitleStyle

public extension View {
    func allEntriesSectionTitleStyle(_ style: some AllEntriesSectionTitleStyle) -> some View {
        self.transformEnvironment(\.allEntriesSectionTitleStyleStack) { stack in
            stack.append(style)
        }
    }

    func allEntriesSectionTitleStyle(@ViewBuilder content: @escaping (AllEntriesSectionTitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.allEntriesSectionTitleStyleStack) { stack in
            let style = AnyAllEntriesSectionTitleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AllowActionStyle

public extension View {
    func allowActionStyle(_ style: some AllowActionStyle) -> some View {
        self.transformEnvironment(\.allowActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func allowActionStyle(@ViewBuilder content: @escaping (AllowActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.allowActionStyleStack) { stack in
            let style = AnyAllowActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ApplyActionStyle

public extension View {
    func applyActionStyle(_ style: some ApplyActionStyle) -> some View {
        self.transformEnvironment(\.applyActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func applyActionStyle(@ViewBuilder content: @escaping (ApplyActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.applyActionStyleStack) { stack in
            let style = AnyApplyActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AttachmentButtonImageStyle

public extension View {
    func attachmentButtonImageStyle(_ style: some AttachmentButtonImageStyle) -> some View {
        self.transformEnvironment(\.attachmentButtonImageStyleStack) { stack in
            stack.append(style)
        }
    }

    func attachmentButtonImageStyle(@ViewBuilder content: @escaping (AttachmentButtonImageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.attachmentButtonImageStyleStack) { stack in
            let style = AnyAttachmentButtonImageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AttachmentStyle

public extension View {
    func attachmentStyle(_ style: some AttachmentStyle) -> some View {
        self.transformEnvironment(\.attachmentStyleStack) { stack in
            stack.append(style)
        }
    }

    func attachmentStyle(@ViewBuilder content: @escaping (AttachmentConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.attachmentStyleStack) { stack in
            let style = AnyAttachmentStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AttachmentFootnoteStyle

public extension View {
    func attachmentFootnoteStyle(_ style: some AttachmentFootnoteStyle) -> some View {
        self.transformEnvironment(\.attachmentFootnoteStyleStack) { stack in
            stack.append(style)
        }
    }

    func attachmentFootnoteStyle(@ViewBuilder content: @escaping (AttachmentFootnoteConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.attachmentFootnoteStyleStack) { stack in
            let style = AnyAttachmentFootnoteStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AttachmentGroupStyle

public extension View {
    func attachmentGroupStyle(_ style: some AttachmentGroupStyle) -> some View {
        self.transformEnvironment(\.attachmentGroupStyleStack) { stack in
            stack.append(style)
        }
    }

    func attachmentGroupStyle(@ViewBuilder content: @escaping (AttachmentGroupConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.attachmentGroupStyleStack) { stack in
            let style = AnyAttachmentGroupStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AttachmentSubtitleStyle

public extension View {
    func attachmentSubtitleStyle(_ style: some AttachmentSubtitleStyle) -> some View {
        self.transformEnvironment(\.attachmentSubtitleStyleStack) { stack in
            stack.append(style)
        }
    }

    func attachmentSubtitleStyle(@ViewBuilder content: @escaping (AttachmentSubtitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.attachmentSubtitleStyleStack) { stack in
            let style = AnyAttachmentSubtitleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AttachmentThumbnailStyle

public extension View {
    func attachmentThumbnailStyle(_ style: some AttachmentThumbnailStyle) -> some View {
        self.transformEnvironment(\.attachmentThumbnailStyleStack) { stack in
            stack.append(style)
        }
    }

    func attachmentThumbnailStyle(@ViewBuilder content: @escaping (AttachmentThumbnailConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.attachmentThumbnailStyleStack) { stack in
            let style = AnyAttachmentThumbnailStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AttachmentTitleStyle

public extension View {
    func attachmentTitleStyle(_ style: some AttachmentTitleStyle) -> some View {
        self.transformEnvironment(\.attachmentTitleStyleStack) { stack in
            stack.append(style)
        }
    }

    func attachmentTitleStyle(@ViewBuilder content: @escaping (AttachmentTitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.attachmentTitleStyleStack) { stack in
            let style = AnyAttachmentTitleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AttributeStyle

public extension View {
    func attributeStyle(_ style: some AttributeStyle) -> some View {
        self.transformEnvironment(\.attributeStyleStack) { stack in
            stack.append(style)
        }
    }

    func attributeStyle(@ViewBuilder content: @escaping (AttributeConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.attributeStyleStack) { stack in
            let style = AnyAttributeStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AuthInputStyle

public extension View {
    func authInputStyle(_ style: some AuthInputStyle) -> some View {
        self.transformEnvironment(\.authInputStyleStack) { stack in
            stack.append(style)
        }
    }

    func authInputStyle(@ViewBuilder content: @escaping (AuthInputConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.authInputStyleStack) { stack in
            let style = AnyAuthInputStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AuthenticationStyle

public extension View {
    func authenticationStyle(_ style: some AuthenticationStyle) -> some View {
        self.transformEnvironment(\.authenticationStyleStack) { stack in
            stack.append(style)
        }
    }

    func authenticationStyle(@ViewBuilder content: @escaping (AuthenticationConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.authenticationStyleStack) { stack in
            let style = AnyAuthenticationStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AvatarStackStyle

public extension View {
    func avatarStackStyle(_ style: some AvatarStackStyle) -> some View {
        self.transformEnvironment(\.avatarStackStyleStack) { stack in
            stack.append(style)
        }
    }

    func avatarStackStyle(@ViewBuilder content: @escaping (AvatarStackConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.avatarStackStyleStack) { stack in
            let style = AnyAvatarStackStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AvatarsStyle

public extension View {
    func avatarsStyle(_ style: some AvatarsStyle) -> some View {
        self.transformEnvironment(\.avatarsStyleStack) { stack in
            stack.append(style)
        }
    }

    func avatarsStyle(@ViewBuilder content: @escaping (AvatarsConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.avatarsStyleStack) { stack in
            let style = AnyAvatarsStyle(content)
            stack.append(style)
        }
    }
}

// MARK: AvatarsTitleStyle

public extension View {
    func avatarsTitleStyle(_ style: some AvatarsTitleStyle) -> some View {
        self.transformEnvironment(\.avatarsTitleStyleStack) { stack in
            stack.append(style)
        }
    }

    func avatarsTitleStyle(@ViewBuilder content: @escaping (AvatarsTitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.avatarsTitleStyleStack) { stack in
            let style = AnyAvatarsTitleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: BannerMessageStyle

public extension View {
    func bannerMessageStyle(_ style: some BannerMessageStyle) -> some View {
        self.transformEnvironment(\.bannerMessageStyleStack) { stack in
            stack.append(style)
        }
    }

    func bannerMessageStyle(@ViewBuilder content: @escaping (BannerMessageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.bannerMessageStyleStack) { stack in
            let style = AnyBannerMessageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: BannerMultiMessageSheetStyle

public extension View {
    func bannerMultiMessageSheetStyle(_ style: some BannerMultiMessageSheetStyle) -> some View {
        self.transformEnvironment(\.bannerMultiMessageSheetStyleStack) { stack in
            stack.append(style)
        }
    }

    func bannerMultiMessageSheetStyle(@ViewBuilder content: @escaping (BannerMultiMessageSheetConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.bannerMultiMessageSheetStyleStack) { stack in
            let style = AnyBannerMultiMessageSheetStyle(content)
            stack.append(style)
        }
    }
}

// MARK: BodyTextStyle

public extension View {
    func bodyTextStyle(_ style: some BodyTextStyle) -> some View {
        self.transformEnvironment(\.bodyTextStyleStack) { stack in
            stack.append(style)
        }
    }

    func bodyTextStyle(@ViewBuilder content: @escaping (BodyTextConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.bodyTextStyleStack) { stack in
            let style = AnyBodyTextStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CancelActionStyle

public extension View {
    func cancelActionStyle(_ style: some CancelActionStyle) -> some View {
        self.transformEnvironment(\.cancelActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func cancelActionStyle(@ViewBuilder content: @escaping (CancelActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.cancelActionStyleStack) { stack in
            let style = AnyCancelActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CardBodyStyle

public extension View {
    func cardBodyStyle(_ style: some CardBodyStyle) -> some View {
        self.transformEnvironment(\.cardBodyStyleStack) { stack in
            stack.append(style)
        }
    }

    func cardBodyStyle(@ViewBuilder content: @escaping (CardBodyConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.cardBodyStyleStack) { stack in
            let style = AnyCardBodyStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CardStyle

public extension View {
    func cardStyle(_ style: some CardStyle) -> some View {
        self.transformEnvironment(\.cardStyleStack) { stack in
            stack.append(style)
        }
    }

    func cardStyle(@ViewBuilder content: @escaping (CardConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.cardStyleStack) { stack in
            let style = AnyCardStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CardExtHeaderStyle

public extension View {
    func cardExtHeaderStyle(_ style: some CardExtHeaderStyle) -> some View {
        self.transformEnvironment(\.cardExtHeaderStyleStack) { stack in
            stack.append(style)
        }
    }

    func cardExtHeaderStyle(@ViewBuilder content: @escaping (CardExtHeaderConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.cardExtHeaderStyleStack) { stack in
            let style = AnyCardExtHeaderStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CardFooterStyle

public extension View {
    func cardFooterStyle(_ style: some CardFooterStyle) -> some View {
        self.transformEnvironment(\.cardFooterStyleStack) { stack in
            stack.append(style)
        }
    }

    func cardFooterStyle(@ViewBuilder content: @escaping (CardFooterConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.cardFooterStyleStack) { stack in
            let style = AnyCardFooterStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CardHeaderStyle

public extension View {
    func cardHeaderStyle(_ style: some CardHeaderStyle) -> some View {
        self.transformEnvironment(\.cardHeaderStyleStack) { stack in
            stack.append(style)
        }
    }

    func cardHeaderStyle(@ViewBuilder content: @escaping (CardHeaderConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.cardHeaderStyleStack) { stack in
            let style = AnyCardHeaderStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CardMainHeaderStyle

public extension View {
    func cardMainHeaderStyle(_ style: some CardMainHeaderStyle) -> some View {
        self.transformEnvironment(\.cardMainHeaderStyleStack) { stack in
            stack.append(style)
        }
    }

    func cardMainHeaderStyle(@ViewBuilder content: @escaping (CardMainHeaderConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.cardMainHeaderStyleStack) { stack in
            let style = AnyCardMainHeaderStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CardMediaStyle

public extension View {
    func cardMediaStyle(_ style: some CardMediaStyle) -> some View {
        self.transformEnvironment(\.cardMediaStyleStack) { stack in
            stack.append(style)
        }
    }

    func cardMediaStyle(@ViewBuilder content: @escaping (CardMediaConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.cardMediaStyleStack) { stack in
            let style = AnyCardMediaStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CheckoutIndicatorStyle

public extension View {
    func checkoutIndicatorStyle(_ style: some CheckoutIndicatorStyle) -> some View {
        self.transformEnvironment(\.checkoutIndicatorStyleStack) { stack in
            stack.append(style)
        }
    }

    func checkoutIndicatorStyle(@ViewBuilder content: @escaping (CheckoutIndicatorConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.checkoutIndicatorStyleStack) { stack in
            let style = AnyCheckoutIndicatorStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ClearActionStyle

public extension View {
    func clearActionStyle(_ style: some ClearActionStyle) -> some View {
        self.transformEnvironment(\.clearActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func clearActionStyle(@ViewBuilder content: @escaping (ClearActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.clearActionStyleStack) { stack in
            let style = AnyClearActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CloseActionStyle

public extension View {
    func closeActionStyle(_ style: some CloseActionStyle) -> some View {
        self.transformEnvironment(\.closeActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func closeActionStyle(@ViewBuilder content: @escaping (CloseActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.closeActionStyleStack) { stack in
            let style = AnyCloseActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ContactItemStyle

public extension View {
    func contactItemStyle(_ style: some ContactItemStyle) -> some View {
        self.transformEnvironment(\.contactItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func contactItemStyle(@ViewBuilder content: @escaping (ContactItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.contactItemStyleStack) { stack in
            let style = AnyContactItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: CounterStyle

public extension View {
    func counterStyle(_ style: some CounterStyle) -> some View {
        self.transformEnvironment(\.counterStyleStack) { stack in
            stack.append(style)
        }
    }

    func counterStyle(@ViewBuilder content: @escaping (CounterConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.counterStyleStack) { stack in
            let style = AnyCounterStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DateTimePickerStyle

public extension View {
    func dateTimePickerStyle(_ style: some DateTimePickerStyle) -> some View {
        self.transformEnvironment(\.dateTimePickerStyleStack) { stack in
            stack.append(style)
        }
    }

    func dateTimePickerStyle(@ViewBuilder content: @escaping (DateTimePickerConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.dateTimePickerStyleStack) { stack in
            let style = AnyDateTimePickerStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DecrementActionStyle

public extension View {
    func decrementActionStyle(_ style: some DecrementActionStyle) -> some View {
        self.transformEnvironment(\.decrementActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func decrementActionStyle(@ViewBuilder content: @escaping (DecrementActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.decrementActionStyleStack) { stack in
            let style = AnyDecrementActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DemoViewStyle

extension View {
    func demoViewStyle(_ style: some DemoViewStyle) -> some View {
        self.transformEnvironment(\.demoViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func demoViewStyle(@ViewBuilder content: @escaping (DemoViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.demoViewStyleStack) { stack in
            let style = AnyDemoViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DenyActionStyle

public extension View {
    func denyActionStyle(_ style: some DenyActionStyle) -> some View {
        self.transformEnvironment(\.denyActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func denyActionStyle(@ViewBuilder content: @escaping (DenyActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.denyActionStyleStack) { stack in
            let style = AnyDenyActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DescriptionStyle

public extension View {
    func descriptionStyle(_ style: some DescriptionStyle) -> some View {
        self.transformEnvironment(\.descriptionStyleStack) { stack in
            stack.append(style)
        }
    }

    func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.descriptionStyleStack) { stack in
            let style = AnyDescriptionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DescriptionTextStyle

public extension View {
    func descriptionTextStyle(_ style: some DescriptionTextStyle) -> some View {
        self.transformEnvironment(\.descriptionTextStyleStack) { stack in
            stack.append(style)
        }
    }

    func descriptionTextStyle(@ViewBuilder content: @escaping (DescriptionTextConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.descriptionTextStyleStack) { stack in
            let style = AnyDescriptionTextStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DeselectAllActionStyle

public extension View {
    func deselectAllActionStyle(_ style: some DeselectAllActionStyle) -> some View {
        self.transformEnvironment(\.deselectAllActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func deselectAllActionStyle(@ViewBuilder content: @escaping (DeselectAllActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.deselectAllActionStyleStack) { stack in
            let style = AnyDeselectAllActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DetailContentStyle

public extension View {
    func detailContentStyle(_ style: some DetailContentStyle) -> some View {
        self.transformEnvironment(\.detailContentStyleStack) { stack in
            stack.append(style)
        }
    }

    func detailContentStyle(@ViewBuilder content: @escaping (DetailContentConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.detailContentStyleStack) { stack in
            let style = AnyDetailContentStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DetailImageStyle

public extension View {
    func detailImageStyle(_ style: some DetailImageStyle) -> some View {
        self.transformEnvironment(\.detailImageStyleStack) { stack in
            stack.append(style)
        }
    }

    func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.detailImageStyleStack) { stack in
            let style = AnyDetailImageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DimensionSegmentStyle

public extension View {
    func dimensionSegmentStyle(_ style: some DimensionSegmentStyle) -> some View {
        self.transformEnvironment(\.dimensionSegmentStyleStack) { stack in
            stack.append(style)
        }
    }

    func dimensionSegmentStyle(@ViewBuilder content: @escaping (DimensionSegmentConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.dimensionSegmentStyleStack) { stack in
            let style = AnyDimensionSegmentStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DimensionSelectorStyle

public extension View {
    func dimensionSelectorStyle(_ style: some DimensionSelectorStyle) -> some View {
        self.transformEnvironment(\.dimensionSelectorStyleStack) { stack in
            stack.append(style)
        }
    }

    func dimensionSelectorStyle(@ViewBuilder content: @escaping (DimensionSelectorConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.dimensionSelectorStyleStack) { stack in
            let style = AnyDimensionSelectorStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DisagreeActionStyle

public extension View {
    func disagreeActionStyle(_ style: some DisagreeActionStyle) -> some View {
        self.transformEnvironment(\.disagreeActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func disagreeActionStyle(@ViewBuilder content: @escaping (DisagreeActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.disagreeActionStyleStack) { stack in
            let style = AnyDisagreeActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: DurationPickerStyle

public extension View {
    func durationPickerStyle(_ style: some DurationPickerStyle) -> some View {
        self.transformEnvironment(\.durationPickerStyleStack) { stack in
            stack.append(style)
        }
    }

    func durationPickerStyle(@ViewBuilder content: @escaping (DurationPickerConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.durationPickerStyleStack) { stack in
            let style = AnyDurationPickerStyle(content)
            stack.append(style)
        }
    }
}

// MARK: EULAViewStyle

public extension View {
    func eULAViewStyle(_ style: some EULAViewStyle) -> some View {
        self.transformEnvironment(\.eULAViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func eULAViewStyle(@ViewBuilder content: @escaping (EULAViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.eULAViewStyleStack) { stack in
            let style = AnyEULAViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FilledIconStyle

public extension View {
    func filledIconStyle(_ style: some FilledIconStyle) -> some View {
        self.transformEnvironment(\.filledIconStyleStack) { stack in
            stack.append(style)
        }
    }

    func filledIconStyle(@ViewBuilder content: @escaping (FilledIconConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.filledIconStyleStack) { stack in
            let style = AnyFilledIconStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FilterFeedbackBarButtonStyle

public extension View {
    func filterFeedbackBarButtonStyle(_ style: some FilterFeedbackBarButtonStyle) -> some View {
        self.transformEnvironment(\.filterFeedbackBarButtonStyleStack) { stack in
            stack.append(style)
        }
    }

    func filterFeedbackBarButtonStyle(@ViewBuilder content: @escaping (FilterFeedbackBarButtonConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.filterFeedbackBarButtonStyleStack) { stack in
            let style = AnyFilterFeedbackBarButtonStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FilterFeedbackBarStyle

public extension View {
    func filterFeedbackBarStyle(_ style: some FilterFeedbackBarStyle) -> some View {
        self.transformEnvironment(\.filterFeedbackBarStyleStack) { stack in
            stack.append(style)
        }
    }

    func filterFeedbackBarStyle(@ViewBuilder content: @escaping (FilterFeedbackBarConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.filterFeedbackBarStyleStack) { stack in
            let style = AnyFilterFeedbackBarStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FilterFeedbackBarItemStyle

public extension View {
    func filterFeedbackBarItemStyle(_ style: some FilterFeedbackBarItemStyle) -> some View {
        self.transformEnvironment(\.filterFeedbackBarItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func filterFeedbackBarItemStyle(@ViewBuilder content: @escaping (FilterFeedbackBarItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.filterFeedbackBarItemStyleStack) { stack in
            let style = AnyFilterFeedbackBarItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FilterFormViewStyle

public extension View {
    func filterFormViewStyle(_ style: some FilterFormViewStyle) -> some View {
        self.transformEnvironment(\.filterFormViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func filterFormViewStyle(@ViewBuilder content: @escaping (FilterFormViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.filterFormViewStyleStack) { stack in
            let style = AnyFilterFormViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FioriSliderStyle

public extension View {
    func fioriSliderStyle(_ style: some FioriSliderStyle) -> some View {
        self.transformEnvironment(\.fioriSliderStyleStack) { stack in
            stack.append(style)
        }
    }

    func fioriSliderStyle(@ViewBuilder content: @escaping (FioriSliderConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.fioriSliderStyleStack) { stack in
            let style = AnyFioriSliderStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FootnoteStyle

public extension View {
    func footnoteStyle(_ style: some FootnoteStyle) -> some View {
        self.transformEnvironment(\.footnoteStyleStack) { stack in
            stack.append(style)
        }
    }

    func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.footnoteStyleStack) { stack in
            let style = AnyFootnoteStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FootnoteIconsStyle

public extension View {
    func footnoteIconsStyle(_ style: some FootnoteIconsStyle) -> some View {
        self.transformEnvironment(\.footnoteIconsStyleStack) { stack in
            stack.append(style)
        }
    }

    func footnoteIconsStyle(@ViewBuilder content: @escaping (FootnoteIconsConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.footnoteIconsStyleStack) { stack in
            let style = AnyFootnoteIconsStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FootnoteIconsTextStyle

public extension View {
    func footnoteIconsTextStyle(_ style: some FootnoteIconsTextStyle) -> some View {
        self.transformEnvironment(\.footnoteIconsTextStyleStack) { stack in
            stack.append(style)
        }
    }

    func footnoteIconsTextStyle(@ViewBuilder content: @escaping (FootnoteIconsTextConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.footnoteIconsTextStyleStack) { stack in
            let style = AnyFootnoteIconsTextStyle(content)
            stack.append(style)
        }
    }
}

// MARK: FormViewStyle

public extension View {
    func formViewStyle(_ style: some FormViewStyle) -> some View {
        self.transformEnvironment(\.formViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.formViewStyleStack) { stack in
            let style = AnyFormViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: GreetingTextStyle

public extension View {
    func greetingTextStyle(_ style: some GreetingTextStyle) -> some View {
        self.transformEnvironment(\.greetingTextStyleStack) { stack in
            stack.append(style)
        }
    }

    func greetingTextStyle(@ViewBuilder content: @escaping (GreetingTextConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.greetingTextStyleStack) { stack in
            let style = AnyGreetingTextStyle(content)
            stack.append(style)
        }
    }
}

// MARK: HalfStarImageStyle

public extension View {
    func halfStarImageStyle(_ style: some HalfStarImageStyle) -> some View {
        self.transformEnvironment(\.halfStarImageStyleStack) { stack in
            stack.append(style)
        }
    }

    func halfStarImageStyle(@ViewBuilder content: @escaping (HalfStarImageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.halfStarImageStyleStack) { stack in
            let style = AnyHalfStarImageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: HeaderActionStyle

public extension View {
    func headerActionStyle(_ style: some HeaderActionStyle) -> some View {
        self.transformEnvironment(\.headerActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func headerActionStyle(@ViewBuilder content: @escaping (HeaderActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.headerActionStyleStack) { stack in
            let style = AnyHeaderActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: HeaderChartStyle

public extension View {
    func headerChartStyle(_ style: some HeaderChartStyle) -> some View {
        self.transformEnvironment(\.headerChartStyleStack) { stack in
            stack.append(style)
        }
    }

    func headerChartStyle(@ViewBuilder content: @escaping (HeaderChartConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.headerChartStyleStack) { stack in
            let style = AnyHeaderChartStyle(content)
            stack.append(style)
        }
    }
}

// MARK: HelperTextStyle

public extension View {
    func helperTextStyle(_ style: some HelperTextStyle) -> some View {
        self.transformEnvironment(\.helperTextStyleStack) { stack in
            stack.append(style)
        }
    }

    func helperTextStyle(@ViewBuilder content: @escaping (HelperTextConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.helperTextStyleStack) { stack in
            let style = AnyHelperTextStyle(content)
            stack.append(style)
        }
    }
}

// MARK: IconStyle

public extension View {
    func iconStyle(_ style: some IconStyle) -> some View {
        self.transformEnvironment(\.iconStyleStack) { stack in
            stack.append(style)
        }
    }

    func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.iconStyleStack) { stack in
            let style = AnyIconStyle(content)
            stack.append(style)
        }
    }
}

// MARK: IconsStyle

public extension View {
    func iconsStyle(_ style: some IconsStyle) -> some View {
        self.transformEnvironment(\.iconsStyleStack) { stack in
            stack.append(style)
        }
    }

    func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.iconsStyleStack) { stack in
            let style = AnyIconsStyle(content)
            stack.append(style)
        }
    }
}

// MARK: IllustratedMessageStyle

public extension View {
    func illustratedMessageStyle(_ style: some IllustratedMessageStyle) -> some View {
        self.transformEnvironment(\.illustratedMessageStyleStack) { stack in
            stack.append(style)
        }
    }

    func illustratedMessageStyle(@ViewBuilder content: @escaping (IllustratedMessageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.illustratedMessageStyleStack) { stack in
            let style = AnyIllustratedMessageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: InactiveTrackStyle

public extension View {
    func inactiveTrackStyle(_ style: some InactiveTrackStyle) -> some View {
        self.transformEnvironment(\.inactiveTrackStyleStack) { stack in
            stack.append(style)
        }
    }

    func inactiveTrackStyle(@ViewBuilder content: @escaping (InactiveTrackConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.inactiveTrackStyleStack) { stack in
            let style = AnyInactiveTrackStyle(content)
            stack.append(style)
        }
    }
}

// MARK: IncrementActionStyle

public extension View {
    func incrementActionStyle(_ style: some IncrementActionStyle) -> some View {
        self.transformEnvironment(\.incrementActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func incrementActionStyle(@ViewBuilder content: @escaping (IncrementActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.incrementActionStyleStack) { stack in
            let style = AnyIncrementActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: InformationViewStyle

public extension View {
    func informationViewStyle(_ style: some InformationViewStyle) -> some View {
        self.transformEnvironment(\.informationViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func informationViewStyle(@ViewBuilder content: @escaping (InformationViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.informationViewStyleStack) { stack in
            let style = AnyInformationViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: InnerCircleStyle

public extension View {
    func innerCircleStyle(_ style: some InnerCircleStyle) -> some View {
        self.transformEnvironment(\.innerCircleStyleStack) { stack in
            stack.append(style)
        }
    }

    func innerCircleStyle(@ViewBuilder content: @escaping (InnerCircleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.innerCircleStyleStack) { stack in
            let style = AnyInnerCircleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: JouleWelcomeScreenStyle

public extension View {
    func jouleWelcomeScreenStyle(_ style: some JouleWelcomeScreenStyle) -> some View {
        self.transformEnvironment(\.jouleWelcomeScreenStyleStack) { stack in
            stack.append(style)
        }
    }

    func jouleWelcomeScreenStyle(@ViewBuilder content: @escaping (JouleWelcomeScreenConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.jouleWelcomeScreenStyleStack) { stack in
            let style = AnyJouleWelcomeScreenStyle(content)
            stack.append(style)
        }
    }
}

// MARK: KPIContentStyle

public extension View {
    func kPIContentStyle(_ style: some KPIContentStyle) -> some View {
        self.transformEnvironment(\.kPIContentStyleStack) { stack in
            stack.append(style)
        }
    }

    func kPIContentStyle(@ViewBuilder content: @escaping (KPIContentConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.kPIContentStyleStack) { stack in
            let style = AnyKPIContentStyle(content)
            stack.append(style)
        }
    }
}

// MARK: KPIItemStyle

public extension View {
    func kPIItemStyle(_ style: some KPIItemStyle) -> some View {
        self.transformEnvironment(\.kPIItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func kPIItemStyle(@ViewBuilder content: @escaping (KPIItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.kPIItemStyleStack) { stack in
            let style = AnyKPIItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: KPIProgressItemStyle

public extension View {
    func kPIProgressItemStyle(_ style: some KPIProgressItemStyle) -> some View {
        self.transformEnvironment(\.kPIProgressItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func kPIProgressItemStyle(@ViewBuilder content: @escaping (KPIProgressItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.kPIProgressItemStyleStack) { stack in
            let style = AnyKPIProgressItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: KPISubItemStyle

public extension View {
    func kPISubItemStyle(_ style: some KPISubItemStyle) -> some View {
        self.transformEnvironment(\.kPISubItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func kPISubItemStyle(@ViewBuilder content: @escaping (KPISubItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.kPISubItemStyleStack) { stack in
            let style = AnyKPISubItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: KeyStyle

public extension View {
    func keyStyle(_ style: some KeyStyle) -> some View {
        self.transformEnvironment(\.keyStyleStack) { stack in
            stack.append(style)
        }
    }

    func keyStyle(@ViewBuilder content: @escaping (KeyConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.keyStyleStack) { stack in
            let style = AnyKeyStyle(content)
            stack.append(style)
        }
    }
}

// MARK: KeyValueFormViewStyle

public extension View {
    func keyValueFormViewStyle(_ style: some KeyValueFormViewStyle) -> some View {
        self.transformEnvironment(\.keyValueFormViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func keyValueFormViewStyle(@ViewBuilder content: @escaping (KeyValueFormViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.keyValueFormViewStyleStack) { stack in
            let style = AnyKeyValueFormViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: KeyValueItemStyle

public extension View {
    func keyValueItemStyle(_ style: some KeyValueItemStyle) -> some View {
        self.transformEnvironment(\.keyValueItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func keyValueItemStyle(@ViewBuilder content: @escaping (KeyValueItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.keyValueItemStyleStack) { stack in
            let style = AnyKeyValueItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: KpiCaptionStyle

public extension View {
    func kpiCaptionStyle(_ style: some KpiCaptionStyle) -> some View {
        self.transformEnvironment(\.kpiCaptionStyleStack) { stack in
            stack.append(style)
        }
    }

    func kpiCaptionStyle(@ViewBuilder content: @escaping (KpiCaptionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.kpiCaptionStyleStack) { stack in
            let style = AnyKpiCaptionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: KpiStyle

public extension View {
    func kpiStyle(_ style: some KpiStyle) -> some View {
        self.transformEnvironment(\.kpiStyleStack) { stack in
            stack.append(style)
        }
    }

    func kpiStyle(@ViewBuilder content: @escaping (KpiConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.kpiStyleStack) { stack in
            let style = AnyKpiStyle(content)
            stack.append(style)
        }
    }
}

// MARK: LabelItemStyle

public extension View {
    func labelItemStyle(_ style: some LabelItemStyle) -> some View {
        self.transformEnvironment(\.labelItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func labelItemStyle(@ViewBuilder content: @escaping (LabelItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.labelItemStyleStack) { stack in
            let style = AnyLabelItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: LeadingAccessoryStyle

public extension View {
    func leadingAccessoryStyle(_ style: some LeadingAccessoryStyle) -> some View {
        self.transformEnvironment(\.leadingAccessoryStyleStack) { stack in
            stack.append(style)
        }
    }

    func leadingAccessoryStyle(@ViewBuilder content: @escaping (LeadingAccessoryConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.leadingAccessoryStyleStack) { stack in
            let style = AnyLeadingAccessoryStyle(content)
            stack.append(style)
        }
    }
}

// MARK: LineStyle

public extension View {
    func lineStyle(_ style: some LineStyle) -> some View {
        self.transformEnvironment(\.lineStyleStack) { stack in
            stack.append(style)
        }
    }

    func lineStyle(@ViewBuilder content: @escaping (LineConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.lineStyleStack) { stack in
            let style = AnyLineStyle(content)
            stack.append(style)
        }
    }
}

// MARK: LinearProgressIndicatorStyle

public extension View {
    func linearProgressIndicatorStyle(_ style: some LinearProgressIndicatorStyle) -> some View {
        self.transformEnvironment(\.linearProgressIndicatorStyleStack) { stack in
            stack.append(style)
        }
    }

    func linearProgressIndicatorStyle(@ViewBuilder content: @escaping (LinearProgressIndicatorConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.linearProgressIndicatorStyleStack) { stack in
            let style = AnyLinearProgressIndicatorStyle(content)
            stack.append(style)
        }
    }
}

// MARK: LinearProgressIndicatorViewStyle

public extension View {
    func linearProgressIndicatorViewStyle(_ style: some LinearProgressIndicatorViewStyle) -> some View {
        self.transformEnvironment(\.linearProgressIndicatorViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func linearProgressIndicatorViewStyle(@ViewBuilder content: @escaping (LinearProgressIndicatorViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.linearProgressIndicatorViewStyleStack) { stack in
            let style = AnyLinearProgressIndicatorViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ListPickerContentStyle

public extension View {
    func listPickerContentStyle(_ style: some ListPickerContentStyle) -> some View {
        self.transformEnvironment(\.listPickerContentStyleStack) { stack in
            stack.append(style)
        }
    }

    func listPickerContentStyle(@ViewBuilder content: @escaping (ListPickerContentConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.listPickerContentStyleStack) { stack in
            let style = AnyListPickerContentStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ListPickerDestinationStyle

public extension View {
    func listPickerDestinationStyle(_ style: some ListPickerDestinationStyle) -> some View {
        self.transformEnvironment(\.listPickerDestinationStyleStack) { stack in
            stack.append(style)
        }
    }

    func listPickerDestinationStyle(@ViewBuilder content: @escaping (ListPickerDestinationConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.listPickerDestinationStyleStack) { stack in
            let style = AnyListPickerDestinationStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ListPickerItemStyle

public extension View {
    func listPickerItemStyle(_ style: some ListPickerItemStyle) -> some View {
        self.transformEnvironment(\.listPickerItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func listPickerItemStyle(@ViewBuilder content: @escaping (ListPickerItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.listPickerItemStyleStack) { stack in
            let style = AnyListPickerItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: LoadingIndicatorStyle

public extension View {
    func loadingIndicatorStyle(_ style: some LoadingIndicatorStyle) -> some View {
        self.transformEnvironment(\.loadingIndicatorStyleStack) { stack in
            stack.append(style)
        }
    }

    func loadingIndicatorStyle(@ViewBuilder content: @escaping (LoadingIndicatorConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.loadingIndicatorStyleStack) { stack in
            let style = AnyLoadingIndicatorStyle(content)
            stack.append(style)
        }
    }
}

// MARK: LowerThumbStyle

public extension View {
    func lowerThumbStyle(_ style: some LowerThumbStyle) -> some View {
        self.transformEnvironment(\.lowerThumbStyleStack) { stack in
            stack.append(style)
        }
    }

    func lowerThumbStyle(@ViewBuilder content: @escaping (LowerThumbConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.lowerThumbStyleStack) { stack in
            let style = AnyLowerThumbStyle(content)
            stack.append(style)
        }
    }
}

// MARK: MediaImageStyle

public extension View {
    func mediaImageStyle(_ style: some MediaImageStyle) -> some View {
        self.transformEnvironment(\.mediaImageStyleStack) { stack in
            stack.append(style)
        }
    }

    func mediaImageStyle(@ViewBuilder content: @escaping (MediaImageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.mediaImageStyleStack) { stack in
            let style = AnyMediaImageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: MenuSelectionStyle

public extension View {
    func menuSelectionStyle(_ style: some MenuSelectionStyle) -> some View {
        self.transformEnvironment(\.menuSelectionStyleStack) { stack in
            stack.append(style)
        }
    }

    func menuSelectionStyle(@ViewBuilder content: @escaping (MenuSelectionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.menuSelectionStyleStack) { stack in
            let style = AnyMenuSelectionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: MenuSelectionItemStyle

public extension View {
    func menuSelectionItemStyle(_ style: some MenuSelectionItemStyle) -> some View {
        self.transformEnvironment(\.menuSelectionItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func menuSelectionItemStyle(@ViewBuilder content: @escaping (MenuSelectionItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.menuSelectionItemStyleStack) { stack in
            let style = AnyMenuSelectionItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: MessageContentStyle

public extension View {
    func messageContentStyle(_ style: some MessageContentStyle) -> some View {
        self.transformEnvironment(\.messageContentStyleStack) { stack in
            stack.append(style)
        }
    }

    func messageContentStyle(@ViewBuilder content: @escaping (MessageContentConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.messageContentStyleStack) { stack in
            let style = AnyMessageContentStyle(content)
            stack.append(style)
        }
    }
}

// MARK: MoreActionOverflowStyle

public extension View {
    func moreActionOverflowStyle(_ style: some MoreActionOverflowStyle) -> some View {
        self.transformEnvironment(\.moreActionOverflowStyleStack) { stack in
            stack.append(style)
        }
    }

    func moreActionOverflowStyle(@ViewBuilder content: @escaping (MoreActionOverflowConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.moreActionOverflowStyleStack) { stack in
            let style = AnyMoreActionOverflowStyle(content)
            stack.append(style)
        }
    }
}

// MARK: NextActionStyle

public extension View {
    func nextActionStyle(_ style: some NextActionStyle) -> some View {
        self.transformEnvironment(\.nextActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func nextActionStyle(@ViewBuilder content: @escaping (NextActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.nextActionStyleStack) { stack in
            let style = AnyNextActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: NodeStyle

public extension View {
    func nodeStyle(_ style: some NodeStyle) -> some View {
        self.transformEnvironment(\.nodeStyleStack) { stack in
            stack.append(style)
        }
    }

    func nodeStyle(@ViewBuilder content: @escaping (NodeConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.nodeStyleStack) { stack in
            let style = AnyNodeStyle(content)
            stack.append(style)
        }
    }
}

// MARK: NotNowActionStyle

public extension View {
    func notNowActionStyle(_ style: some NotNowActionStyle) -> some View {
        self.transformEnvironment(\.notNowActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func notNowActionStyle(@ViewBuilder content: @escaping (NotNowActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.notNowActionStyleStack) { stack in
            let style = AnyNotNowActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: NoteFormViewStyle

public extension View {
    func noteFormViewStyle(_ style: some NoteFormViewStyle) -> some View {
        self.transformEnvironment(\.noteFormViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func noteFormViewStyle(@ViewBuilder content: @escaping (NoteFormViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.noteFormViewStyleStack) { stack in
            let style = AnyNoteFormViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: NowIndicatorNodeStyle

public extension View {
    func nowIndicatorNodeStyle(_ style: some NowIndicatorNodeStyle) -> some View {
        self.transformEnvironment(\.nowIndicatorNodeStyleStack) { stack in
            stack.append(style)
        }
    }

    func nowIndicatorNodeStyle(@ViewBuilder content: @escaping (NowIndicatorNodeConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.nowIndicatorNodeStyleStack) { stack in
            let style = AnyNowIndicatorNodeStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ObjectHeaderStyle

public extension View {
    func objectHeaderStyle(_ style: some ObjectHeaderStyle) -> some View {
        self.transformEnvironment(\.objectHeaderStyleStack) { stack in
            stack.append(style)
        }
    }

    func objectHeaderStyle(@ViewBuilder content: @escaping (ObjectHeaderConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.objectHeaderStyleStack) { stack in
            let style = AnyObjectHeaderStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ObjectItemStyle

public extension View {
    func objectItemStyle(_ style: some ObjectItemStyle) -> some View {
        self.transformEnvironment(\.objectItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func objectItemStyle(@ViewBuilder content: @escaping (ObjectItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.objectItemStyleStack) { stack in
            let style = AnyObjectItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: OffStarImageStyle

public extension View {
    func offStarImageStyle(_ style: some OffStarImageStyle) -> some View {
        self.transformEnvironment(\.offStarImageStyleStack) { stack in
            stack.append(style)
        }
    }

    func offStarImageStyle(@ViewBuilder content: @escaping (OffStarImageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.offStarImageStyleStack) { stack in
            let style = AnyOffStarImageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: OnStarImageStyle

public extension View {
    func onStarImageStyle(_ style: some OnStarImageStyle) -> some View {
        self.transformEnvironment(\.onStarImageStyleStack) { stack in
            stack.append(style)
        }
    }

    func onStarImageStyle(@ViewBuilder content: @escaping (OnStarImageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.onStarImageStyleStack) { stack in
            let style = AnyOnStarImageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: OptionalTitleStyle

public extension View {
    func optionalTitleStyle(_ style: some OptionalTitleStyle) -> some View {
        self.transformEnvironment(\.optionalTitleStyleStack) { stack in
            stack.append(style)
        }
    }

    func optionalTitleStyle(@ViewBuilder content: @escaping (OptionalTitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.optionalTitleStyleStack) { stack in
            let style = AnyOptionalTitleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: OptionsStyle

public extension View {
    func optionsStyle(_ style: some OptionsStyle) -> some View {
        self.transformEnvironment(\.optionsStyleStack) { stack in
            stack.append(style)
        }
    }

    func optionsStyle(@ViewBuilder content: @escaping (OptionsConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.optionsStyleStack) { stack in
            let style = AnyOptionsStyle(content)
            stack.append(style)
        }
    }
}

// MARK: OuterCircleStyle

public extension View {
    func outerCircleStyle(_ style: some OuterCircleStyle) -> some View {
        self.transformEnvironment(\.outerCircleStyleStack) { stack in
            stack.append(style)
        }
    }

    func outerCircleStyle(@ViewBuilder content: @escaping (OuterCircleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.outerCircleStyleStack) { stack in
            let style = AnyOuterCircleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: OverflowActionStyle

public extension View {
    func overflowActionStyle(_ style: some OverflowActionStyle) -> some View {
        self.transformEnvironment(\.overflowActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func overflowActionStyle(@ViewBuilder content: @escaping (OverflowActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.overflowActionStyleStack) { stack in
            let style = AnyOverflowActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: PlaceholderStyle

public extension View {
    func placeholderStyle(_ style: some PlaceholderStyle) -> some View {
        self.transformEnvironment(\.placeholderStyleStack) { stack in
            stack.append(style)
        }
    }

    func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.placeholderStyleStack) { stack in
            let style = AnyPlaceholderStyle(content)
            stack.append(style)
        }
    }
}

// MARK: PlaceholderTextEditorStyle

public extension View {
    func placeholderTextEditorStyle(_ style: some PlaceholderTextEditorStyle) -> some View {
        self.transformEnvironment(\.placeholderTextEditorStyleStack) { stack in
            stack.append(style)
        }
    }

    func placeholderTextEditorStyle(@ViewBuilder content: @escaping (PlaceholderTextEditorConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.placeholderTextEditorStyleStack) { stack in
            let style = AnyPlaceholderTextEditorStyle(content)
            stack.append(style)
        }
    }
}

// MARK: PlaceholderTextFieldStyle

public extension View {
    func placeholderTextFieldStyle(_ style: some PlaceholderTextFieldStyle) -> some View {
        self.transformEnvironment(\.placeholderTextFieldStyleStack) { stack in
            stack.append(style)
        }
    }

    func placeholderTextFieldStyle(@ViewBuilder content: @escaping (PlaceholderTextFieldConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.placeholderTextFieldStyleStack) { stack in
            let style = AnyPlaceholderTextFieldStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ProcessingIndicatorStyle

public extension View {
    func processingIndicatorStyle(_ style: some ProcessingIndicatorStyle) -> some View {
        self.transformEnvironment(\.processingIndicatorStyleStack) { stack in
            stack.append(style)
        }
    }

    func processingIndicatorStyle(@ViewBuilder content: @escaping (ProcessingIndicatorConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.processingIndicatorStyleStack) { stack in
            let style = AnyProcessingIndicatorStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ProfileHeaderStyle

public extension View {
    func profileHeaderStyle(_ style: some ProfileHeaderStyle) -> some View {
        self.transformEnvironment(\.profileHeaderStyleStack) { stack in
            stack.append(style)
        }
    }

    func profileHeaderStyle(@ViewBuilder content: @escaping (ProfileHeaderConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.profileHeaderStyleStack) { stack in
            let style = AnyProfileHeaderStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ProgressStyle

public extension View {
    func progressStyle(_ style: some ProgressStyle) -> some View {
        self.transformEnvironment(\.progressStyleStack) { stack in
            stack.append(style)
        }
    }

    func progressStyle(@ViewBuilder content: @escaping (ProgressConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.progressStyleStack) { stack in
            let style = AnyProgressStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ProgressIndicatorStyle

public extension View {
    func progressIndicatorStyle(_ style: some ProgressIndicatorStyle) -> some View {
        self.transformEnvironment(\.progressIndicatorStyleStack) { stack in
            stack.append(style)
        }
    }

    func progressIndicatorStyle(@ViewBuilder content: @escaping (ProgressIndicatorConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.progressIndicatorStyleStack) { stack in
            let style = AnyProgressIndicatorStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ProgressIndicatorProtocolStyle

public extension View {
    func progressIndicatorProtocolStyle(_ style: some ProgressIndicatorProtocolStyle) -> some View {
        self.transformEnvironment(\.progressIndicatorProtocolStyleStack) { stack in
            stack.append(style)
        }
    }

    func progressIndicatorProtocolStyle(@ViewBuilder content: @escaping (ProgressIndicatorProtocolConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.progressIndicatorProtocolStyleStack) { stack in
            let style = AnyProgressIndicatorProtocolStyle(content)
            stack.append(style)
        }
    }
}

// MARK: PromptStyle

public extension View {
    func promptStyle(_ style: some PromptStyle) -> some View {
        self.transformEnvironment(\.promptStyleStack) { stack in
            stack.append(style)
        }
    }

    func promptStyle(@ViewBuilder content: @escaping (PromptConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.promptStyleStack) { stack in
            let style = AnyPromptStyle(content)
            stack.append(style)
        }
    }
}

// MARK: RangeSliderControlStyle

public extension View {
    func rangeSliderControlStyle(_ style: some RangeSliderControlStyle) -> some View {
        self.transformEnvironment(\.rangeSliderControlStyleStack) { stack in
            stack.append(style)
        }
    }

    func rangeSliderControlStyle(@ViewBuilder content: @escaping (RangeSliderControlConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.rangeSliderControlStyleStack) { stack in
            let style = AnyRangeSliderControlStyle(content)
            stack.append(style)
        }
    }
}

// MARK: RatingControlStyle

public extension View {
    func ratingControlStyle(_ style: some RatingControlStyle) -> some View {
        self.transformEnvironment(\.ratingControlStyleStack) { stack in
            stack.append(style)
        }
    }

    func ratingControlStyle(@ViewBuilder content: @escaping (RatingControlConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.ratingControlStyleStack) { stack in
            let style = AnyRatingControlStyle(content)
            stack.append(style)
        }
    }
}

// MARK: RatingControlFormViewStyle

public extension View {
    func ratingControlFormViewStyle(_ style: some RatingControlFormViewStyle) -> some View {
        self.transformEnvironment(\.ratingControlFormViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func ratingControlFormViewStyle(@ViewBuilder content: @escaping (RatingControlFormViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.ratingControlFormViewStyleStack) { stack in
            let style = AnyRatingControlFormViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ReenterSignatureActionStyle

public extension View {
    func reenterSignatureActionStyle(_ style: some ReenterSignatureActionStyle) -> some View {
        self.transformEnvironment(\.reenterSignatureActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func reenterSignatureActionStyle(@ViewBuilder content: @escaping (ReenterSignatureActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.reenterSignatureActionStyleStack) { stack in
            let style = AnyReenterSignatureActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ResetActionStyle

public extension View {
    func resetActionStyle(_ style: some ResetActionStyle) -> some View {
        self.transformEnvironment(\.resetActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func resetActionStyle(@ViewBuilder content: @escaping (ResetActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.resetActionStyleStack) { stack in
            let style = AnyResetActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ReviewCountLabelStyle

public extension View {
    func reviewCountLabelStyle(_ style: some ReviewCountLabelStyle) -> some View {
        self.transformEnvironment(\.reviewCountLabelStyleStack) { stack in
            stack.append(style)
        }
    }

    func reviewCountLabelStyle(@ViewBuilder content: @escaping (ReviewCountLabelConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.reviewCountLabelStyleStack) { stack in
            let style = AnyReviewCountLabelStyle(content)
            stack.append(style)
        }
    }
}

// MARK: Row1Style

public extension View {
    func row1Style(_ style: some Row1Style) -> some View {
        self.transformEnvironment(\.row1StyleStack) { stack in
            stack.append(style)
        }
    }

    func row1Style(@ViewBuilder content: @escaping (Row1Configuration) -> some View) -> some View {
        self.transformEnvironment(\.row1StyleStack) { stack in
            let style = AnyRow1Style(content)
            stack.append(style)
        }
    }
}

// MARK: Row2Style

public extension View {
    func row2Style(_ style: some Row2Style) -> some View {
        self.transformEnvironment(\.row2StyleStack) { stack in
            stack.append(style)
        }
    }

    func row2Style(@ViewBuilder content: @escaping (Row2Configuration) -> some View) -> some View {
        self.transformEnvironment(\.row2StyleStack) { stack in
            let style = AnyRow2Style(content)
            stack.append(style)
        }
    }
}

// MARK: Row3Style

public extension View {
    func row3Style(_ style: some Row3Style) -> some View {
        self.transformEnvironment(\.row3StyleStack) { stack in
            stack.append(style)
        }
    }

    func row3Style(@ViewBuilder content: @escaping (Row3Configuration) -> some View) -> some View {
        self.transformEnvironment(\.row3StyleStack) { stack in
            let style = AnyRow3Style(content)
            stack.append(style)
        }
    }
}

// MARK: SaveActionStyle

public extension View {
    func saveActionStyle(_ style: some SaveActionStyle) -> some View {
        self.transformEnvironment(\.saveActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func saveActionStyle(@ViewBuilder content: @escaping (SaveActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.saveActionStyleStack) { stack in
            let style = AnySaveActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SecondaryActionStyle

public extension View {
    func secondaryActionStyle(_ style: some SecondaryActionStyle) -> some View {
        self.transformEnvironment(\.secondaryActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func secondaryActionStyle(@ViewBuilder content: @escaping (SecondaryActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.secondaryActionStyleStack) { stack in
            let style = AnySecondaryActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SecondaryTimestampStyle

public extension View {
    func secondaryTimestampStyle(_ style: some SecondaryTimestampStyle) -> some View {
        self.transformEnvironment(\.secondaryTimestampStyleStack) { stack in
            stack.append(style)
        }
    }

    func secondaryTimestampStyle(@ViewBuilder content: @escaping (SecondaryTimestampConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.secondaryTimestampStyleStack) { stack in
            let style = AnySecondaryTimestampStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SectionFooterStyle

public extension View {
    func sectionFooterStyle(_ style: some SectionFooterStyle) -> some View {
        self.transformEnvironment(\.sectionFooterStyleStack) { stack in
            stack.append(style)
        }
    }

    func sectionFooterStyle(@ViewBuilder content: @escaping (SectionFooterConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.sectionFooterStyleStack) { stack in
            let style = AnySectionFooterStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SectionHeaderStyle

public extension View {
    func sectionHeaderStyle(_ style: some SectionHeaderStyle) -> some View {
        self.transformEnvironment(\.sectionHeaderStyleStack) { stack in
            stack.append(style)
        }
    }

    func sectionHeaderStyle(@ViewBuilder content: @escaping (SectionHeaderConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.sectionHeaderStyleStack) { stack in
            let style = AnySectionHeaderStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SegmentedControlPickerStyle

public extension View {
    func segmentedControlPickerStyle(_ style: some SegmentedControlPickerStyle) -> some View {
        self.transformEnvironment(\.segmentedControlPickerStyleStack) { stack in
            stack.append(style)
        }
    }

    func segmentedControlPickerStyle(@ViewBuilder content: @escaping (SegmentedControlPickerConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.segmentedControlPickerStyleStack) { stack in
            let style = AnySegmentedControlPickerStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SelectAllActionStyle

public extension View {
    func selectAllActionStyle(_ style: some SelectAllActionStyle) -> some View {
        self.transformEnvironment(\.selectAllActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func selectAllActionStyle(@ViewBuilder content: @escaping (SelectAllActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.selectAllActionStyleStack) { stack in
            let style = AnySelectAllActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SelectedEntriesSectionTitleStyle

public extension View {
    func selectedEntriesSectionTitleStyle(_ style: some SelectedEntriesSectionTitleStyle) -> some View {
        self.transformEnvironment(\.selectedEntriesSectionTitleStyleStack) { stack in
            stack.append(style)
        }
    }

    func selectedEntriesSectionTitleStyle(@ViewBuilder content: @escaping (SelectedEntriesSectionTitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.selectedEntriesSectionTitleStyleStack) { stack in
            let style = AnySelectedEntriesSectionTitleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SideBarStyle

public extension View {
    func sideBarStyle(_ style: some SideBarStyle) -> some View {
        self.transformEnvironment(\.sideBarStyleStack) { stack in
            stack.append(style)
        }
    }

    func sideBarStyle(@ViewBuilder content: @escaping (SideBarConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.sideBarStyleStack) { stack in
            let style = AnySideBarStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SideBarListItemStyle

public extension View {
    func sideBarListItemStyle(_ style: some SideBarListItemStyle) -> some View {
        self.transformEnvironment(\.sideBarListItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func sideBarListItemStyle(@ViewBuilder content: @escaping (SideBarListItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.sideBarListItemStyleStack) { stack in
            let style = AnySideBarListItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SignInActionStyle

public extension View {
    func signInActionStyle(_ style: some SignInActionStyle) -> some View {
        self.transformEnvironment(\.signInActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func signInActionStyle(@ViewBuilder content: @escaping (SignInActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.signInActionStyleStack) { stack in
            let style = AnySignInActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SignatureCaptureViewStyle

public extension View {
    func signatureCaptureViewStyle(_ style: some SignatureCaptureViewStyle) -> some View {
        self.transformEnvironment(\.signatureCaptureViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func signatureCaptureViewStyle(@ViewBuilder content: @escaping (SignatureCaptureViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.signatureCaptureViewStyleStack) { stack in
            let style = AnySignatureCaptureViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SingleStepStyle

public extension View {
    func singleStepStyle(_ style: some SingleStepStyle) -> some View {
        self.transformEnvironment(\.singleStepStyleStack) { stack in
            stack.append(style)
        }
    }

    func singleStepStyle(@ViewBuilder content: @escaping (SingleStepConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.singleStepStyleStack) { stack in
            let style = AnySingleStepStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SortFilterViewStyle

public extension View {
    func sortFilterViewStyle(_ style: some SortFilterViewStyle) -> some View {
        self.transformEnvironment(\.sortFilterViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func sortFilterViewStyle(@ViewBuilder content: @escaping (SortFilterViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.sortFilterViewStyleStack) { stack in
            let style = AnySortFilterViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: StartSignatureActionStyle

public extension View {
    func startSignatureActionStyle(_ style: some StartSignatureActionStyle) -> some View {
        self.transformEnvironment(\.startSignatureActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func startSignatureActionStyle(@ViewBuilder content: @escaping (StartSignatureActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.startSignatureActionStyleStack) { stack in
            let style = AnyStartSignatureActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: StatusStyle

public extension View {
    func statusStyle(_ style: some StatusStyle) -> some View {
        self.transformEnvironment(\.statusStyleStack) { stack in
            stack.append(style)
        }
    }

    func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.statusStyleStack) { stack in
            let style = AnyStatusStyle(content)
            stack.append(style)
        }
    }
}

// MARK: StepProgressIndicatorStyle

public extension View {
    func stepProgressIndicatorStyle(_ style: some StepProgressIndicatorStyle) -> some View {
        self.transformEnvironment(\.stepProgressIndicatorStyleStack) { stack in
            stack.append(style)
        }
    }

    func stepProgressIndicatorStyle(@ViewBuilder content: @escaping (StepProgressIndicatorConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.stepProgressIndicatorStyleStack) { stack in
            let style = AnyStepProgressIndicatorStyle(content)
            stack.append(style)
        }
    }
}

// MARK: StepperFieldStyle

public extension View {
    func stepperFieldStyle(_ style: some StepperFieldStyle) -> some View {
        self.transformEnvironment(\.stepperFieldStyleStack) { stack in
            stack.append(style)
        }
    }

    func stepperFieldStyle(@ViewBuilder content: @escaping (StepperFieldConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.stepperFieldStyleStack) { stack in
            let style = AnyStepperFieldStyle(content)
            stack.append(style)
        }
    }
}

// MARK: StepperViewStyle

public extension View {
    func stepperViewStyle(_ style: some StepperViewStyle) -> some View {
        self.transformEnvironment(\.stepperViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func stepperViewStyle(@ViewBuilder content: @escaping (StepperViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.stepperViewStyleStack) { stack in
            let style = AnyStepperViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SubAttributeStyle

public extension View {
    func subAttributeStyle(_ style: some SubAttributeStyle) -> some View {
        self.transformEnvironment(\.subAttributeStyleStack) { stack in
            stack.append(style)
        }
    }

    func subAttributeStyle(@ViewBuilder content: @escaping (SubAttributeConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.subAttributeStyleStack) { stack in
            let style = AnySubAttributeStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SubstatusStyle

public extension View {
    func substatusStyle(_ style: some SubstatusStyle) -> some View {
        self.transformEnvironment(\.substatusStyleStack) { stack in
            stack.append(style)
        }
    }

    func substatusStyle(@ViewBuilder content: @escaping (SubstatusConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.substatusStyleStack) { stack in
            let style = AnySubstatusStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SubtitleStyle

public extension View {
    func subtitleStyle(_ style: some SubtitleStyle) -> some View {
        self.transformEnvironment(\.subtitleStyleStack) { stack in
            stack.append(style)
        }
    }

    func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.subtitleStyleStack) { stack in
            let style = AnySubtitleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SwitchStyle

public extension View {
    func switchStyle(_ style: some SwitchStyle) -> some View {
        self.transformEnvironment(\.switchStyleStack) { stack in
            stack.append(style)
        }
    }

    func switchStyle(@ViewBuilder content: @escaping (SwitchConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.switchStyleStack) { stack in
            let style = AnySwitchStyle(content)
            stack.append(style)
        }
    }
}

// MARK: SwitchViewStyle

public extension View {
    func switchViewStyle(_ style: some SwitchViewStyle) -> some View {
        self.transformEnvironment(\.switchViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func switchViewStyle(@ViewBuilder content: @escaping (SwitchViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.switchViewStyleStack) { stack in
            let style = AnySwitchViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TagStyle

public extension View {
    func tagStyle(_ style: some TagStyle) -> some View {
        self.transformEnvironment(\.tagStyleStack) { stack in
            stack.append(style)
        }
    }

    func tagStyle(@ViewBuilder content: @escaping (TagConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.tagStyleStack) { stack in
            let style = AnyTagStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TagsStyle

public extension View {
    func tagsStyle(_ style: some TagsStyle) -> some View {
        self.transformEnvironment(\.tagsStyleStack) { stack in
            stack.append(style)
        }
    }

    func tagsStyle(@ViewBuilder content: @escaping (TagsConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.tagsStyleStack) { stack in
            let style = AnyTagsStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TertiaryActionStyle

public extension View {
    func tertiaryActionStyle(_ style: some TertiaryActionStyle) -> some View {
        self.transformEnvironment(\.tertiaryActionStyleStack) { stack in
            stack.append(style)
        }
    }

    func tertiaryActionStyle(@ViewBuilder content: @escaping (TertiaryActionConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.tertiaryActionStyleStack) { stack in
            let style = AnyTertiaryActionStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TextFieldFormViewStyle

public extension View {
    func textFieldFormViewStyle(_ style: some TextFieldFormViewStyle) -> some View {
        self.transformEnvironment(\.textFieldFormViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func textFieldFormViewStyle(@ViewBuilder content: @escaping (TextFieldFormViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.textFieldFormViewStyleStack) { stack in
            let style = AnyTextFieldFormViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TextInputStyle

public extension View {
    func textInputStyle(_ style: some TextInputStyle) -> some View {
        self.transformEnvironment(\.textInputStyleStack) { stack in
            stack.append(style)
        }
    }

    func textInputStyle(@ViewBuilder content: @escaping (TextInputConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.textInputStyleStack) { stack in
            let style = AnyTextInputStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TextInputFieldStyle

public extension View {
    func textInputFieldStyle(_ style: some TextInputFieldStyle) -> some View {
        self.transformEnvironment(\.textInputFieldStyleStack) { stack in
            stack.append(style)
        }
    }

    func textInputFieldStyle(@ViewBuilder content: @escaping (TextInputFieldConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.textInputFieldStyleStack) { stack in
            let style = AnyTextInputFieldStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TextInputInfoViewStyle

extension View {
    func textInputInfoViewStyle(_ style: some TextInputInfoViewStyle) -> some View {
        self.transformEnvironment(\.textInputInfoViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func textInputInfoViewStyle(@ViewBuilder content: @escaping (TextInputInfoViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.textInputInfoViewStyleStack) { stack in
            let style = AnyTextInputInfoViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TextViewStyle

public extension View {
    func textViewStyle(_ style: some TextViewStyle) -> some View {
        self.transformEnvironment(\.textViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func textViewStyle(@ViewBuilder content: @escaping (TextViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.textViewStyleStack) { stack in
            let style = AnyTextViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TimelineStyle

public extension View {
    func timelineStyle(_ style: some TimelineStyle) -> some View {
        self.transformEnvironment(\.timelineStyleStack) { stack in
            stack.append(style)
        }
    }

    func timelineStyle(@ViewBuilder content: @escaping (TimelineConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.timelineStyleStack) { stack in
            let style = AnyTimelineStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TimelineMarkerStyle

public extension View {
    func timelineMarkerStyle(_ style: some TimelineMarkerStyle) -> some View {
        self.transformEnvironment(\.timelineMarkerStyleStack) { stack in
            stack.append(style)
        }
    }

    func timelineMarkerStyle(@ViewBuilder content: @escaping (TimelineMarkerConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.timelineMarkerStyleStack) { stack in
            let style = AnyTimelineMarkerStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TimelineNodeStyle

public extension View {
    func timelineNodeStyle(_ style: some TimelineNodeStyle) -> some View {
        self.transformEnvironment(\.timelineNodeStyleStack) { stack in
            stack.append(style)
        }
    }

    func timelineNodeStyle(@ViewBuilder content: @escaping (TimelineNodeConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.timelineNodeStyleStack) { stack in
            let style = AnyTimelineNodeStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TimelineNowIndicatorStyle

public extension View {
    func timelineNowIndicatorStyle(_ style: some TimelineNowIndicatorStyle) -> some View {
        self.transformEnvironment(\.timelineNowIndicatorStyleStack) { stack in
            stack.append(style)
        }
    }

    func timelineNowIndicatorStyle(@ViewBuilder content: @escaping (TimelineNowIndicatorConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.timelineNowIndicatorStyleStack) { stack in
            let style = AnyTimelineNowIndicatorStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TimelinePreviewStyle

public extension View {
    func timelinePreviewStyle(_ style: some TimelinePreviewStyle) -> some View {
        self.transformEnvironment(\.timelinePreviewStyleStack) { stack in
            stack.append(style)
        }
    }

    func timelinePreviewStyle(@ViewBuilder content: @escaping (TimelinePreviewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.timelinePreviewStyleStack) { stack in
            let style = AnyTimelinePreviewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TimelinePreviewItemStyle

public extension View {
    func timelinePreviewItemStyle(_ style: some TimelinePreviewItemStyle) -> some View {
        self.transformEnvironment(\.timelinePreviewItemStyleStack) { stack in
            stack.append(style)
        }
    }

    func timelinePreviewItemStyle(@ViewBuilder content: @escaping (TimelinePreviewItemConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.timelinePreviewItemStyleStack) { stack in
            let style = AnyTimelinePreviewItemStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TimestampStyle

public extension View {
    func timestampStyle(_ style: some TimestampStyle) -> some View {
        self.transformEnvironment(\.timestampStyleStack) { stack in
            stack.append(style)
        }
    }

    func timestampStyle(@ViewBuilder content: @escaping (TimestampConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.timestampStyleStack) { stack in
            let style = AnyTimestampStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TitleStyle

public extension View {
    func titleStyle(_ style: some TitleStyle) -> some View {
        self.transformEnvironment(\.titleStyleStack) { stack in
            stack.append(style)
        }
    }

    func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.titleStyleStack) { stack in
            let style = AnyTitleStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TitleFormViewStyle

public extension View {
    func titleFormViewStyle(_ style: some TitleFormViewStyle) -> some View {
        self.transformEnvironment(\.titleFormViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func titleFormViewStyle(@ViewBuilder content: @escaping (TitleFormViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.titleFormViewStyleStack) { stack in
            let style = AnyTitleFormViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ToastMessageStyle

public extension View {
    func toastMessageStyle(_ style: some ToastMessageStyle) -> some View {
        self.transformEnvironment(\.toastMessageStyleStack) { stack in
            stack.append(style)
        }
    }

    func toastMessageStyle(@ViewBuilder content: @escaping (ToastMessageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.toastMessageStyleStack) { stack in
            let style = AnyToastMessageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TopDividerStyle

public extension View {
    func topDividerStyle(_ style: some TopDividerStyle) -> some View {
        self.transformEnvironment(\.topDividerStyleStack) { stack in
            stack.append(style)
        }
    }

    func topDividerStyle(@ViewBuilder content: @escaping (TopDividerConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.topDividerStyleStack) { stack in
            let style = AnyTopDividerStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TrailingAccessoryStyle

public extension View {
    func trailingAccessoryStyle(_ style: some TrailingAccessoryStyle) -> some View {
        self.transformEnvironment(\.trailingAccessoryStyleStack) { stack in
            stack.append(style)
        }
    }

    func trailingAccessoryStyle(@ViewBuilder content: @escaping (TrailingAccessoryConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.trailingAccessoryStyleStack) { stack in
            let style = AnyTrailingAccessoryStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TrendStyle

public extension View {
    func trendStyle(_ style: some TrendStyle) -> some View {
        self.transformEnvironment(\.trendStyleStack) { stack in
            stack.append(style)
        }
    }

    func trendStyle(@ViewBuilder content: @escaping (TrendConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.trendStyleStack) { stack in
            let style = AnyTrendStyle(content)
            stack.append(style)
        }
    }
}

// MARK: TrendImageStyle

public extension View {
    func trendImageStyle(_ style: some TrendImageStyle) -> some View {
        self.transformEnvironment(\.trendImageStyleStack) { stack in
            stack.append(style)
        }
    }

    func trendImageStyle(@ViewBuilder content: @escaping (TrendImageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.trendImageStyleStack) { stack in
            let style = AnyTrendImageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: UpperThumbStyle

public extension View {
    func upperThumbStyle(_ style: some UpperThumbStyle) -> some View {
        self.transformEnvironment(\.upperThumbStyleStack) { stack in
            stack.append(style)
        }
    }

    func upperThumbStyle(@ViewBuilder content: @escaping (UpperThumbConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.upperThumbStyleStack) { stack in
            let style = AnyUpperThumbStyle(content)
            stack.append(style)
        }
    }
}

// MARK: UserConsentFormStyle

public extension View {
    func userConsentFormStyle(_ style: some UserConsentFormStyle) -> some View {
        self.transformEnvironment(\.userConsentFormStyleStack) { stack in
            stack.append(style)
        }
    }

    func userConsentFormStyle(@ViewBuilder content: @escaping (UserConsentFormConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.userConsentFormStyleStack) { stack in
            let style = AnyUserConsentFormStyle(content)
            stack.append(style)
        }
    }
}

// MARK: UserConsentPageStyle

public extension View {
    func userConsentPageStyle(_ style: some UserConsentPageStyle) -> some View {
        self.transformEnvironment(\.userConsentPageStyleStack) { stack in
            stack.append(style)
        }
    }

    func userConsentPageStyle(@ViewBuilder content: @escaping (UserConsentPageConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.userConsentPageStyleStack) { stack in
            let style = AnyUserConsentPageStyle(content)
            stack.append(style)
        }
    }
}

// MARK: UserConsentViewStyle

public extension View {
    func userConsentViewStyle(_ style: some UserConsentViewStyle) -> some View {
        self.transformEnvironment(\.userConsentViewStyleStack) { stack in
            stack.append(style)
        }
    }

    func userConsentViewStyle(@ViewBuilder content: @escaping (UserConsentViewConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.userConsentViewStyleStack) { stack in
            let style = AnyUserConsentViewStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ValueStyle

public extension View {
    func valueStyle(_ style: some ValueStyle) -> some View {
        self.transformEnvironment(\.valueStyleStack) { stack in
            stack.append(style)
        }
    }

    func valueStyle(@ViewBuilder content: @escaping (ValueConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.valueStyleStack) { stack in
            let style = AnyValueStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ValueLabelStyle

public extension View {
    func valueLabelStyle(_ style: some ValueLabelStyle) -> some View {
        self.transformEnvironment(\.valueLabelStyleStack) { stack in
            stack.append(style)
        }
    }

    func valueLabelStyle(@ViewBuilder content: @escaping (ValueLabelConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.valueLabelStyleStack) { stack in
            let style = AnyValueLabelStyle(content)
            stack.append(style)
        }
    }
}

// MARK: ValuePickerStyle

public extension View {
    func valuePickerStyle(_ style: some ValuePickerStyle) -> some View {
        self.transformEnvironment(\.valuePickerStyleStack) { stack in
            stack.append(style)
        }
    }

    func valuePickerStyle(@ViewBuilder content: @escaping (ValuePickerConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.valuePickerStyleStack) { stack in
            let style = AnyValuePickerStyle(content)
            stack.append(style)
        }
    }
}

// MARK: WatermarkStyle

public extension View {
    func watermarkStyle(_ style: some WatermarkStyle) -> some View {
        self.transformEnvironment(\.watermarkStyleStack) { stack in
            stack.append(style)
        }
    }

    func watermarkStyle(@ViewBuilder content: @escaping (WatermarkConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.watermarkStyleStack) { stack in
            let style = AnyWatermarkStyle(content)
            stack.append(style)
        }
    }
}

// MARK: WelcomeScreenStyle

public extension View {
    func welcomeScreenStyle(_ style: some WelcomeScreenStyle) -> some View {
        self.transformEnvironment(\.welcomeScreenStyleStack) { stack in
            stack.append(style)
        }
    }

    func welcomeScreenStyle(@ViewBuilder content: @escaping (WelcomeScreenConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.welcomeScreenStyleStack) { stack in
            let style = AnyWelcomeScreenStyle(content)
            stack.append(style)
        }
    }
}

// MARK: XmarkStyle

public extension View {
    func xmarkStyle(_ style: some XmarkStyle) -> some View {
        self.transformEnvironment(\.xmarkStyleStack) { stack in
            stack.append(style)
        }
    }

    func xmarkStyle(@ViewBuilder content: @escaping (XmarkConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.xmarkStyleStack) { stack in
            let style = AnyXmarkStyle(content)
            stack.append(style)
        }
    }
}
