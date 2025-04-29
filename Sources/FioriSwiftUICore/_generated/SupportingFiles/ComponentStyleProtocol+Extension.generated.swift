// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: AINoticeStyle

public extension AINoticeStyle where Self == AINoticeBaseStyle {
    static var base: AINoticeBaseStyle {
        AINoticeBaseStyle()
    }
}

public extension AINoticeStyle where Self == AINoticeFioriStyle {
    static var fiori: AINoticeFioriStyle {
        AINoticeFioriStyle()
    }
}

public struct AINoticeIconStyle: AINoticeStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: AINoticeConfiguration) -> some View {
        AINotice(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension AINoticeStyle where Self == AINoticeIconStyle {
    static func iconStyle(_ style: some IconStyle) -> AINoticeIconStyle {
        AINoticeIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> AINoticeIconStyle {
        let style = AnyIconStyle(content)
        return AINoticeIconStyle(style: style)
    }
}

// MARK: AccessoryIconStyle

public extension AccessoryIconStyle where Self == AccessoryIconBaseStyle {
    static var base: AccessoryIconBaseStyle {
        AccessoryIconBaseStyle()
    }
}

public extension AccessoryIconStyle where Self == AccessoryIconFioriStyle {
    static var fiori: AccessoryIconFioriStyle {
        AccessoryIconFioriStyle()
    }
}

// MARK: ActionStyle

public extension ActionStyle where Self == ActionBaseStyle {
    static var base: ActionBaseStyle {
        ActionBaseStyle()
    }
}

public extension ActionStyle where Self == ActionFioriStyle {
    static var fiori: ActionFioriStyle {
        ActionFioriStyle()
    }
}

// MARK: ActivationScreenStyle

public extension ActivationScreenStyle where Self == ActivationScreenBaseStyle {
    static var base: ActivationScreenBaseStyle {
        ActivationScreenBaseStyle()
    }
}

public extension ActivationScreenStyle where Self == ActivationScreenFioriStyle {
    static var fiori: ActivationScreenFioriStyle {
        ActivationScreenFioriStyle()
    }
}

public struct ActivationScreenTitleStyle: ActivationScreenStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ActivationScreenConfiguration) -> some View {
        ActivationScreen(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ActivationScreenStyle where Self == ActivationScreenTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ActivationScreenTitleStyle {
        ActivationScreenTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ActivationScreenTitleStyle {
        let style = AnyTitleStyle(content)
        return ActivationScreenTitleStyle(style: style)
    }
}

public struct ActivationScreenDescriptionTextStyle: ActivationScreenStyle {
    let style: any DescriptionTextStyle

    public func makeBody(_ configuration: ActivationScreenConfiguration) -> some View {
        ActivationScreen(configuration)
            .descriptionTextStyle(self.style)
            .typeErased
    }
}

public extension ActivationScreenStyle where Self == ActivationScreenDescriptionTextStyle {
    static func descriptionTextStyle(_ style: some DescriptionTextStyle) -> ActivationScreenDescriptionTextStyle {
        ActivationScreenDescriptionTextStyle(style: style)
    }

    static func descriptionTextStyle(@ViewBuilder content: @escaping (DescriptionTextConfiguration) -> some View) -> ActivationScreenDescriptionTextStyle {
        let style = AnyDescriptionTextStyle(content)
        return ActivationScreenDescriptionTextStyle(style: style)
    }
}

public struct ActivationScreenFootnoteStyle: ActivationScreenStyle {
    let style: any FootnoteStyle

    public func makeBody(_ configuration: ActivationScreenConfiguration) -> some View {
        ActivationScreen(configuration)
            .footnoteStyle(self.style)
            .typeErased
    }
}

public extension ActivationScreenStyle where Self == ActivationScreenFootnoteStyle {
    static func footnoteStyle(_ style: some FootnoteStyle) -> ActivationScreenFootnoteStyle {
        ActivationScreenFootnoteStyle(style: style)
    }

    static func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> ActivationScreenFootnoteStyle {
        let style = AnyFootnoteStyle(content)
        return ActivationScreenFootnoteStyle(style: style)
    }
}

public struct ActivationScreenActionStyle: ActivationScreenStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: ActivationScreenConfiguration) -> some View {
        ActivationScreen(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension ActivationScreenStyle where Self == ActivationScreenActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> ActivationScreenActionStyle {
        ActivationScreenActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> ActivationScreenActionStyle {
        let style = AnyActionStyle(content)
        return ActivationScreenActionStyle(style: style)
    }
}

public struct ActivationScreenSecondaryActionStyle: ActivationScreenStyle {
    let style: any SecondaryActionStyle

    public func makeBody(_ configuration: ActivationScreenConfiguration) -> some View {
        ActivationScreen(configuration)
            .secondaryActionStyle(self.style)
            .typeErased
    }
}

public extension ActivationScreenStyle where Self == ActivationScreenSecondaryActionStyle {
    static func secondaryActionStyle(_ style: some SecondaryActionStyle) -> ActivationScreenSecondaryActionStyle {
        ActivationScreenSecondaryActionStyle(style: style)
    }

    static func secondaryActionStyle(@ViewBuilder content: @escaping (SecondaryActionConfiguration) -> some View) -> ActivationScreenSecondaryActionStyle {
        let style = AnySecondaryActionStyle(content)
        return ActivationScreenSecondaryActionStyle(style: style)
    }
}

// MARK: ActiveTrackStyle

public extension ActiveTrackStyle where Self == ActiveTrackBaseStyle {
    static var base: ActiveTrackBaseStyle {
        ActiveTrackBaseStyle()
    }
}

public extension ActiveTrackStyle where Self == ActiveTrackFioriStyle {
    static var fiori: ActiveTrackFioriStyle {
        ActiveTrackFioriStyle()
    }
}

// MARK: ActivityItemStyle

public extension ActivityItemStyle where Self == ActivityItemBaseStyle {
    static var base: ActivityItemBaseStyle {
        ActivityItemBaseStyle()
    }
}

public extension ActivityItemStyle where Self == ActivityItemFioriStyle {
    static var fiori: ActivityItemFioriStyle {
        ActivityItemFioriStyle()
    }
}

public struct ActivityItemIconStyle: ActivityItemStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: ActivityItemConfiguration) -> some View {
        ActivityItem(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension ActivityItemStyle where Self == ActivityItemIconStyle {
    static func iconStyle(_ style: some IconStyle) -> ActivityItemIconStyle {
        ActivityItemIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> ActivityItemIconStyle {
        let style = AnyIconStyle(content)
        return ActivityItemIconStyle(style: style)
    }
}

public struct ActivityItemSubtitleStyle: ActivityItemStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: ActivityItemConfiguration) -> some View {
        ActivityItem(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension ActivityItemStyle where Self == ActivityItemSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> ActivityItemSubtitleStyle {
        ActivityItemSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> ActivityItemSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return ActivityItemSubtitleStyle(style: style)
    }
}

// MARK: ActivityItemsStyle

public extension ActivityItemsStyle where Self == ActivityItemsBaseStyle {
    static var base: ActivityItemsBaseStyle {
        ActivityItemsBaseStyle()
    }
}

public extension ActivityItemsStyle where Self == ActivityItemsFioriStyle {
    static var fiori: ActivityItemsFioriStyle {
        ActivityItemsFioriStyle()
    }
}

// MARK: AgreeActionStyle

public extension AgreeActionStyle where Self == AgreeActionBaseStyle {
    static var base: AgreeActionBaseStyle {
        AgreeActionBaseStyle()
    }
}

public extension AgreeActionStyle where Self == AgreeActionFioriStyle {
    static var fiori: AgreeActionFioriStyle {
        AgreeActionFioriStyle()
    }
}

// MARK: AllEntriesSectionTitleStyle

public extension AllEntriesSectionTitleStyle where Self == AllEntriesSectionTitleBaseStyle {
    static var base: AllEntriesSectionTitleBaseStyle {
        AllEntriesSectionTitleBaseStyle()
    }
}

public extension AllEntriesSectionTitleStyle where Self == AllEntriesSectionTitleFioriStyle {
    static var fiori: AllEntriesSectionTitleFioriStyle {
        AllEntriesSectionTitleFioriStyle()
    }
}

// MARK: AllowActionStyle

public extension AllowActionStyle where Self == AllowActionBaseStyle {
    static var base: AllowActionBaseStyle {
        AllowActionBaseStyle()
    }
}

public extension AllowActionStyle where Self == AllowActionFioriStyle {
    static var fiori: AllowActionFioriStyle {
        AllowActionFioriStyle()
    }
}

// MARK: ApplyActionStyle

public extension ApplyActionStyle where Self == ApplyActionBaseStyle {
    static var base: ApplyActionBaseStyle {
        ApplyActionBaseStyle()
    }
}

public extension ApplyActionStyle where Self == ApplyActionFioriStyle {
    static var fiori: ApplyActionFioriStyle {
        ApplyActionFioriStyle()
    }
}

// MARK: AttachmentButtonImageStyle

public extension AttachmentButtonImageStyle where Self == AttachmentButtonImageBaseStyle {
    static var base: AttachmentButtonImageBaseStyle {
        AttachmentButtonImageBaseStyle()
    }
}

public extension AttachmentButtonImageStyle where Self == AttachmentButtonImageFioriStyle {
    static var fiori: AttachmentButtonImageFioriStyle {
        AttachmentButtonImageFioriStyle()
    }
}

// MARK: AttachmentStyle

public extension AttachmentStyle where Self == AttachmentBaseStyle {
    static var base: AttachmentBaseStyle {
        AttachmentBaseStyle()
    }
}

public extension AttachmentStyle where Self == AttachmentFioriStyle {
    static var fiori: AttachmentFioriStyle {
        AttachmentFioriStyle()
    }
}

public struct AttachmentAttachmentTitleStyle: AttachmentStyle {
    let style: any AttachmentTitleStyle

    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        Attachment(configuration)
            .attachmentTitleStyle(self.style)
            .typeErased
    }
}

public extension AttachmentStyle where Self == AttachmentAttachmentTitleStyle {
    static func attachmentTitleStyle(_ style: some AttachmentTitleStyle) -> AttachmentAttachmentTitleStyle {
        AttachmentAttachmentTitleStyle(style: style)
    }

    static func attachmentTitleStyle(@ViewBuilder content: @escaping (AttachmentTitleConfiguration) -> some View) -> AttachmentAttachmentTitleStyle {
        let style = AnyAttachmentTitleStyle(content)
        return AttachmentAttachmentTitleStyle(style: style)
    }
}

public struct AttachmentAttachmentSubtitleStyle: AttachmentStyle {
    let style: any AttachmentSubtitleStyle

    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        Attachment(configuration)
            .attachmentSubtitleStyle(self.style)
            .typeErased
    }
}

public extension AttachmentStyle where Self == AttachmentAttachmentSubtitleStyle {
    static func attachmentSubtitleStyle(_ style: some AttachmentSubtitleStyle) -> AttachmentAttachmentSubtitleStyle {
        AttachmentAttachmentSubtitleStyle(style: style)
    }

    static func attachmentSubtitleStyle(@ViewBuilder content: @escaping (AttachmentSubtitleConfiguration) -> some View) -> AttachmentAttachmentSubtitleStyle {
        let style = AnyAttachmentSubtitleStyle(content)
        return AttachmentAttachmentSubtitleStyle(style: style)
    }
}

public struct AttachmentAttachmentFootnoteStyle: AttachmentStyle {
    let style: any AttachmentFootnoteStyle

    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        Attachment(configuration)
            .attachmentFootnoteStyle(self.style)
            .typeErased
    }
}

public extension AttachmentStyle where Self == AttachmentAttachmentFootnoteStyle {
    static func attachmentFootnoteStyle(_ style: some AttachmentFootnoteStyle) -> AttachmentAttachmentFootnoteStyle {
        AttachmentAttachmentFootnoteStyle(style: style)
    }

    static func attachmentFootnoteStyle(@ViewBuilder content: @escaping (AttachmentFootnoteConfiguration) -> some View) -> AttachmentAttachmentFootnoteStyle {
        let style = AnyAttachmentFootnoteStyle(content)
        return AttachmentAttachmentFootnoteStyle(style: style)
    }
}

// MARK: AttachmentFootnoteStyle

public extension AttachmentFootnoteStyle where Self == AttachmentFootnoteBaseStyle {
    static var base: AttachmentFootnoteBaseStyle {
        AttachmentFootnoteBaseStyle()
    }
}

public extension AttachmentFootnoteStyle where Self == AttachmentFootnoteFioriStyle {
    static var fiori: AttachmentFootnoteFioriStyle {
        AttachmentFootnoteFioriStyle()
    }
}

// MARK: AttachmentGroupStyle

public extension AttachmentGroupStyle where Self == AttachmentGroupBaseStyle {
    static var base: AttachmentGroupBaseStyle {
        AttachmentGroupBaseStyle()
    }
}

public extension AttachmentGroupStyle where Self == AttachmentGroupFioriStyle {
    static var fiori: AttachmentGroupFioriStyle {
        AttachmentGroupFioriStyle()
    }
}

public struct AttachmentGroupTitleStyle: AttachmentGroupStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: AttachmentGroupConfiguration) -> some View {
        AttachmentGroup(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension AttachmentGroupStyle where Self == AttachmentGroupTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> AttachmentGroupTitleStyle {
        AttachmentGroupTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> AttachmentGroupTitleStyle {
        let style = AnyTitleStyle(content)
        return AttachmentGroupTitleStyle(style: style)
    }
}

// MARK: AttachmentSubtitleStyle

public extension AttachmentSubtitleStyle where Self == AttachmentSubtitleBaseStyle {
    static var base: AttachmentSubtitleBaseStyle {
        AttachmentSubtitleBaseStyle()
    }
}

public extension AttachmentSubtitleStyle where Self == AttachmentSubtitleFioriStyle {
    static var fiori: AttachmentSubtitleFioriStyle {
        AttachmentSubtitleFioriStyle()
    }
}

// MARK: AttachmentThumbnailStyle

public extension AttachmentThumbnailStyle where Self == AttachmentThumbnailBaseStyle {
    static var base: AttachmentThumbnailBaseStyle {
        AttachmentThumbnailBaseStyle()
    }
}

public extension AttachmentThumbnailStyle where Self == AttachmentThumbnailFioriStyle {
    static var fiori: AttachmentThumbnailFioriStyle {
        AttachmentThumbnailFioriStyle()
    }
}

// MARK: AttachmentTitleStyle

public extension AttachmentTitleStyle where Self == AttachmentTitleBaseStyle {
    static var base: AttachmentTitleBaseStyle {
        AttachmentTitleBaseStyle()
    }
}

public extension AttachmentTitleStyle where Self == AttachmentTitleFioriStyle {
    static var fiori: AttachmentTitleFioriStyle {
        AttachmentTitleFioriStyle()
    }
}

// MARK: AttributeStyle

public extension AttributeStyle where Self == AttributeBaseStyle {
    static var base: AttributeBaseStyle {
        AttributeBaseStyle()
    }
}

public extension AttributeStyle where Self == AttributeFioriStyle {
    static var fiori: AttributeFioriStyle {
        AttributeFioriStyle()
    }
}

// MARK: AuthInputStyle

public extension AuthInputStyle where Self == AuthInputBaseStyle {
    static var base: AuthInputBaseStyle {
        AuthInputBaseStyle()
    }
}

public extension AuthInputStyle where Self == AuthInputFioriStyle {
    static var fiori: AuthInputFioriStyle {
        AuthInputFioriStyle()
    }
}

// MARK: AuthenticationStyle

public extension AuthenticationStyle where Self == AuthenticationBaseStyle {
    static var base: AuthenticationBaseStyle {
        AuthenticationBaseStyle()
    }
}

public extension AuthenticationStyle where Self == AuthenticationFioriStyle {
    static var fiori: AuthenticationFioriStyle {
        AuthenticationFioriStyle()
    }
}

public struct AuthenticationDetailImageStyle: AuthenticationStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: AuthenticationConfiguration) -> some View {
        Authentication(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension AuthenticationStyle where Self == AuthenticationDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> AuthenticationDetailImageStyle {
        AuthenticationDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> AuthenticationDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return AuthenticationDetailImageStyle(style: style)
    }
}

public struct AuthenticationTitleStyle: AuthenticationStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: AuthenticationConfiguration) -> some View {
        Authentication(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension AuthenticationStyle where Self == AuthenticationTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> AuthenticationTitleStyle {
        AuthenticationTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> AuthenticationTitleStyle {
        let style = AnyTitleStyle(content)
        return AuthenticationTitleStyle(style: style)
    }
}

public struct AuthenticationSubtitleStyle: AuthenticationStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: AuthenticationConfiguration) -> some View {
        Authentication(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension AuthenticationStyle where Self == AuthenticationSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> AuthenticationSubtitleStyle {
        AuthenticationSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> AuthenticationSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return AuthenticationSubtitleStyle(style: style)
    }
}

public struct AuthenticationAuthInputStyle: AuthenticationStyle {
    let style: any AuthInputStyle

    public func makeBody(_ configuration: AuthenticationConfiguration) -> some View {
        Authentication(configuration)
            .authInputStyle(self.style)
            .typeErased
    }
}

public extension AuthenticationStyle where Self == AuthenticationAuthInputStyle {
    static func authInputStyle(_ style: some AuthInputStyle) -> AuthenticationAuthInputStyle {
        AuthenticationAuthInputStyle(style: style)
    }

    static func authInputStyle(@ViewBuilder content: @escaping (AuthInputConfiguration) -> some View) -> AuthenticationAuthInputStyle {
        let style = AnyAuthInputStyle(content)
        return AuthenticationAuthInputStyle(style: style)
    }
}

public struct AuthenticationSignInActionStyle: AuthenticationStyle {
    let style: any SignInActionStyle

    public func makeBody(_ configuration: AuthenticationConfiguration) -> some View {
        Authentication(configuration)
            .signInActionStyle(self.style)
            .typeErased
    }
}

public extension AuthenticationStyle where Self == AuthenticationSignInActionStyle {
    static func signInActionStyle(_ style: some SignInActionStyle) -> AuthenticationSignInActionStyle {
        AuthenticationSignInActionStyle(style: style)
    }

    static func signInActionStyle(@ViewBuilder content: @escaping (SignInActionConfiguration) -> some View) -> AuthenticationSignInActionStyle {
        let style = AnySignInActionStyle(content)
        return AuthenticationSignInActionStyle(style: style)
    }
}

// MARK: AvatarStackStyle

public extension AvatarStackStyle where Self == AvatarStackBaseStyle {
    static var base: AvatarStackBaseStyle {
        AvatarStackBaseStyle()
    }
}

public extension AvatarStackStyle where Self == AvatarStackFioriStyle {
    static var fiori: AvatarStackFioriStyle {
        AvatarStackFioriStyle()
    }
}

public struct AvatarStackAvatarsStyle: AvatarStackStyle {
    let style: any AvatarsStyle

    public func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
        AvatarStack(configuration)
            .avatarsStyle(self.style)
            .typeErased
    }
}

public extension AvatarStackStyle where Self == AvatarStackAvatarsStyle {
    static func avatarsStyle(_ style: some AvatarsStyle) -> AvatarStackAvatarsStyle {
        AvatarStackAvatarsStyle(style: style)
    }

    static func avatarsStyle(@ViewBuilder content: @escaping (AvatarsConfiguration) -> some View) -> AvatarStackAvatarsStyle {
        let style = AnyAvatarsStyle(content)
        return AvatarStackAvatarsStyle(style: style)
    }
}

public struct AvatarStackAvatarsTitleStyle: AvatarStackStyle {
    let style: any AvatarsTitleStyle

    public func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
        AvatarStack(configuration)
            .avatarsTitleStyle(self.style)
            .typeErased
    }
}

public extension AvatarStackStyle where Self == AvatarStackAvatarsTitleStyle {
    static func avatarsTitleStyle(_ style: some AvatarsTitleStyle) -> AvatarStackAvatarsTitleStyle {
        AvatarStackAvatarsTitleStyle(style: style)
    }

    static func avatarsTitleStyle(@ViewBuilder content: @escaping (AvatarsTitleConfiguration) -> some View) -> AvatarStackAvatarsTitleStyle {
        let style = AnyAvatarsTitleStyle(content)
        return AvatarStackAvatarsTitleStyle(style: style)
    }
}

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

// MARK: AvatarsTitleStyle

public extension AvatarsTitleStyle where Self == AvatarsTitleBaseStyle {
    static var base: AvatarsTitleBaseStyle {
        AvatarsTitleBaseStyle()
    }
}

public extension AvatarsTitleStyle where Self == AvatarsTitleFioriStyle {
    static var fiori: AvatarsTitleFioriStyle {
        AvatarsTitleFioriStyle()
    }
}

// MARK: BannerMessageStyle

public extension BannerMessageStyle where Self == BannerMessageBaseStyle {
    static var base: BannerMessageBaseStyle {
        BannerMessageBaseStyle()
    }
}

public extension BannerMessageStyle where Self == BannerMessageFioriStyle {
    static var fiori: BannerMessageFioriStyle {
        BannerMessageFioriStyle()
    }
}

public struct BannerMessageIconStyle: BannerMessageStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension BannerMessageStyle where Self == BannerMessageIconStyle {
    static func iconStyle(_ style: some IconStyle) -> BannerMessageIconStyle {
        BannerMessageIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> BannerMessageIconStyle {
        let style = AnyIconStyle(content)
        return BannerMessageIconStyle(style: style)
    }
}

public struct BannerMessageTitleStyle: BannerMessageStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension BannerMessageStyle where Self == BannerMessageTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> BannerMessageTitleStyle {
        BannerMessageTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> BannerMessageTitleStyle {
        let style = AnyTitleStyle(content)
        return BannerMessageTitleStyle(style: style)
    }
}

public struct BannerMessageCloseActionStyle: BannerMessageStyle {
    let style: any CloseActionStyle

    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .closeActionStyle(self.style)
            .typeErased
    }
}

public extension BannerMessageStyle where Self == BannerMessageCloseActionStyle {
    static func closeActionStyle(_ style: some CloseActionStyle) -> BannerMessageCloseActionStyle {
        BannerMessageCloseActionStyle(style: style)
    }

    static func closeActionStyle(@ViewBuilder content: @escaping (CloseActionConfiguration) -> some View) -> BannerMessageCloseActionStyle {
        let style = AnyCloseActionStyle(content)
        return BannerMessageCloseActionStyle(style: style)
    }
}

public struct BannerMessageTopDividerStyle: BannerMessageStyle {
    let style: any TopDividerStyle

    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .topDividerStyle(self.style)
            .typeErased
    }
}

public extension BannerMessageStyle where Self == BannerMessageTopDividerStyle {
    static func topDividerStyle(_ style: some TopDividerStyle) -> BannerMessageTopDividerStyle {
        BannerMessageTopDividerStyle(style: style)
    }

    static func topDividerStyle(@ViewBuilder content: @escaping (TopDividerConfiguration) -> some View) -> BannerMessageTopDividerStyle {
        let style = AnyTopDividerStyle(content)
        return BannerMessageTopDividerStyle(style: style)
    }
}

// MARK: BannerMultiMessageSheetStyle

public extension BannerMultiMessageSheetStyle where Self == BannerMultiMessageSheetBaseStyle {
    static var base: BannerMultiMessageSheetBaseStyle {
        BannerMultiMessageSheetBaseStyle()
    }
}

public extension BannerMultiMessageSheetStyle where Self == BannerMultiMessageSheetFioriStyle {
    static var fiori: BannerMultiMessageSheetFioriStyle {
        BannerMultiMessageSheetFioriStyle()
    }
}

public struct BannerMultiMessageSheetTitleStyle: BannerMultiMessageSheetStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: BannerMultiMessageSheetConfiguration) -> some View {
        BannerMultiMessageSheet(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension BannerMultiMessageSheetStyle where Self == BannerMultiMessageSheetTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> BannerMultiMessageSheetTitleStyle {
        BannerMultiMessageSheetTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> BannerMultiMessageSheetTitleStyle {
        let style = AnyTitleStyle(content)
        return BannerMultiMessageSheetTitleStyle(style: style)
    }
}

public struct BannerMultiMessageSheetCloseActionStyle: BannerMultiMessageSheetStyle {
    let style: any CloseActionStyle

    public func makeBody(_ configuration: BannerMultiMessageSheetConfiguration) -> some View {
        BannerMultiMessageSheet(configuration)
            .closeActionStyle(self.style)
            .typeErased
    }
}

public extension BannerMultiMessageSheetStyle where Self == BannerMultiMessageSheetCloseActionStyle {
    static func closeActionStyle(_ style: some CloseActionStyle) -> BannerMultiMessageSheetCloseActionStyle {
        BannerMultiMessageSheetCloseActionStyle(style: style)
    }

    static func closeActionStyle(@ViewBuilder content: @escaping (CloseActionConfiguration) -> some View) -> BannerMultiMessageSheetCloseActionStyle {
        let style = AnyCloseActionStyle(content)
        return BannerMultiMessageSheetCloseActionStyle(style: style)
    }
}

// MARK: BodyTextStyle

public extension BodyTextStyle where Self == BodyTextBaseStyle {
    static var base: BodyTextBaseStyle {
        BodyTextBaseStyle()
    }
}

public extension BodyTextStyle where Self == BodyTextFioriStyle {
    static var fiori: BodyTextFioriStyle {
        BodyTextFioriStyle()
    }
}

// MARK: CancelActionStyle

public extension CancelActionStyle where Self == CancelActionBaseStyle {
    static var base: CancelActionBaseStyle {
        CancelActionBaseStyle()
    }
}

public extension CancelActionStyle where Self == CancelActionFioriStyle {
    static var fiori: CancelActionFioriStyle {
        CancelActionFioriStyle()
    }
}

// MARK: CardBodyStyle

public extension CardBodyStyle where Self == CardBodyBaseStyle {
    static var base: CardBodyBaseStyle {
        CardBodyBaseStyle()
    }
}

public extension CardBodyStyle where Self == CardBodyFioriStyle {
    static var fiori: CardBodyFioriStyle {
        CardBodyFioriStyle()
    }
}

// MARK: CardStyle

public extension CardStyle where Self == CardBaseStyle {
    static var base: CardBaseStyle {
        CardBaseStyle()
    }
}

public extension CardStyle where Self == CardFioriStyle {
    static var fiori: CardFioriStyle {
        CardFioriStyle()
    }
}

public struct CardMediaImageStyle: CardStyle {
    let style: any MediaImageStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .mediaImageStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardMediaImageStyle {
    static func mediaImageStyle(_ style: some MediaImageStyle) -> CardMediaImageStyle {
        CardMediaImageStyle(style: style)
    }

    static func mediaImageStyle(@ViewBuilder content: @escaping (MediaImageConfiguration) -> some View) -> CardMediaImageStyle {
        let style = AnyMediaImageStyle(content)
        return CardMediaImageStyle(style: style)
    }
}

public struct CardDescriptionStyle: CardStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> CardDescriptionStyle {
        CardDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> CardDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return CardDescriptionStyle(style: style)
    }
}

public struct CardTitleStyle: CardStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> CardTitleStyle {
        CardTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> CardTitleStyle {
        let style = AnyTitleStyle(content)
        return CardTitleStyle(style: style)
    }
}

public struct CardSubtitleStyle: CardStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> CardSubtitleStyle {
        CardSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> CardSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return CardSubtitleStyle(style: style)
    }
}

public struct CardIconsStyle: CardStyle {
    let style: any IconsStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .iconsStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardIconsStyle {
    static func iconsStyle(_ style: some IconsStyle) -> CardIconsStyle {
        CardIconsStyle(style: style)
    }

    static func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> CardIconsStyle {
        let style = AnyIconsStyle(content)
        return CardIconsStyle(style: style)
    }
}

public struct CardDetailImageStyle: CardStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> CardDetailImageStyle {
        CardDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> CardDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return CardDetailImageStyle(style: style)
    }
}

public struct CardHeaderActionStyle: CardStyle {
    let style: any HeaderActionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .headerActionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardHeaderActionStyle {
    static func headerActionStyle(_ style: some HeaderActionStyle) -> CardHeaderActionStyle {
        CardHeaderActionStyle(style: style)
    }

    static func headerActionStyle(@ViewBuilder content: @escaping (HeaderActionConfiguration) -> some View) -> CardHeaderActionStyle {
        let style = AnyHeaderActionStyle(content)
        return CardHeaderActionStyle(style: style)
    }
}

public struct CardCounterStyle: CardStyle {
    let style: any CounterStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .counterStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardCounterStyle {
    static func counterStyle(_ style: some CounterStyle) -> CardCounterStyle {
        CardCounterStyle(style: style)
    }

    static func counterStyle(@ViewBuilder content: @escaping (CounterConfiguration) -> some View) -> CardCounterStyle {
        let style = AnyCounterStyle(content)
        return CardCounterStyle(style: style)
    }
}

public struct CardRow1Style: CardStyle {
    let style: any Row1Style

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .row1Style(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardRow1Style {
    static func row1Style(_ style: some Row1Style) -> CardRow1Style {
        CardRow1Style(style: style)
    }

    static func row1Style(@ViewBuilder content: @escaping (Row1Configuration) -> some View) -> CardRow1Style {
        let style = AnyRow1Style(content)
        return CardRow1Style(style: style)
    }
}

public struct CardRow2Style: CardStyle {
    let style: any Row2Style

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .row2Style(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardRow2Style {
    static func row2Style(_ style: some Row2Style) -> CardRow2Style {
        CardRow2Style(style: style)
    }

    static func row2Style(@ViewBuilder content: @escaping (Row2Configuration) -> some View) -> CardRow2Style {
        let style = AnyRow2Style(content)
        return CardRow2Style(style: style)
    }
}

public struct CardRow3Style: CardStyle {
    let style: any Row3Style

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .row3Style(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardRow3Style {
    static func row3Style(_ style: some Row3Style) -> CardRow3Style {
        CardRow3Style(style: style)
    }

    static func row3Style(@ViewBuilder content: @escaping (Row3Configuration) -> some View) -> CardRow3Style {
        let style = AnyRow3Style(content)
        return CardRow3Style(style: style)
    }
}

public struct CardKpiStyle: CardStyle {
    let style: any KpiStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .kpiStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardKpiStyle {
    static func kpiStyle(_ style: some KpiStyle) -> CardKpiStyle {
        CardKpiStyle(style: style)
    }

    static func kpiStyle(@ViewBuilder content: @escaping (KpiConfiguration) -> some View) -> CardKpiStyle {
        let style = AnyKpiStyle(content)
        return CardKpiStyle(style: style)
    }
}

public struct CardKpiCaptionStyle: CardStyle {
    let style: any KpiCaptionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .kpiCaptionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardKpiCaptionStyle {
    static func kpiCaptionStyle(_ style: some KpiCaptionStyle) -> CardKpiCaptionStyle {
        CardKpiCaptionStyle(style: style)
    }

    static func kpiCaptionStyle(@ViewBuilder content: @escaping (KpiCaptionConfiguration) -> some View) -> CardKpiCaptionStyle {
        let style = AnyKpiCaptionStyle(content)
        return CardKpiCaptionStyle(style: style)
    }
}

public struct CardCardBodyStyle: CardStyle {
    let style: any CardBodyStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .cardBodyStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardCardBodyStyle {
    static func cardBodyStyle(_ style: some CardBodyStyle) -> CardCardBodyStyle {
        CardCardBodyStyle(style: style)
    }

    static func cardBodyStyle(@ViewBuilder content: @escaping (CardBodyConfiguration) -> some View) -> CardCardBodyStyle {
        let style = AnyCardBodyStyle(content)
        return CardCardBodyStyle(style: style)
    }
}

public struct CardActionStyle: CardStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> CardActionStyle {
        CardActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> CardActionStyle {
        let style = AnyActionStyle(content)
        return CardActionStyle(style: style)
    }
}

public struct CardSecondaryActionStyle: CardStyle {
    let style: any SecondaryActionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .secondaryActionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardSecondaryActionStyle {
    static func secondaryActionStyle(_ style: some SecondaryActionStyle) -> CardSecondaryActionStyle {
        CardSecondaryActionStyle(style: style)
    }

    static func secondaryActionStyle(@ViewBuilder content: @escaping (SecondaryActionConfiguration) -> some View) -> CardSecondaryActionStyle {
        let style = AnySecondaryActionStyle(content)
        return CardSecondaryActionStyle(style: style)
    }
}

public struct CardTertiaryActionStyle: CardStyle {
    let style: any TertiaryActionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .tertiaryActionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardTertiaryActionStyle {
    static func tertiaryActionStyle(_ style: some TertiaryActionStyle) -> CardTertiaryActionStyle {
        CardTertiaryActionStyle(style: style)
    }

    static func tertiaryActionStyle(@ViewBuilder content: @escaping (TertiaryActionConfiguration) -> some View) -> CardTertiaryActionStyle {
        let style = AnyTertiaryActionStyle(content)
        return CardTertiaryActionStyle(style: style)
    }
}

public struct CardOverflowActionStyle: CardStyle {
    let style: any OverflowActionStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .overflowActionStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardOverflowActionStyle {
    static func overflowActionStyle(_ style: some OverflowActionStyle) -> CardOverflowActionStyle {
        CardOverflowActionStyle(style: style)
    }

    static func overflowActionStyle(@ViewBuilder content: @escaping (OverflowActionConfiguration) -> some View) -> CardOverflowActionStyle {
        let style = AnyOverflowActionStyle(content)
        return CardOverflowActionStyle(style: style)
    }
}

public struct CardCardHeaderStyle: CardStyle {
    let style: any CardHeaderStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .cardHeaderStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardCardHeaderStyle {
    static func cardHeaderStyle(_ style: some CardHeaderStyle) -> CardCardHeaderStyle {
        CardCardHeaderStyle(style: style)
    }

    static func cardHeaderStyle(@ViewBuilder content: @escaping (CardHeaderConfiguration) -> some View) -> CardCardHeaderStyle {
        let style = AnyCardHeaderStyle(content)
        return CardCardHeaderStyle(style: style)
    }
}

public struct CardCardFooterStyle: CardStyle {
    let style: any CardFooterStyle

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .cardFooterStyle(self.style)
            .typeErased
    }
}

public extension CardStyle where Self == CardCardFooterStyle {
    static func cardFooterStyle(_ style: some CardFooterStyle) -> CardCardFooterStyle {
        CardCardFooterStyle(style: style)
    }

    static func cardFooterStyle(@ViewBuilder content: @escaping (CardFooterConfiguration) -> some View) -> CardCardFooterStyle {
        let style = AnyCardFooterStyle(content)
        return CardCardFooterStyle(style: style)
    }
}

// MARK: CardExtHeaderStyle

public extension CardExtHeaderStyle where Self == CardExtHeaderBaseStyle {
    static var base: CardExtHeaderBaseStyle {
        CardExtHeaderBaseStyle()
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderFioriStyle {
    static var fiori: CardExtHeaderFioriStyle {
        CardExtHeaderFioriStyle()
    }
}

public struct CardExtHeaderRow1Style: CardExtHeaderStyle {
    let style: any Row1Style

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .row1Style(self.style)
            .typeErased
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderRow1Style {
    static func row1Style(_ style: some Row1Style) -> CardExtHeaderRow1Style {
        CardExtHeaderRow1Style(style: style)
    }

    static func row1Style(@ViewBuilder content: @escaping (Row1Configuration) -> some View) -> CardExtHeaderRow1Style {
        let style = AnyRow1Style(content)
        return CardExtHeaderRow1Style(style: style)
    }
}

public struct CardExtHeaderRow2Style: CardExtHeaderStyle {
    let style: any Row2Style

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .row2Style(self.style)
            .typeErased
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderRow2Style {
    static func row2Style(_ style: some Row2Style) -> CardExtHeaderRow2Style {
        CardExtHeaderRow2Style(style: style)
    }

    static func row2Style(@ViewBuilder content: @escaping (Row2Configuration) -> some View) -> CardExtHeaderRow2Style {
        let style = AnyRow2Style(content)
        return CardExtHeaderRow2Style(style: style)
    }
}

public struct CardExtHeaderRow3Style: CardExtHeaderStyle {
    let style: any Row3Style

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .row3Style(self.style)
            .typeErased
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderRow3Style {
    static func row3Style(_ style: some Row3Style) -> CardExtHeaderRow3Style {
        CardExtHeaderRow3Style(style: style)
    }

    static func row3Style(@ViewBuilder content: @escaping (Row3Configuration) -> some View) -> CardExtHeaderRow3Style {
        let style = AnyRow3Style(content)
        return CardExtHeaderRow3Style(style: style)
    }
}

public struct CardExtHeaderKpiStyle: CardExtHeaderStyle {
    let style: any KpiStyle

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .kpiStyle(self.style)
            .typeErased
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderKpiStyle {
    static func kpiStyle(_ style: some KpiStyle) -> CardExtHeaderKpiStyle {
        CardExtHeaderKpiStyle(style: style)
    }

    static func kpiStyle(@ViewBuilder content: @escaping (KpiConfiguration) -> some View) -> CardExtHeaderKpiStyle {
        let style = AnyKpiStyle(content)
        return CardExtHeaderKpiStyle(style: style)
    }
}

public struct CardExtHeaderKpiCaptionStyle: CardExtHeaderStyle {
    let style: any KpiCaptionStyle

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .kpiCaptionStyle(self.style)
            .typeErased
    }
}

public extension CardExtHeaderStyle where Self == CardExtHeaderKpiCaptionStyle {
    static func kpiCaptionStyle(_ style: some KpiCaptionStyle) -> CardExtHeaderKpiCaptionStyle {
        CardExtHeaderKpiCaptionStyle(style: style)
    }

    static func kpiCaptionStyle(@ViewBuilder content: @escaping (KpiCaptionConfiguration) -> some View) -> CardExtHeaderKpiCaptionStyle {
        let style = AnyKpiCaptionStyle(content)
        return CardExtHeaderKpiCaptionStyle(style: style)
    }
}

// MARK: CardFooterStyle

public extension CardFooterStyle where Self == CardFooterBaseStyle {
    static var base: CardFooterBaseStyle {
        CardFooterBaseStyle()
    }
}

public extension CardFooterStyle where Self == CardFooterFioriStyle {
    static var fiori: CardFooterFioriStyle {
        CardFooterFioriStyle()
    }
}

public struct CardFooterActionStyle: CardFooterStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension CardFooterStyle where Self == CardFooterActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> CardFooterActionStyle {
        CardFooterActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> CardFooterActionStyle {
        let style = AnyActionStyle(content)
        return CardFooterActionStyle(style: style)
    }
}

public struct CardFooterSecondaryActionStyle: CardFooterStyle {
    let style: any SecondaryActionStyle

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .secondaryActionStyle(self.style)
            .typeErased
    }
}

public extension CardFooterStyle where Self == CardFooterSecondaryActionStyle {
    static func secondaryActionStyle(_ style: some SecondaryActionStyle) -> CardFooterSecondaryActionStyle {
        CardFooterSecondaryActionStyle(style: style)
    }

    static func secondaryActionStyle(@ViewBuilder content: @escaping (SecondaryActionConfiguration) -> some View) -> CardFooterSecondaryActionStyle {
        let style = AnySecondaryActionStyle(content)
        return CardFooterSecondaryActionStyle(style: style)
    }
}

public struct CardFooterTertiaryActionStyle: CardFooterStyle {
    let style: any TertiaryActionStyle

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .tertiaryActionStyle(self.style)
            .typeErased
    }
}

public extension CardFooterStyle where Self == CardFooterTertiaryActionStyle {
    static func tertiaryActionStyle(_ style: some TertiaryActionStyle) -> CardFooterTertiaryActionStyle {
        CardFooterTertiaryActionStyle(style: style)
    }

    static func tertiaryActionStyle(@ViewBuilder content: @escaping (TertiaryActionConfiguration) -> some View) -> CardFooterTertiaryActionStyle {
        let style = AnyTertiaryActionStyle(content)
        return CardFooterTertiaryActionStyle(style: style)
    }
}

public struct CardFooterOverflowActionStyle: CardFooterStyle {
    let style: any OverflowActionStyle

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .overflowActionStyle(self.style)
            .typeErased
    }
}

public extension CardFooterStyle where Self == CardFooterOverflowActionStyle {
    static func overflowActionStyle(_ style: some OverflowActionStyle) -> CardFooterOverflowActionStyle {
        CardFooterOverflowActionStyle(style: style)
    }

    static func overflowActionStyle(@ViewBuilder content: @escaping (OverflowActionConfiguration) -> some View) -> CardFooterOverflowActionStyle {
        let style = AnyOverflowActionStyle(content)
        return CardFooterOverflowActionStyle(style: style)
    }
}

// MARK: CardHeaderStyle

public extension CardHeaderStyle where Self == CardHeaderBaseStyle {
    static var base: CardHeaderBaseStyle {
        CardHeaderBaseStyle()
    }
}

public extension CardHeaderStyle where Self == CardHeaderFioriStyle {
    static var fiori: CardHeaderFioriStyle {
        CardHeaderFioriStyle()
    }
}

public struct CardHeaderMediaImageStyle: CardHeaderStyle {
    let style: any MediaImageStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .mediaImageStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderMediaImageStyle {
    static func mediaImageStyle(_ style: some MediaImageStyle) -> CardHeaderMediaImageStyle {
        CardHeaderMediaImageStyle(style: style)
    }

    static func mediaImageStyle(@ViewBuilder content: @escaping (MediaImageConfiguration) -> some View) -> CardHeaderMediaImageStyle {
        let style = AnyMediaImageStyle(content)
        return CardHeaderMediaImageStyle(style: style)
    }
}

public struct CardHeaderDescriptionStyle: CardHeaderStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> CardHeaderDescriptionStyle {
        CardHeaderDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> CardHeaderDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return CardHeaderDescriptionStyle(style: style)
    }
}

public struct CardHeaderTitleStyle: CardHeaderStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> CardHeaderTitleStyle {
        CardHeaderTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> CardHeaderTitleStyle {
        let style = AnyTitleStyle(content)
        return CardHeaderTitleStyle(style: style)
    }
}

public struct CardHeaderSubtitleStyle: CardHeaderStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> CardHeaderSubtitleStyle {
        CardHeaderSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> CardHeaderSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return CardHeaderSubtitleStyle(style: style)
    }
}

public struct CardHeaderIconsStyle: CardHeaderStyle {
    let style: any IconsStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .iconsStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderIconsStyle {
    static func iconsStyle(_ style: some IconsStyle) -> CardHeaderIconsStyle {
        CardHeaderIconsStyle(style: style)
    }

    static func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> CardHeaderIconsStyle {
        let style = AnyIconsStyle(content)
        return CardHeaderIconsStyle(style: style)
    }
}

public struct CardHeaderDetailImageStyle: CardHeaderStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> CardHeaderDetailImageStyle {
        CardHeaderDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> CardHeaderDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return CardHeaderDetailImageStyle(style: style)
    }
}

public struct CardHeaderHeaderActionStyle: CardHeaderStyle {
    let style: any HeaderActionStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .headerActionStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderHeaderActionStyle {
    static func headerActionStyle(_ style: some HeaderActionStyle) -> CardHeaderHeaderActionStyle {
        CardHeaderHeaderActionStyle(style: style)
    }

    static func headerActionStyle(@ViewBuilder content: @escaping (HeaderActionConfiguration) -> some View) -> CardHeaderHeaderActionStyle {
        let style = AnyHeaderActionStyle(content)
        return CardHeaderHeaderActionStyle(style: style)
    }
}

public struct CardHeaderCounterStyle: CardHeaderStyle {
    let style: any CounterStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .counterStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderCounterStyle {
    static func counterStyle(_ style: some CounterStyle) -> CardHeaderCounterStyle {
        CardHeaderCounterStyle(style: style)
    }

    static func counterStyle(@ViewBuilder content: @escaping (CounterConfiguration) -> some View) -> CardHeaderCounterStyle {
        let style = AnyCounterStyle(content)
        return CardHeaderCounterStyle(style: style)
    }
}

public struct CardHeaderRow1Style: CardHeaderStyle {
    let style: any Row1Style

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .row1Style(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderRow1Style {
    static func row1Style(_ style: some Row1Style) -> CardHeaderRow1Style {
        CardHeaderRow1Style(style: style)
    }

    static func row1Style(@ViewBuilder content: @escaping (Row1Configuration) -> some View) -> CardHeaderRow1Style {
        let style = AnyRow1Style(content)
        return CardHeaderRow1Style(style: style)
    }
}

public struct CardHeaderRow2Style: CardHeaderStyle {
    let style: any Row2Style

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .row2Style(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderRow2Style {
    static func row2Style(_ style: some Row2Style) -> CardHeaderRow2Style {
        CardHeaderRow2Style(style: style)
    }

    static func row2Style(@ViewBuilder content: @escaping (Row2Configuration) -> some View) -> CardHeaderRow2Style {
        let style = AnyRow2Style(content)
        return CardHeaderRow2Style(style: style)
    }
}

public struct CardHeaderRow3Style: CardHeaderStyle {
    let style: any Row3Style

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .row3Style(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderRow3Style {
    static func row3Style(_ style: some Row3Style) -> CardHeaderRow3Style {
        CardHeaderRow3Style(style: style)
    }

    static func row3Style(@ViewBuilder content: @escaping (Row3Configuration) -> some View) -> CardHeaderRow3Style {
        let style = AnyRow3Style(content)
        return CardHeaderRow3Style(style: style)
    }
}

public struct CardHeaderKpiStyle: CardHeaderStyle {
    let style: any KpiStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .kpiStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderKpiStyle {
    static func kpiStyle(_ style: some KpiStyle) -> CardHeaderKpiStyle {
        CardHeaderKpiStyle(style: style)
    }

    static func kpiStyle(@ViewBuilder content: @escaping (KpiConfiguration) -> some View) -> CardHeaderKpiStyle {
        let style = AnyKpiStyle(content)
        return CardHeaderKpiStyle(style: style)
    }
}

public struct CardHeaderKpiCaptionStyle: CardHeaderStyle {
    let style: any KpiCaptionStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .kpiCaptionStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderKpiCaptionStyle {
    static func kpiCaptionStyle(_ style: some KpiCaptionStyle) -> CardHeaderKpiCaptionStyle {
        CardHeaderKpiCaptionStyle(style: style)
    }

    static func kpiCaptionStyle(@ViewBuilder content: @escaping (KpiCaptionConfiguration) -> some View) -> CardHeaderKpiCaptionStyle {
        let style = AnyKpiCaptionStyle(content)
        return CardHeaderKpiCaptionStyle(style: style)
    }
}

public struct CardHeaderCardMediaStyle: CardHeaderStyle {
    let style: any CardMediaStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .cardMediaStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderCardMediaStyle {
    static func cardMediaStyle(_ style: some CardMediaStyle) -> CardHeaderCardMediaStyle {
        CardHeaderCardMediaStyle(style: style)
    }

    static func cardMediaStyle(@ViewBuilder content: @escaping (CardMediaConfiguration) -> some View) -> CardHeaderCardMediaStyle {
        let style = AnyCardMediaStyle(content)
        return CardHeaderCardMediaStyle(style: style)
    }
}

public struct CardHeaderCardMainHeaderStyle: CardHeaderStyle {
    let style: any CardMainHeaderStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .cardMainHeaderStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderCardMainHeaderStyle {
    static func cardMainHeaderStyle(_ style: some CardMainHeaderStyle) -> CardHeaderCardMainHeaderStyle {
        CardHeaderCardMainHeaderStyle(style: style)
    }

    static func cardMainHeaderStyle(@ViewBuilder content: @escaping (CardMainHeaderConfiguration) -> some View) -> CardHeaderCardMainHeaderStyle {
        let style = AnyCardMainHeaderStyle(content)
        return CardHeaderCardMainHeaderStyle(style: style)
    }
}

public struct CardHeaderCardExtHeaderStyle: CardHeaderStyle {
    let style: any CardExtHeaderStyle

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .cardExtHeaderStyle(self.style)
            .typeErased
    }
}

public extension CardHeaderStyle where Self == CardHeaderCardExtHeaderStyle {
    static func cardExtHeaderStyle(_ style: some CardExtHeaderStyle) -> CardHeaderCardExtHeaderStyle {
        CardHeaderCardExtHeaderStyle(style: style)
    }

    static func cardExtHeaderStyle(@ViewBuilder content: @escaping (CardExtHeaderConfiguration) -> some View) -> CardHeaderCardExtHeaderStyle {
        let style = AnyCardExtHeaderStyle(content)
        return CardHeaderCardExtHeaderStyle(style: style)
    }
}

// MARK: CardMainHeaderStyle

public extension CardMainHeaderStyle where Self == CardMainHeaderBaseStyle {
    static var base: CardMainHeaderBaseStyle {
        CardMainHeaderBaseStyle()
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderFioriStyle {
    static var fiori: CardMainHeaderFioriStyle {
        CardMainHeaderFioriStyle()
    }
}

public struct CardMainHeaderTitleStyle: CardMainHeaderStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> CardMainHeaderTitleStyle {
        CardMainHeaderTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> CardMainHeaderTitleStyle {
        let style = AnyTitleStyle(content)
        return CardMainHeaderTitleStyle(style: style)
    }
}

public struct CardMainHeaderSubtitleStyle: CardMainHeaderStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> CardMainHeaderSubtitleStyle {
        CardMainHeaderSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> CardMainHeaderSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return CardMainHeaderSubtitleStyle(style: style)
    }
}

public struct CardMainHeaderIconsStyle: CardMainHeaderStyle {
    let style: any IconsStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .iconsStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderIconsStyle {
    static func iconsStyle(_ style: some IconsStyle) -> CardMainHeaderIconsStyle {
        CardMainHeaderIconsStyle(style: style)
    }

    static func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> CardMainHeaderIconsStyle {
        let style = AnyIconsStyle(content)
        return CardMainHeaderIconsStyle(style: style)
    }
}

public struct CardMainHeaderDetailImageStyle: CardMainHeaderStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> CardMainHeaderDetailImageStyle {
        CardMainHeaderDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> CardMainHeaderDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return CardMainHeaderDetailImageStyle(style: style)
    }
}

public struct CardMainHeaderHeaderActionStyle: CardMainHeaderStyle {
    let style: any HeaderActionStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .headerActionStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderHeaderActionStyle {
    static func headerActionStyle(_ style: some HeaderActionStyle) -> CardMainHeaderHeaderActionStyle {
        CardMainHeaderHeaderActionStyle(style: style)
    }

    static func headerActionStyle(@ViewBuilder content: @escaping (HeaderActionConfiguration) -> some View) -> CardMainHeaderHeaderActionStyle {
        let style = AnyHeaderActionStyle(content)
        return CardMainHeaderHeaderActionStyle(style: style)
    }
}

public struct CardMainHeaderCounterStyle: CardMainHeaderStyle {
    let style: any CounterStyle

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .counterStyle(self.style)
            .typeErased
    }
}

public extension CardMainHeaderStyle where Self == CardMainHeaderCounterStyle {
    static func counterStyle(_ style: some CounterStyle) -> CardMainHeaderCounterStyle {
        CardMainHeaderCounterStyle(style: style)
    }

    static func counterStyle(@ViewBuilder content: @escaping (CounterConfiguration) -> some View) -> CardMainHeaderCounterStyle {
        let style = AnyCounterStyle(content)
        return CardMainHeaderCounterStyle(style: style)
    }
}

// MARK: CardMediaStyle

public extension CardMediaStyle where Self == CardMediaBaseStyle {
    static var base: CardMediaBaseStyle {
        CardMediaBaseStyle()
    }
}

public extension CardMediaStyle where Self == CardMediaFioriStyle {
    static var fiori: CardMediaFioriStyle {
        CardMediaFioriStyle()
    }
}

public struct CardMediaMediaImageStyle: CardMediaStyle {
    let style: any MediaImageStyle

    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        CardMedia(configuration)
            .mediaImageStyle(self.style)
            .typeErased
    }
}

public extension CardMediaStyle where Self == CardMediaMediaImageStyle {
    static func mediaImageStyle(_ style: some MediaImageStyle) -> CardMediaMediaImageStyle {
        CardMediaMediaImageStyle(style: style)
    }

    static func mediaImageStyle(@ViewBuilder content: @escaping (MediaImageConfiguration) -> some View) -> CardMediaMediaImageStyle {
        let style = AnyMediaImageStyle(content)
        return CardMediaMediaImageStyle(style: style)
    }
}

public struct CardMediaDescriptionStyle: CardMediaStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        CardMedia(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension CardMediaStyle where Self == CardMediaDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> CardMediaDescriptionStyle {
        CardMediaDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> CardMediaDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return CardMediaDescriptionStyle(style: style)
    }
}

// MARK: CheckoutIndicatorStyle

public extension CheckoutIndicatorStyle where Self == CheckoutIndicatorBaseStyle {
    static var base: CheckoutIndicatorBaseStyle {
        CheckoutIndicatorBaseStyle()
    }
}

public extension CheckoutIndicatorStyle where Self == CheckoutIndicatorFioriStyle {
    static var fiori: CheckoutIndicatorFioriStyle {
        CheckoutIndicatorFioriStyle()
    }
}

// MARK: ClearActionStyle

public extension ClearActionStyle where Self == ClearActionBaseStyle {
    static var base: ClearActionBaseStyle {
        ClearActionBaseStyle()
    }
}

public extension ClearActionStyle where Self == ClearActionFioriStyle {
    static var fiori: ClearActionFioriStyle {
        ClearActionFioriStyle()
    }
}

// MARK: CloseActionStyle

public extension CloseActionStyle where Self == CloseActionBaseStyle {
    static var base: CloseActionBaseStyle {
        CloseActionBaseStyle()
    }
}

public extension CloseActionStyle where Self == CloseActionFioriStyle {
    static var fiori: CloseActionFioriStyle {
        CloseActionFioriStyle()
    }
}

// MARK: ContactItemStyle

public extension ContactItemStyle where Self == ContactItemBaseStyle {
    static var base: ContactItemBaseStyle {
        ContactItemBaseStyle()
    }
}

public extension ContactItemStyle where Self == ContactItemFioriStyle {
    static var fiori: ContactItemFioriStyle {
        ContactItemFioriStyle()
    }
}

public struct ContactItemTitleStyle: ContactItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        ContactItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ContactItemStyle where Self == ContactItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ContactItemTitleStyle {
        ContactItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ContactItemTitleStyle {
        let style = AnyTitleStyle(content)
        return ContactItemTitleStyle(style: style)
    }
}

public struct ContactItemSubtitleStyle: ContactItemStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        ContactItem(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension ContactItemStyle where Self == ContactItemSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> ContactItemSubtitleStyle {
        ContactItemSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> ContactItemSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return ContactItemSubtitleStyle(style: style)
    }
}

public struct ContactItemDescriptionStyle: ContactItemStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        ContactItem(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension ContactItemStyle where Self == ContactItemDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> ContactItemDescriptionStyle {
        ContactItemDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> ContactItemDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return ContactItemDescriptionStyle(style: style)
    }
}

public struct ContactItemDetailImageStyle: ContactItemStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        ContactItem(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension ContactItemStyle where Self == ContactItemDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> ContactItemDetailImageStyle {
        ContactItemDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> ContactItemDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return ContactItemDetailImageStyle(style: style)
    }
}

public struct ContactItemActivityItemsStyle: ContactItemStyle {
    let style: any ActivityItemsStyle

    public func makeBody(_ configuration: ContactItemConfiguration) -> some View {
        ContactItem(configuration)
            .activityItemsStyle(self.style)
            .typeErased
    }
}

public extension ContactItemStyle where Self == ContactItemActivityItemsStyle {
    static func activityItemsStyle(_ style: some ActivityItemsStyle) -> ContactItemActivityItemsStyle {
        ContactItemActivityItemsStyle(style: style)
    }

    static func activityItemsStyle(@ViewBuilder content: @escaping (ActivityItemsConfiguration) -> some View) -> ContactItemActivityItemsStyle {
        let style = AnyActivityItemsStyle(content)
        return ContactItemActivityItemsStyle(style: style)
    }
}

// MARK: CounterStyle

public extension CounterStyle where Self == CounterBaseStyle {
    static var base: CounterBaseStyle {
        CounterBaseStyle()
    }
}

public extension CounterStyle where Self == CounterFioriStyle {
    static var fiori: CounterFioriStyle {
        CounterFioriStyle()
    }
}

// MARK: DateTimePickerStyle

public extension DateTimePickerStyle where Self == DateTimePickerBaseStyle {
    static var base: DateTimePickerBaseStyle {
        DateTimePickerBaseStyle()
    }
}

public extension DateTimePickerStyle where Self == DateTimePickerFioriStyle {
    static var fiori: DateTimePickerFioriStyle {
        DateTimePickerFioriStyle()
    }
}

public struct DateTimePickerTitleStyle: DateTimePickerStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        DateTimePicker(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension DateTimePickerStyle where Self == DateTimePickerTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> DateTimePickerTitleStyle {
        DateTimePickerTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> DateTimePickerTitleStyle {
        let style = AnyTitleStyle(content)
        return DateTimePickerTitleStyle(style: style)
    }
}

public struct DateTimePickerValueLabelStyle: DateTimePickerStyle {
    let style: any ValueLabelStyle

    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        DateTimePicker(configuration)
            .valueLabelStyle(self.style)
            .typeErased
    }
}

public extension DateTimePickerStyle where Self == DateTimePickerValueLabelStyle {
    static func valueLabelStyle(_ style: some ValueLabelStyle) -> DateTimePickerValueLabelStyle {
        DateTimePickerValueLabelStyle(style: style)
    }

    static func valueLabelStyle(@ViewBuilder content: @escaping (ValueLabelConfiguration) -> some View) -> DateTimePickerValueLabelStyle {
        let style = AnyValueLabelStyle(content)
        return DateTimePickerValueLabelStyle(style: style)
    }
}

public struct DateTimePickerFormViewStyle: DateTimePickerStyle {
    let style: any FormViewStyle

    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        DateTimePicker(configuration)
            .formViewStyle(self.style)
            .typeErased
    }
}

public extension DateTimePickerStyle where Self == DateTimePickerFormViewStyle {
    static func formViewStyle(_ style: some FormViewStyle) -> DateTimePickerFormViewStyle {
        DateTimePickerFormViewStyle(style: style)
    }

    static func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> DateTimePickerFormViewStyle {
        let style = AnyFormViewStyle(content)
        return DateTimePickerFormViewStyle(style: style)
    }
}

// MARK: DecrementActionStyle

public extension DecrementActionStyle where Self == DecrementActionBaseStyle {
    static var base: DecrementActionBaseStyle {
        DecrementActionBaseStyle()
    }
}

public extension DecrementActionStyle where Self == DecrementActionFioriStyle {
    static var fiori: DecrementActionFioriStyle {
        DecrementActionFioriStyle()
    }
}

// MARK: DemoViewStyle

extension DemoViewStyle where Self == DemoViewBaseStyle {
    static var base: DemoViewBaseStyle {
        DemoViewBaseStyle()
    }
}

extension DemoViewStyle where Self == DemoViewFioriStyle {
    static var fiori: DemoViewFioriStyle {
        DemoViewFioriStyle()
    }
}

struct DemoViewTitleStyle: DemoViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

extension DemoViewStyle where Self == DemoViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> DemoViewTitleStyle {
        DemoViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> DemoViewTitleStyle {
        let style = AnyTitleStyle(content)
        return DemoViewTitleStyle(style: style)
    }
}

struct DemoViewSubtitleStyle: DemoViewStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

extension DemoViewStyle where Self == DemoViewSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> DemoViewSubtitleStyle {
        DemoViewSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> DemoViewSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return DemoViewSubtitleStyle(style: style)
    }
}

struct DemoViewStatusStyle: DemoViewStyle {
    let style: any StatusStyle

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .statusStyle(self.style)
            .typeErased
    }
}

extension DemoViewStyle where Self == DemoViewStatusStyle {
    static func statusStyle(_ style: some StatusStyle) -> DemoViewStatusStyle {
        DemoViewStatusStyle(style: style)
    }

    static func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> DemoViewStatusStyle {
        let style = AnyStatusStyle(content)
        return DemoViewStatusStyle(style: style)
    }
}

struct DemoViewActionStyle: DemoViewStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

extension DemoViewStyle where Self == DemoViewActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> DemoViewActionStyle {
        DemoViewActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> DemoViewActionStyle {
        let style = AnyActionStyle(content)
        return DemoViewActionStyle(style: style)
    }
}

struct DemoViewSwitchStyle: DemoViewStyle {
    let style: any SwitchStyle

    public func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .switchStyle(self.style)
            .typeErased
    }
}

extension DemoViewStyle where Self == DemoViewSwitchStyle {
    static func switchStyle(_ style: some SwitchStyle) -> DemoViewSwitchStyle {
        DemoViewSwitchStyle(style: style)
    }

    static func switchStyle(@ViewBuilder content: @escaping (SwitchConfiguration) -> some View) -> DemoViewSwitchStyle {
        let style = AnySwitchStyle(content)
        return DemoViewSwitchStyle(style: style)
    }
}

// MARK: DenyActionStyle

public extension DenyActionStyle where Self == DenyActionBaseStyle {
    static var base: DenyActionBaseStyle {
        DenyActionBaseStyle()
    }
}

public extension DenyActionStyle where Self == DenyActionFioriStyle {
    static var fiori: DenyActionFioriStyle {
        DenyActionFioriStyle()
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

// MARK: DescriptionTextStyle

public extension DescriptionTextStyle where Self == DescriptionTextBaseStyle {
    static var base: DescriptionTextBaseStyle {
        DescriptionTextBaseStyle()
    }
}

public extension DescriptionTextStyle where Self == DescriptionTextFioriStyle {
    static var fiori: DescriptionTextFioriStyle {
        DescriptionTextFioriStyle()
    }
}

// MARK: DeselectAllActionStyle

public extension DeselectAllActionStyle where Self == DeselectAllActionBaseStyle {
    static var base: DeselectAllActionBaseStyle {
        DeselectAllActionBaseStyle()
    }
}

public extension DeselectAllActionStyle where Self == DeselectAllActionFioriStyle {
    static var fiori: DeselectAllActionFioriStyle {
        DeselectAllActionFioriStyle()
    }
}

// MARK: DetailContentStyle

public extension DetailContentStyle where Self == DetailContentBaseStyle {
    static var base: DetailContentBaseStyle {
        DetailContentBaseStyle()
    }
}

public extension DetailContentStyle where Self == DetailContentFioriStyle {
    static var fiori: DetailContentFioriStyle {
        DetailContentFioriStyle()
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

// MARK: DimensionSegmentStyle

public extension DimensionSegmentStyle where Self == DimensionSegmentBaseStyle {
    static var base: DimensionSegmentBaseStyle {
        DimensionSegmentBaseStyle()
    }
}

public extension DimensionSegmentStyle where Self == DimensionSegmentFioriStyle {
    static var fiori: DimensionSegmentFioriStyle {
        DimensionSegmentFioriStyle()
    }
}

public struct DimensionSegmentTitleStyle: DimensionSegmentStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: DimensionSegmentConfiguration) -> some View {
        DimensionSegment(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension DimensionSegmentStyle where Self == DimensionSegmentTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> DimensionSegmentTitleStyle {
        DimensionSegmentTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> DimensionSegmentTitleStyle {
        let style = AnyTitleStyle(content)
        return DimensionSegmentTitleStyle(style: style)
    }
}

// MARK: DimensionSelectorStyle

public extension DimensionSelectorStyle where Self == DimensionSelectorBaseStyle {
    static var base: DimensionSelectorBaseStyle {
        DimensionSelectorBaseStyle()
    }
}

public extension DimensionSelectorStyle where Self == DimensionSelectorFioriStyle {
    static var fiori: DimensionSelectorFioriStyle {
        DimensionSelectorFioriStyle()
    }
}

// MARK: DisagreeActionStyle

public extension DisagreeActionStyle where Self == DisagreeActionBaseStyle {
    static var base: DisagreeActionBaseStyle {
        DisagreeActionBaseStyle()
    }
}

public extension DisagreeActionStyle where Self == DisagreeActionFioriStyle {
    static var fiori: DisagreeActionFioriStyle {
        DisagreeActionFioriStyle()
    }
}

// MARK: DurationPickerStyle

public extension DurationPickerStyle where Self == DurationPickerBaseStyle {
    static var base: DurationPickerBaseStyle {
        DurationPickerBaseStyle()
    }
}

public extension DurationPickerStyle where Self == DurationPickerFioriStyle {
    static var fiori: DurationPickerFioriStyle {
        DurationPickerFioriStyle()
    }
}

public struct DurationPickerTitleStyle: DurationPickerStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: DurationPickerConfiguration) -> some View {
        DurationPicker(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension DurationPickerStyle where Self == DurationPickerTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> DurationPickerTitleStyle {
        DurationPickerTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> DurationPickerTitleStyle {
        let style = AnyTitleStyle(content)
        return DurationPickerTitleStyle(style: style)
    }
}

public struct DurationPickerValueLabelStyle: DurationPickerStyle {
    let style: any ValueLabelStyle

    public func makeBody(_ configuration: DurationPickerConfiguration) -> some View {
        DurationPicker(configuration)
            .valueLabelStyle(self.style)
            .typeErased
    }
}

public extension DurationPickerStyle where Self == DurationPickerValueLabelStyle {
    static func valueLabelStyle(_ style: some ValueLabelStyle) -> DurationPickerValueLabelStyle {
        DurationPickerValueLabelStyle(style: style)
    }

    static func valueLabelStyle(@ViewBuilder content: @escaping (ValueLabelConfiguration) -> some View) -> DurationPickerValueLabelStyle {
        let style = AnyValueLabelStyle(content)
        return DurationPickerValueLabelStyle(style: style)
    }
}

public struct DurationPickerFormViewStyle: DurationPickerStyle {
    let style: any FormViewStyle

    public func makeBody(_ configuration: DurationPickerConfiguration) -> some View {
        DurationPicker(configuration)
            .formViewStyle(self.style)
            .typeErased
    }
}

public extension DurationPickerStyle where Self == DurationPickerFormViewStyle {
    static func formViewStyle(_ style: some FormViewStyle) -> DurationPickerFormViewStyle {
        DurationPickerFormViewStyle(style: style)
    }

    static func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> DurationPickerFormViewStyle {
        let style = AnyFormViewStyle(content)
        return DurationPickerFormViewStyle(style: style)
    }
}

// MARK: EULAViewStyle

public extension EULAViewStyle where Self == EULAViewBaseStyle {
    static var base: EULAViewBaseStyle {
        EULAViewBaseStyle()
    }
}

public extension EULAViewStyle where Self == EULAViewFioriStyle {
    static var fiori: EULAViewFioriStyle {
        EULAViewFioriStyle()
    }
}

public struct EULAViewTitleStyle: EULAViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: EULAViewConfiguration) -> some View {
        EULAView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension EULAViewStyle where Self == EULAViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> EULAViewTitleStyle {
        EULAViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> EULAViewTitleStyle {
        let style = AnyTitleStyle(content)
        return EULAViewTitleStyle(style: style)
    }
}

public struct EULAViewBodyTextStyle: EULAViewStyle {
    let style: any BodyTextStyle

    public func makeBody(_ configuration: EULAViewConfiguration) -> some View {
        EULAView(configuration)
            .bodyTextStyle(self.style)
            .typeErased
    }
}

public extension EULAViewStyle where Self == EULAViewBodyTextStyle {
    static func bodyTextStyle(_ style: some BodyTextStyle) -> EULAViewBodyTextStyle {
        EULAViewBodyTextStyle(style: style)
    }

    static func bodyTextStyle(@ViewBuilder content: @escaping (BodyTextConfiguration) -> some View) -> EULAViewBodyTextStyle {
        let style = AnyBodyTextStyle(content)
        return EULAViewBodyTextStyle(style: style)
    }
}

public struct EULAViewAgreeActionStyle: EULAViewStyle {
    let style: any AgreeActionStyle

    public func makeBody(_ configuration: EULAViewConfiguration) -> some View {
        EULAView(configuration)
            .agreeActionStyle(self.style)
            .typeErased
    }
}

public extension EULAViewStyle where Self == EULAViewAgreeActionStyle {
    static func agreeActionStyle(_ style: some AgreeActionStyle) -> EULAViewAgreeActionStyle {
        EULAViewAgreeActionStyle(style: style)
    }

    static func agreeActionStyle(@ViewBuilder content: @escaping (AgreeActionConfiguration) -> some View) -> EULAViewAgreeActionStyle {
        let style = AnyAgreeActionStyle(content)
        return EULAViewAgreeActionStyle(style: style)
    }
}

public struct EULAViewDisagreeActionStyle: EULAViewStyle {
    let style: any DisagreeActionStyle

    public func makeBody(_ configuration: EULAViewConfiguration) -> some View {
        EULAView(configuration)
            .disagreeActionStyle(self.style)
            .typeErased
    }
}

public extension EULAViewStyle where Self == EULAViewDisagreeActionStyle {
    static func disagreeActionStyle(_ style: some DisagreeActionStyle) -> EULAViewDisagreeActionStyle {
        EULAViewDisagreeActionStyle(style: style)
    }

    static func disagreeActionStyle(@ViewBuilder content: @escaping (DisagreeActionConfiguration) -> some View) -> EULAViewDisagreeActionStyle {
        let style = AnyDisagreeActionStyle(content)
        return EULAViewDisagreeActionStyle(style: style)
    }
}

public struct EULAViewCancelActionStyle: EULAViewStyle {
    let style: any CancelActionStyle

    public func makeBody(_ configuration: EULAViewConfiguration) -> some View {
        EULAView(configuration)
            .cancelActionStyle(self.style)
            .typeErased
    }
}

public extension EULAViewStyle where Self == EULAViewCancelActionStyle {
    static func cancelActionStyle(_ style: some CancelActionStyle) -> EULAViewCancelActionStyle {
        EULAViewCancelActionStyle(style: style)
    }

    static func cancelActionStyle(@ViewBuilder content: @escaping (CancelActionConfiguration) -> some View) -> EULAViewCancelActionStyle {
        let style = AnyCancelActionStyle(content)
        return EULAViewCancelActionStyle(style: style)
    }
}

// MARK: FilledIconStyle

public extension FilledIconStyle where Self == FilledIconBaseStyle {
    static var base: FilledIconBaseStyle {
        FilledIconBaseStyle()
    }
}

public extension FilledIconStyle where Self == FilledIconFioriStyle {
    static var fiori: FilledIconFioriStyle {
        FilledIconFioriStyle()
    }
}

// MARK: FilterFeedbackBarButtonStyle

public extension FilterFeedbackBarButtonStyle where Self == FilterFeedbackBarButtonBaseStyle {
    static var base: FilterFeedbackBarButtonBaseStyle {
        FilterFeedbackBarButtonBaseStyle()
    }
}

public extension FilterFeedbackBarButtonStyle where Self == FilterFeedbackBarButtonFioriStyle {
    static var fiori: FilterFeedbackBarButtonFioriStyle {
        FilterFeedbackBarButtonFioriStyle()
    }
}

public struct FilterFeedbackBarButtonIconStyle: FilterFeedbackBarButtonStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: FilterFeedbackBarButtonConfiguration) -> some View {
        FilterFeedbackBarButton(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension FilterFeedbackBarButtonStyle where Self == FilterFeedbackBarButtonIconStyle {
    static func iconStyle(_ style: some IconStyle) -> FilterFeedbackBarButtonIconStyle {
        FilterFeedbackBarButtonIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> FilterFeedbackBarButtonIconStyle {
        let style = AnyIconStyle(content)
        return FilterFeedbackBarButtonIconStyle(style: style)
    }
}

public struct FilterFeedbackBarButtonTitleStyle: FilterFeedbackBarButtonStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: FilterFeedbackBarButtonConfiguration) -> some View {
        FilterFeedbackBarButton(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension FilterFeedbackBarButtonStyle where Self == FilterFeedbackBarButtonTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> FilterFeedbackBarButtonTitleStyle {
        FilterFeedbackBarButtonTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> FilterFeedbackBarButtonTitleStyle {
        let style = AnyTitleStyle(content)
        return FilterFeedbackBarButtonTitleStyle(style: style)
    }
}

// MARK: FilterFeedbackBarStyle

public extension FilterFeedbackBarStyle where Self == FilterFeedbackBarBaseStyle {
    static var base: FilterFeedbackBarBaseStyle {
        FilterFeedbackBarBaseStyle()
    }
}

public extension FilterFeedbackBarStyle where Self == FilterFeedbackBarFioriStyle {
    static var fiori: FilterFeedbackBarFioriStyle {
        FilterFeedbackBarFioriStyle()
    }
}

// MARK: FilterFeedbackBarItemStyle

public extension FilterFeedbackBarItemStyle where Self == FilterFeedbackBarItemBaseStyle {
    static var base: FilterFeedbackBarItemBaseStyle {
        FilterFeedbackBarItemBaseStyle()
    }
}

public extension FilterFeedbackBarItemStyle where Self == FilterFeedbackBarItemFioriStyle {
    static var fiori: FilterFeedbackBarItemFioriStyle {
        FilterFeedbackBarItemFioriStyle()
    }
}

public struct FilterFeedbackBarItemIconStyle: FilterFeedbackBarItemStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> some View {
        FilterFeedbackBarItem(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension FilterFeedbackBarItemStyle where Self == FilterFeedbackBarItemIconStyle {
    static func iconStyle(_ style: some IconStyle) -> FilterFeedbackBarItemIconStyle {
        FilterFeedbackBarItemIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> FilterFeedbackBarItemIconStyle {
        let style = AnyIconStyle(content)
        return FilterFeedbackBarItemIconStyle(style: style)
    }
}

public struct FilterFeedbackBarItemTitleStyle: FilterFeedbackBarItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> some View {
        FilterFeedbackBarItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension FilterFeedbackBarItemStyle where Self == FilterFeedbackBarItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> FilterFeedbackBarItemTitleStyle {
        FilterFeedbackBarItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> FilterFeedbackBarItemTitleStyle {
        let style = AnyTitleStyle(content)
        return FilterFeedbackBarItemTitleStyle(style: style)
    }
}

public struct FilterFeedbackBarItemAccessoryIconStyle: FilterFeedbackBarItemStyle {
    let style: any AccessoryIconStyle

    public func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> some View {
        FilterFeedbackBarItem(configuration)
            .accessoryIconStyle(self.style)
            .typeErased
    }
}

public extension FilterFeedbackBarItemStyle where Self == FilterFeedbackBarItemAccessoryIconStyle {
    static func accessoryIconStyle(_ style: some AccessoryIconStyle) -> FilterFeedbackBarItemAccessoryIconStyle {
        FilterFeedbackBarItemAccessoryIconStyle(style: style)
    }

    static func accessoryIconStyle(@ViewBuilder content: @escaping (AccessoryIconConfiguration) -> some View) -> FilterFeedbackBarItemAccessoryIconStyle {
        let style = AnyAccessoryIconStyle(content)
        return FilterFeedbackBarItemAccessoryIconStyle(style: style)
    }
}

// MARK: FilterFormViewStyle

public extension FilterFormViewStyle where Self == FilterFormViewBaseStyle {
    static var base: FilterFormViewBaseStyle {
        FilterFormViewBaseStyle()
    }
}

public extension FilterFormViewStyle where Self == FilterFormViewFioriStyle {
    static var fiori: FilterFormViewFioriStyle {
        FilterFormViewFioriStyle()
    }
}

public struct FilterFormViewTitleStyle: FilterFormViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: FilterFormViewConfiguration) -> some View {
        FilterFormView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension FilterFormViewStyle where Self == FilterFormViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> FilterFormViewTitleStyle {
        FilterFormViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> FilterFormViewTitleStyle {
        let style = AnyTitleStyle(content)
        return FilterFormViewTitleStyle(style: style)
    }
}

public struct FilterFormViewOptionsStyle: FilterFormViewStyle {
    let style: any OptionsStyle

    public func makeBody(_ configuration: FilterFormViewConfiguration) -> some View {
        FilterFormView(configuration)
            .optionsStyle(self.style)
            .typeErased
    }
}

public extension FilterFormViewStyle where Self == FilterFormViewOptionsStyle {
    static func optionsStyle(_ style: some OptionsStyle) -> FilterFormViewOptionsStyle {
        FilterFormViewOptionsStyle(style: style)
    }

    static func optionsStyle(@ViewBuilder content: @escaping (OptionsConfiguration) -> some View) -> FilterFormViewOptionsStyle {
        let style = AnyOptionsStyle(content)
        return FilterFormViewOptionsStyle(style: style)
    }
}

public struct FilterFormViewFormViewStyle: FilterFormViewStyle {
    let style: any FormViewStyle

    public func makeBody(_ configuration: FilterFormViewConfiguration) -> some View {
        FilterFormView(configuration)
            .formViewStyle(self.style)
            .typeErased
    }
}

public extension FilterFormViewStyle where Self == FilterFormViewFormViewStyle {
    static func formViewStyle(_ style: some FormViewStyle) -> FilterFormViewFormViewStyle {
        FilterFormViewFormViewStyle(style: style)
    }

    static func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> FilterFormViewFormViewStyle {
        let style = AnyFormViewStyle(content)
        return FilterFormViewFormViewStyle(style: style)
    }
}

// MARK: FioriSliderStyle

public extension FioriSliderStyle where Self == FioriSliderBaseStyle {
    static var base: FioriSliderBaseStyle {
        FioriSliderBaseStyle()
    }
}

public extension FioriSliderStyle where Self == FioriSliderFioriStyle {
    static var fiori: FioriSliderFioriStyle {
        FioriSliderFioriStyle()
    }
}

public struct FioriSliderTitleStyle: FioriSliderStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> FioriSliderTitleStyle {
        FioriSliderTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> FioriSliderTitleStyle {
        let style = AnyTitleStyle(content)
        return FioriSliderTitleStyle(style: style)
    }
}

public struct FioriSliderValueLabelStyle: FioriSliderStyle {
    let style: any ValueLabelStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .valueLabelStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderValueLabelStyle {
    static func valueLabelStyle(_ style: some ValueLabelStyle) -> FioriSliderValueLabelStyle {
        FioriSliderValueLabelStyle(style: style)
    }

    static func valueLabelStyle(@ViewBuilder content: @escaping (ValueLabelConfiguration) -> some View) -> FioriSliderValueLabelStyle {
        let style = AnyValueLabelStyle(content)
        return FioriSliderValueLabelStyle(style: style)
    }
}

public struct FioriSliderLowerThumbStyle: FioriSliderStyle {
    let style: any LowerThumbStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .lowerThumbStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderLowerThumbStyle {
    static func lowerThumbStyle(_ style: some LowerThumbStyle) -> FioriSliderLowerThumbStyle {
        FioriSliderLowerThumbStyle(style: style)
    }

    static func lowerThumbStyle(@ViewBuilder content: @escaping (LowerThumbConfiguration) -> some View) -> FioriSliderLowerThumbStyle {
        let style = AnyLowerThumbStyle(content)
        return FioriSliderLowerThumbStyle(style: style)
    }
}

public struct FioriSliderUpperThumbStyle: FioriSliderStyle {
    let style: any UpperThumbStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .upperThumbStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderUpperThumbStyle {
    static func upperThumbStyle(_ style: some UpperThumbStyle) -> FioriSliderUpperThumbStyle {
        FioriSliderUpperThumbStyle(style: style)
    }

    static func upperThumbStyle(@ViewBuilder content: @escaping (UpperThumbConfiguration) -> some View) -> FioriSliderUpperThumbStyle {
        let style = AnyUpperThumbStyle(content)
        return FioriSliderUpperThumbStyle(style: style)
    }
}

public struct FioriSliderActiveTrackStyle: FioriSliderStyle {
    let style: any ActiveTrackStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .activeTrackStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderActiveTrackStyle {
    static func activeTrackStyle(_ style: some ActiveTrackStyle) -> FioriSliderActiveTrackStyle {
        FioriSliderActiveTrackStyle(style: style)
    }

    static func activeTrackStyle(@ViewBuilder content: @escaping (ActiveTrackConfiguration) -> some View) -> FioriSliderActiveTrackStyle {
        let style = AnyActiveTrackStyle(content)
        return FioriSliderActiveTrackStyle(style: style)
    }
}

public struct FioriSliderInactiveTrackStyle: FioriSliderStyle {
    let style: any InactiveTrackStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .inactiveTrackStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderInactiveTrackStyle {
    static func inactiveTrackStyle(_ style: some InactiveTrackStyle) -> FioriSliderInactiveTrackStyle {
        FioriSliderInactiveTrackStyle(style: style)
    }

    static func inactiveTrackStyle(@ViewBuilder content: @escaping (InactiveTrackConfiguration) -> some View) -> FioriSliderInactiveTrackStyle {
        let style = AnyInactiveTrackStyle(content)
        return FioriSliderInactiveTrackStyle(style: style)
    }
}

public struct FioriSliderIconStyle: FioriSliderStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderIconStyle {
    static func iconStyle(_ style: some IconStyle) -> FioriSliderIconStyle {
        FioriSliderIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> FioriSliderIconStyle {
        let style = AnyIconStyle(content)
        return FioriSliderIconStyle(style: style)
    }
}

public struct FioriSliderDescriptionStyle: FioriSliderStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> FioriSliderDescriptionStyle {
        FioriSliderDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> FioriSliderDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return FioriSliderDescriptionStyle(style: style)
    }
}

public struct FioriSliderLeadingAccessoryStyle: FioriSliderStyle {
    let style: any LeadingAccessoryStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .leadingAccessoryStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderLeadingAccessoryStyle {
    static func leadingAccessoryStyle(_ style: some LeadingAccessoryStyle) -> FioriSliderLeadingAccessoryStyle {
        FioriSliderLeadingAccessoryStyle(style: style)
    }

    static func leadingAccessoryStyle(@ViewBuilder content: @escaping (LeadingAccessoryConfiguration) -> some View) -> FioriSliderLeadingAccessoryStyle {
        let style = AnyLeadingAccessoryStyle(content)
        return FioriSliderLeadingAccessoryStyle(style: style)
    }
}

public struct FioriSliderTrailingAccessoryStyle: FioriSliderStyle {
    let style: any TrailingAccessoryStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .trailingAccessoryStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderTrailingAccessoryStyle {
    static func trailingAccessoryStyle(_ style: some TrailingAccessoryStyle) -> FioriSliderTrailingAccessoryStyle {
        FioriSliderTrailingAccessoryStyle(style: style)
    }

    static func trailingAccessoryStyle(@ViewBuilder content: @escaping (TrailingAccessoryConfiguration) -> some View) -> FioriSliderTrailingAccessoryStyle {
        let style = AnyTrailingAccessoryStyle(content)
        return FioriSliderTrailingAccessoryStyle(style: style)
    }
}

public struct FioriSliderRangeSliderControlStyle: FioriSliderStyle {
    let style: any RangeSliderControlStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .rangeSliderControlStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderRangeSliderControlStyle {
    static func rangeSliderControlStyle(_ style: some RangeSliderControlStyle) -> FioriSliderRangeSliderControlStyle {
        FioriSliderRangeSliderControlStyle(style: style)
    }

    static func rangeSliderControlStyle(@ViewBuilder content: @escaping (RangeSliderControlConfiguration) -> some View) -> FioriSliderRangeSliderControlStyle {
        let style = AnyRangeSliderControlStyle(content)
        return FioriSliderRangeSliderControlStyle(style: style)
    }
}

public struct FioriSliderInformationViewStyle: FioriSliderStyle {
    let style: any InformationViewStyle

    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        FioriSlider(configuration)
            .informationViewStyle(self.style)
            .typeErased
    }
}

public extension FioriSliderStyle where Self == FioriSliderInformationViewStyle {
    static func informationViewStyle(_ style: some InformationViewStyle) -> FioriSliderInformationViewStyle {
        FioriSliderInformationViewStyle(style: style)
    }

    static func informationViewStyle(@ViewBuilder content: @escaping (InformationViewConfiguration) -> some View) -> FioriSliderInformationViewStyle {
        let style = AnyInformationViewStyle(content)
        return FioriSliderInformationViewStyle(style: style)
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

// MARK: FootnoteIconsTextStyle

public extension FootnoteIconsTextStyle where Self == FootnoteIconsTextBaseStyle {
    static var base: FootnoteIconsTextBaseStyle {
        FootnoteIconsTextBaseStyle()
    }
}

public extension FootnoteIconsTextStyle where Self == FootnoteIconsTextFioriStyle {
    static var fiori: FootnoteIconsTextFioriStyle {
        FootnoteIconsTextFioriStyle()
    }
}

// MARK: FormViewStyle

public extension FormViewStyle where Self == FormViewBaseStyle {
    static var base: FormViewBaseStyle {
        FormViewBaseStyle()
    }
}

public extension FormViewStyle where Self == FormViewFioriStyle {
    static var fiori: FormViewFioriStyle {
        FormViewFioriStyle()
    }
}

// MARK: GreetingTextStyle

public extension GreetingTextStyle where Self == GreetingTextBaseStyle {
    static var base: GreetingTextBaseStyle {
        GreetingTextBaseStyle()
    }
}

public extension GreetingTextStyle where Self == GreetingTextFioriStyle {
    static var fiori: GreetingTextFioriStyle {
        GreetingTextFioriStyle()
    }
}

// MARK: HalfStarImageStyle

public extension HalfStarImageStyle where Self == HalfStarImageBaseStyle {
    static var base: HalfStarImageBaseStyle {
        HalfStarImageBaseStyle()
    }
}

public extension HalfStarImageStyle where Self == HalfStarImageFioriStyle {
    static var fiori: HalfStarImageFioriStyle {
        HalfStarImageFioriStyle()
    }
}

// MARK: HeaderActionStyle

public extension HeaderActionStyle where Self == HeaderActionBaseStyle {
    static var base: HeaderActionBaseStyle {
        HeaderActionBaseStyle()
    }
}

public extension HeaderActionStyle where Self == HeaderActionFioriStyle {
    static var fiori: HeaderActionFioriStyle {
        HeaderActionFioriStyle()
    }
}

// MARK: HeaderChartStyle

public extension HeaderChartStyle where Self == HeaderChartBaseStyle {
    static var base: HeaderChartBaseStyle {
        HeaderChartBaseStyle()
    }
}

public extension HeaderChartStyle where Self == HeaderChartFioriStyle {
    static var fiori: HeaderChartFioriStyle {
        HeaderChartFioriStyle()
    }
}

public struct HeaderChartTitleStyle: HeaderChartStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: HeaderChartConfiguration) -> some View {
        HeaderChart(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension HeaderChartStyle where Self == HeaderChartTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> HeaderChartTitleStyle {
        HeaderChartTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> HeaderChartTitleStyle {
        let style = AnyTitleStyle(content)
        return HeaderChartTitleStyle(style: style)
    }
}

public struct HeaderChartSubtitleStyle: HeaderChartStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: HeaderChartConfiguration) -> some View {
        HeaderChart(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension HeaderChartStyle where Self == HeaderChartSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> HeaderChartSubtitleStyle {
        HeaderChartSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> HeaderChartSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return HeaderChartSubtitleStyle(style: style)
    }
}

public struct HeaderChartTrendStyle: HeaderChartStyle {
    let style: any TrendStyle

    public func makeBody(_ configuration: HeaderChartConfiguration) -> some View {
        HeaderChart(configuration)
            .trendStyle(self.style)
            .typeErased
    }
}

public extension HeaderChartStyle where Self == HeaderChartTrendStyle {
    static func trendStyle(_ style: some TrendStyle) -> HeaderChartTrendStyle {
        HeaderChartTrendStyle(style: style)
    }

    static func trendStyle(@ViewBuilder content: @escaping (TrendConfiguration) -> some View) -> HeaderChartTrendStyle {
        let style = AnyTrendStyle(content)
        return HeaderChartTrendStyle(style: style)
    }
}

public struct HeaderChartTrendImageStyle: HeaderChartStyle {
    let style: any TrendImageStyle

    public func makeBody(_ configuration: HeaderChartConfiguration) -> some View {
        HeaderChart(configuration)
            .trendImageStyle(self.style)
            .typeErased
    }
}

public extension HeaderChartStyle where Self == HeaderChartTrendImageStyle {
    static func trendImageStyle(_ style: some TrendImageStyle) -> HeaderChartTrendImageStyle {
        HeaderChartTrendImageStyle(style: style)
    }

    static func trendImageStyle(@ViewBuilder content: @escaping (TrendImageConfiguration) -> some View) -> HeaderChartTrendImageStyle {
        let style = AnyTrendImageStyle(content)
        return HeaderChartTrendImageStyle(style: style)
    }
}

public struct HeaderChartKpiStyle: HeaderChartStyle {
    let style: any KpiStyle

    public func makeBody(_ configuration: HeaderChartConfiguration) -> some View {
        HeaderChart(configuration)
            .kpiStyle(self.style)
            .typeErased
    }
}

public extension HeaderChartStyle where Self == HeaderChartKpiStyle {
    static func kpiStyle(_ style: some KpiStyle) -> HeaderChartKpiStyle {
        HeaderChartKpiStyle(style: style)
    }

    static func kpiStyle(@ViewBuilder content: @escaping (KpiConfiguration) -> some View) -> HeaderChartKpiStyle {
        let style = AnyKpiStyle(content)
        return HeaderChartKpiStyle(style: style)
    }
}

// MARK: HelperTextStyle

public extension HelperTextStyle where Self == HelperTextBaseStyle {
    static var base: HelperTextBaseStyle {
        HelperTextBaseStyle()
    }
}

public extension HelperTextStyle where Self == HelperTextFioriStyle {
    static var fiori: HelperTextFioriStyle {
        HelperTextFioriStyle()
    }
}

// MARK: IconStyle

public extension IconStyle where Self == IconBaseStyle {
    static var base: IconBaseStyle {
        IconBaseStyle()
    }
}

public extension IconStyle where Self == IconFioriStyle {
    static var fiori: IconFioriStyle {
        IconFioriStyle()
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

// MARK: IllustratedMessageStyle

public extension IllustratedMessageStyle where Self == IllustratedMessageBaseStyle {
    static var base: IllustratedMessageBaseStyle {
        IllustratedMessageBaseStyle()
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageFioriStyle {
    static var fiori: IllustratedMessageFioriStyle {
        IllustratedMessageFioriStyle()
    }
}

public struct IllustratedMessageDetailImageStyle: IllustratedMessageStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> IllustratedMessageDetailImageStyle {
        IllustratedMessageDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> IllustratedMessageDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return IllustratedMessageDetailImageStyle(style: style)
    }
}

public struct IllustratedMessageTitleStyle: IllustratedMessageStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> IllustratedMessageTitleStyle {
        IllustratedMessageTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> IllustratedMessageTitleStyle {
        let style = AnyTitleStyle(content)
        return IllustratedMessageTitleStyle(style: style)
    }
}

public struct IllustratedMessageDescriptionStyle: IllustratedMessageStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> IllustratedMessageDescriptionStyle {
        IllustratedMessageDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> IllustratedMessageDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return IllustratedMessageDescriptionStyle(style: style)
    }
}

public struct IllustratedMessageActionStyle: IllustratedMessageStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> IllustratedMessageActionStyle {
        IllustratedMessageActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> IllustratedMessageActionStyle {
        let style = AnyActionStyle(content)
        return IllustratedMessageActionStyle(style: style)
    }
}

public struct IllustratedMessageSecondaryActionStyle: IllustratedMessageStyle {
    let style: any SecondaryActionStyle

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .secondaryActionStyle(self.style)
            .typeErased
    }
}

public extension IllustratedMessageStyle where Self == IllustratedMessageSecondaryActionStyle {
    static func secondaryActionStyle(_ style: some SecondaryActionStyle) -> IllustratedMessageSecondaryActionStyle {
        IllustratedMessageSecondaryActionStyle(style: style)
    }

    static func secondaryActionStyle(@ViewBuilder content: @escaping (SecondaryActionConfiguration) -> some View) -> IllustratedMessageSecondaryActionStyle {
        let style = AnySecondaryActionStyle(content)
        return IllustratedMessageSecondaryActionStyle(style: style)
    }
}

// MARK: InactiveTrackStyle

public extension InactiveTrackStyle where Self == InactiveTrackBaseStyle {
    static var base: InactiveTrackBaseStyle {
        InactiveTrackBaseStyle()
    }
}

public extension InactiveTrackStyle where Self == InactiveTrackFioriStyle {
    static var fiori: InactiveTrackFioriStyle {
        InactiveTrackFioriStyle()
    }
}

// MARK: IncrementActionStyle

public extension IncrementActionStyle where Self == IncrementActionBaseStyle {
    static var base: IncrementActionBaseStyle {
        IncrementActionBaseStyle()
    }
}

public extension IncrementActionStyle where Self == IncrementActionFioriStyle {
    static var fiori: IncrementActionFioriStyle {
        IncrementActionFioriStyle()
    }
}

// MARK: InformationViewStyle

public extension InformationViewStyle where Self == InformationViewBaseStyle {
    static var base: InformationViewBaseStyle {
        InformationViewBaseStyle()
    }
}

public extension InformationViewStyle where Self == InformationViewFioriStyle {
    static var fiori: InformationViewFioriStyle {
        InformationViewFioriStyle()
    }
}

public struct InformationViewIconStyle: InformationViewStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension InformationViewStyle where Self == InformationViewIconStyle {
    static func iconStyle(_ style: some IconStyle) -> InformationViewIconStyle {
        InformationViewIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> InformationViewIconStyle {
        let style = AnyIconStyle(content)
        return InformationViewIconStyle(style: style)
    }
}

public struct InformationViewDescriptionStyle: InformationViewStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension InformationViewStyle where Self == InformationViewDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> InformationViewDescriptionStyle {
        InformationViewDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> InformationViewDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return InformationViewDescriptionStyle(style: style)
    }
}

// MARK: InnerCircleStyle

public extension InnerCircleStyle where Self == InnerCircleBaseStyle {
    static var base: InnerCircleBaseStyle {
        InnerCircleBaseStyle()
    }
}

public extension InnerCircleStyle where Self == InnerCircleFioriStyle {
    static var fiori: InnerCircleFioriStyle {
        InnerCircleFioriStyle()
    }
}

// MARK: JouleWelcomeScreenStyle

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenBaseStyle {
    static var base: JouleWelcomeScreenBaseStyle {
        JouleWelcomeScreenBaseStyle()
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenFioriStyle {
    static var fiori: JouleWelcomeScreenFioriStyle {
        JouleWelcomeScreenFioriStyle()
    }
}

public struct JouleWelcomeScreenMediaImageStyle: JouleWelcomeScreenStyle {
    let style: any MediaImageStyle

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .mediaImageStyle(self.style)
            .typeErased
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenMediaImageStyle {
    static func mediaImageStyle(_ style: some MediaImageStyle) -> JouleWelcomeScreenMediaImageStyle {
        JouleWelcomeScreenMediaImageStyle(style: style)
    }

    static func mediaImageStyle(@ViewBuilder content: @escaping (MediaImageConfiguration) -> some View) -> JouleWelcomeScreenMediaImageStyle {
        let style = AnyMediaImageStyle(content)
        return JouleWelcomeScreenMediaImageStyle(style: style)
    }
}

public struct JouleWelcomeScreenGreetingTextStyle: JouleWelcomeScreenStyle {
    let style: any GreetingTextStyle

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .greetingTextStyle(self.style)
            .typeErased
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenGreetingTextStyle {
    static func greetingTextStyle(_ style: some GreetingTextStyle) -> JouleWelcomeScreenGreetingTextStyle {
        JouleWelcomeScreenGreetingTextStyle(style: style)
    }

    static func greetingTextStyle(@ViewBuilder content: @escaping (GreetingTextConfiguration) -> some View) -> JouleWelcomeScreenGreetingTextStyle {
        let style = AnyGreetingTextStyle(content)
        return JouleWelcomeScreenGreetingTextStyle(style: style)
    }
}

public struct JouleWelcomeScreenTitleStyle: JouleWelcomeScreenStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> JouleWelcomeScreenTitleStyle {
        JouleWelcomeScreenTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> JouleWelcomeScreenTitleStyle {
        let style = AnyTitleStyle(content)
        return JouleWelcomeScreenTitleStyle(style: style)
    }
}

public struct JouleWelcomeScreenFootnoteStyle: JouleWelcomeScreenStyle {
    let style: any FootnoteStyle

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .footnoteStyle(self.style)
            .typeErased
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenFootnoteStyle {
    static func footnoteStyle(_ style: some FootnoteStyle) -> JouleWelcomeScreenFootnoteStyle {
        JouleWelcomeScreenFootnoteStyle(style: style)
    }

    static func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> JouleWelcomeScreenFootnoteStyle {
        let style = AnyFootnoteStyle(content)
        return JouleWelcomeScreenFootnoteStyle(style: style)
    }
}

public struct JouleWelcomeScreenMessageContentStyle: JouleWelcomeScreenStyle {
    let style: any MessageContentStyle

    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .messageContentStyle(self.style)
            .typeErased
    }
}

public extension JouleWelcomeScreenStyle where Self == JouleWelcomeScreenMessageContentStyle {
    static func messageContentStyle(_ style: some MessageContentStyle) -> JouleWelcomeScreenMessageContentStyle {
        JouleWelcomeScreenMessageContentStyle(style: style)
    }

    static func messageContentStyle(@ViewBuilder content: @escaping (MessageContentConfiguration) -> some View) -> JouleWelcomeScreenMessageContentStyle {
        let style = AnyMessageContentStyle(content)
        return JouleWelcomeScreenMessageContentStyle(style: style)
    }
}

// MARK: KPIContentStyle

public extension KPIContentStyle where Self == KPIContentBaseStyle {
    static var base: KPIContentBaseStyle {
        KPIContentBaseStyle()
    }
}

public extension KPIContentStyle where Self == KPIContentFioriStyle {
    static var fiori: KPIContentFioriStyle {
        KPIContentFioriStyle()
    }
}

// MARK: KPIHeaderStyle

public extension KPIHeaderStyle where Self == KPIHeaderBaseStyle {
    static var base: KPIHeaderBaseStyle {
        KPIHeaderBaseStyle()
    }
}

public extension KPIHeaderStyle where Self == KPIHeaderFioriStyle {
    static var fiori: KPIHeaderFioriStyle {
        KPIHeaderFioriStyle()
    }
}

// MARK: KPIItemStyle

public extension KPIItemStyle where Self == KPIItemBaseStyle {
    static var base: KPIItemBaseStyle {
        KPIItemBaseStyle()
    }
}

public extension KPIItemStyle where Self == KPIItemFioriStyle {
    static var fiori: KPIItemFioriStyle {
        KPIItemFioriStyle()
    }
}

public struct KPIItemKpiCaptionStyle: KPIItemStyle {
    let style: any KpiCaptionStyle

    public func makeBody(_ configuration: KPIItemConfiguration) -> some View {
        KPIItem(configuration)
            .kpiCaptionStyle(self.style)
            .typeErased
    }
}

public extension KPIItemStyle where Self == KPIItemKpiCaptionStyle {
    static func kpiCaptionStyle(_ style: some KpiCaptionStyle) -> KPIItemKpiCaptionStyle {
        KPIItemKpiCaptionStyle(style: style)
    }

    static func kpiCaptionStyle(@ViewBuilder content: @escaping (KpiCaptionConfiguration) -> some View) -> KPIItemKpiCaptionStyle {
        let style = AnyKpiCaptionStyle(content)
        return KPIItemKpiCaptionStyle(style: style)
    }
}

// MARK: KPIProgressItemStyle

public extension KPIProgressItemStyle where Self == KPIProgressItemBaseStyle {
    static var base: KPIProgressItemBaseStyle {
        KPIProgressItemBaseStyle()
    }
}

public extension KPIProgressItemStyle where Self == KPIProgressItemFioriStyle {
    static var fiori: KPIProgressItemFioriStyle {
        KPIProgressItemFioriStyle()
    }
}

public struct KPIProgressItemKPIContentStyle: KPIProgressItemStyle {
    let style: any KPIContentStyle

    public func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
        KPIProgressItem(configuration)
            .kPIContentStyle(self.style)
            .typeErased
    }
}

public extension KPIProgressItemStyle where Self == KPIProgressItemKPIContentStyle {
    static func kPIContentStyle(_ style: some KPIContentStyle) -> KPIProgressItemKPIContentStyle {
        KPIProgressItemKPIContentStyle(style: style)
    }

    static func kPIContentStyle(@ViewBuilder content: @escaping (KPIContentConfiguration) -> some View) -> KPIProgressItemKPIContentStyle {
        let style = AnyKPIContentStyle(content)
        return KPIProgressItemKPIContentStyle(style: style)
    }
}

public struct KPIProgressItemKpiCaptionStyle: KPIProgressItemStyle {
    let style: any KpiCaptionStyle

    public func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
        KPIProgressItem(configuration)
            .kpiCaptionStyle(self.style)
            .typeErased
    }
}

public extension KPIProgressItemStyle where Self == KPIProgressItemKpiCaptionStyle {
    static func kpiCaptionStyle(_ style: some KpiCaptionStyle) -> KPIProgressItemKpiCaptionStyle {
        KPIProgressItemKpiCaptionStyle(style: style)
    }

    static func kpiCaptionStyle(@ViewBuilder content: @escaping (KpiCaptionConfiguration) -> some View) -> KPIProgressItemKpiCaptionStyle {
        let style = AnyKpiCaptionStyle(content)
        return KPIProgressItemKpiCaptionStyle(style: style)
    }
}

public struct KPIProgressItemFootnoteStyle: KPIProgressItemStyle {
    let style: any FootnoteStyle

    public func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
        KPIProgressItem(configuration)
            .footnoteStyle(self.style)
            .typeErased
    }
}

public extension KPIProgressItemStyle where Self == KPIProgressItemFootnoteStyle {
    static func footnoteStyle(_ style: some FootnoteStyle) -> KPIProgressItemFootnoteStyle {
        KPIProgressItemFootnoteStyle(style: style)
    }

    static func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> KPIProgressItemFootnoteStyle {
        let style = AnyFootnoteStyle(content)
        return KPIProgressItemFootnoteStyle(style: style)
    }
}

public struct KPIProgressItemInnerCircleStyle: KPIProgressItemStyle {
    let style: any InnerCircleStyle

    public func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
        KPIProgressItem(configuration)
            .innerCircleStyle(self.style)
            .typeErased
    }
}

public extension KPIProgressItemStyle where Self == KPIProgressItemInnerCircleStyle {
    static func innerCircleStyle(_ style: some InnerCircleStyle) -> KPIProgressItemInnerCircleStyle {
        KPIProgressItemInnerCircleStyle(style: style)
    }

    static func innerCircleStyle(@ViewBuilder content: @escaping (InnerCircleConfiguration) -> some View) -> KPIProgressItemInnerCircleStyle {
        let style = AnyInnerCircleStyle(content)
        return KPIProgressItemInnerCircleStyle(style: style)
    }
}

public struct KPIProgressItemOuterCircleStyle: KPIProgressItemStyle {
    let style: any OuterCircleStyle

    public func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
        KPIProgressItem(configuration)
            .outerCircleStyle(self.style)
            .typeErased
    }
}

public extension KPIProgressItemStyle where Self == KPIProgressItemOuterCircleStyle {
    static func outerCircleStyle(_ style: some OuterCircleStyle) -> KPIProgressItemOuterCircleStyle {
        KPIProgressItemOuterCircleStyle(style: style)
    }

    static func outerCircleStyle(@ViewBuilder content: @escaping (OuterCircleConfiguration) -> some View) -> KPIProgressItemOuterCircleStyle {
        let style = AnyOuterCircleStyle(content)
        return KPIProgressItemOuterCircleStyle(style: style)
    }
}

// MARK: KPISubItemStyle

public extension KPISubItemStyle where Self == KPISubItemBaseStyle {
    static var base: KPISubItemBaseStyle {
        KPISubItemBaseStyle()
    }
}

public extension KPISubItemStyle where Self == KPISubItemFioriStyle {
    static var fiori: KPISubItemFioriStyle {
        KPISubItemFioriStyle()
    }
}

// MARK: KeyStyle

public extension KeyStyle where Self == KeyBaseStyle {
    static var base: KeyBaseStyle {
        KeyBaseStyle()
    }
}

public extension KeyStyle where Self == KeyFioriStyle {
    static var fiori: KeyFioriStyle {
        KeyFioriStyle()
    }
}

// MARK: KeyValueFormViewStyle

public extension KeyValueFormViewStyle where Self == KeyValueFormViewBaseStyle {
    static var base: KeyValueFormViewBaseStyle {
        KeyValueFormViewBaseStyle()
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewFioriStyle {
    static var fiori: KeyValueFormViewFioriStyle {
        KeyValueFormViewFioriStyle()
    }
}

public struct KeyValueFormViewTitleStyle: KeyValueFormViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> KeyValueFormViewTitleStyle {
        KeyValueFormViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> KeyValueFormViewTitleStyle {
        let style = AnyTitleStyle(content)
        return KeyValueFormViewTitleStyle(style: style)
    }
}

public struct KeyValueFormViewTextViewStyle: KeyValueFormViewStyle {
    let style: any TextViewStyle

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .textViewStyle(self.style)
            .typeErased
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewTextViewStyle {
    static func textViewStyle(_ style: some TextViewStyle) -> KeyValueFormViewTextViewStyle {
        KeyValueFormViewTextViewStyle(style: style)
    }

    static func textViewStyle(@ViewBuilder content: @escaping (TextViewConfiguration) -> some View) -> KeyValueFormViewTextViewStyle {
        let style = AnyTextViewStyle(content)
        return KeyValueFormViewTextViewStyle(style: style)
    }
}

public struct KeyValueFormViewPlaceholderStyle: KeyValueFormViewStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> KeyValueFormViewPlaceholderStyle {
        KeyValueFormViewPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> KeyValueFormViewPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return KeyValueFormViewPlaceholderStyle(style: style)
    }
}

public struct KeyValueFormViewNoteFormViewStyle: KeyValueFormViewStyle {
    let style: any NoteFormViewStyle

    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .noteFormViewStyle(self.style)
            .typeErased
    }
}

public extension KeyValueFormViewStyle where Self == KeyValueFormViewNoteFormViewStyle {
    static func noteFormViewStyle(_ style: some NoteFormViewStyle) -> KeyValueFormViewNoteFormViewStyle {
        KeyValueFormViewNoteFormViewStyle(style: style)
    }

    static func noteFormViewStyle(@ViewBuilder content: @escaping (NoteFormViewConfiguration) -> some View) -> KeyValueFormViewNoteFormViewStyle {
        let style = AnyNoteFormViewStyle(content)
        return KeyValueFormViewNoteFormViewStyle(style: style)
    }
}

// MARK: KeyValueItemStyle

public extension KeyValueItemStyle where Self == KeyValueItemBaseStyle {
    static var base: KeyValueItemBaseStyle {
        KeyValueItemBaseStyle()
    }
}

public extension KeyValueItemStyle where Self == KeyValueItemFioriStyle {
    static var fiori: KeyValueItemFioriStyle {
        KeyValueItemFioriStyle()
    }
}

public struct KeyValueItemKeyStyle: KeyValueItemStyle {
    let style: any KeyStyle

    public func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
        KeyValueItem(configuration)
            .keyStyle(self.style)
            .typeErased
    }
}

public extension KeyValueItemStyle where Self == KeyValueItemKeyStyle {
    static func keyStyle(_ style: some KeyStyle) -> KeyValueItemKeyStyle {
        KeyValueItemKeyStyle(style: style)
    }

    static func keyStyle(@ViewBuilder content: @escaping (KeyConfiguration) -> some View) -> KeyValueItemKeyStyle {
        let style = AnyKeyStyle(content)
        return KeyValueItemKeyStyle(style: style)
    }
}

public struct KeyValueItemValueStyle: KeyValueItemStyle {
    let style: any ValueStyle

    public func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
        KeyValueItem(configuration)
            .valueStyle(self.style)
            .typeErased
    }
}

public extension KeyValueItemStyle where Self == KeyValueItemValueStyle {
    static func valueStyle(_ style: some ValueStyle) -> KeyValueItemValueStyle {
        KeyValueItemValueStyle(style: style)
    }

    static func valueStyle(@ViewBuilder content: @escaping (ValueConfiguration) -> some View) -> KeyValueItemValueStyle {
        let style = AnyValueStyle(content)
        return KeyValueItemValueStyle(style: style)
    }
}

public struct KeyValueItemFormViewStyle: KeyValueItemStyle {
    let style: any FormViewStyle

    public func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
        KeyValueItem(configuration)
            .formViewStyle(self.style)
            .typeErased
    }
}

public extension KeyValueItemStyle where Self == KeyValueItemFormViewStyle {
    static func formViewStyle(_ style: some FormViewStyle) -> KeyValueItemFormViewStyle {
        KeyValueItemFormViewStyle(style: style)
    }

    static func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> KeyValueItemFormViewStyle {
        let style = AnyFormViewStyle(content)
        return KeyValueItemFormViewStyle(style: style)
    }
}

// MARK: KpiCaptionStyle

public extension KpiCaptionStyle where Self == KpiCaptionBaseStyle {
    static var base: KpiCaptionBaseStyle {
        KpiCaptionBaseStyle()
    }
}

public extension KpiCaptionStyle where Self == KpiCaptionFioriStyle {
    static var fiori: KpiCaptionFioriStyle {
        KpiCaptionFioriStyle()
    }
}

// MARK: KpiStyle

public extension KpiStyle where Self == KpiBaseStyle {
    static var base: KpiBaseStyle {
        KpiBaseStyle()
    }
}

public extension KpiStyle where Self == KpiFioriStyle {
    static var fiori: KpiFioriStyle {
        KpiFioriStyle()
    }
}

// MARK: LabelItemStyle

public extension LabelItemStyle where Self == LabelItemBaseStyle {
    static var base: LabelItemBaseStyle {
        LabelItemBaseStyle()
    }
}

public extension LabelItemStyle where Self == LabelItemFioriStyle {
    static var fiori: LabelItemFioriStyle {
        LabelItemFioriStyle()
    }
}

public struct LabelItemIconStyle: LabelItemStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: LabelItemConfiguration) -> some View {
        LabelItem(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension LabelItemStyle where Self == LabelItemIconStyle {
    static func iconStyle(_ style: some IconStyle) -> LabelItemIconStyle {
        LabelItemIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> LabelItemIconStyle {
        let style = AnyIconStyle(content)
        return LabelItemIconStyle(style: style)
    }
}

public struct LabelItemTitleStyle: LabelItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: LabelItemConfiguration) -> some View {
        LabelItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension LabelItemStyle where Self == LabelItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> LabelItemTitleStyle {
        LabelItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> LabelItemTitleStyle {
        let style = AnyTitleStyle(content)
        return LabelItemTitleStyle(style: style)
    }
}

// MARK: LeadingAccessoryStyle

public extension LeadingAccessoryStyle where Self == LeadingAccessoryBaseStyle {
    static var base: LeadingAccessoryBaseStyle {
        LeadingAccessoryBaseStyle()
    }
}

public extension LeadingAccessoryStyle where Self == LeadingAccessoryFioriStyle {
    static var fiori: LeadingAccessoryFioriStyle {
        LeadingAccessoryFioriStyle()
    }
}

// MARK: LineStyle

public extension LineStyle where Self == LineBaseStyle {
    static var base: LineBaseStyle {
        LineBaseStyle()
    }
}

public extension LineStyle where Self == LineFioriStyle {
    static var fiori: LineFioriStyle {
        LineFioriStyle()
    }
}

// MARK: LinearProgressIndicatorStyle

public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorBaseStyle {
    static var base: LinearProgressIndicatorBaseStyle {
        LinearProgressIndicatorBaseStyle()
    }
}

public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorFioriStyle {
    static var fiori: LinearProgressIndicatorFioriStyle {
        LinearProgressIndicatorFioriStyle()
    }
}

// MARK: LinearProgressIndicatorViewStyle

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewBaseStyle {
    static var base: LinearProgressIndicatorViewBaseStyle {
        LinearProgressIndicatorViewBaseStyle()
    }
}

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewFioriStyle {
    static var fiori: LinearProgressIndicatorViewFioriStyle {
        LinearProgressIndicatorViewFioriStyle()
    }
}

public struct LinearProgressIndicatorViewLinearProgressIndicatorStyle: LinearProgressIndicatorViewStyle {
    let style: any LinearProgressIndicatorStyle

    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorStyle(self.style)
            .typeErased
    }
}

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewLinearProgressIndicatorStyle {
    static func linearProgressIndicatorStyle(_ style: some LinearProgressIndicatorStyle) -> LinearProgressIndicatorViewLinearProgressIndicatorStyle {
        LinearProgressIndicatorViewLinearProgressIndicatorStyle(style: style)
    }

    static func linearProgressIndicatorStyle(@ViewBuilder content: @escaping (LinearProgressIndicatorConfiguration) -> some View) -> LinearProgressIndicatorViewLinearProgressIndicatorStyle {
        let style = AnyLinearProgressIndicatorStyle(content)
        return LinearProgressIndicatorViewLinearProgressIndicatorStyle(style: style)
    }
}

public struct LinearProgressIndicatorViewIconStyle: LinearProgressIndicatorViewStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewIconStyle {
    static func iconStyle(_ style: some IconStyle) -> LinearProgressIndicatorViewIconStyle {
        LinearProgressIndicatorViewIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> LinearProgressIndicatorViewIconStyle {
        let style = AnyIconStyle(content)
        return LinearProgressIndicatorViewIconStyle(style: style)
    }
}

public struct LinearProgressIndicatorViewDescriptionStyle: LinearProgressIndicatorViewStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension LinearProgressIndicatorViewStyle where Self == LinearProgressIndicatorViewDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> LinearProgressIndicatorViewDescriptionStyle {
        LinearProgressIndicatorViewDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> LinearProgressIndicatorViewDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return LinearProgressIndicatorViewDescriptionStyle(style: style)
    }
}

// MARK: ListPickerContentStyle

public extension ListPickerContentStyle where Self == ListPickerContentBaseStyle {
    static var base: ListPickerContentBaseStyle {
        ListPickerContentBaseStyle()
    }
}

public extension ListPickerContentStyle where Self == ListPickerContentFioriStyle {
    static var fiori: ListPickerContentFioriStyle {
        ListPickerContentFioriStyle()
    }
}

// MARK: ListPickerDestinationStyle

public extension ListPickerDestinationStyle where Self == ListPickerDestinationBaseStyle {
    static var base: ListPickerDestinationBaseStyle {
        ListPickerDestinationBaseStyle()
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationFioriStyle {
    static var fiori: ListPickerDestinationFioriStyle {
        ListPickerDestinationFioriStyle()
    }
}

public struct ListPickerDestinationCancelActionStyle: ListPickerDestinationStyle {
    let style: any CancelActionStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .cancelActionStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationCancelActionStyle {
    static func cancelActionStyle(_ style: some CancelActionStyle) -> ListPickerDestinationCancelActionStyle {
        ListPickerDestinationCancelActionStyle(style: style)
    }

    static func cancelActionStyle(@ViewBuilder content: @escaping (CancelActionConfiguration) -> some View) -> ListPickerDestinationCancelActionStyle {
        let style = AnyCancelActionStyle(content)
        return ListPickerDestinationCancelActionStyle(style: style)
    }
}

public struct ListPickerDestinationApplyActionStyle: ListPickerDestinationStyle {
    let style: any ApplyActionStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .applyActionStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationApplyActionStyle {
    static func applyActionStyle(_ style: some ApplyActionStyle) -> ListPickerDestinationApplyActionStyle {
        ListPickerDestinationApplyActionStyle(style: style)
    }

    static func applyActionStyle(@ViewBuilder content: @escaping (ApplyActionConfiguration) -> some View) -> ListPickerDestinationApplyActionStyle {
        let style = AnyApplyActionStyle(content)
        return ListPickerDestinationApplyActionStyle(style: style)
    }
}

public struct ListPickerDestinationSelectedEntriesSectionTitleStyle: ListPickerDestinationStyle {
    let style: any SelectedEntriesSectionTitleStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .selectedEntriesSectionTitleStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationSelectedEntriesSectionTitleStyle {
    static func selectedEntriesSectionTitleStyle(_ style: some SelectedEntriesSectionTitleStyle) -> ListPickerDestinationSelectedEntriesSectionTitleStyle {
        ListPickerDestinationSelectedEntriesSectionTitleStyle(style: style)
    }

    static func selectedEntriesSectionTitleStyle(@ViewBuilder content: @escaping (SelectedEntriesSectionTitleConfiguration) -> some View) -> ListPickerDestinationSelectedEntriesSectionTitleStyle {
        let style = AnySelectedEntriesSectionTitleStyle(content)
        return ListPickerDestinationSelectedEntriesSectionTitleStyle(style: style)
    }
}

public struct ListPickerDestinationSelectAllActionStyle: ListPickerDestinationStyle {
    let style: any SelectAllActionStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .selectAllActionStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationSelectAllActionStyle {
    static func selectAllActionStyle(_ style: some SelectAllActionStyle) -> ListPickerDestinationSelectAllActionStyle {
        ListPickerDestinationSelectAllActionStyle(style: style)
    }

    static func selectAllActionStyle(@ViewBuilder content: @escaping (SelectAllActionConfiguration) -> some View) -> ListPickerDestinationSelectAllActionStyle {
        let style = AnySelectAllActionStyle(content)
        return ListPickerDestinationSelectAllActionStyle(style: style)
    }
}

public struct ListPickerDestinationDeselectAllActionStyle: ListPickerDestinationStyle {
    let style: any DeselectAllActionStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .deselectAllActionStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationDeselectAllActionStyle {
    static func deselectAllActionStyle(_ style: some DeselectAllActionStyle) -> ListPickerDestinationDeselectAllActionStyle {
        ListPickerDestinationDeselectAllActionStyle(style: style)
    }

    static func deselectAllActionStyle(@ViewBuilder content: @escaping (DeselectAllActionConfiguration) -> some View) -> ListPickerDestinationDeselectAllActionStyle {
        let style = AnyDeselectAllActionStyle(content)
        return ListPickerDestinationDeselectAllActionStyle(style: style)
    }
}

public struct ListPickerDestinationAllEntriesSectionTitleStyle: ListPickerDestinationStyle {
    let style: any AllEntriesSectionTitleStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .allEntriesSectionTitleStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationAllEntriesSectionTitleStyle {
    static func allEntriesSectionTitleStyle(_ style: some AllEntriesSectionTitleStyle) -> ListPickerDestinationAllEntriesSectionTitleStyle {
        ListPickerDestinationAllEntriesSectionTitleStyle(style: style)
    }

    static func allEntriesSectionTitleStyle(@ViewBuilder content: @escaping (AllEntriesSectionTitleConfiguration) -> some View) -> ListPickerDestinationAllEntriesSectionTitleStyle {
        let style = AnyAllEntriesSectionTitleStyle(content)
        return ListPickerDestinationAllEntriesSectionTitleStyle(style: style)
    }
}

public struct ListPickerDestinationListPickerContentStyle: ListPickerDestinationStyle {
    let style: any ListPickerContentStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .listPickerContentStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationListPickerContentStyle {
    static func listPickerContentStyle(_ style: some ListPickerContentStyle) -> ListPickerDestinationListPickerContentStyle {
        ListPickerDestinationListPickerContentStyle(style: style)
    }

    static func listPickerContentStyle(@ViewBuilder content: @escaping (ListPickerContentConfiguration) -> some View) -> ListPickerDestinationListPickerContentStyle {
        let style = AnyListPickerContentStyle(content)
        return ListPickerDestinationListPickerContentStyle(style: style)
    }
}

public struct ListPickerDestinationPromptStyle: ListPickerDestinationStyle {
    let style: any PromptStyle

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .promptStyle(self.style)
            .typeErased
    }
}

public extension ListPickerDestinationStyle where Self == ListPickerDestinationPromptStyle {
    static func promptStyle(_ style: some PromptStyle) -> ListPickerDestinationPromptStyle {
        ListPickerDestinationPromptStyle(style: style)
    }

    static func promptStyle(@ViewBuilder content: @escaping (PromptConfiguration) -> some View) -> ListPickerDestinationPromptStyle {
        let style = AnyPromptStyle(content)
        return ListPickerDestinationPromptStyle(style: style)
    }
}

// MARK: ListPickerItemStyle

public extension ListPickerItemStyle where Self == ListPickerItemBaseStyle {
    static var base: ListPickerItemBaseStyle {
        ListPickerItemBaseStyle()
    }
}

public extension ListPickerItemStyle where Self == ListPickerItemFioriStyle {
    static var fiori: ListPickerItemFioriStyle {
        ListPickerItemFioriStyle()
    }
}

public struct ListPickerItemTitleStyle: ListPickerItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        ListPickerItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ListPickerItemStyle where Self == ListPickerItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ListPickerItemTitleStyle {
        ListPickerItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ListPickerItemTitleStyle {
        let style = AnyTitleStyle(content)
        return ListPickerItemTitleStyle(style: style)
    }
}

public struct ListPickerItemValueStyle: ListPickerItemStyle {
    let style: any ValueStyle

    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        ListPickerItem(configuration)
            .valueStyle(self.style)
            .typeErased
    }
}

public extension ListPickerItemStyle where Self == ListPickerItemValueStyle {
    static func valueStyle(_ style: some ValueStyle) -> ListPickerItemValueStyle {
        ListPickerItemValueStyle(style: style)
    }

    static func valueStyle(@ViewBuilder content: @escaping (ValueConfiguration) -> some View) -> ListPickerItemValueStyle {
        let style = AnyValueStyle(content)
        return ListPickerItemValueStyle(style: style)
    }
}

public struct ListPickerItemFormViewStyle: ListPickerItemStyle {
    let style: any FormViewStyle

    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        ListPickerItem(configuration)
            .formViewStyle(self.style)
            .typeErased
    }
}

public extension ListPickerItemStyle where Self == ListPickerItemFormViewStyle {
    static func formViewStyle(_ style: some FormViewStyle) -> ListPickerItemFormViewStyle {
        ListPickerItemFormViewStyle(style: style)
    }

    static func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> ListPickerItemFormViewStyle {
        let style = AnyFormViewStyle(content)
        return ListPickerItemFormViewStyle(style: style)
    }
}

// MARK: LoadingIndicatorStyle

public extension LoadingIndicatorStyle where Self == LoadingIndicatorBaseStyle {
    static var base: LoadingIndicatorBaseStyle {
        LoadingIndicatorBaseStyle()
    }
}

public extension LoadingIndicatorStyle where Self == LoadingIndicatorFioriStyle {
    static var fiori: LoadingIndicatorFioriStyle {
        LoadingIndicatorFioriStyle()
    }
}

public struct LoadingIndicatorTitleStyle: LoadingIndicatorStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: LoadingIndicatorConfiguration) -> some View {
        LoadingIndicator(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension LoadingIndicatorStyle where Self == LoadingIndicatorTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> LoadingIndicatorTitleStyle {
        LoadingIndicatorTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> LoadingIndicatorTitleStyle {
        let style = AnyTitleStyle(content)
        return LoadingIndicatorTitleStyle(style: style)
    }
}

public struct LoadingIndicatorProgressStyle: LoadingIndicatorStyle {
    let style: any ProgressStyle

    public func makeBody(_ configuration: LoadingIndicatorConfiguration) -> some View {
        LoadingIndicator(configuration)
            .progressStyle(self.style)
            .typeErased
    }
}

public extension LoadingIndicatorStyle where Self == LoadingIndicatorProgressStyle {
    static func progressStyle(_ style: some ProgressStyle) -> LoadingIndicatorProgressStyle {
        LoadingIndicatorProgressStyle(style: style)
    }

    static func progressStyle(@ViewBuilder content: @escaping (ProgressConfiguration) -> some View) -> LoadingIndicatorProgressStyle {
        let style = AnyProgressStyle(content)
        return LoadingIndicatorProgressStyle(style: style)
    }
}

// MARK: LowerThumbStyle

public extension LowerThumbStyle where Self == LowerThumbBaseStyle {
    static var base: LowerThumbBaseStyle {
        LowerThumbBaseStyle()
    }
}

public extension LowerThumbStyle where Self == LowerThumbFioriStyle {
    static var fiori: LowerThumbFioriStyle {
        LowerThumbFioriStyle()
    }
}

// MARK: MediaImageStyle

public extension MediaImageStyle where Self == MediaImageBaseStyle {
    static var base: MediaImageBaseStyle {
        MediaImageBaseStyle()
    }
}

public extension MediaImageStyle where Self == MediaImageFioriStyle {
    static var fiori: MediaImageFioriStyle {
        MediaImageFioriStyle()
    }
}

// MARK: MenuSelectionStyle

public extension MenuSelectionStyle where Self == MenuSelectionBaseStyle {
    static var base: MenuSelectionBaseStyle {
        MenuSelectionBaseStyle()
    }
}

public extension MenuSelectionStyle where Self == MenuSelectionFioriStyle {
    static var fiori: MenuSelectionFioriStyle {
        MenuSelectionFioriStyle()
    }
}

public struct MenuSelectionActionStyle: MenuSelectionStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
        MenuSelection(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension MenuSelectionStyle where Self == MenuSelectionActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> MenuSelectionActionStyle {
        MenuSelectionActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> MenuSelectionActionStyle {
        let style = AnyActionStyle(content)
        return MenuSelectionActionStyle(style: style)
    }
}

// MARK: MenuSelectionItemStyle

public extension MenuSelectionItemStyle where Self == MenuSelectionItemBaseStyle {
    static var base: MenuSelectionItemBaseStyle {
        MenuSelectionItemBaseStyle()
    }
}

public extension MenuSelectionItemStyle where Self == MenuSelectionItemFioriStyle {
    static var fiori: MenuSelectionItemFioriStyle {
        MenuSelectionItemFioriStyle()
    }
}

public struct MenuSelectionItemIconStyle: MenuSelectionItemStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        MenuSelectionItem(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension MenuSelectionItemStyle where Self == MenuSelectionItemIconStyle {
    static func iconStyle(_ style: some IconStyle) -> MenuSelectionItemIconStyle {
        MenuSelectionItemIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> MenuSelectionItemIconStyle {
        let style = AnyIconStyle(content)
        return MenuSelectionItemIconStyle(style: style)
    }
}

public struct MenuSelectionItemTitleStyle: MenuSelectionItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        MenuSelectionItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension MenuSelectionItemStyle where Self == MenuSelectionItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> MenuSelectionItemTitleStyle {
        MenuSelectionItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> MenuSelectionItemTitleStyle {
        let style = AnyTitleStyle(content)
        return MenuSelectionItemTitleStyle(style: style)
    }
}

// MARK: MessageContentStyle

public extension MessageContentStyle where Self == MessageContentBaseStyle {
    static var base: MessageContentBaseStyle {
        MessageContentBaseStyle()
    }
}

public extension MessageContentStyle where Self == MessageContentFioriStyle {
    static var fiori: MessageContentFioriStyle {
        MessageContentFioriStyle()
    }
}

// MARK: MoreActionOverflowStyle

public extension MoreActionOverflowStyle where Self == MoreActionOverflowBaseStyle {
    static var base: MoreActionOverflowBaseStyle {
        MoreActionOverflowBaseStyle()
    }
}

public extension MoreActionOverflowStyle where Self == MoreActionOverflowFioriStyle {
    static var fiori: MoreActionOverflowFioriStyle {
        MoreActionOverflowFioriStyle()
    }
}

// MARK: NextActionStyle

public extension NextActionStyle where Self == NextActionBaseStyle {
    static var base: NextActionBaseStyle {
        NextActionBaseStyle()
    }
}

public extension NextActionStyle where Self == NextActionFioriStyle {
    static var fiori: NextActionFioriStyle {
        NextActionFioriStyle()
    }
}

// MARK: NodeStyle

public extension NodeStyle where Self == NodeBaseStyle {
    static var base: NodeBaseStyle {
        NodeBaseStyle()
    }
}

public extension NodeStyle where Self == NodeFioriStyle {
    static var fiori: NodeFioriStyle {
        NodeFioriStyle()
    }
}

// MARK: NotNowActionStyle

public extension NotNowActionStyle where Self == NotNowActionBaseStyle {
    static var base: NotNowActionBaseStyle {
        NotNowActionBaseStyle()
    }
}

public extension NotNowActionStyle where Self == NotNowActionFioriStyle {
    static var fiori: NotNowActionFioriStyle {
        NotNowActionFioriStyle()
    }
}

// MARK: NoteFormViewStyle

public extension NoteFormViewStyle where Self == NoteFormViewBaseStyle {
    static var base: NoteFormViewBaseStyle {
        NoteFormViewBaseStyle()
    }
}

public extension NoteFormViewStyle where Self == NoteFormViewFioriStyle {
    static var fiori: NoteFormViewFioriStyle {
        NoteFormViewFioriStyle()
    }
}

public struct NoteFormViewTextViewStyle: NoteFormViewStyle {
    let style: any TextViewStyle

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .textViewStyle(self.style)
            .typeErased
    }
}

public extension NoteFormViewStyle where Self == NoteFormViewTextViewStyle {
    static func textViewStyle(_ style: some TextViewStyle) -> NoteFormViewTextViewStyle {
        NoteFormViewTextViewStyle(style: style)
    }

    static func textViewStyle(@ViewBuilder content: @escaping (TextViewConfiguration) -> some View) -> NoteFormViewTextViewStyle {
        let style = AnyTextViewStyle(content)
        return NoteFormViewTextViewStyle(style: style)
    }
}

public struct NoteFormViewPlaceholderStyle: NoteFormViewStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension NoteFormViewStyle where Self == NoteFormViewPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> NoteFormViewPlaceholderStyle {
        NoteFormViewPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> NoteFormViewPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return NoteFormViewPlaceholderStyle(style: style)
    }
}

public struct NoteFormViewPlaceholderTextEditorStyle: NoteFormViewStyle {
    let style: any PlaceholderTextEditorStyle

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .placeholderTextEditorStyle(self.style)
            .typeErased
    }
}

public extension NoteFormViewStyle where Self == NoteFormViewPlaceholderTextEditorStyle {
    static func placeholderTextEditorStyle(_ style: some PlaceholderTextEditorStyle) -> NoteFormViewPlaceholderTextEditorStyle {
        NoteFormViewPlaceholderTextEditorStyle(style: style)
    }

    static func placeholderTextEditorStyle(@ViewBuilder content: @escaping (PlaceholderTextEditorConfiguration) -> some View) -> NoteFormViewPlaceholderTextEditorStyle {
        let style = AnyPlaceholderTextEditorStyle(content)
        return NoteFormViewPlaceholderTextEditorStyle(style: style)
    }
}

public struct NoteFormViewFormViewStyle: NoteFormViewStyle {
    let style: any FormViewStyle

    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .formViewStyle(self.style)
            .typeErased
    }
}

public extension NoteFormViewStyle where Self == NoteFormViewFormViewStyle {
    static func formViewStyle(_ style: some FormViewStyle) -> NoteFormViewFormViewStyle {
        NoteFormViewFormViewStyle(style: style)
    }

    static func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> NoteFormViewFormViewStyle {
        let style = AnyFormViewStyle(content)
        return NoteFormViewFormViewStyle(style: style)
    }
}

// MARK: NowIndicatorNodeStyle

public extension NowIndicatorNodeStyle where Self == NowIndicatorNodeBaseStyle {
    static var base: NowIndicatorNodeBaseStyle {
        NowIndicatorNodeBaseStyle()
    }
}

public extension NowIndicatorNodeStyle where Self == NowIndicatorNodeFioriStyle {
    static var fiori: NowIndicatorNodeFioriStyle {
        NowIndicatorNodeFioriStyle()
    }
}

// MARK: ObjectHeaderStyle

public extension ObjectHeaderStyle where Self == ObjectHeaderBaseStyle {
    static var base: ObjectHeaderBaseStyle {
        ObjectHeaderBaseStyle()
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderFioriStyle {
    static var fiori: ObjectHeaderFioriStyle {
        ObjectHeaderFioriStyle()
    }
}

public struct ObjectHeaderTitleStyle: ObjectHeaderStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ObjectHeaderTitleStyle {
        ObjectHeaderTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ObjectHeaderTitleStyle {
        let style = AnyTitleStyle(content)
        return ObjectHeaderTitleStyle(style: style)
    }
}

public struct ObjectHeaderSubtitleStyle: ObjectHeaderStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> ObjectHeaderSubtitleStyle {
        ObjectHeaderSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> ObjectHeaderSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return ObjectHeaderSubtitleStyle(style: style)
    }
}

public struct ObjectHeaderTagsStyle: ObjectHeaderStyle {
    let style: any TagsStyle

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .tagsStyle(self.style)
            .typeErased
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderTagsStyle {
    static func tagsStyle(_ style: some TagsStyle) -> ObjectHeaderTagsStyle {
        ObjectHeaderTagsStyle(style: style)
    }

    static func tagsStyle(@ViewBuilder content: @escaping (TagsConfiguration) -> some View) -> ObjectHeaderTagsStyle {
        let style = AnyTagsStyle(content)
        return ObjectHeaderTagsStyle(style: style)
    }
}

public struct ObjectHeaderBodyTextStyle: ObjectHeaderStyle {
    let style: any BodyTextStyle

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .bodyTextStyle(self.style)
            .typeErased
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderBodyTextStyle {
    static func bodyTextStyle(_ style: some BodyTextStyle) -> ObjectHeaderBodyTextStyle {
        ObjectHeaderBodyTextStyle(style: style)
    }

    static func bodyTextStyle(@ViewBuilder content: @escaping (BodyTextConfiguration) -> some View) -> ObjectHeaderBodyTextStyle {
        let style = AnyBodyTextStyle(content)
        return ObjectHeaderBodyTextStyle(style: style)
    }
}

public struct ObjectHeaderFootnoteStyle: ObjectHeaderStyle {
    let style: any FootnoteStyle

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .footnoteStyle(self.style)
            .typeErased
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderFootnoteStyle {
    static func footnoteStyle(_ style: some FootnoteStyle) -> ObjectHeaderFootnoteStyle {
        ObjectHeaderFootnoteStyle(style: style)
    }

    static func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> ObjectHeaderFootnoteStyle {
        let style = AnyFootnoteStyle(content)
        return ObjectHeaderFootnoteStyle(style: style)
    }
}

public struct ObjectHeaderDescriptionTextStyle: ObjectHeaderStyle {
    let style: any DescriptionTextStyle

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .descriptionTextStyle(self.style)
            .typeErased
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderDescriptionTextStyle {
    static func descriptionTextStyle(_ style: some DescriptionTextStyle) -> ObjectHeaderDescriptionTextStyle {
        ObjectHeaderDescriptionTextStyle(style: style)
    }

    static func descriptionTextStyle(@ViewBuilder content: @escaping (DescriptionTextConfiguration) -> some View) -> ObjectHeaderDescriptionTextStyle {
        let style = AnyDescriptionTextStyle(content)
        return ObjectHeaderDescriptionTextStyle(style: style)
    }
}

public struct ObjectHeaderStatusStyle: ObjectHeaderStyle {
    let style: any StatusStyle

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .statusStyle(self.style)
            .typeErased
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderStatusStyle {
    static func statusStyle(_ style: some StatusStyle) -> ObjectHeaderStatusStyle {
        ObjectHeaderStatusStyle(style: style)
    }

    static func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> ObjectHeaderStatusStyle {
        let style = AnyStatusStyle(content)
        return ObjectHeaderStatusStyle(style: style)
    }
}

public struct ObjectHeaderSubstatusStyle: ObjectHeaderStyle {
    let style: any SubstatusStyle

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .substatusStyle(self.style)
            .typeErased
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderSubstatusStyle {
    static func substatusStyle(_ style: some SubstatusStyle) -> ObjectHeaderSubstatusStyle {
        ObjectHeaderSubstatusStyle(style: style)
    }

    static func substatusStyle(@ViewBuilder content: @escaping (SubstatusConfiguration) -> some View) -> ObjectHeaderSubstatusStyle {
        let style = AnySubstatusStyle(content)
        return ObjectHeaderSubstatusStyle(style: style)
    }
}

public struct ObjectHeaderDetailImageStyle: ObjectHeaderStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> ObjectHeaderDetailImageStyle {
        ObjectHeaderDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> ObjectHeaderDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return ObjectHeaderDetailImageStyle(style: style)
    }
}

public struct ObjectHeaderDetailContentStyle: ObjectHeaderStyle {
    let style: any DetailContentStyle

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .detailContentStyle(self.style)
            .typeErased
    }
}

public extension ObjectHeaderStyle where Self == ObjectHeaderDetailContentStyle {
    static func detailContentStyle(_ style: some DetailContentStyle) -> ObjectHeaderDetailContentStyle {
        ObjectHeaderDetailContentStyle(style: style)
    }

    static func detailContentStyle(@ViewBuilder content: @escaping (DetailContentConfiguration) -> some View) -> ObjectHeaderDetailContentStyle {
        let style = AnyDetailContentStyle(content)
        return ObjectHeaderDetailContentStyle(style: style)
    }
}

// MARK: ObjectItemStyle

public extension ObjectItemStyle where Self == ObjectItemBaseStyle {
    static var base: ObjectItemBaseStyle {
        ObjectItemBaseStyle()
    }
}

public extension ObjectItemStyle where Self == ObjectItemFioriStyle {
    static var fiori: ObjectItemFioriStyle {
        ObjectItemFioriStyle()
    }
}

public struct ObjectItemTitleStyle: ObjectItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ObjectItemTitleStyle {
        ObjectItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ObjectItemTitleStyle {
        let style = AnyTitleStyle(content)
        return ObjectItemTitleStyle(style: style)
    }
}

public struct ObjectItemSubtitleStyle: ObjectItemStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> ObjectItemSubtitleStyle {
        ObjectItemSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> ObjectItemSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return ObjectItemSubtitleStyle(style: style)
    }
}

public struct ObjectItemFootnoteStyle: ObjectItemStyle {
    let style: any FootnoteStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .footnoteStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemFootnoteStyle {
    static func footnoteStyle(_ style: some FootnoteStyle) -> ObjectItemFootnoteStyle {
        ObjectItemFootnoteStyle(style: style)
    }

    static func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> ObjectItemFootnoteStyle {
        let style = AnyFootnoteStyle(content)
        return ObjectItemFootnoteStyle(style: style)
    }
}

public struct ObjectItemDescriptionStyle: ObjectItemStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> ObjectItemDescriptionStyle {
        ObjectItemDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> ObjectItemDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return ObjectItemDescriptionStyle(style: style)
    }
}

public struct ObjectItemStatusStyle: ObjectItemStyle {
    let style: any StatusStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .statusStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemStatusStyle {
    static func statusStyle(_ style: some StatusStyle) -> ObjectItemStatusStyle {
        ObjectItemStatusStyle(style: style)
    }

    static func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> ObjectItemStatusStyle {
        let style = AnyStatusStyle(content)
        return ObjectItemStatusStyle(style: style)
    }
}

public struct ObjectItemSubstatusStyle: ObjectItemStyle {
    let style: any SubstatusStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .substatusStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemSubstatusStyle {
    static func substatusStyle(_ style: some SubstatusStyle) -> ObjectItemSubstatusStyle {
        ObjectItemSubstatusStyle(style: style)
    }

    static func substatusStyle(@ViewBuilder content: @escaping (SubstatusConfiguration) -> some View) -> ObjectItemSubstatusStyle {
        let style = AnySubstatusStyle(content)
        return ObjectItemSubstatusStyle(style: style)
    }
}

public struct ObjectItemDetailImageStyle: ObjectItemStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> ObjectItemDetailImageStyle {
        ObjectItemDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> ObjectItemDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return ObjectItemDetailImageStyle(style: style)
    }
}

public struct ObjectItemIconsStyle: ObjectItemStyle {
    let style: any IconsStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .iconsStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemIconsStyle {
    static func iconsStyle(_ style: some IconsStyle) -> ObjectItemIconsStyle {
        ObjectItemIconsStyle(style: style)
    }

    static func iconsStyle(@ViewBuilder content: @escaping (IconsConfiguration) -> some View) -> ObjectItemIconsStyle {
        let style = AnyIconsStyle(content)
        return ObjectItemIconsStyle(style: style)
    }
}

public struct ObjectItemAvatarsStyle: ObjectItemStyle {
    let style: any AvatarsStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .avatarsStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemAvatarsStyle {
    static func avatarsStyle(_ style: some AvatarsStyle) -> ObjectItemAvatarsStyle {
        ObjectItemAvatarsStyle(style: style)
    }

    static func avatarsStyle(@ViewBuilder content: @escaping (AvatarsConfiguration) -> some View) -> ObjectItemAvatarsStyle {
        let style = AnyAvatarsStyle(content)
        return ObjectItemAvatarsStyle(style: style)
    }
}

public struct ObjectItemFootnoteIconsStyle: ObjectItemStyle {
    let style: any FootnoteIconsStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .footnoteIconsStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemFootnoteIconsStyle {
    static func footnoteIconsStyle(_ style: some FootnoteIconsStyle) -> ObjectItemFootnoteIconsStyle {
        ObjectItemFootnoteIconsStyle(style: style)
    }

    static func footnoteIconsStyle(@ViewBuilder content: @escaping (FootnoteIconsConfiguration) -> some View) -> ObjectItemFootnoteIconsStyle {
        let style = AnyFootnoteIconsStyle(content)
        return ObjectItemFootnoteIconsStyle(style: style)
    }
}

public struct ObjectItemFootnoteIconsTextStyle: ObjectItemStyle {
    let style: any FootnoteIconsTextStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .footnoteIconsTextStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemFootnoteIconsTextStyle {
    static func footnoteIconsTextStyle(_ style: some FootnoteIconsTextStyle) -> ObjectItemFootnoteIconsTextStyle {
        ObjectItemFootnoteIconsTextStyle(style: style)
    }

    static func footnoteIconsTextStyle(@ViewBuilder content: @escaping (FootnoteIconsTextConfiguration) -> some View) -> ObjectItemFootnoteIconsTextStyle {
        let style = AnyFootnoteIconsTextStyle(content)
        return ObjectItemFootnoteIconsTextStyle(style: style)
    }
}

public struct ObjectItemTagsStyle: ObjectItemStyle {
    let style: any TagsStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .tagsStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemTagsStyle {
    static func tagsStyle(_ style: some TagsStyle) -> ObjectItemTagsStyle {
        ObjectItemTagsStyle(style: style)
    }

    static func tagsStyle(@ViewBuilder content: @escaping (TagsConfiguration) -> some View) -> ObjectItemTagsStyle {
        let style = AnyTagsStyle(content)
        return ObjectItemTagsStyle(style: style)
    }
}

public struct ObjectItemActionStyle: ObjectItemStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension ObjectItemStyle where Self == ObjectItemActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> ObjectItemActionStyle {
        ObjectItemActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> ObjectItemActionStyle {
        let style = AnyActionStyle(content)
        return ObjectItemActionStyle(style: style)
    }
}

// MARK: OffStarImageStyle

public extension OffStarImageStyle where Self == OffStarImageBaseStyle {
    static var base: OffStarImageBaseStyle {
        OffStarImageBaseStyle()
    }
}

public extension OffStarImageStyle where Self == OffStarImageFioriStyle {
    static var fiori: OffStarImageFioriStyle {
        OffStarImageFioriStyle()
    }
}

// MARK: OnStarImageStyle

public extension OnStarImageStyle where Self == OnStarImageBaseStyle {
    static var base: OnStarImageBaseStyle {
        OnStarImageBaseStyle()
    }
}

public extension OnStarImageStyle where Self == OnStarImageFioriStyle {
    static var fiori: OnStarImageFioriStyle {
        OnStarImageFioriStyle()
    }
}

// MARK: OptionalTitleStyle

public extension OptionalTitleStyle where Self == OptionalTitleBaseStyle {
    static var base: OptionalTitleBaseStyle {
        OptionalTitleBaseStyle()
    }
}

public extension OptionalTitleStyle where Self == OptionalTitleFioriStyle {
    static var fiori: OptionalTitleFioriStyle {
        OptionalTitleFioriStyle()
    }
}

// MARK: OptionsStyle

public extension OptionsStyle where Self == OptionsBaseStyle {
    static var base: OptionsBaseStyle {
        OptionsBaseStyle()
    }
}

public extension OptionsStyle where Self == OptionsFioriStyle {
    static var fiori: OptionsFioriStyle {
        OptionsFioriStyle()
    }
}

// MARK: OuterCircleStyle

public extension OuterCircleStyle where Self == OuterCircleBaseStyle {
    static var base: OuterCircleBaseStyle {
        OuterCircleBaseStyle()
    }
}

public extension OuterCircleStyle where Self == OuterCircleFioriStyle {
    static var fiori: OuterCircleFioriStyle {
        OuterCircleFioriStyle()
    }
}

// MARK: OverflowActionStyle

public extension OverflowActionStyle where Self == OverflowActionBaseStyle {
    static var base: OverflowActionBaseStyle {
        OverflowActionBaseStyle()
    }
}

public extension OverflowActionStyle where Self == OverflowActionFioriStyle {
    static var fiori: OverflowActionFioriStyle {
        OverflowActionFioriStyle()
    }
}

// MARK: PlaceholderStyle

public extension PlaceholderStyle where Self == PlaceholderBaseStyle {
    static var base: PlaceholderBaseStyle {
        PlaceholderBaseStyle()
    }
}

public extension PlaceholderStyle where Self == PlaceholderFioriStyle {
    static var fiori: PlaceholderFioriStyle {
        PlaceholderFioriStyle()
    }
}

// MARK: PlaceholderTextEditorStyle

public extension PlaceholderTextEditorStyle where Self == PlaceholderTextEditorBaseStyle {
    static var base: PlaceholderTextEditorBaseStyle {
        PlaceholderTextEditorBaseStyle()
    }
}

public extension PlaceholderTextEditorStyle where Self == PlaceholderTextEditorFioriStyle {
    static var fiori: PlaceholderTextEditorFioriStyle {
        PlaceholderTextEditorFioriStyle()
    }
}

public struct PlaceholderTextEditorTextViewStyle: PlaceholderTextEditorStyle {
    let style: any TextViewStyle

    public func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
        PlaceholderTextEditor(configuration)
            .textViewStyle(self.style)
            .typeErased
    }
}

public extension PlaceholderTextEditorStyle where Self == PlaceholderTextEditorTextViewStyle {
    static func textViewStyle(_ style: some TextViewStyle) -> PlaceholderTextEditorTextViewStyle {
        PlaceholderTextEditorTextViewStyle(style: style)
    }

    static func textViewStyle(@ViewBuilder content: @escaping (TextViewConfiguration) -> some View) -> PlaceholderTextEditorTextViewStyle {
        let style = AnyTextViewStyle(content)
        return PlaceholderTextEditorTextViewStyle(style: style)
    }
}

public struct PlaceholderTextEditorPlaceholderStyle: PlaceholderTextEditorStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
        PlaceholderTextEditor(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension PlaceholderTextEditorStyle where Self == PlaceholderTextEditorPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> PlaceholderTextEditorPlaceholderStyle {
        PlaceholderTextEditorPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> PlaceholderTextEditorPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return PlaceholderTextEditorPlaceholderStyle(style: style)
    }
}

// MARK: PlaceholderTextFieldStyle

public extension PlaceholderTextFieldStyle where Self == PlaceholderTextFieldBaseStyle {
    static var base: PlaceholderTextFieldBaseStyle {
        PlaceholderTextFieldBaseStyle()
    }
}

public extension PlaceholderTextFieldStyle where Self == PlaceholderTextFieldFioriStyle {
    static var fiori: PlaceholderTextFieldFioriStyle {
        PlaceholderTextFieldFioriStyle()
    }
}

public struct PlaceholderTextFieldPlaceholderStyle: PlaceholderTextFieldStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        PlaceholderTextField(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension PlaceholderTextFieldStyle where Self == PlaceholderTextFieldPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> PlaceholderTextFieldPlaceholderStyle {
        PlaceholderTextFieldPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> PlaceholderTextFieldPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return PlaceholderTextFieldPlaceholderStyle(style: style)
    }
}

public struct PlaceholderTextFieldTextInputFieldStyle: PlaceholderTextFieldStyle {
    let style: any TextInputFieldStyle

    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        PlaceholderTextField(configuration)
            .textInputFieldStyle(self.style)
            .typeErased
    }
}

public extension PlaceholderTextFieldStyle where Self == PlaceholderTextFieldTextInputFieldStyle {
    static func textInputFieldStyle(_ style: some TextInputFieldStyle) -> PlaceholderTextFieldTextInputFieldStyle {
        PlaceholderTextFieldTextInputFieldStyle(style: style)
    }

    static func textInputFieldStyle(@ViewBuilder content: @escaping (TextInputFieldConfiguration) -> some View) -> PlaceholderTextFieldTextInputFieldStyle {
        let style = AnyTextInputFieldStyle(content)
        return PlaceholderTextFieldTextInputFieldStyle(style: style)
    }
}

// MARK: ProcessingIndicatorStyle

public extension ProcessingIndicatorStyle where Self == ProcessingIndicatorBaseStyle {
    static var base: ProcessingIndicatorBaseStyle {
        ProcessingIndicatorBaseStyle()
    }
}

public extension ProcessingIndicatorStyle where Self == ProcessingIndicatorFioriStyle {
    static var fiori: ProcessingIndicatorFioriStyle {
        ProcessingIndicatorFioriStyle()
    }
}

public struct ProcessingIndicatorOptionalTitleStyle: ProcessingIndicatorStyle {
    let style: any OptionalTitleStyle

    public func makeBody(_ configuration: ProcessingIndicatorConfiguration) -> some View {
        ProcessingIndicator(configuration)
            .optionalTitleStyle(self.style)
            .typeErased
    }
}

public extension ProcessingIndicatorStyle where Self == ProcessingIndicatorOptionalTitleStyle {
    static func optionalTitleStyle(_ style: some OptionalTitleStyle) -> ProcessingIndicatorOptionalTitleStyle {
        ProcessingIndicatorOptionalTitleStyle(style: style)
    }

    static func optionalTitleStyle(@ViewBuilder content: @escaping (OptionalTitleConfiguration) -> some View) -> ProcessingIndicatorOptionalTitleStyle {
        let style = AnyOptionalTitleStyle(content)
        return ProcessingIndicatorOptionalTitleStyle(style: style)
    }
}

// MARK: ProfileHeaderStyle

public extension ProfileHeaderStyle where Self == ProfileHeaderBaseStyle {
    static var base: ProfileHeaderBaseStyle {
        ProfileHeaderBaseStyle()
    }
}

public extension ProfileHeaderStyle where Self == ProfileHeaderFioriStyle {
    static var fiori: ProfileHeaderFioriStyle {
        ProfileHeaderFioriStyle()
    }
}

public struct ProfileHeaderDetailImageStyle: ProfileHeaderStyle {
    let style: any DetailImageStyle

    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .detailImageStyle(self.style)
            .typeErased
    }
}

public extension ProfileHeaderStyle where Self == ProfileHeaderDetailImageStyle {
    static func detailImageStyle(_ style: some DetailImageStyle) -> ProfileHeaderDetailImageStyle {
        ProfileHeaderDetailImageStyle(style: style)
    }

    static func detailImageStyle(@ViewBuilder content: @escaping (DetailImageConfiguration) -> some View) -> ProfileHeaderDetailImageStyle {
        let style = AnyDetailImageStyle(content)
        return ProfileHeaderDetailImageStyle(style: style)
    }
}

public struct ProfileHeaderTitleStyle: ProfileHeaderStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ProfileHeaderStyle where Self == ProfileHeaderTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ProfileHeaderTitleStyle {
        ProfileHeaderTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ProfileHeaderTitleStyle {
        let style = AnyTitleStyle(content)
        return ProfileHeaderTitleStyle(style: style)
    }
}

public struct ProfileHeaderSubtitleStyle: ProfileHeaderStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension ProfileHeaderStyle where Self == ProfileHeaderSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> ProfileHeaderSubtitleStyle {
        ProfileHeaderSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> ProfileHeaderSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return ProfileHeaderSubtitleStyle(style: style)
    }
}

public struct ProfileHeaderDescriptionStyle: ProfileHeaderStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension ProfileHeaderStyle where Self == ProfileHeaderDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> ProfileHeaderDescriptionStyle {
        ProfileHeaderDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> ProfileHeaderDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return ProfileHeaderDescriptionStyle(style: style)
    }
}

// MARK: ProgressStyle

public extension ProgressStyle where Self == ProgressBaseStyle {
    static var base: ProgressBaseStyle {
        ProgressBaseStyle()
    }
}

public extension ProgressStyle where Self == ProgressFioriStyle {
    static var fiori: ProgressFioriStyle {
        ProgressFioriStyle()
    }
}

// MARK: ProgressIndicatorStyle

public extension ProgressIndicatorStyle where Self == ProgressIndicatorBaseStyle {
    static var base: ProgressIndicatorBaseStyle {
        ProgressIndicatorBaseStyle()
    }
}

public extension ProgressIndicatorStyle where Self == ProgressIndicatorFioriStyle {
    static var fiori: ProgressIndicatorFioriStyle {
        ProgressIndicatorFioriStyle()
    }
}

public struct ProgressIndicatorProgressIndicatorProtocolStyle: ProgressIndicatorStyle {
    let style: any ProgressIndicatorProtocolStyle

    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        ProgressIndicator(configuration)
            .progressIndicatorProtocolStyle(self.style)
            .typeErased
    }
}

public extension ProgressIndicatorStyle where Self == ProgressIndicatorProgressIndicatorProtocolStyle {
    static func progressIndicatorProtocolStyle(_ style: some ProgressIndicatorProtocolStyle) -> ProgressIndicatorProgressIndicatorProtocolStyle {
        ProgressIndicatorProgressIndicatorProtocolStyle(style: style)
    }

    static func progressIndicatorProtocolStyle(@ViewBuilder content: @escaping (ProgressIndicatorProtocolConfiguration) -> some View) -> ProgressIndicatorProgressIndicatorProtocolStyle {
        let style = AnyProgressIndicatorProtocolStyle(content)
        return ProgressIndicatorProgressIndicatorProtocolStyle(style: style)
    }
}

// MARK: ProgressIndicatorProtocolStyle

public extension ProgressIndicatorProtocolStyle where Self == ProgressIndicatorProtocolBaseStyle {
    static var base: ProgressIndicatorProtocolBaseStyle {
        ProgressIndicatorProtocolBaseStyle()
    }
}

public extension ProgressIndicatorProtocolStyle where Self == ProgressIndicatorProtocolFioriStyle {
    static var fiori: ProgressIndicatorProtocolFioriStyle {
        ProgressIndicatorProtocolFioriStyle()
    }
}

// MARK: PromptStyle

public extension PromptStyle where Self == PromptBaseStyle {
    static var base: PromptBaseStyle {
        PromptBaseStyle()
    }
}

public extension PromptStyle where Self == PromptFioriStyle {
    static var fiori: PromptFioriStyle {
        PromptFioriStyle()
    }
}

// MARK: RangeSliderControlStyle

public extension RangeSliderControlStyle where Self == RangeSliderControlBaseStyle {
    static var base: RangeSliderControlBaseStyle {
        RangeSliderControlBaseStyle()
    }
}

public extension RangeSliderControlStyle where Self == RangeSliderControlFioriStyle {
    static var fiori: RangeSliderControlFioriStyle {
        RangeSliderControlFioriStyle()
    }
}

public struct RangeSliderControlLowerThumbStyle: RangeSliderControlStyle {
    let style: any LowerThumbStyle

    public func makeBody(_ configuration: RangeSliderControlConfiguration) -> some View {
        RangeSliderControl(configuration)
            .lowerThumbStyle(self.style)
            .typeErased
    }
}

public extension RangeSliderControlStyle where Self == RangeSliderControlLowerThumbStyle {
    static func lowerThumbStyle(_ style: some LowerThumbStyle) -> RangeSliderControlLowerThumbStyle {
        RangeSliderControlLowerThumbStyle(style: style)
    }

    static func lowerThumbStyle(@ViewBuilder content: @escaping (LowerThumbConfiguration) -> some View) -> RangeSliderControlLowerThumbStyle {
        let style = AnyLowerThumbStyle(content)
        return RangeSliderControlLowerThumbStyle(style: style)
    }
}

public struct RangeSliderControlUpperThumbStyle: RangeSliderControlStyle {
    let style: any UpperThumbStyle

    public func makeBody(_ configuration: RangeSliderControlConfiguration) -> some View {
        RangeSliderControl(configuration)
            .upperThumbStyle(self.style)
            .typeErased
    }
}

public extension RangeSliderControlStyle where Self == RangeSliderControlUpperThumbStyle {
    static func upperThumbStyle(_ style: some UpperThumbStyle) -> RangeSliderControlUpperThumbStyle {
        RangeSliderControlUpperThumbStyle(style: style)
    }

    static func upperThumbStyle(@ViewBuilder content: @escaping (UpperThumbConfiguration) -> some View) -> RangeSliderControlUpperThumbStyle {
        let style = AnyUpperThumbStyle(content)
        return RangeSliderControlUpperThumbStyle(style: style)
    }
}

public struct RangeSliderControlActiveTrackStyle: RangeSliderControlStyle {
    let style: any ActiveTrackStyle

    public func makeBody(_ configuration: RangeSliderControlConfiguration) -> some View {
        RangeSliderControl(configuration)
            .activeTrackStyle(self.style)
            .typeErased
    }
}

public extension RangeSliderControlStyle where Self == RangeSliderControlActiveTrackStyle {
    static func activeTrackStyle(_ style: some ActiveTrackStyle) -> RangeSliderControlActiveTrackStyle {
        RangeSliderControlActiveTrackStyle(style: style)
    }

    static func activeTrackStyle(@ViewBuilder content: @escaping (ActiveTrackConfiguration) -> some View) -> RangeSliderControlActiveTrackStyle {
        let style = AnyActiveTrackStyle(content)
        return RangeSliderControlActiveTrackStyle(style: style)
    }
}

public struct RangeSliderControlInactiveTrackStyle: RangeSliderControlStyle {
    let style: any InactiveTrackStyle

    public func makeBody(_ configuration: RangeSliderControlConfiguration) -> some View {
        RangeSliderControl(configuration)
            .inactiveTrackStyle(self.style)
            .typeErased
    }
}

public extension RangeSliderControlStyle where Self == RangeSliderControlInactiveTrackStyle {
    static func inactiveTrackStyle(_ style: some InactiveTrackStyle) -> RangeSliderControlInactiveTrackStyle {
        RangeSliderControlInactiveTrackStyle(style: style)
    }

    static func inactiveTrackStyle(@ViewBuilder content: @escaping (InactiveTrackConfiguration) -> some View) -> RangeSliderControlInactiveTrackStyle {
        let style = AnyInactiveTrackStyle(content)
        return RangeSliderControlInactiveTrackStyle(style: style)
    }
}

// MARK: RatingControlStyle

public extension RatingControlStyle where Self == RatingControlBaseStyle {
    static var base: RatingControlBaseStyle {
        RatingControlBaseStyle()
    }
}

public extension RatingControlStyle where Self == RatingControlFioriStyle {
    static var fiori: RatingControlFioriStyle {
        RatingControlFioriStyle()
    }
}

public struct RatingControlValueLabelStyle: RatingControlStyle {
    let style: any ValueLabelStyle

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .valueLabelStyle(self.style)
            .typeErased
    }
}

public extension RatingControlStyle where Self == RatingControlValueLabelStyle {
    static func valueLabelStyle(_ style: some ValueLabelStyle) -> RatingControlValueLabelStyle {
        RatingControlValueLabelStyle(style: style)
    }

    static func valueLabelStyle(@ViewBuilder content: @escaping (ValueLabelConfiguration) -> some View) -> RatingControlValueLabelStyle {
        let style = AnyValueLabelStyle(content)
        return RatingControlValueLabelStyle(style: style)
    }
}

public struct RatingControlOnStarImageStyle: RatingControlStyle {
    let style: any OnStarImageStyle

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .onStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlStyle where Self == RatingControlOnStarImageStyle {
    static func onStarImageStyle(_ style: some OnStarImageStyle) -> RatingControlOnStarImageStyle {
        RatingControlOnStarImageStyle(style: style)
    }

    static func onStarImageStyle(@ViewBuilder content: @escaping (OnStarImageConfiguration) -> some View) -> RatingControlOnStarImageStyle {
        let style = AnyOnStarImageStyle(content)
        return RatingControlOnStarImageStyle(style: style)
    }
}

public struct RatingControlOffStarImageStyle: RatingControlStyle {
    let style: any OffStarImageStyle

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .offStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlStyle where Self == RatingControlOffStarImageStyle {
    static func offStarImageStyle(_ style: some OffStarImageStyle) -> RatingControlOffStarImageStyle {
        RatingControlOffStarImageStyle(style: style)
    }

    static func offStarImageStyle(@ViewBuilder content: @escaping (OffStarImageConfiguration) -> some View) -> RatingControlOffStarImageStyle {
        let style = AnyOffStarImageStyle(content)
        return RatingControlOffStarImageStyle(style: style)
    }
}

public struct RatingControlHalfStarImageStyle: RatingControlStyle {
    let style: any HalfStarImageStyle

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .halfStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlStyle where Self == RatingControlHalfStarImageStyle {
    static func halfStarImageStyle(_ style: some HalfStarImageStyle) -> RatingControlHalfStarImageStyle {
        RatingControlHalfStarImageStyle(style: style)
    }

    static func halfStarImageStyle(@ViewBuilder content: @escaping (HalfStarImageConfiguration) -> some View) -> RatingControlHalfStarImageStyle {
        let style = AnyHalfStarImageStyle(content)
        return RatingControlHalfStarImageStyle(style: style)
    }
}

public struct RatingControlReviewCountLabelStyle: RatingControlStyle {
    let style: any ReviewCountLabelStyle

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .reviewCountLabelStyle(self.style)
            .typeErased
    }
}

public extension RatingControlStyle where Self == RatingControlReviewCountLabelStyle {
    static func reviewCountLabelStyle(_ style: some ReviewCountLabelStyle) -> RatingControlReviewCountLabelStyle {
        RatingControlReviewCountLabelStyle(style: style)
    }

    static func reviewCountLabelStyle(@ViewBuilder content: @escaping (ReviewCountLabelConfiguration) -> some View) -> RatingControlReviewCountLabelStyle {
        let style = AnyReviewCountLabelStyle(content)
        return RatingControlReviewCountLabelStyle(style: style)
    }
}

// MARK: RatingControlFormViewStyle

public extension RatingControlFormViewStyle where Self == RatingControlFormViewBaseStyle {
    static var base: RatingControlFormViewBaseStyle {
        RatingControlFormViewBaseStyle()
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewFioriStyle {
    static var fiori: RatingControlFormViewFioriStyle {
        RatingControlFormViewFioriStyle()
    }
}

public struct RatingControlFormViewTitleStyle: RatingControlFormViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> RatingControlFormViewTitleStyle {
        RatingControlFormViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> RatingControlFormViewTitleStyle {
        let style = AnyTitleStyle(content)
        return RatingControlFormViewTitleStyle(style: style)
    }
}

public struct RatingControlFormViewValueLabelStyle: RatingControlFormViewStyle {
    let style: any ValueLabelStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .valueLabelStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewValueLabelStyle {
    static func valueLabelStyle(_ style: some ValueLabelStyle) -> RatingControlFormViewValueLabelStyle {
        RatingControlFormViewValueLabelStyle(style: style)
    }

    static func valueLabelStyle(@ViewBuilder content: @escaping (ValueLabelConfiguration) -> some View) -> RatingControlFormViewValueLabelStyle {
        let style = AnyValueLabelStyle(content)
        return RatingControlFormViewValueLabelStyle(style: style)
    }
}

public struct RatingControlFormViewOnStarImageStyle: RatingControlFormViewStyle {
    let style: any OnStarImageStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .onStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewOnStarImageStyle {
    static func onStarImageStyle(_ style: some OnStarImageStyle) -> RatingControlFormViewOnStarImageStyle {
        RatingControlFormViewOnStarImageStyle(style: style)
    }

    static func onStarImageStyle(@ViewBuilder content: @escaping (OnStarImageConfiguration) -> some View) -> RatingControlFormViewOnStarImageStyle {
        let style = AnyOnStarImageStyle(content)
        return RatingControlFormViewOnStarImageStyle(style: style)
    }
}

public struct RatingControlFormViewOffStarImageStyle: RatingControlFormViewStyle {
    let style: any OffStarImageStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .offStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewOffStarImageStyle {
    static func offStarImageStyle(_ style: some OffStarImageStyle) -> RatingControlFormViewOffStarImageStyle {
        RatingControlFormViewOffStarImageStyle(style: style)
    }

    static func offStarImageStyle(@ViewBuilder content: @escaping (OffStarImageConfiguration) -> some View) -> RatingControlFormViewOffStarImageStyle {
        let style = AnyOffStarImageStyle(content)
        return RatingControlFormViewOffStarImageStyle(style: style)
    }
}

public struct RatingControlFormViewHalfStarImageStyle: RatingControlFormViewStyle {
    let style: any HalfStarImageStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .halfStarImageStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewHalfStarImageStyle {
    static func halfStarImageStyle(_ style: some HalfStarImageStyle) -> RatingControlFormViewHalfStarImageStyle {
        RatingControlFormViewHalfStarImageStyle(style: style)
    }

    static func halfStarImageStyle(@ViewBuilder content: @escaping (HalfStarImageConfiguration) -> some View) -> RatingControlFormViewHalfStarImageStyle {
        let style = AnyHalfStarImageStyle(content)
        return RatingControlFormViewHalfStarImageStyle(style: style)
    }
}

public struct RatingControlFormViewReviewCountLabelStyle: RatingControlFormViewStyle {
    let style: any ReviewCountLabelStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .reviewCountLabelStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewReviewCountLabelStyle {
    static func reviewCountLabelStyle(_ style: some ReviewCountLabelStyle) -> RatingControlFormViewReviewCountLabelStyle {
        RatingControlFormViewReviewCountLabelStyle(style: style)
    }

    static func reviewCountLabelStyle(@ViewBuilder content: @escaping (ReviewCountLabelConfiguration) -> some View) -> RatingControlFormViewReviewCountLabelStyle {
        let style = AnyReviewCountLabelStyle(content)
        return RatingControlFormViewReviewCountLabelStyle(style: style)
    }
}

public struct RatingControlFormViewSubtitleStyle: RatingControlFormViewStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> RatingControlFormViewSubtitleStyle {
        RatingControlFormViewSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> RatingControlFormViewSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return RatingControlFormViewSubtitleStyle(style: style)
    }
}

public struct RatingControlFormViewRatingControlStyle: RatingControlFormViewStyle {
    let style: any RatingControlStyle

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .ratingControlStyle(self.style)
            .typeErased
    }
}

public extension RatingControlFormViewStyle where Self == RatingControlFormViewRatingControlStyle {
    static func ratingControlStyle(_ style: some RatingControlStyle) -> RatingControlFormViewRatingControlStyle {
        RatingControlFormViewRatingControlStyle(style: style)
    }

    static func ratingControlStyle(@ViewBuilder content: @escaping (RatingControlConfiguration) -> some View) -> RatingControlFormViewRatingControlStyle {
        let style = AnyRatingControlStyle(content)
        return RatingControlFormViewRatingControlStyle(style: style)
    }
}

// MARK: ReenterSignatureActionStyle

public extension ReenterSignatureActionStyle where Self == ReenterSignatureActionBaseStyle {
    static var base: ReenterSignatureActionBaseStyle {
        ReenterSignatureActionBaseStyle()
    }
}

public extension ReenterSignatureActionStyle where Self == ReenterSignatureActionFioriStyle {
    static var fiori: ReenterSignatureActionFioriStyle {
        ReenterSignatureActionFioriStyle()
    }
}

// MARK: ResetActionStyle

public extension ResetActionStyle where Self == ResetActionBaseStyle {
    static var base: ResetActionBaseStyle {
        ResetActionBaseStyle()
    }
}

public extension ResetActionStyle where Self == ResetActionFioriStyle {
    static var fiori: ResetActionFioriStyle {
        ResetActionFioriStyle()
    }
}

// MARK: ReviewCountLabelStyle

public extension ReviewCountLabelStyle where Self == ReviewCountLabelBaseStyle {
    static var base: ReviewCountLabelBaseStyle {
        ReviewCountLabelBaseStyle()
    }
}

public extension ReviewCountLabelStyle where Self == ReviewCountLabelFioriStyle {
    static var fiori: ReviewCountLabelFioriStyle {
        ReviewCountLabelFioriStyle()
    }
}

// MARK: Row1Style

public extension Row1Style where Self == Row1BaseStyle {
    static var base: Row1BaseStyle {
        Row1BaseStyle()
    }
}

public extension Row1Style where Self == Row1FioriStyle {
    static var fiori: Row1FioriStyle {
        Row1FioriStyle()
    }
}

// MARK: Row2Style

public extension Row2Style where Self == Row2BaseStyle {
    static var base: Row2BaseStyle {
        Row2BaseStyle()
    }
}

public extension Row2Style where Self == Row2FioriStyle {
    static var fiori: Row2FioriStyle {
        Row2FioriStyle()
    }
}

// MARK: Row3Style

public extension Row3Style where Self == Row3BaseStyle {
    static var base: Row3BaseStyle {
        Row3BaseStyle()
    }
}

public extension Row3Style where Self == Row3FioriStyle {
    static var fiori: Row3FioriStyle {
        Row3FioriStyle()
    }
}

// MARK: SaveActionStyle

public extension SaveActionStyle where Self == SaveActionBaseStyle {
    static var base: SaveActionBaseStyle {
        SaveActionBaseStyle()
    }
}

public extension SaveActionStyle where Self == SaveActionFioriStyle {
    static var fiori: SaveActionFioriStyle {
        SaveActionFioriStyle()
    }
}

// MARK: SecondaryActionStyle

public extension SecondaryActionStyle where Self == SecondaryActionBaseStyle {
    static var base: SecondaryActionBaseStyle {
        SecondaryActionBaseStyle()
    }
}

public extension SecondaryActionStyle where Self == SecondaryActionFioriStyle {
    static var fiori: SecondaryActionFioriStyle {
        SecondaryActionFioriStyle()
    }
}

// MARK: SecondaryTimestampStyle

public extension SecondaryTimestampStyle where Self == SecondaryTimestampBaseStyle {
    static var base: SecondaryTimestampBaseStyle {
        SecondaryTimestampBaseStyle()
    }
}

public extension SecondaryTimestampStyle where Self == SecondaryTimestampFioriStyle {
    static var fiori: SecondaryTimestampFioriStyle {
        SecondaryTimestampFioriStyle()
    }
}

// MARK: SectionFooterStyle

public extension SectionFooterStyle where Self == SectionFooterBaseStyle {
    static var base: SectionFooterBaseStyle {
        SectionFooterBaseStyle()
    }
}

public extension SectionFooterStyle where Self == SectionFooterFioriStyle {
    static var fiori: SectionFooterFioriStyle {
        SectionFooterFioriStyle()
    }
}

public struct SectionFooterTitleStyle: SectionFooterStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: SectionFooterConfiguration) -> some View {
        SectionFooter(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension SectionFooterStyle where Self == SectionFooterTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> SectionFooterTitleStyle {
        SectionFooterTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> SectionFooterTitleStyle {
        let style = AnyTitleStyle(content)
        return SectionFooterTitleStyle(style: style)
    }
}

public struct SectionFooterAttributeStyle: SectionFooterStyle {
    let style: any AttributeStyle

    public func makeBody(_ configuration: SectionFooterConfiguration) -> some View {
        SectionFooter(configuration)
            .attributeStyle(self.style)
            .typeErased
    }
}

public extension SectionFooterStyle where Self == SectionFooterAttributeStyle {
    static func attributeStyle(_ style: some AttributeStyle) -> SectionFooterAttributeStyle {
        SectionFooterAttributeStyle(style: style)
    }

    static func attributeStyle(@ViewBuilder content: @escaping (AttributeConfiguration) -> some View) -> SectionFooterAttributeStyle {
        let style = AnyAttributeStyle(content)
        return SectionFooterAttributeStyle(style: style)
    }
}

// MARK: SectionHeaderStyle

public extension SectionHeaderStyle where Self == SectionHeaderBaseStyle {
    static var base: SectionHeaderBaseStyle {
        SectionHeaderBaseStyle()
    }
}

public extension SectionHeaderStyle where Self == SectionHeaderFioriStyle {
    static var fiori: SectionHeaderFioriStyle {
        SectionHeaderFioriStyle()
    }
}

public struct SectionHeaderTitleStyle: SectionHeaderStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
        SectionHeader(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension SectionHeaderStyle where Self == SectionHeaderTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> SectionHeaderTitleStyle {
        SectionHeaderTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> SectionHeaderTitleStyle {
        let style = AnyTitleStyle(content)
        return SectionHeaderTitleStyle(style: style)
    }
}

public struct SectionHeaderAttributeStyle: SectionHeaderStyle {
    let style: any AttributeStyle

    public func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
        SectionHeader(configuration)
            .attributeStyle(self.style)
            .typeErased
    }
}

public extension SectionHeaderStyle where Self == SectionHeaderAttributeStyle {
    static func attributeStyle(_ style: some AttributeStyle) -> SectionHeaderAttributeStyle {
        SectionHeaderAttributeStyle(style: style)
    }

    static func attributeStyle(@ViewBuilder content: @escaping (AttributeConfiguration) -> some View) -> SectionHeaderAttributeStyle {
        let style = AnyAttributeStyle(content)
        return SectionHeaderAttributeStyle(style: style)
    }
}

// MARK: SegmentedControlPickerStyle

public extension SegmentedControlPickerStyle where Self == SegmentedControlPickerBaseStyle {
    static var base: SegmentedControlPickerBaseStyle {
        SegmentedControlPickerBaseStyle()
    }
}

public extension SegmentedControlPickerStyle where Self == SegmentedControlPickerFioriStyle {
    static var fiori: SegmentedControlPickerFioriStyle {
        SegmentedControlPickerFioriStyle()
    }
}

public struct SegmentedControlPickerOptionsStyle: SegmentedControlPickerStyle {
    let style: any OptionsStyle

    public func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
        SegmentedControlPicker(configuration)
            .optionsStyle(self.style)
            .typeErased
    }
}

public extension SegmentedControlPickerStyle where Self == SegmentedControlPickerOptionsStyle {
    static func optionsStyle(_ style: some OptionsStyle) -> SegmentedControlPickerOptionsStyle {
        SegmentedControlPickerOptionsStyle(style: style)
    }

    static func optionsStyle(@ViewBuilder content: @escaping (OptionsConfiguration) -> some View) -> SegmentedControlPickerOptionsStyle {
        let style = AnyOptionsStyle(content)
        return SegmentedControlPickerOptionsStyle(style: style)
    }
}

// MARK: SelectAllActionStyle

public extension SelectAllActionStyle where Self == SelectAllActionBaseStyle {
    static var base: SelectAllActionBaseStyle {
        SelectAllActionBaseStyle()
    }
}

public extension SelectAllActionStyle where Self == SelectAllActionFioriStyle {
    static var fiori: SelectAllActionFioriStyle {
        SelectAllActionFioriStyle()
    }
}

// MARK: SelectedEntriesSectionTitleStyle

public extension SelectedEntriesSectionTitleStyle where Self == SelectedEntriesSectionTitleBaseStyle {
    static var base: SelectedEntriesSectionTitleBaseStyle {
        SelectedEntriesSectionTitleBaseStyle()
    }
}

public extension SelectedEntriesSectionTitleStyle where Self == SelectedEntriesSectionTitleFioriStyle {
    static var fiori: SelectedEntriesSectionTitleFioriStyle {
        SelectedEntriesSectionTitleFioriStyle()
    }
}

// MARK: SideBarStyle

public extension SideBarStyle where Self == SideBarBaseStyle {
    static var base: SideBarBaseStyle {
        SideBarBaseStyle()
    }
}

public extension SideBarStyle where Self == SideBarFioriStyle {
    static var fiori: SideBarFioriStyle {
        SideBarFioriStyle()
    }
}

// MARK: SideBarListItemStyle

public extension SideBarListItemStyle where Self == SideBarListItemBaseStyle {
    static var base: SideBarListItemBaseStyle {
        SideBarListItemBaseStyle()
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemFioriStyle {
    static var fiori: SideBarListItemFioriStyle {
        SideBarListItemFioriStyle()
    }
}

public struct SideBarListItemIconStyle: SideBarListItemStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemIconStyle {
    static func iconStyle(_ style: some IconStyle) -> SideBarListItemIconStyle {
        SideBarListItemIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> SideBarListItemIconStyle {
        let style = AnyIconStyle(content)
        return SideBarListItemIconStyle(style: style)
    }
}

public struct SideBarListItemFilledIconStyle: SideBarListItemStyle {
    let style: any FilledIconStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .filledIconStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemFilledIconStyle {
    static func filledIconStyle(_ style: some FilledIconStyle) -> SideBarListItemFilledIconStyle {
        SideBarListItemFilledIconStyle(style: style)
    }

    static func filledIconStyle(@ViewBuilder content: @escaping (FilledIconConfiguration) -> some View) -> SideBarListItemFilledIconStyle {
        let style = AnyFilledIconStyle(content)
        return SideBarListItemFilledIconStyle(style: style)
    }
}

public struct SideBarListItemTitleStyle: SideBarListItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> SideBarListItemTitleStyle {
        SideBarListItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> SideBarListItemTitleStyle {
        let style = AnyTitleStyle(content)
        return SideBarListItemTitleStyle(style: style)
    }
}

public struct SideBarListItemSubtitleStyle: SideBarListItemStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> SideBarListItemSubtitleStyle {
        SideBarListItemSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> SideBarListItemSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return SideBarListItemSubtitleStyle(style: style)
    }
}

public struct SideBarListItemAccessoryIconStyle: SideBarListItemStyle {
    let style: any AccessoryIconStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .accessoryIconStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemAccessoryIconStyle {
    static func accessoryIconStyle(_ style: some AccessoryIconStyle) -> SideBarListItemAccessoryIconStyle {
        SideBarListItemAccessoryIconStyle(style: style)
    }

    static func accessoryIconStyle(@ViewBuilder content: @escaping (AccessoryIconConfiguration) -> some View) -> SideBarListItemAccessoryIconStyle {
        let style = AnyAccessoryIconStyle(content)
        return SideBarListItemAccessoryIconStyle(style: style)
    }
}

public struct SideBarListItemSwitchStyle: SideBarListItemStyle {
    let style: any SwitchStyle

    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .switchStyle(self.style)
            .typeErased
    }
}

public extension SideBarListItemStyle where Self == SideBarListItemSwitchStyle {
    static func switchStyle(_ style: some SwitchStyle) -> SideBarListItemSwitchStyle {
        SideBarListItemSwitchStyle(style: style)
    }

    static func switchStyle(@ViewBuilder content: @escaping (SwitchConfiguration) -> some View) -> SideBarListItemSwitchStyle {
        let style = AnySwitchStyle(content)
        return SideBarListItemSwitchStyle(style: style)
    }
}

// MARK: SignInActionStyle

public extension SignInActionStyle where Self == SignInActionBaseStyle {
    static var base: SignInActionBaseStyle {
        SignInActionBaseStyle()
    }
}

public extension SignInActionStyle where Self == SignInActionFioriStyle {
    static var fiori: SignInActionFioriStyle {
        SignInActionFioriStyle()
    }
}

// MARK: SignatureCaptureViewStyle

public extension SignatureCaptureViewStyle where Self == SignatureCaptureViewBaseStyle {
    static var base: SignatureCaptureViewBaseStyle {
        SignatureCaptureViewBaseStyle()
    }
}

public extension SignatureCaptureViewStyle where Self == SignatureCaptureViewFioriStyle {
    static var fiori: SignatureCaptureViewFioriStyle {
        SignatureCaptureViewFioriStyle()
    }
}

public struct SignatureCaptureViewTitleStyle: SignatureCaptureViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        SignatureCaptureView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension SignatureCaptureViewStyle where Self == SignatureCaptureViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> SignatureCaptureViewTitleStyle {
        SignatureCaptureViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> SignatureCaptureViewTitleStyle {
        let style = AnyTitleStyle(content)
        return SignatureCaptureViewTitleStyle(style: style)
    }
}

public struct SignatureCaptureViewStartSignatureActionStyle: SignatureCaptureViewStyle {
    let style: any StartSignatureActionStyle

    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        SignatureCaptureView(configuration)
            .startSignatureActionStyle(self.style)
            .typeErased
    }
}

public extension SignatureCaptureViewStyle where Self == SignatureCaptureViewStartSignatureActionStyle {
    static func startSignatureActionStyle(_ style: some StartSignatureActionStyle) -> SignatureCaptureViewStartSignatureActionStyle {
        SignatureCaptureViewStartSignatureActionStyle(style: style)
    }

    static func startSignatureActionStyle(@ViewBuilder content: @escaping (StartSignatureActionConfiguration) -> some View) -> SignatureCaptureViewStartSignatureActionStyle {
        let style = AnyStartSignatureActionStyle(content)
        return SignatureCaptureViewStartSignatureActionStyle(style: style)
    }
}

public struct SignatureCaptureViewReenterSignatureActionStyle: SignatureCaptureViewStyle {
    let style: any ReenterSignatureActionStyle

    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        SignatureCaptureView(configuration)
            .reenterSignatureActionStyle(self.style)
            .typeErased
    }
}

public extension SignatureCaptureViewStyle where Self == SignatureCaptureViewReenterSignatureActionStyle {
    static func reenterSignatureActionStyle(_ style: some ReenterSignatureActionStyle) -> SignatureCaptureViewReenterSignatureActionStyle {
        SignatureCaptureViewReenterSignatureActionStyle(style: style)
    }

    static func reenterSignatureActionStyle(@ViewBuilder content: @escaping (ReenterSignatureActionConfiguration) -> some View) -> SignatureCaptureViewReenterSignatureActionStyle {
        let style = AnyReenterSignatureActionStyle(content)
        return SignatureCaptureViewReenterSignatureActionStyle(style: style)
    }
}

public struct SignatureCaptureViewCancelActionStyle: SignatureCaptureViewStyle {
    let style: any CancelActionStyle

    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        SignatureCaptureView(configuration)
            .cancelActionStyle(self.style)
            .typeErased
    }
}

public extension SignatureCaptureViewStyle where Self == SignatureCaptureViewCancelActionStyle {
    static func cancelActionStyle(_ style: some CancelActionStyle) -> SignatureCaptureViewCancelActionStyle {
        SignatureCaptureViewCancelActionStyle(style: style)
    }

    static func cancelActionStyle(@ViewBuilder content: @escaping (CancelActionConfiguration) -> some View) -> SignatureCaptureViewCancelActionStyle {
        let style = AnyCancelActionStyle(content)
        return SignatureCaptureViewCancelActionStyle(style: style)
    }
}

public struct SignatureCaptureViewClearActionStyle: SignatureCaptureViewStyle {
    let style: any ClearActionStyle

    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        SignatureCaptureView(configuration)
            .clearActionStyle(self.style)
            .typeErased
    }
}

public extension SignatureCaptureViewStyle where Self == SignatureCaptureViewClearActionStyle {
    static func clearActionStyle(_ style: some ClearActionStyle) -> SignatureCaptureViewClearActionStyle {
        SignatureCaptureViewClearActionStyle(style: style)
    }

    static func clearActionStyle(@ViewBuilder content: @escaping (ClearActionConfiguration) -> some View) -> SignatureCaptureViewClearActionStyle {
        let style = AnyClearActionStyle(content)
        return SignatureCaptureViewClearActionStyle(style: style)
    }
}

public struct SignatureCaptureViewSaveActionStyle: SignatureCaptureViewStyle {
    let style: any SaveActionStyle

    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        SignatureCaptureView(configuration)
            .saveActionStyle(self.style)
            .typeErased
    }
}

public extension SignatureCaptureViewStyle where Self == SignatureCaptureViewSaveActionStyle {
    static func saveActionStyle(_ style: some SaveActionStyle) -> SignatureCaptureViewSaveActionStyle {
        SignatureCaptureViewSaveActionStyle(style: style)
    }

    static func saveActionStyle(@ViewBuilder content: @escaping (SaveActionConfiguration) -> some View) -> SignatureCaptureViewSaveActionStyle {
        let style = AnySaveActionStyle(content)
        return SignatureCaptureViewSaveActionStyle(style: style)
    }
}

public struct SignatureCaptureViewXmarkStyle: SignatureCaptureViewStyle {
    let style: any XmarkStyle

    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        SignatureCaptureView(configuration)
            .xmarkStyle(self.style)
            .typeErased
    }
}

public extension SignatureCaptureViewStyle where Self == SignatureCaptureViewXmarkStyle {
    static func xmarkStyle(_ style: some XmarkStyle) -> SignatureCaptureViewXmarkStyle {
        SignatureCaptureViewXmarkStyle(style: style)
    }

    static func xmarkStyle(@ViewBuilder content: @escaping (XmarkConfiguration) -> some View) -> SignatureCaptureViewXmarkStyle {
        let style = AnyXmarkStyle(content)
        return SignatureCaptureViewXmarkStyle(style: style)
    }
}

public struct SignatureCaptureViewWatermarkStyle: SignatureCaptureViewStyle {
    let style: any WatermarkStyle

    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        SignatureCaptureView(configuration)
            .watermarkStyle(self.style)
            .typeErased
    }
}

public extension SignatureCaptureViewStyle where Self == SignatureCaptureViewWatermarkStyle {
    static func watermarkStyle(_ style: some WatermarkStyle) -> SignatureCaptureViewWatermarkStyle {
        SignatureCaptureViewWatermarkStyle(style: style)
    }

    static func watermarkStyle(@ViewBuilder content: @escaping (WatermarkConfiguration) -> some View) -> SignatureCaptureViewWatermarkStyle {
        let style = AnyWatermarkStyle(content)
        return SignatureCaptureViewWatermarkStyle(style: style)
    }
}

// MARK: SingleStepStyle

public extension SingleStepStyle where Self == SingleStepBaseStyle {
    static var base: SingleStepBaseStyle {
        SingleStepBaseStyle()
    }
}

public extension SingleStepStyle where Self == SingleStepFioriStyle {
    static var fiori: SingleStepFioriStyle {
        SingleStepFioriStyle()
    }
}

public struct SingleStepTitleStyle: SingleStepStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: SingleStepConfiguration) -> some View {
        SingleStep(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension SingleStepStyle where Self == SingleStepTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> SingleStepTitleStyle {
        SingleStepTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> SingleStepTitleStyle {
        let style = AnyTitleStyle(content)
        return SingleStepTitleStyle(style: style)
    }
}

public struct SingleStepNodeStyle: SingleStepStyle {
    let style: any NodeStyle

    public func makeBody(_ configuration: SingleStepConfiguration) -> some View {
        SingleStep(configuration)
            .nodeStyle(self.style)
            .typeErased
    }
}

public extension SingleStepStyle where Self == SingleStepNodeStyle {
    static func nodeStyle(_ style: some NodeStyle) -> SingleStepNodeStyle {
        SingleStepNodeStyle(style: style)
    }

    static func nodeStyle(@ViewBuilder content: @escaping (NodeConfiguration) -> some View) -> SingleStepNodeStyle {
        let style = AnyNodeStyle(content)
        return SingleStepNodeStyle(style: style)
    }
}

public struct SingleStepLineStyle: SingleStepStyle {
    let style: any LineStyle

    public func makeBody(_ configuration: SingleStepConfiguration) -> some View {
        SingleStep(configuration)
            .lineStyle(self.style)
            .typeErased
    }
}

public extension SingleStepStyle where Self == SingleStepLineStyle {
    static func lineStyle(_ style: some LineStyle) -> SingleStepLineStyle {
        SingleStepLineStyle(style: style)
    }

    static func lineStyle(@ViewBuilder content: @escaping (LineConfiguration) -> some View) -> SingleStepLineStyle {
        let style = AnyLineStyle(content)
        return SingleStepLineStyle(style: style)
    }
}

// MARK: SortFilterViewStyle

public extension SortFilterViewStyle where Self == SortFilterViewBaseStyle {
    static var base: SortFilterViewBaseStyle {
        SortFilterViewBaseStyle()
    }
}

public extension SortFilterViewStyle where Self == SortFilterViewFioriStyle {
    static var fiori: SortFilterViewFioriStyle {
        SortFilterViewFioriStyle()
    }
}

public struct SortFilterViewTitleStyle: SortFilterViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: SortFilterViewConfiguration) -> some View {
        SortFilterView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension SortFilterViewStyle where Self == SortFilterViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> SortFilterViewTitleStyle {
        SortFilterViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> SortFilterViewTitleStyle {
        let style = AnyTitleStyle(content)
        return SortFilterViewTitleStyle(style: style)
    }
}

public struct SortFilterViewCancelActionStyle: SortFilterViewStyle {
    let style: any CancelActionStyle

    public func makeBody(_ configuration: SortFilterViewConfiguration) -> some View {
        SortFilterView(configuration)
            .cancelActionStyle(self.style)
            .typeErased
    }
}

public extension SortFilterViewStyle where Self == SortFilterViewCancelActionStyle {
    static func cancelActionStyle(_ style: some CancelActionStyle) -> SortFilterViewCancelActionStyle {
        SortFilterViewCancelActionStyle(style: style)
    }

    static func cancelActionStyle(@ViewBuilder content: @escaping (CancelActionConfiguration) -> some View) -> SortFilterViewCancelActionStyle {
        let style = AnyCancelActionStyle(content)
        return SortFilterViewCancelActionStyle(style: style)
    }
}

public struct SortFilterViewApplyActionStyle: SortFilterViewStyle {
    let style: any ApplyActionStyle

    public func makeBody(_ configuration: SortFilterViewConfiguration) -> some View {
        SortFilterView(configuration)
            .applyActionStyle(self.style)
            .typeErased
    }
}

public extension SortFilterViewStyle where Self == SortFilterViewApplyActionStyle {
    static func applyActionStyle(_ style: some ApplyActionStyle) -> SortFilterViewApplyActionStyle {
        SortFilterViewApplyActionStyle(style: style)
    }

    static func applyActionStyle(@ViewBuilder content: @escaping (ApplyActionConfiguration) -> some View) -> SortFilterViewApplyActionStyle {
        let style = AnyApplyActionStyle(content)
        return SortFilterViewApplyActionStyle(style: style)
    }
}

public struct SortFilterViewResetActionStyle: SortFilterViewStyle {
    let style: any ResetActionStyle

    public func makeBody(_ configuration: SortFilterViewConfiguration) -> some View {
        SortFilterView(configuration)
            .resetActionStyle(self.style)
            .typeErased
    }
}

public extension SortFilterViewStyle where Self == SortFilterViewResetActionStyle {
    static func resetActionStyle(_ style: some ResetActionStyle) -> SortFilterViewResetActionStyle {
        SortFilterViewResetActionStyle(style: style)
    }

    static func resetActionStyle(@ViewBuilder content: @escaping (ResetActionConfiguration) -> some View) -> SortFilterViewResetActionStyle {
        let style = AnyResetActionStyle(content)
        return SortFilterViewResetActionStyle(style: style)
    }
}

// MARK: StartSignatureActionStyle

public extension StartSignatureActionStyle where Self == StartSignatureActionBaseStyle {
    static var base: StartSignatureActionBaseStyle {
        StartSignatureActionBaseStyle()
    }
}

public extension StartSignatureActionStyle where Self == StartSignatureActionFioriStyle {
    static var fiori: StartSignatureActionFioriStyle {
        StartSignatureActionFioriStyle()
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

// MARK: StepProgressIndicatorStyle

public extension StepProgressIndicatorStyle where Self == StepProgressIndicatorBaseStyle {
    static var base: StepProgressIndicatorBaseStyle {
        StepProgressIndicatorBaseStyle()
    }
}

public extension StepProgressIndicatorStyle where Self == StepProgressIndicatorFioriStyle {
    static var fiori: StepProgressIndicatorFioriStyle {
        StepProgressIndicatorFioriStyle()
    }
}

public struct StepProgressIndicatorTitleStyle: StepProgressIndicatorStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: StepProgressIndicatorConfiguration) -> some View {
        StepProgressIndicator(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension StepProgressIndicatorStyle where Self == StepProgressIndicatorTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> StepProgressIndicatorTitleStyle {
        StepProgressIndicatorTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> StepProgressIndicatorTitleStyle {
        let style = AnyTitleStyle(content)
        return StepProgressIndicatorTitleStyle(style: style)
    }
}

public struct StepProgressIndicatorActionStyle: StepProgressIndicatorStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: StepProgressIndicatorConfiguration) -> some View {
        StepProgressIndicator(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension StepProgressIndicatorStyle where Self == StepProgressIndicatorActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> StepProgressIndicatorActionStyle {
        StepProgressIndicatorActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> StepProgressIndicatorActionStyle {
        let style = AnyActionStyle(content)
        return StepProgressIndicatorActionStyle(style: style)
    }
}

public struct StepProgressIndicatorCancelActionStyle: StepProgressIndicatorStyle {
    let style: any CancelActionStyle

    public func makeBody(_ configuration: StepProgressIndicatorConfiguration) -> some View {
        StepProgressIndicator(configuration)
            .cancelActionStyle(self.style)
            .typeErased
    }
}

public extension StepProgressIndicatorStyle where Self == StepProgressIndicatorCancelActionStyle {
    static func cancelActionStyle(_ style: some CancelActionStyle) -> StepProgressIndicatorCancelActionStyle {
        StepProgressIndicatorCancelActionStyle(style: style)
    }

    static func cancelActionStyle(@ViewBuilder content: @escaping (CancelActionConfiguration) -> some View) -> StepProgressIndicatorCancelActionStyle {
        let style = AnyCancelActionStyle(content)
        return StepProgressIndicatorCancelActionStyle(style: style)
    }
}

// MARK: StepperFieldStyle

public extension StepperFieldStyle where Self == StepperFieldBaseStyle {
    static var base: StepperFieldBaseStyle {
        StepperFieldBaseStyle()
    }
}

public extension StepperFieldStyle where Self == StepperFieldFioriStyle {
    static var fiori: StepperFieldFioriStyle {
        StepperFieldFioriStyle()
    }
}

public struct StepperFieldDecrementActionStyle: StepperFieldStyle {
    let style: any DecrementActionStyle

    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        StepperField(configuration)
            .decrementActionStyle(self.style)
            .typeErased
    }
}

public extension StepperFieldStyle where Self == StepperFieldDecrementActionStyle {
    static func decrementActionStyle(_ style: some DecrementActionStyle) -> StepperFieldDecrementActionStyle {
        StepperFieldDecrementActionStyle(style: style)
    }

    static func decrementActionStyle(@ViewBuilder content: @escaping (DecrementActionConfiguration) -> some View) -> StepperFieldDecrementActionStyle {
        let style = AnyDecrementActionStyle(content)
        return StepperFieldDecrementActionStyle(style: style)
    }
}

public struct StepperFieldIncrementActionStyle: StepperFieldStyle {
    let style: any IncrementActionStyle

    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        StepperField(configuration)
            .incrementActionStyle(self.style)
            .typeErased
    }
}

public extension StepperFieldStyle where Self == StepperFieldIncrementActionStyle {
    static func incrementActionStyle(_ style: some IncrementActionStyle) -> StepperFieldIncrementActionStyle {
        StepperFieldIncrementActionStyle(style: style)
    }

    static func incrementActionStyle(@ViewBuilder content: @escaping (IncrementActionConfiguration) -> some View) -> StepperFieldIncrementActionStyle {
        let style = AnyIncrementActionStyle(content)
        return StepperFieldIncrementActionStyle(style: style)
    }
}

public struct StepperFieldTextInputFieldStyle: StepperFieldStyle {
    let style: any TextInputFieldStyle

    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        StepperField(configuration)
            .textInputFieldStyle(self.style)
            .typeErased
    }
}

public extension StepperFieldStyle where Self == StepperFieldTextInputFieldStyle {
    static func textInputFieldStyle(_ style: some TextInputFieldStyle) -> StepperFieldTextInputFieldStyle {
        StepperFieldTextInputFieldStyle(style: style)
    }

    static func textInputFieldStyle(@ViewBuilder content: @escaping (TextInputFieldConfiguration) -> some View) -> StepperFieldTextInputFieldStyle {
        let style = AnyTextInputFieldStyle(content)
        return StepperFieldTextInputFieldStyle(style: style)
    }
}

// MARK: StepperViewStyle

public extension StepperViewStyle where Self == StepperViewBaseStyle {
    static var base: StepperViewBaseStyle {
        StepperViewBaseStyle()
    }
}

public extension StepperViewStyle where Self == StepperViewFioriStyle {
    static var fiori: StepperViewFioriStyle {
        StepperViewFioriStyle()
    }
}

public struct StepperViewTitleStyle: StepperViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> StepperViewTitleStyle {
        StepperViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> StepperViewTitleStyle {
        let style = AnyTitleStyle(content)
        return StepperViewTitleStyle(style: style)
    }
}

public struct StepperViewDecrementActionStyle: StepperViewStyle {
    let style: any DecrementActionStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .decrementActionStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewDecrementActionStyle {
    static func decrementActionStyle(_ style: some DecrementActionStyle) -> StepperViewDecrementActionStyle {
        StepperViewDecrementActionStyle(style: style)
    }

    static func decrementActionStyle(@ViewBuilder content: @escaping (DecrementActionConfiguration) -> some View) -> StepperViewDecrementActionStyle {
        let style = AnyDecrementActionStyle(content)
        return StepperViewDecrementActionStyle(style: style)
    }
}

public struct StepperViewIncrementActionStyle: StepperViewStyle {
    let style: any IncrementActionStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .incrementActionStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewIncrementActionStyle {
    static func incrementActionStyle(_ style: some IncrementActionStyle) -> StepperViewIncrementActionStyle {
        StepperViewIncrementActionStyle(style: style)
    }

    static func incrementActionStyle(@ViewBuilder content: @escaping (IncrementActionConfiguration) -> some View) -> StepperViewIncrementActionStyle {
        let style = AnyIncrementActionStyle(content)
        return StepperViewIncrementActionStyle(style: style)
    }
}

public struct StepperViewIconStyle: StepperViewStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewIconStyle {
    static func iconStyle(_ style: some IconStyle) -> StepperViewIconStyle {
        StepperViewIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> StepperViewIconStyle {
        let style = AnyIconStyle(content)
        return StepperViewIconStyle(style: style)
    }
}

public struct StepperViewDescriptionStyle: StepperViewStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> StepperViewDescriptionStyle {
        StepperViewDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> StepperViewDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return StepperViewDescriptionStyle(style: style)
    }
}

public struct StepperViewStepperFieldStyle: StepperViewStyle {
    let style: any StepperFieldStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .stepperFieldStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewStepperFieldStyle {
    static func stepperFieldStyle(_ style: some StepperFieldStyle) -> StepperViewStepperFieldStyle {
        StepperViewStepperFieldStyle(style: style)
    }

    static func stepperFieldStyle(@ViewBuilder content: @escaping (StepperFieldConfiguration) -> some View) -> StepperViewStepperFieldStyle {
        let style = AnyStepperFieldStyle(content)
        return StepperViewStepperFieldStyle(style: style)
    }
}

public struct StepperViewInformationViewStyle: StepperViewStyle {
    let style: any InformationViewStyle

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .informationViewStyle(self.style)
            .typeErased
    }
}

public extension StepperViewStyle where Self == StepperViewInformationViewStyle {
    static func informationViewStyle(_ style: some InformationViewStyle) -> StepperViewInformationViewStyle {
        StepperViewInformationViewStyle(style: style)
    }

    static func informationViewStyle(@ViewBuilder content: @escaping (InformationViewConfiguration) -> some View) -> StepperViewInformationViewStyle {
        let style = AnyInformationViewStyle(content)
        return StepperViewInformationViewStyle(style: style)
    }
}

// MARK: SubAttributeStyle

public extension SubAttributeStyle where Self == SubAttributeBaseStyle {
    static var base: SubAttributeBaseStyle {
        SubAttributeBaseStyle()
    }
}

public extension SubAttributeStyle where Self == SubAttributeFioriStyle {
    static var fiori: SubAttributeFioriStyle {
        SubAttributeFioriStyle()
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

// MARK: SwitchStyle

public extension SwitchStyle where Self == SwitchBaseStyle {
    static var base: SwitchBaseStyle {
        SwitchBaseStyle()
    }
}

public extension SwitchStyle where Self == SwitchFioriStyle {
    static var fiori: SwitchFioriStyle {
        SwitchFioriStyle()
    }
}

// MARK: SwitchViewStyle

public extension SwitchViewStyle where Self == SwitchViewBaseStyle {
    static var base: SwitchViewBaseStyle {
        SwitchViewBaseStyle()
    }
}

public extension SwitchViewStyle where Self == SwitchViewFioriStyle {
    static var fiori: SwitchViewFioriStyle {
        SwitchViewFioriStyle()
    }
}

public struct SwitchViewTitleStyle: SwitchViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        SwitchView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension SwitchViewStyle where Self == SwitchViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> SwitchViewTitleStyle {
        SwitchViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> SwitchViewTitleStyle {
        let style = AnyTitleStyle(content)
        return SwitchViewTitleStyle(style: style)
    }
}

public struct SwitchViewSwitchStyle: SwitchViewStyle {
    let style: any SwitchStyle

    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        SwitchView(configuration)
            .switchStyle(self.style)
            .typeErased
    }
}

public extension SwitchViewStyle where Self == SwitchViewSwitchStyle {
    static func switchStyle(_ style: some SwitchStyle) -> SwitchViewSwitchStyle {
        SwitchViewSwitchStyle(style: style)
    }

    static func switchStyle(@ViewBuilder content: @escaping (SwitchConfiguration) -> some View) -> SwitchViewSwitchStyle {
        let style = AnySwitchStyle(content)
        return SwitchViewSwitchStyle(style: style)
    }
}

// MARK: TagStyle

public extension TagStyle where Self == TagBaseStyle {
    static var base: TagBaseStyle {
        TagBaseStyle()
    }
}

public extension TagStyle where Self == TagFioriStyle {
    static var fiori: TagFioriStyle {
        TagFioriStyle()
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

// MARK: TertiaryActionStyle

public extension TertiaryActionStyle where Self == TertiaryActionBaseStyle {
    static var base: TertiaryActionBaseStyle {
        TertiaryActionBaseStyle()
    }
}

public extension TertiaryActionStyle where Self == TertiaryActionFioriStyle {
    static var fiori: TertiaryActionFioriStyle {
        TertiaryActionFioriStyle()
    }
}

// MARK: TextFieldFormViewStyle

public extension TextFieldFormViewStyle where Self == TextFieldFormViewBaseStyle {
    static var base: TextFieldFormViewBaseStyle {
        TextFieldFormViewBaseStyle()
    }
}

public extension TextFieldFormViewStyle where Self == TextFieldFormViewFioriStyle {
    static var fiori: TextFieldFormViewFioriStyle {
        TextFieldFormViewFioriStyle()
    }
}

public struct TextFieldFormViewTitleStyle: TextFieldFormViewStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension TextFieldFormViewStyle where Self == TextFieldFormViewTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> TextFieldFormViewTitleStyle {
        TextFieldFormViewTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> TextFieldFormViewTitleStyle {
        let style = AnyTitleStyle(content)
        return TextFieldFormViewTitleStyle(style: style)
    }
}

public struct TextFieldFormViewPlaceholderStyle: TextFieldFormViewStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension TextFieldFormViewStyle where Self == TextFieldFormViewPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> TextFieldFormViewPlaceholderStyle {
        TextFieldFormViewPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> TextFieldFormViewPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return TextFieldFormViewPlaceholderStyle(style: style)
    }
}

public struct TextFieldFormViewTitleFormViewStyle: TextFieldFormViewStyle {
    let style: any TitleFormViewStyle

    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .titleFormViewStyle(self.style)
            .typeErased
    }
}

public extension TextFieldFormViewStyle where Self == TextFieldFormViewTitleFormViewStyle {
    static func titleFormViewStyle(_ style: some TitleFormViewStyle) -> TextFieldFormViewTitleFormViewStyle {
        TextFieldFormViewTitleFormViewStyle(style: style)
    }

    static func titleFormViewStyle(@ViewBuilder content: @escaping (TitleFormViewConfiguration) -> some View) -> TextFieldFormViewTitleFormViewStyle {
        let style = AnyTitleFormViewStyle(content)
        return TextFieldFormViewTitleFormViewStyle(style: style)
    }
}

// MARK: TextInputStyle

public extension TextInputStyle where Self == TextInputBaseStyle {
    static var base: TextInputBaseStyle {
        TextInputBaseStyle()
    }
}

public extension TextInputStyle where Self == TextInputFioriStyle {
    static var fiori: TextInputFioriStyle {
        TextInputFioriStyle()
    }
}

// MARK: TextInputFieldStyle

public extension TextInputFieldStyle where Self == TextInputFieldBaseStyle {
    static var base: TextInputFieldBaseStyle {
        TextInputFieldBaseStyle()
    }
}

public extension TextInputFieldStyle where Self == TextInputFieldFioriStyle {
    static var fiori: TextInputFieldFioriStyle {
        TextInputFieldFioriStyle()
    }
}

// MARK: TextInputInfoViewStyle

extension TextInputInfoViewStyle where Self == TextInputInfoViewBaseStyle {
    static var base: TextInputInfoViewBaseStyle {
        TextInputInfoViewBaseStyle()
    }
}

extension TextInputInfoViewStyle where Self == TextInputInfoViewFioriStyle {
    static var fiori: TextInputInfoViewFioriStyle {
        TextInputInfoViewFioriStyle()
    }
}

struct TextInputInfoViewIconStyle: TextInputInfoViewStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

extension TextInputInfoViewStyle where Self == TextInputInfoViewIconStyle {
    static func iconStyle(_ style: some IconStyle) -> TextInputInfoViewIconStyle {
        TextInputInfoViewIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> TextInputInfoViewIconStyle {
        let style = AnyIconStyle(content)
        return TextInputInfoViewIconStyle(style: style)
    }
}

struct TextInputInfoViewDescriptionStyle: TextInputInfoViewStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

extension TextInputInfoViewStyle where Self == TextInputInfoViewDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> TextInputInfoViewDescriptionStyle {
        TextInputInfoViewDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> TextInputInfoViewDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return TextInputInfoViewDescriptionStyle(style: style)
    }
}

struct TextInputInfoViewCounterStyle: TextInputInfoViewStyle {
    let style: any CounterStyle

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .counterStyle(self.style)
            .typeErased
    }
}

extension TextInputInfoViewStyle where Self == TextInputInfoViewCounterStyle {
    static func counterStyle(_ style: some CounterStyle) -> TextInputInfoViewCounterStyle {
        TextInputInfoViewCounterStyle(style: style)
    }

    static func counterStyle(@ViewBuilder content: @escaping (CounterConfiguration) -> some View) -> TextInputInfoViewCounterStyle {
        let style = AnyCounterStyle(content)
        return TextInputInfoViewCounterStyle(style: style)
    }
}

struct TextInputInfoViewInformationViewStyle: TextInputInfoViewStyle {
    let style: any InformationViewStyle

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .informationViewStyle(self.style)
            .typeErased
    }
}

extension TextInputInfoViewStyle where Self == TextInputInfoViewInformationViewStyle {
    static func informationViewStyle(_ style: some InformationViewStyle) -> TextInputInfoViewInformationViewStyle {
        TextInputInfoViewInformationViewStyle(style: style)
    }

    static func informationViewStyle(@ViewBuilder content: @escaping (InformationViewConfiguration) -> some View) -> TextInputInfoViewInformationViewStyle {
        let style = AnyInformationViewStyle(content)
        return TextInputInfoViewInformationViewStyle(style: style)
    }
}

// MARK: TextViewStyle

public extension TextViewStyle where Self == TextViewBaseStyle {
    static var base: TextViewBaseStyle {
        TextViewBaseStyle()
    }
}

public extension TextViewStyle where Self == TextViewFioriStyle {
    static var fiori: TextViewFioriStyle {
        TextViewFioriStyle()
    }
}

// MARK: TimelineStyle

public extension TimelineStyle where Self == TimelineBaseStyle {
    static var base: TimelineBaseStyle {
        TimelineBaseStyle()
    }
}

public extension TimelineStyle where Self == TimelineFioriStyle {
    static var fiori: TimelineFioriStyle {
        TimelineFioriStyle()
    }
}

public struct TimelineTimestampStyle: TimelineStyle {
    let style: any TimestampStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .timestampStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineTimestampStyle {
    static func timestampStyle(_ style: some TimestampStyle) -> TimelineTimestampStyle {
        TimelineTimestampStyle(style: style)
    }

    static func timestampStyle(@ViewBuilder content: @escaping (TimestampConfiguration) -> some View) -> TimelineTimestampStyle {
        let style = AnyTimestampStyle(content)
        return TimelineTimestampStyle(style: style)
    }
}

public struct TimelineSecondaryTimestampStyle: TimelineStyle {
    let style: any SecondaryTimestampStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .secondaryTimestampStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineSecondaryTimestampStyle {
    static func secondaryTimestampStyle(_ style: some SecondaryTimestampStyle) -> TimelineSecondaryTimestampStyle {
        TimelineSecondaryTimestampStyle(style: style)
    }

    static func secondaryTimestampStyle(@ViewBuilder content: @escaping (SecondaryTimestampConfiguration) -> some View) -> TimelineSecondaryTimestampStyle {
        let style = AnySecondaryTimestampStyle(content)
        return TimelineSecondaryTimestampStyle(style: style)
    }
}

public struct TimelineTimelineNodeStyle: TimelineStyle {
    let style: any TimelineNodeStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .timelineNodeStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineTimelineNodeStyle {
    static func timelineNodeStyle(_ style: some TimelineNodeStyle) -> TimelineTimelineNodeStyle {
        TimelineTimelineNodeStyle(style: style)
    }

    static func timelineNodeStyle(@ViewBuilder content: @escaping (TimelineNodeConfiguration) -> some View) -> TimelineTimelineNodeStyle {
        let style = AnyTimelineNodeStyle(content)
        return TimelineTimelineNodeStyle(style: style)
    }
}

public struct TimelineIconStyle: TimelineStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineIconStyle {
    static func iconStyle(_ style: some IconStyle) -> TimelineIconStyle {
        TimelineIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> TimelineIconStyle {
        let style = AnyIconStyle(content)
        return TimelineIconStyle(style: style)
    }
}

public struct TimelineTitleStyle: TimelineStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> TimelineTitleStyle {
        TimelineTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> TimelineTitleStyle {
        let style = AnyTitleStyle(content)
        return TimelineTitleStyle(style: style)
    }
}

public struct TimelineSubtitleStyle: TimelineStyle {
    let style: any SubtitleStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .subtitleStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineSubtitleStyle {
    static func subtitleStyle(_ style: some SubtitleStyle) -> TimelineSubtitleStyle {
        TimelineSubtitleStyle(style: style)
    }

    static func subtitleStyle(@ViewBuilder content: @escaping (SubtitleConfiguration) -> some View) -> TimelineSubtitleStyle {
        let style = AnySubtitleStyle(content)
        return TimelineSubtitleStyle(style: style)
    }
}

public struct TimelineAttributeStyle: TimelineStyle {
    let style: any AttributeStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .attributeStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineAttributeStyle {
    static func attributeStyle(_ style: some AttributeStyle) -> TimelineAttributeStyle {
        TimelineAttributeStyle(style: style)
    }

    static func attributeStyle(@ViewBuilder content: @escaping (AttributeConfiguration) -> some View) -> TimelineAttributeStyle {
        let style = AnyAttributeStyle(content)
        return TimelineAttributeStyle(style: style)
    }
}

public struct TimelineStatusStyle: TimelineStyle {
    let style: any StatusStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .statusStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineStatusStyle {
    static func statusStyle(_ style: some StatusStyle) -> TimelineStatusStyle {
        TimelineStatusStyle(style: style)
    }

    static func statusStyle(@ViewBuilder content: @escaping (StatusConfiguration) -> some View) -> TimelineStatusStyle {
        let style = AnyStatusStyle(content)
        return TimelineStatusStyle(style: style)
    }
}

public struct TimelineSubstatusStyle: TimelineStyle {
    let style: any SubstatusStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .substatusStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineSubstatusStyle {
    static func substatusStyle(_ style: some SubstatusStyle) -> TimelineSubstatusStyle {
        TimelineSubstatusStyle(style: style)
    }

    static func substatusStyle(@ViewBuilder content: @escaping (SubstatusConfiguration) -> some View) -> TimelineSubstatusStyle {
        let style = AnySubstatusStyle(content)
        return TimelineSubstatusStyle(style: style)
    }
}

public struct TimelineSubAttributeStyle: TimelineStyle {
    let style: any SubAttributeStyle

    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .subAttributeStyle(self.style)
            .typeErased
    }
}

public extension TimelineStyle where Self == TimelineSubAttributeStyle {
    static func subAttributeStyle(_ style: some SubAttributeStyle) -> TimelineSubAttributeStyle {
        TimelineSubAttributeStyle(style: style)
    }

    static func subAttributeStyle(@ViewBuilder content: @escaping (SubAttributeConfiguration) -> some View) -> TimelineSubAttributeStyle {
        let style = AnySubAttributeStyle(content)
        return TimelineSubAttributeStyle(style: style)
    }
}

// MARK: TimelineMarkerStyle

public extension TimelineMarkerStyle where Self == TimelineMarkerBaseStyle {
    static var base: TimelineMarkerBaseStyle {
        TimelineMarkerBaseStyle()
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerFioriStyle {
    static var fiori: TimelineMarkerFioriStyle {
        TimelineMarkerFioriStyle()
    }
}

public struct TimelineMarkerTimestampStyle: TimelineMarkerStyle {
    let style: any TimestampStyle

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .timestampStyle(self.style)
            .typeErased
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerTimestampStyle {
    static func timestampStyle(_ style: some TimestampStyle) -> TimelineMarkerTimestampStyle {
        TimelineMarkerTimestampStyle(style: style)
    }

    static func timestampStyle(@ViewBuilder content: @escaping (TimestampConfiguration) -> some View) -> TimelineMarkerTimestampStyle {
        let style = AnyTimestampStyle(content)
        return TimelineMarkerTimestampStyle(style: style)
    }
}

public struct TimelineMarkerSecondaryTimestampStyle: TimelineMarkerStyle {
    let style: any SecondaryTimestampStyle

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .secondaryTimestampStyle(self.style)
            .typeErased
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerSecondaryTimestampStyle {
    static func secondaryTimestampStyle(_ style: some SecondaryTimestampStyle) -> TimelineMarkerSecondaryTimestampStyle {
        TimelineMarkerSecondaryTimestampStyle(style: style)
    }

    static func secondaryTimestampStyle(@ViewBuilder content: @escaping (SecondaryTimestampConfiguration) -> some View) -> TimelineMarkerSecondaryTimestampStyle {
        let style = AnySecondaryTimestampStyle(content)
        return TimelineMarkerSecondaryTimestampStyle(style: style)
    }
}

public struct TimelineMarkerTimelineNodeStyle: TimelineMarkerStyle {
    let style: any TimelineNodeStyle

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .timelineNodeStyle(self.style)
            .typeErased
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerTimelineNodeStyle {
    static func timelineNodeStyle(_ style: some TimelineNodeStyle) -> TimelineMarkerTimelineNodeStyle {
        TimelineMarkerTimelineNodeStyle(style: style)
    }

    static func timelineNodeStyle(@ViewBuilder content: @escaping (TimelineNodeConfiguration) -> some View) -> TimelineMarkerTimelineNodeStyle {
        let style = AnyTimelineNodeStyle(content)
        return TimelineMarkerTimelineNodeStyle(style: style)
    }
}

public struct TimelineMarkerIconStyle: TimelineMarkerStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerIconStyle {
    static func iconStyle(_ style: some IconStyle) -> TimelineMarkerIconStyle {
        TimelineMarkerIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> TimelineMarkerIconStyle {
        let style = AnyIconStyle(content)
        return TimelineMarkerIconStyle(style: style)
    }
}

public struct TimelineMarkerTitleStyle: TimelineMarkerStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension TimelineMarkerStyle where Self == TimelineMarkerTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> TimelineMarkerTitleStyle {
        TimelineMarkerTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> TimelineMarkerTitleStyle {
        let style = AnyTitleStyle(content)
        return TimelineMarkerTitleStyle(style: style)
    }
}

// MARK: TimelineNodeStyle

public extension TimelineNodeStyle where Self == TimelineNodeBaseStyle {
    static var base: TimelineNodeBaseStyle {
        TimelineNodeBaseStyle()
    }
}

public extension TimelineNodeStyle where Self == TimelineNodeFioriStyle {
    static var fiori: TimelineNodeFioriStyle {
        TimelineNodeFioriStyle()
    }
}

// MARK: TimelineNowIndicatorStyle

public extension TimelineNowIndicatorStyle where Self == TimelineNowIndicatorBaseStyle {
    static var base: TimelineNowIndicatorBaseStyle {
        TimelineNowIndicatorBaseStyle()
    }
}

public extension TimelineNowIndicatorStyle where Self == TimelineNowIndicatorFioriStyle {
    static var fiori: TimelineNowIndicatorFioriStyle {
        TimelineNowIndicatorFioriStyle()
    }
}

public struct TimelineNowIndicatorNowIndicatorNodeStyle: TimelineNowIndicatorStyle {
    let style: any NowIndicatorNodeStyle

    public func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        TimelineNowIndicator(configuration)
            .nowIndicatorNodeStyle(self.style)
            .typeErased
    }
}

public extension TimelineNowIndicatorStyle where Self == TimelineNowIndicatorNowIndicatorNodeStyle {
    static func nowIndicatorNodeStyle(_ style: some NowIndicatorNodeStyle) -> TimelineNowIndicatorNowIndicatorNodeStyle {
        TimelineNowIndicatorNowIndicatorNodeStyle(style: style)
    }

    static func nowIndicatorNodeStyle(@ViewBuilder content: @escaping (NowIndicatorNodeConfiguration) -> some View) -> TimelineNowIndicatorNowIndicatorNodeStyle {
        let style = AnyNowIndicatorNodeStyle(content)
        return TimelineNowIndicatorNowIndicatorNodeStyle(style: style)
    }
}

// MARK: TimelinePreviewStyle

public extension TimelinePreviewStyle where Self == TimelinePreviewBaseStyle {
    static var base: TimelinePreviewBaseStyle {
        TimelinePreviewBaseStyle()
    }
}

public extension TimelinePreviewStyle where Self == TimelinePreviewFioriStyle {
    static var fiori: TimelinePreviewFioriStyle {
        TimelinePreviewFioriStyle()
    }
}

public struct TimelinePreviewOptionalTitleStyle: TimelinePreviewStyle {
    let style: any OptionalTitleStyle

    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        TimelinePreview(configuration)
            .optionalTitleStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewStyle where Self == TimelinePreviewOptionalTitleStyle {
    static func optionalTitleStyle(_ style: some OptionalTitleStyle) -> TimelinePreviewOptionalTitleStyle {
        TimelinePreviewOptionalTitleStyle(style: style)
    }

    static func optionalTitleStyle(@ViewBuilder content: @escaping (OptionalTitleConfiguration) -> some View) -> TimelinePreviewOptionalTitleStyle {
        let style = AnyOptionalTitleStyle(content)
        return TimelinePreviewOptionalTitleStyle(style: style)
    }
}

public struct TimelinePreviewActionStyle: TimelinePreviewStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        TimelinePreview(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewStyle where Self == TimelinePreviewActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> TimelinePreviewActionStyle {
        TimelinePreviewActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> TimelinePreviewActionStyle {
        let style = AnyActionStyle(content)
        return TimelinePreviewActionStyle(style: style)
    }
}

// MARK: TimelinePreviewItemStyle

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemBaseStyle {
    static var base: TimelinePreviewItemBaseStyle {
        TimelinePreviewItemBaseStyle()
    }
}

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemFioriStyle {
    static var fiori: TimelinePreviewItemFioriStyle {
        TimelinePreviewItemFioriStyle()
    }
}

public struct TimelinePreviewItemTitleStyle: TimelinePreviewItemStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> TimelinePreviewItemTitleStyle {
        TimelinePreviewItemTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> TimelinePreviewItemTitleStyle {
        let style = AnyTitleStyle(content)
        return TimelinePreviewItemTitleStyle(style: style)
    }
}

public struct TimelinePreviewItemIconStyle: TimelinePreviewItemStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemIconStyle {
    static func iconStyle(_ style: some IconStyle) -> TimelinePreviewItemIconStyle {
        TimelinePreviewItemIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> TimelinePreviewItemIconStyle {
        let style = AnyIconStyle(content)
        return TimelinePreviewItemIconStyle(style: style)
    }
}

public struct TimelinePreviewItemTimelineNodeStyle: TimelinePreviewItemStyle {
    let style: any TimelineNodeStyle

    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .timelineNodeStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemTimelineNodeStyle {
    static func timelineNodeStyle(_ style: some TimelineNodeStyle) -> TimelinePreviewItemTimelineNodeStyle {
        TimelinePreviewItemTimelineNodeStyle(style: style)
    }

    static func timelineNodeStyle(@ViewBuilder content: @escaping (TimelineNodeConfiguration) -> some View) -> TimelinePreviewItemTimelineNodeStyle {
        let style = AnyTimelineNodeStyle(content)
        return TimelinePreviewItemTimelineNodeStyle(style: style)
    }
}

public struct TimelinePreviewItemTimestampStyle: TimelinePreviewItemStyle {
    let style: any TimestampStyle

    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .timestampStyle(self.style)
            .typeErased
    }
}

public extension TimelinePreviewItemStyle where Self == TimelinePreviewItemTimestampStyle {
    static func timestampStyle(_ style: some TimestampStyle) -> TimelinePreviewItemTimestampStyle {
        TimelinePreviewItemTimestampStyle(style: style)
    }

    static func timestampStyle(@ViewBuilder content: @escaping (TimestampConfiguration) -> some View) -> TimelinePreviewItemTimestampStyle {
        let style = AnyTimestampStyle(content)
        return TimelinePreviewItemTimestampStyle(style: style)
    }
}

// MARK: TimestampStyle

public extension TimestampStyle where Self == TimestampBaseStyle {
    static var base: TimestampBaseStyle {
        TimestampBaseStyle()
    }
}

public extension TimestampStyle where Self == TimestampFioriStyle {
    static var fiori: TimestampFioriStyle {
        TimestampFioriStyle()
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

// MARK: TitleFormViewStyle

public extension TitleFormViewStyle where Self == TitleFormViewBaseStyle {
    static var base: TitleFormViewBaseStyle {
        TitleFormViewBaseStyle()
    }
}

public extension TitleFormViewStyle where Self == TitleFormViewFioriStyle {
    static var fiori: TitleFormViewFioriStyle {
        TitleFormViewFioriStyle()
    }
}

public struct TitleFormViewPlaceholderStyle: TitleFormViewStyle {
    let style: any PlaceholderStyle

    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .placeholderStyle(self.style)
            .typeErased
    }
}

public extension TitleFormViewStyle where Self == TitleFormViewPlaceholderStyle {
    static func placeholderStyle(_ style: some PlaceholderStyle) -> TitleFormViewPlaceholderStyle {
        TitleFormViewPlaceholderStyle(style: style)
    }

    static func placeholderStyle(@ViewBuilder content: @escaping (PlaceholderConfiguration) -> some View) -> TitleFormViewPlaceholderStyle {
        let style = AnyPlaceholderStyle(content)
        return TitleFormViewPlaceholderStyle(style: style)
    }
}

public struct TitleFormViewPlaceholderTextFieldStyle: TitleFormViewStyle {
    let style: any PlaceholderTextFieldStyle

    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .placeholderTextFieldStyle(self.style)
            .typeErased
    }
}

public extension TitleFormViewStyle where Self == TitleFormViewPlaceholderTextFieldStyle {
    static func placeholderTextFieldStyle(_ style: some PlaceholderTextFieldStyle) -> TitleFormViewPlaceholderTextFieldStyle {
        TitleFormViewPlaceholderTextFieldStyle(style: style)
    }

    static func placeholderTextFieldStyle(@ViewBuilder content: @escaping (PlaceholderTextFieldConfiguration) -> some View) -> TitleFormViewPlaceholderTextFieldStyle {
        let style = AnyPlaceholderTextFieldStyle(content)
        return TitleFormViewPlaceholderTextFieldStyle(style: style)
    }
}

public struct TitleFormViewFormViewStyle: TitleFormViewStyle {
    let style: any FormViewStyle

    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .formViewStyle(self.style)
            .typeErased
    }
}

public extension TitleFormViewStyle where Self == TitleFormViewFormViewStyle {
    static func formViewStyle(_ style: some FormViewStyle) -> TitleFormViewFormViewStyle {
        TitleFormViewFormViewStyle(style: style)
    }

    static func formViewStyle(@ViewBuilder content: @escaping (FormViewConfiguration) -> some View) -> TitleFormViewFormViewStyle {
        let style = AnyFormViewStyle(content)
        return TitleFormViewFormViewStyle(style: style)
    }
}

// MARK: ToastMessageStyle

public extension ToastMessageStyle where Self == ToastMessageBaseStyle {
    static var base: ToastMessageBaseStyle {
        ToastMessageBaseStyle()
    }
}

public extension ToastMessageStyle where Self == ToastMessageFioriStyle {
    static var fiori: ToastMessageFioriStyle {
        ToastMessageFioriStyle()
    }
}

public struct ToastMessageIconStyle: ToastMessageStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
        ToastMessage(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension ToastMessageStyle where Self == ToastMessageIconStyle {
    static func iconStyle(_ style: some IconStyle) -> ToastMessageIconStyle {
        ToastMessageIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> ToastMessageIconStyle {
        let style = AnyIconStyle(content)
        return ToastMessageIconStyle(style: style)
    }
}

public struct ToastMessageTitleStyle: ToastMessageStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
        ToastMessage(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ToastMessageStyle where Self == ToastMessageTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ToastMessageTitleStyle {
        ToastMessageTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ToastMessageTitleStyle {
        let style = AnyTitleStyle(content)
        return ToastMessageTitleStyle(style: style)
    }
}

// MARK: TopDividerStyle

public extension TopDividerStyle where Self == TopDividerBaseStyle {
    static var base: TopDividerBaseStyle {
        TopDividerBaseStyle()
    }
}

public extension TopDividerStyle where Self == TopDividerFioriStyle {
    static var fiori: TopDividerFioriStyle {
        TopDividerFioriStyle()
    }
}

// MARK: TrailingAccessoryStyle

public extension TrailingAccessoryStyle where Self == TrailingAccessoryBaseStyle {
    static var base: TrailingAccessoryBaseStyle {
        TrailingAccessoryBaseStyle()
    }
}

public extension TrailingAccessoryStyle where Self == TrailingAccessoryFioriStyle {
    static var fiori: TrailingAccessoryFioriStyle {
        TrailingAccessoryFioriStyle()
    }
}

// MARK: TrendStyle

public extension TrendStyle where Self == TrendBaseStyle {
    static var base: TrendBaseStyle {
        TrendBaseStyle()
    }
}

public extension TrendStyle where Self == TrendFioriStyle {
    static var fiori: TrendFioriStyle {
        TrendFioriStyle()
    }
}

// MARK: TrendImageStyle

public extension TrendImageStyle where Self == TrendImageBaseStyle {
    static var base: TrendImageBaseStyle {
        TrendImageBaseStyle()
    }
}

public extension TrendImageStyle where Self == TrendImageFioriStyle {
    static var fiori: TrendImageFioriStyle {
        TrendImageFioriStyle()
    }
}

// MARK: UpperThumbStyle

public extension UpperThumbStyle where Self == UpperThumbBaseStyle {
    static var base: UpperThumbBaseStyle {
        UpperThumbBaseStyle()
    }
}

public extension UpperThumbStyle where Self == UpperThumbFioriStyle {
    static var fiori: UpperThumbFioriStyle {
        UpperThumbFioriStyle()
    }
}

// MARK: UserConsentFormStyle

public extension UserConsentFormStyle where Self == UserConsentFormBaseStyle {
    static var base: UserConsentFormBaseStyle {
        UserConsentFormBaseStyle()
    }
}

public extension UserConsentFormStyle where Self == UserConsentFormFioriStyle {
    static var fiori: UserConsentFormFioriStyle {
        UserConsentFormFioriStyle()
    }
}

public struct UserConsentFormNextActionStyle: UserConsentFormStyle {
    let style: any NextActionStyle

    public func makeBody(_ configuration: UserConsentFormConfiguration) -> some View {
        UserConsentForm(configuration)
            .nextActionStyle(self.style)
            .typeErased
    }
}

public extension UserConsentFormStyle where Self == UserConsentFormNextActionStyle {
    static func nextActionStyle(_ style: some NextActionStyle) -> UserConsentFormNextActionStyle {
        UserConsentFormNextActionStyle(style: style)
    }

    static func nextActionStyle(@ViewBuilder content: @escaping (NextActionConfiguration) -> some View) -> UserConsentFormNextActionStyle {
        let style = AnyNextActionStyle(content)
        return UserConsentFormNextActionStyle(style: style)
    }
}

public struct UserConsentFormCancelActionStyle: UserConsentFormStyle {
    let style: any CancelActionStyle

    public func makeBody(_ configuration: UserConsentFormConfiguration) -> some View {
        UserConsentForm(configuration)
            .cancelActionStyle(self.style)
            .typeErased
    }
}

public extension UserConsentFormStyle where Self == UserConsentFormCancelActionStyle {
    static func cancelActionStyle(_ style: some CancelActionStyle) -> UserConsentFormCancelActionStyle {
        UserConsentFormCancelActionStyle(style: style)
    }

    static func cancelActionStyle(@ViewBuilder content: @escaping (CancelActionConfiguration) -> some View) -> UserConsentFormCancelActionStyle {
        let style = AnyCancelActionStyle(content)
        return UserConsentFormCancelActionStyle(style: style)
    }
}

public struct UserConsentFormAllowActionStyle: UserConsentFormStyle {
    let style: any AllowActionStyle

    public func makeBody(_ configuration: UserConsentFormConfiguration) -> some View {
        UserConsentForm(configuration)
            .allowActionStyle(self.style)
            .typeErased
    }
}

public extension UserConsentFormStyle where Self == UserConsentFormAllowActionStyle {
    static func allowActionStyle(_ style: some AllowActionStyle) -> UserConsentFormAllowActionStyle {
        UserConsentFormAllowActionStyle(style: style)
    }

    static func allowActionStyle(@ViewBuilder content: @escaping (AllowActionConfiguration) -> some View) -> UserConsentFormAllowActionStyle {
        let style = AnyAllowActionStyle(content)
        return UserConsentFormAllowActionStyle(style: style)
    }
}

public struct UserConsentFormDenyActionStyle: UserConsentFormStyle {
    let style: any DenyActionStyle

    public func makeBody(_ configuration: UserConsentFormConfiguration) -> some View {
        UserConsentForm(configuration)
            .denyActionStyle(self.style)
            .typeErased
    }
}

public extension UserConsentFormStyle where Self == UserConsentFormDenyActionStyle {
    static func denyActionStyle(_ style: some DenyActionStyle) -> UserConsentFormDenyActionStyle {
        UserConsentFormDenyActionStyle(style: style)
    }

    static func denyActionStyle(@ViewBuilder content: @escaping (DenyActionConfiguration) -> some View) -> UserConsentFormDenyActionStyle {
        let style = AnyDenyActionStyle(content)
        return UserConsentFormDenyActionStyle(style: style)
    }
}

public struct UserConsentFormNotNowActionStyle: UserConsentFormStyle {
    let style: any NotNowActionStyle

    public func makeBody(_ configuration: UserConsentFormConfiguration) -> some View {
        UserConsentForm(configuration)
            .notNowActionStyle(self.style)
            .typeErased
    }
}

public extension UserConsentFormStyle where Self == UserConsentFormNotNowActionStyle {
    static func notNowActionStyle(_ style: some NotNowActionStyle) -> UserConsentFormNotNowActionStyle {
        UserConsentFormNotNowActionStyle(style: style)
    }

    static func notNowActionStyle(@ViewBuilder content: @escaping (NotNowActionConfiguration) -> some View) -> UserConsentFormNotNowActionStyle {
        let style = AnyNotNowActionStyle(content)
        return UserConsentFormNotNowActionStyle(style: style)
    }
}

// MARK: UserConsentPageStyle

public extension UserConsentPageStyle where Self == UserConsentPageBaseStyle {
    static var base: UserConsentPageBaseStyle {
        UserConsentPageBaseStyle()
    }
}

public extension UserConsentPageStyle where Self == UserConsentPageFioriStyle {
    static var fiori: UserConsentPageFioriStyle {
        UserConsentPageFioriStyle()
    }
}

public struct UserConsentPageTitleStyle: UserConsentPageStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: UserConsentPageConfiguration) -> some View {
        UserConsentPage(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension UserConsentPageStyle where Self == UserConsentPageTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> UserConsentPageTitleStyle {
        UserConsentPageTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> UserConsentPageTitleStyle {
        let style = AnyTitleStyle(content)
        return UserConsentPageTitleStyle(style: style)
    }
}

public struct UserConsentPageBodyTextStyle: UserConsentPageStyle {
    let style: any BodyTextStyle

    public func makeBody(_ configuration: UserConsentPageConfiguration) -> some View {
        UserConsentPage(configuration)
            .bodyTextStyle(self.style)
            .typeErased
    }
}

public extension UserConsentPageStyle where Self == UserConsentPageBodyTextStyle {
    static func bodyTextStyle(_ style: some BodyTextStyle) -> UserConsentPageBodyTextStyle {
        UserConsentPageBodyTextStyle(style: style)
    }

    static func bodyTextStyle(@ViewBuilder content: @escaping (BodyTextConfiguration) -> some View) -> UserConsentPageBodyTextStyle {
        let style = AnyBodyTextStyle(content)
        return UserConsentPageBodyTextStyle(style: style)
    }
}

public struct UserConsentPageActionStyle: UserConsentPageStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: UserConsentPageConfiguration) -> some View {
        UserConsentPage(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension UserConsentPageStyle where Self == UserConsentPageActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> UserConsentPageActionStyle {
        UserConsentPageActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> UserConsentPageActionStyle {
        let style = AnyActionStyle(content)
        return UserConsentPageActionStyle(style: style)
    }
}

// MARK: UserConsentViewStyle

public extension UserConsentViewStyle where Self == UserConsentViewBaseStyle {
    static var base: UserConsentViewBaseStyle {
        UserConsentViewBaseStyle()
    }
}

public extension UserConsentViewStyle where Self == UserConsentViewFioriStyle {
    static var fiori: UserConsentViewFioriStyle {
        UserConsentViewFioriStyle()
    }
}

// MARK: ValueStyle

public extension ValueStyle where Self == ValueBaseStyle {
    static var base: ValueBaseStyle {
        ValueBaseStyle()
    }
}

public extension ValueStyle where Self == ValueFioriStyle {
    static var fiori: ValueFioriStyle {
        ValueFioriStyle()
    }
}

// MARK: ValueLabelStyle

public extension ValueLabelStyle where Self == ValueLabelBaseStyle {
    static var base: ValueLabelBaseStyle {
        ValueLabelBaseStyle()
    }
}

public extension ValueLabelStyle where Self == ValueLabelFioriStyle {
    static var fiori: ValueLabelFioriStyle {
        ValueLabelFioriStyle()
    }
}

// MARK: ValuePickerStyle

public extension ValuePickerStyle where Self == ValuePickerBaseStyle {
    static var base: ValuePickerBaseStyle {
        ValuePickerBaseStyle()
    }
}

public extension ValuePickerStyle where Self == ValuePickerFioriStyle {
    static var fiori: ValuePickerFioriStyle {
        ValuePickerFioriStyle()
    }
}

public struct ValuePickerTitleStyle: ValuePickerStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: ValuePickerConfiguration) -> some View {
        ValuePicker(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension ValuePickerStyle where Self == ValuePickerTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> ValuePickerTitleStyle {
        ValuePickerTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> ValuePickerTitleStyle {
        let style = AnyTitleStyle(content)
        return ValuePickerTitleStyle(style: style)
    }
}

public struct ValuePickerValueLabelStyle: ValuePickerStyle {
    let style: any ValueLabelStyle

    public func makeBody(_ configuration: ValuePickerConfiguration) -> some View {
        ValuePicker(configuration)
            .valueLabelStyle(self.style)
            .typeErased
    }
}

public extension ValuePickerStyle where Self == ValuePickerValueLabelStyle {
    static func valueLabelStyle(_ style: some ValueLabelStyle) -> ValuePickerValueLabelStyle {
        ValuePickerValueLabelStyle(style: style)
    }

    static func valueLabelStyle(@ViewBuilder content: @escaping (ValueLabelConfiguration) -> some View) -> ValuePickerValueLabelStyle {
        let style = AnyValueLabelStyle(content)
        return ValuePickerValueLabelStyle(style: style)
    }
}

public struct ValuePickerOptionsStyle: ValuePickerStyle {
    let style: any OptionsStyle

    public func makeBody(_ configuration: ValuePickerConfiguration) -> some View {
        ValuePicker(configuration)
            .optionsStyle(self.style)
            .typeErased
    }
}

public extension ValuePickerStyle where Self == ValuePickerOptionsStyle {
    static func optionsStyle(_ style: some OptionsStyle) -> ValuePickerOptionsStyle {
        ValuePickerOptionsStyle(style: style)
    }

    static func optionsStyle(@ViewBuilder content: @escaping (OptionsConfiguration) -> some View) -> ValuePickerOptionsStyle {
        let style = AnyOptionsStyle(content)
        return ValuePickerOptionsStyle(style: style)
    }
}

// MARK: WatermarkStyle

public extension WatermarkStyle where Self == WatermarkBaseStyle {
    static var base: WatermarkBaseStyle {
        WatermarkBaseStyle()
    }
}

public extension WatermarkStyle where Self == WatermarkFioriStyle {
    static var fiori: WatermarkFioriStyle {
        WatermarkFioriStyle()
    }
}

// MARK: WelcomeScreenStyle

public extension WelcomeScreenStyle where Self == WelcomeScreenBaseStyle {
    static var base: WelcomeScreenBaseStyle {
        WelcomeScreenBaseStyle()
    }
}

public extension WelcomeScreenStyle where Self == WelcomeScreenFioriStyle {
    static var fiori: WelcomeScreenFioriStyle {
        WelcomeScreenFioriStyle()
    }
}

public struct WelcomeScreenTitleStyle: WelcomeScreenStyle {
    let style: any TitleStyle

    public func makeBody(_ configuration: WelcomeScreenConfiguration) -> some View {
        WelcomeScreen(configuration)
            .titleStyle(self.style)
            .typeErased
    }
}

public extension WelcomeScreenStyle where Self == WelcomeScreenTitleStyle {
    static func titleStyle(_ style: some TitleStyle) -> WelcomeScreenTitleStyle {
        WelcomeScreenTitleStyle(style: style)
    }

    static func titleStyle(@ViewBuilder content: @escaping (TitleConfiguration) -> some View) -> WelcomeScreenTitleStyle {
        let style = AnyTitleStyle(content)
        return WelcomeScreenTitleStyle(style: style)
    }
}

public struct WelcomeScreenDescriptionStyle: WelcomeScreenStyle {
    let style: any DescriptionStyle

    public func makeBody(_ configuration: WelcomeScreenConfiguration) -> some View {
        WelcomeScreen(configuration)
            .descriptionStyle(self.style)
            .typeErased
    }
}

public extension WelcomeScreenStyle where Self == WelcomeScreenDescriptionStyle {
    static func descriptionStyle(_ style: some DescriptionStyle) -> WelcomeScreenDescriptionStyle {
        WelcomeScreenDescriptionStyle(style: style)
    }

    static func descriptionStyle(@ViewBuilder content: @escaping (DescriptionConfiguration) -> some View) -> WelcomeScreenDescriptionStyle {
        let style = AnyDescriptionStyle(content)
        return WelcomeScreenDescriptionStyle(style: style)
    }
}

public struct WelcomeScreenIconStyle: WelcomeScreenStyle {
    let style: any IconStyle

    public func makeBody(_ configuration: WelcomeScreenConfiguration) -> some View {
        WelcomeScreen(configuration)
            .iconStyle(self.style)
            .typeErased
    }
}

public extension WelcomeScreenStyle where Self == WelcomeScreenIconStyle {
    static func iconStyle(_ style: some IconStyle) -> WelcomeScreenIconStyle {
        WelcomeScreenIconStyle(style: style)
    }

    static func iconStyle(@ViewBuilder content: @escaping (IconConfiguration) -> some View) -> WelcomeScreenIconStyle {
        let style = AnyIconStyle(content)
        return WelcomeScreenIconStyle(style: style)
    }
}

public struct WelcomeScreenFootnoteStyle: WelcomeScreenStyle {
    let style: any FootnoteStyle

    public func makeBody(_ configuration: WelcomeScreenConfiguration) -> some View {
        WelcomeScreen(configuration)
            .footnoteStyle(self.style)
            .typeErased
    }
}

public extension WelcomeScreenStyle where Self == WelcomeScreenFootnoteStyle {
    static func footnoteStyle(_ style: some FootnoteStyle) -> WelcomeScreenFootnoteStyle {
        WelcomeScreenFootnoteStyle(style: style)
    }

    static func footnoteStyle(@ViewBuilder content: @escaping (FootnoteConfiguration) -> some View) -> WelcomeScreenFootnoteStyle {
        let style = AnyFootnoteStyle(content)
        return WelcomeScreenFootnoteStyle(style: style)
    }
}

public struct WelcomeScreenActionStyle: WelcomeScreenStyle {
    let style: any ActionStyle

    public func makeBody(_ configuration: WelcomeScreenConfiguration) -> some View {
        WelcomeScreen(configuration)
            .actionStyle(self.style)
            .typeErased
    }
}

public extension WelcomeScreenStyle where Self == WelcomeScreenActionStyle {
    static func actionStyle(_ style: some ActionStyle) -> WelcomeScreenActionStyle {
        WelcomeScreenActionStyle(style: style)
    }

    static func actionStyle(@ViewBuilder content: @escaping (ActionConfiguration) -> some View) -> WelcomeScreenActionStyle {
        let style = AnyActionStyle(content)
        return WelcomeScreenActionStyle(style: style)
    }
}

public struct WelcomeScreenSecondaryActionStyle: WelcomeScreenStyle {
    let style: any SecondaryActionStyle

    public func makeBody(_ configuration: WelcomeScreenConfiguration) -> some View {
        WelcomeScreen(configuration)
            .secondaryActionStyle(self.style)
            .typeErased
    }
}

public extension WelcomeScreenStyle where Self == WelcomeScreenSecondaryActionStyle {
    static func secondaryActionStyle(_ style: some SecondaryActionStyle) -> WelcomeScreenSecondaryActionStyle {
        WelcomeScreenSecondaryActionStyle(style: style)
    }

    static func secondaryActionStyle(@ViewBuilder content: @escaping (SecondaryActionConfiguration) -> some View) -> WelcomeScreenSecondaryActionStyle {
        let style = AnySecondaryActionStyle(content)
        return WelcomeScreenSecondaryActionStyle(style: style)
    }
}

// MARK: XmarkStyle

public extension XmarkStyle where Self == XmarkBaseStyle {
    static var base: XmarkBaseStyle {
        XmarkBaseStyle()
    }
}

public extension XmarkStyle where Self == XmarkFioriStyle {
    static var fiori: XmarkFioriStyle {
        XmarkFioriStyle()
    }
}
