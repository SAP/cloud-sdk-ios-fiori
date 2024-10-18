// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ModifiedStyle<Style, Modifier: ViewModifier>: DynamicProperty {
    var style: Style
    var modifier: Modifier
}

// MARK: AccessoryIconStyle

extension ModifiedStyle: AccessoryIconStyle where Style: AccessoryIconStyle {
    public func makeBody(_ configuration: AccessoryIconConfiguration) -> some View {
        AccessoryIcon(configuration)
            .accessoryIconStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct AccessoryIconStyleModifier<Style: AccessoryIconStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.accessoryIconStyle(self.style)
    }
}

public extension AccessoryIconStyle {
    func modifier(_ modifier: some ViewModifier) -> some AccessoryIconStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some AccessoryIconStyle) -> some AccessoryIconStyle {
        style.modifier(AccessoryIconStyleModifier(style: self))
    }
}

// MARK: ActionStyle

extension ModifiedStyle: ActionStyle where Style: ActionStyle {
    public func makeBody(_ configuration: ActionConfiguration) -> some View {
        Action(configuration)
            .actionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ActionStyleModifier<Style: ActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.actionStyle(self.style)
    }
}

public extension ActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some ActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ActionStyle) -> some ActionStyle {
        style.modifier(ActionStyleModifier(style: self))
    }
}

// MARK: AllEntriesSectionTitleStyle

extension ModifiedStyle: AllEntriesSectionTitleStyle where Style: AllEntriesSectionTitleStyle {
    public func makeBody(_ configuration: AllEntriesSectionTitleConfiguration) -> some View {
        AllEntriesSectionTitle(configuration)
            .allEntriesSectionTitleStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct AllEntriesSectionTitleStyleModifier<Style: AllEntriesSectionTitleStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.allEntriesSectionTitleStyle(self.style)
    }
}

public extension AllEntriesSectionTitleStyle {
    func modifier(_ modifier: some ViewModifier) -> some AllEntriesSectionTitleStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some AllEntriesSectionTitleStyle) -> some AllEntriesSectionTitleStyle {
        style.modifier(AllEntriesSectionTitleStyleModifier(style: self))
    }
}

// MARK: ApplyActionStyle

extension ModifiedStyle: ApplyActionStyle where Style: ApplyActionStyle {
    public func makeBody(_ configuration: ApplyActionConfiguration) -> some View {
        ApplyAction(configuration)
            .applyActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ApplyActionStyleModifier<Style: ApplyActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.applyActionStyle(self.style)
    }
}

public extension ApplyActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some ApplyActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ApplyActionStyle) -> some ApplyActionStyle {
        style.modifier(ApplyActionStyleModifier(style: self))
    }
}

// MARK: AttributeStyle

extension ModifiedStyle: AttributeStyle where Style: AttributeStyle {
    public func makeBody(_ configuration: AttributeConfiguration) -> some View {
        Attribute(configuration)
            .attributeStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct AttributeStyleModifier<Style: AttributeStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.attributeStyle(self.style)
    }
}

public extension AttributeStyle {
    func modifier(_ modifier: some ViewModifier) -> some AttributeStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some AttributeStyle) -> some AttributeStyle {
        style.modifier(AttributeStyleModifier(style: self))
    }
}

// MARK: AvatarStackStyle

extension ModifiedStyle: AvatarStackStyle where Style: AvatarStackStyle {
    public func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
        AvatarStack(configuration)
            .avatarStackStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct AvatarStackStyleModifier<Style: AvatarStackStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.avatarStackStyle(self.style)
    }
}

public extension AvatarStackStyle {
    func modifier(_ modifier: some ViewModifier) -> some AvatarStackStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some AvatarStackStyle) -> some AvatarStackStyle {
        style.modifier(AvatarStackStyleModifier(style: self))
    }
}

// MARK: AvatarsStyle

extension ModifiedStyle: AvatarsStyle where Style: AvatarsStyle {
    public func makeBody(_ configuration: AvatarsConfiguration) -> some View {
        Avatars(configuration)
            .avatarsStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct AvatarsStyleModifier<Style: AvatarsStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.avatarsStyle(self.style)
    }
}

public extension AvatarsStyle {
    func modifier(_ modifier: some ViewModifier) -> some AvatarsStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some AvatarsStyle) -> some AvatarsStyle {
        style.modifier(AvatarsStyleModifier(style: self))
    }
}

// MARK: AvatarsTitleStyle

extension ModifiedStyle: AvatarsTitleStyle where Style: AvatarsTitleStyle {
    public func makeBody(_ configuration: AvatarsTitleConfiguration) -> some View {
        AvatarsTitle(configuration)
            .avatarsTitleStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct AvatarsTitleStyleModifier<Style: AvatarsTitleStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.avatarsTitleStyle(self.style)
    }
}

public extension AvatarsTitleStyle {
    func modifier(_ modifier: some ViewModifier) -> some AvatarsTitleStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some AvatarsTitleStyle) -> some AvatarsTitleStyle {
        style.modifier(AvatarsTitleStyleModifier(style: self))
    }
}

// MARK: BannerMessageStyle

extension ModifiedStyle: BannerMessageStyle where Style: BannerMessageStyle {
    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .bannerMessageStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct BannerMessageStyleModifier<Style: BannerMessageStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.bannerMessageStyle(self.style)
    }
}

public extension BannerMessageStyle {
    func modifier(_ modifier: some ViewModifier) -> some BannerMessageStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some BannerMessageStyle) -> some BannerMessageStyle {
        style.modifier(BannerMessageStyleModifier(style: self))
    }
}

// MARK: CancelActionStyle

extension ModifiedStyle: CancelActionStyle where Style: CancelActionStyle {
    public func makeBody(_ configuration: CancelActionConfiguration) -> some View {
        CancelAction(configuration)
            .cancelActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CancelActionStyleModifier<Style: CancelActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cancelActionStyle(self.style)
    }
}

public extension CancelActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some CancelActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CancelActionStyle) -> some CancelActionStyle {
        style.modifier(CancelActionStyleModifier(style: self))
    }
}

// MARK: CardBodyStyle

extension ModifiedStyle: CardBodyStyle where Style: CardBodyStyle {
    public func makeBody(_ configuration: CardBodyConfiguration) -> some View {
        CardBody(configuration)
            .cardBodyStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardBodyStyleModifier<Style: CardBodyStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardBodyStyle(self.style)
    }
}

public extension CardBodyStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardBodyStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardBodyStyle) -> some CardBodyStyle {
        style.modifier(CardBodyStyleModifier(style: self))
    }
}

// MARK: CardStyle

extension ModifiedStyle: CardStyle where Style: CardStyle {
    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .cardStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardStyleModifier<Style: CardStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardStyle(self.style)
    }
}

public extension CardStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardStyle) -> some CardStyle {
        style.modifier(CardStyleModifier(style: self))
    }
}

// MARK: CardExtHeaderStyle

extension ModifiedStyle: CardExtHeaderStyle where Style: CardExtHeaderStyle {
    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .cardExtHeaderStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardExtHeaderStyleModifier<Style: CardExtHeaderStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardExtHeaderStyle(self.style)
    }
}

public extension CardExtHeaderStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardExtHeaderStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardExtHeaderStyle) -> some CardExtHeaderStyle {
        style.modifier(CardExtHeaderStyleModifier(style: self))
    }
}

// MARK: CardFooterStyle

extension ModifiedStyle: CardFooterStyle where Style: CardFooterStyle {
    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .cardFooterStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardFooterStyleModifier<Style: CardFooterStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardFooterStyle(self.style)
    }
}

public extension CardFooterStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardFooterStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardFooterStyle) -> some CardFooterStyle {
        style.modifier(CardFooterStyleModifier(style: self))
    }
}

// MARK: CardHeaderStyle

extension ModifiedStyle: CardHeaderStyle where Style: CardHeaderStyle {
    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .cardHeaderStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardHeaderStyleModifier<Style: CardHeaderStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardHeaderStyle(self.style)
    }
}

public extension CardHeaderStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardHeaderStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardHeaderStyle) -> some CardHeaderStyle {
        style.modifier(CardHeaderStyleModifier(style: self))
    }
}

// MARK: CardMainHeaderStyle

extension ModifiedStyle: CardMainHeaderStyle where Style: CardMainHeaderStyle {
    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .cardMainHeaderStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardMainHeaderStyleModifier<Style: CardMainHeaderStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardMainHeaderStyle(self.style)
    }
}

public extension CardMainHeaderStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardMainHeaderStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardMainHeaderStyle) -> some CardMainHeaderStyle {
        style.modifier(CardMainHeaderStyleModifier(style: self))
    }
}

// MARK: CardMediaStyle

extension ModifiedStyle: CardMediaStyle where Style: CardMediaStyle {
    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        CardMedia(configuration)
            .cardMediaStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CardMediaStyleModifier<Style: CardMediaStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.cardMediaStyle(self.style)
    }
}

public extension CardMediaStyle {
    func modifier(_ modifier: some ViewModifier) -> some CardMediaStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CardMediaStyle) -> some CardMediaStyle {
        style.modifier(CardMediaStyleModifier(style: self))
    }
}

// MARK: CloseActionStyle

extension ModifiedStyle: CloseActionStyle where Style: CloseActionStyle {
    public func makeBody(_ configuration: CloseActionConfiguration) -> some View {
        CloseAction(configuration)
            .closeActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CloseActionStyleModifier<Style: CloseActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.closeActionStyle(self.style)
    }
}

public extension CloseActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some CloseActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CloseActionStyle) -> some CloseActionStyle {
        style.modifier(CloseActionStyleModifier(style: self))
    }
}

// MARK: CounterStyle

extension ModifiedStyle: CounterStyle where Style: CounterStyle {
    public func makeBody(_ configuration: CounterConfiguration) -> some View {
        Counter(configuration)
            .counterStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct CounterStyleModifier<Style: CounterStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.counterStyle(self.style)
    }
}

public extension CounterStyle {
    func modifier(_ modifier: some ViewModifier) -> some CounterStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some CounterStyle) -> some CounterStyle {
        style.modifier(CounterStyleModifier(style: self))
    }
}

// MARK: DateTimePickerStyle

extension ModifiedStyle: DateTimePickerStyle where Style: DateTimePickerStyle {
    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        DateTimePicker(configuration)
            .dateTimePickerStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct DateTimePickerStyleModifier<Style: DateTimePickerStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.dateTimePickerStyle(self.style)
    }
}

public extension DateTimePickerStyle {
    func modifier(_ modifier: some ViewModifier) -> some DateTimePickerStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some DateTimePickerStyle) -> some DateTimePickerStyle {
        style.modifier(DateTimePickerStyleModifier(style: self))
    }
}

// MARK: DecrementActionStyle

extension ModifiedStyle: DecrementActionStyle where Style: DecrementActionStyle {
    public func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
        DecrementAction(configuration)
            .decrementActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct DecrementActionStyleModifier<Style: DecrementActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.decrementActionStyle(self.style)
    }
}

public extension DecrementActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some DecrementActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some DecrementActionStyle) -> some DecrementActionStyle {
        style.modifier(DecrementActionStyleModifier(style: self))
    }
}

// MARK: DemoViewStyle

extension ModifiedStyle: DemoViewStyle where Style: DemoViewStyle {
    func makeBody(_ configuration: DemoViewConfiguration) -> some View {
        DemoView(configuration)
            .demoViewStyle(self.style)
            .modifier(self.modifier)
    }
}

struct DemoViewStyleModifier<Style: DemoViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.demoViewStyle(self.style)
    }
}

extension DemoViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some DemoViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some DemoViewStyle) -> some DemoViewStyle {
        style.modifier(DemoViewStyleModifier(style: self))
    }
}

// MARK: DescriptionStyle

extension ModifiedStyle: DescriptionStyle where Style: DescriptionStyle {
    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        Description(configuration)
            .descriptionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct DescriptionStyleModifier<Style: DescriptionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.descriptionStyle(self.style)
    }
}

public extension DescriptionStyle {
    func modifier(_ modifier: some ViewModifier) -> some DescriptionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some DescriptionStyle) -> some DescriptionStyle {
        style.modifier(DescriptionStyleModifier(style: self))
    }
}

// MARK: DeselectAllActionStyle

extension ModifiedStyle: DeselectAllActionStyle where Style: DeselectAllActionStyle {
    public func makeBody(_ configuration: DeselectAllActionConfiguration) -> some View {
        DeselectAllAction(configuration)
            .deselectAllActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct DeselectAllActionStyleModifier<Style: DeselectAllActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.deselectAllActionStyle(self.style)
    }
}

public extension DeselectAllActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some DeselectAllActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some DeselectAllActionStyle) -> some DeselectAllActionStyle {
        style.modifier(DeselectAllActionStyleModifier(style: self))
    }
}

// MARK: DetailImageStyle

extension ModifiedStyle: DetailImageStyle where Style: DetailImageStyle {
    public func makeBody(_ configuration: DetailImageConfiguration) -> some View {
        DetailImage(configuration)
            .detailImageStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct DetailImageStyleModifier<Style: DetailImageStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.detailImageStyle(self.style)
    }
}

public extension DetailImageStyle {
    func modifier(_ modifier: some ViewModifier) -> some DetailImageStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some DetailImageStyle) -> some DetailImageStyle {
        style.modifier(DetailImageStyleModifier(style: self))
    }
}

// MARK: FilledIconStyle

extension ModifiedStyle: FilledIconStyle where Style: FilledIconStyle {
    public func makeBody(_ configuration: FilledIconConfiguration) -> some View {
        FilledIcon(configuration)
            .filledIconStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct FilledIconStyleModifier<Style: FilledIconStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.filledIconStyle(self.style)
    }
}

public extension FilledIconStyle {
    func modifier(_ modifier: some ViewModifier) -> some FilledIconStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some FilledIconStyle) -> some FilledIconStyle {
        style.modifier(FilledIconStyleModifier(style: self))
    }
}

// MARK: FootnoteStyle

extension ModifiedStyle: FootnoteStyle where Style: FootnoteStyle {
    public func makeBody(_ configuration: FootnoteConfiguration) -> some View {
        Footnote(configuration)
            .footnoteStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct FootnoteStyleModifier<Style: FootnoteStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.footnoteStyle(self.style)
    }
}

public extension FootnoteStyle {
    func modifier(_ modifier: some ViewModifier) -> some FootnoteStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some FootnoteStyle) -> some FootnoteStyle {
        style.modifier(FootnoteStyleModifier(style: self))
    }
}

// MARK: FootnoteIconsStyle

extension ModifiedStyle: FootnoteIconsStyle where Style: FootnoteIconsStyle {
    public func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
        FootnoteIcons(configuration)
            .footnoteIconsStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct FootnoteIconsStyleModifier<Style: FootnoteIconsStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.footnoteIconsStyle(self.style)
    }
}

public extension FootnoteIconsStyle {
    func modifier(_ modifier: some ViewModifier) -> some FootnoteIconsStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some FootnoteIconsStyle) -> some FootnoteIconsStyle {
        style.modifier(FootnoteIconsStyleModifier(style: self))
    }
}

// MARK: FootnoteIconsTextStyle

extension ModifiedStyle: FootnoteIconsTextStyle where Style: FootnoteIconsTextStyle {
    public func makeBody(_ configuration: FootnoteIconsTextConfiguration) -> some View {
        FootnoteIconsText(configuration)
            .footnoteIconsTextStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct FootnoteIconsTextStyleModifier<Style: FootnoteIconsTextStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.footnoteIconsTextStyle(self.style)
    }
}

public extension FootnoteIconsTextStyle {
    func modifier(_ modifier: some ViewModifier) -> some FootnoteIconsTextStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some FootnoteIconsTextStyle) -> some FootnoteIconsTextStyle {
        style.modifier(FootnoteIconsTextStyleModifier(style: self))
    }
}

// MARK: FormViewStyle

extension ModifiedStyle: FormViewStyle where Style: FormViewStyle {
    public func makeBody(_ configuration: FormViewConfiguration) -> some View {
        FormView(configuration)
            .formViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct FormViewStyleModifier<Style: FormViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.formViewStyle(self.style)
    }
}

public extension FormViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some FormViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some FormViewStyle) -> some FormViewStyle {
        style.modifier(FormViewStyleModifier(style: self))
    }
}

// MARK: GreetingTextStyle

extension ModifiedStyle: GreetingTextStyle where Style: GreetingTextStyle {
    public func makeBody(_ configuration: GreetingTextConfiguration) -> some View {
        GreetingText(configuration)
            .greetingTextStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct GreetingTextStyleModifier<Style: GreetingTextStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.greetingTextStyle(self.style)
    }
}

public extension GreetingTextStyle {
    func modifier(_ modifier: some ViewModifier) -> some GreetingTextStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some GreetingTextStyle) -> some GreetingTextStyle {
        style.modifier(GreetingTextStyleModifier(style: self))
    }
}

// MARK: HalfStarImageStyle

extension ModifiedStyle: HalfStarImageStyle where Style: HalfStarImageStyle {
    public func makeBody(_ configuration: HalfStarImageConfiguration) -> some View {
        HalfStarImage(configuration)
            .halfStarImageStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct HalfStarImageStyleModifier<Style: HalfStarImageStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.halfStarImageStyle(self.style)
    }
}

public extension HalfStarImageStyle {
    func modifier(_ modifier: some ViewModifier) -> some HalfStarImageStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some HalfStarImageStyle) -> some HalfStarImageStyle {
        style.modifier(HalfStarImageStyleModifier(style: self))
    }
}

// MARK: HeaderActionStyle

extension ModifiedStyle: HeaderActionStyle where Style: HeaderActionStyle {
    public func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
        HeaderAction(configuration)
            .headerActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct HeaderActionStyleModifier<Style: HeaderActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.headerActionStyle(self.style)
    }
}

public extension HeaderActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some HeaderActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some HeaderActionStyle) -> some HeaderActionStyle {
        style.modifier(HeaderActionStyleModifier(style: self))
    }
}

// MARK: HelperTextStyle

extension ModifiedStyle: HelperTextStyle where Style: HelperTextStyle {
    public func makeBody(_ configuration: HelperTextConfiguration) -> some View {
        HelperText(configuration)
            .helperTextStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct HelperTextStyleModifier<Style: HelperTextStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.helperTextStyle(self.style)
    }
}

public extension HelperTextStyle {
    func modifier(_ modifier: some ViewModifier) -> some HelperTextStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some HelperTextStyle) -> some HelperTextStyle {
        style.modifier(HelperTextStyleModifier(style: self))
    }
}

// MARK: IconStyle

extension ModifiedStyle: IconStyle where Style: IconStyle {
    public func makeBody(_ configuration: IconConfiguration) -> some View {
        Icon(configuration)
            .iconStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct IconStyleModifier<Style: IconStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.iconStyle(self.style)
    }
}

public extension IconStyle {
    func modifier(_ modifier: some ViewModifier) -> some IconStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some IconStyle) -> some IconStyle {
        style.modifier(IconStyleModifier(style: self))
    }
}

// MARK: IconsStyle

extension ModifiedStyle: IconsStyle where Style: IconsStyle {
    public func makeBody(_ configuration: IconsConfiguration) -> some View {
        Icons(configuration)
            .iconsStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct IconsStyleModifier<Style: IconsStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.iconsStyle(self.style)
    }
}

public extension IconsStyle {
    func modifier(_ modifier: some ViewModifier) -> some IconsStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some IconsStyle) -> some IconsStyle {
        style.modifier(IconsStyleModifier(style: self))
    }
}

// MARK: IllustratedMessageStyle

extension ModifiedStyle: IllustratedMessageStyle where Style: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .illustratedMessageStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct IllustratedMessageStyleModifier<Style: IllustratedMessageStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.illustratedMessageStyle(self.style)
    }
}

public extension IllustratedMessageStyle {
    func modifier(_ modifier: some ViewModifier) -> some IllustratedMessageStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some IllustratedMessageStyle) -> some IllustratedMessageStyle {
        style.modifier(IllustratedMessageStyleModifier(style: self))
    }
}

// MARK: IncrementActionStyle

extension ModifiedStyle: IncrementActionStyle where Style: IncrementActionStyle {
    public func makeBody(_ configuration: IncrementActionConfiguration) -> some View {
        IncrementAction(configuration)
            .incrementActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct IncrementActionStyleModifier<Style: IncrementActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.incrementActionStyle(self.style)
    }
}

public extension IncrementActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some IncrementActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some IncrementActionStyle) -> some IncrementActionStyle {
        style.modifier(IncrementActionStyleModifier(style: self))
    }
}

// MARK: InformationViewStyle

extension ModifiedStyle: InformationViewStyle where Style: InformationViewStyle {
    public func makeBody(_ configuration: InformationViewConfiguration) -> some View {
        InformationView(configuration)
            .informationViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct InformationViewStyleModifier<Style: InformationViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.informationViewStyle(self.style)
    }
}

public extension InformationViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some InformationViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some InformationViewStyle) -> some InformationViewStyle {
        style.modifier(InformationViewStyleModifier(style: self))
    }
}

// MARK: JouleWelcomeScreenStyle

extension ModifiedStyle: JouleWelcomeScreenStyle where Style: JouleWelcomeScreenStyle {
    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        JouleWelcomeScreen(configuration)
            .jouleWelcomeScreenStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct JouleWelcomeScreenStyleModifier<Style: JouleWelcomeScreenStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.jouleWelcomeScreenStyle(self.style)
    }
}

public extension JouleWelcomeScreenStyle {
    func modifier(_ modifier: some ViewModifier) -> some JouleWelcomeScreenStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some JouleWelcomeScreenStyle) -> some JouleWelcomeScreenStyle {
        style.modifier(JouleWelcomeScreenStyleModifier(style: self))
    }
}

// MARK: KeyValueFormViewStyle

extension ModifiedStyle: KeyValueFormViewStyle where Style: KeyValueFormViewStyle {
    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        KeyValueFormView(configuration)
            .keyValueFormViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct KeyValueFormViewStyleModifier<Style: KeyValueFormViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.keyValueFormViewStyle(self.style)
    }
}

public extension KeyValueFormViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some KeyValueFormViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some KeyValueFormViewStyle) -> some KeyValueFormViewStyle {
        style.modifier(KeyValueFormViewStyleModifier(style: self))
    }
}

// MARK: KpiCaptionStyle

extension ModifiedStyle: KpiCaptionStyle where Style: KpiCaptionStyle {
    public func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
        KpiCaption(configuration)
            .kpiCaptionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct KpiCaptionStyleModifier<Style: KpiCaptionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.kpiCaptionStyle(self.style)
    }
}

public extension KpiCaptionStyle {
    func modifier(_ modifier: some ViewModifier) -> some KpiCaptionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some KpiCaptionStyle) -> some KpiCaptionStyle {
        style.modifier(KpiCaptionStyleModifier(style: self))
    }
}

// MARK: KpiStyle

extension ModifiedStyle: KpiStyle where Style: KpiStyle {
    public func makeBody(_ configuration: KpiConfiguration) -> some View {
        Kpi(configuration)
            .kpiStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct KpiStyleModifier<Style: KpiStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.kpiStyle(self.style)
    }
}

public extension KpiStyle {
    func modifier(_ modifier: some ViewModifier) -> some KpiStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some KpiStyle) -> some KpiStyle {
        style.modifier(KpiStyleModifier(style: self))
    }
}

// MARK: LabelItemStyle

extension ModifiedStyle: LabelItemStyle where Style: LabelItemStyle {
    public func makeBody(_ configuration: LabelItemConfiguration) -> some View {
        LabelItem(configuration)
            .labelItemStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct LabelItemStyleModifier<Style: LabelItemStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.labelItemStyle(self.style)
    }
}

public extension LabelItemStyle {
    func modifier(_ modifier: some ViewModifier) -> some LabelItemStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some LabelItemStyle) -> some LabelItemStyle {
        style.modifier(LabelItemStyleModifier(style: self))
    }
}

// MARK: LinearProgressIndicatorStyle

extension ModifiedStyle: LinearProgressIndicatorStyle where Style: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        LinearProgressIndicator(configuration)
            .linearProgressIndicatorStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct LinearProgressIndicatorStyleModifier<Style: LinearProgressIndicatorStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.linearProgressIndicatorStyle(self.style)
    }
}

public extension LinearProgressIndicatorStyle {
    func modifier(_ modifier: some ViewModifier) -> some LinearProgressIndicatorStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some LinearProgressIndicatorStyle) -> some LinearProgressIndicatorStyle {
        style.modifier(LinearProgressIndicatorStyleModifier(style: self))
    }
}

// MARK: LinearProgressIndicatorViewStyle

extension ModifiedStyle: LinearProgressIndicatorViewStyle where Style: LinearProgressIndicatorViewStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorViewConfiguration) -> some View {
        LinearProgressIndicatorView(configuration)
            .linearProgressIndicatorViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct LinearProgressIndicatorViewStyleModifier<Style: LinearProgressIndicatorViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.linearProgressIndicatorViewStyle(self.style)
    }
}

public extension LinearProgressIndicatorViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some LinearProgressIndicatorViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some LinearProgressIndicatorViewStyle) -> some LinearProgressIndicatorViewStyle {
        style.modifier(LinearProgressIndicatorViewStyleModifier(style: self))
    }
}

// MARK: ListPickerContentStyle

extension ModifiedStyle: ListPickerContentStyle where Style: ListPickerContentStyle {
    public func makeBody(_ configuration: ListPickerContentConfiguration) -> some View {
        ListPickerContent(configuration)
            .listPickerContentStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ListPickerContentStyleModifier<Style: ListPickerContentStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.listPickerContentStyle(self.style)
    }
}

public extension ListPickerContentStyle {
    func modifier(_ modifier: some ViewModifier) -> some ListPickerContentStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ListPickerContentStyle) -> some ListPickerContentStyle {
        style.modifier(ListPickerContentStyleModifier(style: self))
    }
}

// MARK: ListPickerDestinationStyle

extension ModifiedStyle: ListPickerDestinationStyle where Style: ListPickerDestinationStyle {
    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .listPickerDestinationStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ListPickerDestinationStyleModifier<Style: ListPickerDestinationStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.listPickerDestinationStyle(self.style)
    }
}

public extension ListPickerDestinationStyle {
    func modifier(_ modifier: some ViewModifier) -> some ListPickerDestinationStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ListPickerDestinationStyle) -> some ListPickerDestinationStyle {
        style.modifier(ListPickerDestinationStyleModifier(style: self))
    }
}

// MARK: ListPickerItemStyle

extension ModifiedStyle: ListPickerItemStyle where Style: ListPickerItemStyle {
    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        ListPickerItem(configuration)
            .listPickerItemStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ListPickerItemStyleModifier<Style: ListPickerItemStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.listPickerItemStyle(self.style)
    }
}

public extension ListPickerItemStyle {
    func modifier(_ modifier: some ViewModifier) -> some ListPickerItemStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ListPickerItemStyle) -> some ListPickerItemStyle {
        style.modifier(ListPickerItemStyleModifier(style: self))
    }
}

// MARK: MandatoryFieldIndicatorStyle

extension ModifiedStyle: MandatoryFieldIndicatorStyle where Style: MandatoryFieldIndicatorStyle {
    public func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
        MandatoryFieldIndicator(configuration)
            .mandatoryFieldIndicatorStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct MandatoryFieldIndicatorStyleModifier<Style: MandatoryFieldIndicatorStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.mandatoryFieldIndicatorStyle(self.style)
    }
}

public extension MandatoryFieldIndicatorStyle {
    func modifier(_ modifier: some ViewModifier) -> some MandatoryFieldIndicatorStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some MandatoryFieldIndicatorStyle) -> some MandatoryFieldIndicatorStyle {
        style.modifier(MandatoryFieldIndicatorStyleModifier(style: self))
    }
}

// MARK: MediaImageStyle

extension ModifiedStyle: MediaImageStyle where Style: MediaImageStyle {
    public func makeBody(_ configuration: MediaImageConfiguration) -> some View {
        MediaImage(configuration)
            .mediaImageStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct MediaImageStyleModifier<Style: MediaImageStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.mediaImageStyle(self.style)
    }
}

public extension MediaImageStyle {
    func modifier(_ modifier: some ViewModifier) -> some MediaImageStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some MediaImageStyle) -> some MediaImageStyle {
        style.modifier(MediaImageStyleModifier(style: self))
    }
}

// MARK: MenuSelectionStyle

extension ModifiedStyle: MenuSelectionStyle where Style: MenuSelectionStyle {
    public func makeBody(_ configuration: MenuSelectionConfiguration) -> some View {
        MenuSelection(configuration)
            .menuSelectionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct MenuSelectionStyleModifier<Style: MenuSelectionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.menuSelectionStyle(self.style)
    }
}

public extension MenuSelectionStyle {
    func modifier(_ modifier: some ViewModifier) -> some MenuSelectionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some MenuSelectionStyle) -> some MenuSelectionStyle {
        style.modifier(MenuSelectionStyleModifier(style: self))
    }
}

// MARK: MenuSelectionItemStyle

extension ModifiedStyle: MenuSelectionItemStyle where Style: MenuSelectionItemStyle {
    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        MenuSelectionItem(configuration)
            .menuSelectionItemStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct MenuSelectionItemStyleModifier<Style: MenuSelectionItemStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.menuSelectionItemStyle(self.style)
    }
}

public extension MenuSelectionItemStyle {
    func modifier(_ modifier: some ViewModifier) -> some MenuSelectionItemStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some MenuSelectionItemStyle) -> some MenuSelectionItemStyle {
        style.modifier(MenuSelectionItemStyleModifier(style: self))
    }
}

// MARK: MessageContentStyle

extension ModifiedStyle: MessageContentStyle where Style: MessageContentStyle {
    public func makeBody(_ configuration: MessageContentConfiguration) -> some View {
        MessageContent(configuration)
            .messageContentStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct MessageContentStyleModifier<Style: MessageContentStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.messageContentStyle(self.style)
    }
}

public extension MessageContentStyle {
    func modifier(_ modifier: some ViewModifier) -> some MessageContentStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some MessageContentStyle) -> some MessageContentStyle {
        style.modifier(MessageContentStyleModifier(style: self))
    }
}

// MARK: MoreActionOverflowStyle

extension ModifiedStyle: MoreActionOverflowStyle where Style: MoreActionOverflowStyle {
    public func makeBody(_ configuration: MoreActionOverflowConfiguration) -> some View {
        MoreActionOverflow(configuration)
            .moreActionOverflowStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct MoreActionOverflowStyleModifier<Style: MoreActionOverflowStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.moreActionOverflowStyle(self.style)
    }
}

public extension MoreActionOverflowStyle {
    func modifier(_ modifier: some ViewModifier) -> some MoreActionOverflowStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some MoreActionOverflowStyle) -> some MoreActionOverflowStyle {
        style.modifier(MoreActionOverflowStyleModifier(style: self))
    }
}

// MARK: NoteFormViewStyle

extension ModifiedStyle: NoteFormViewStyle where Style: NoteFormViewStyle {
    public func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
        NoteFormView(configuration)
            .noteFormViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct NoteFormViewStyleModifier<Style: NoteFormViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.noteFormViewStyle(self.style)
    }
}

public extension NoteFormViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some NoteFormViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some NoteFormViewStyle) -> some NoteFormViewStyle {
        style.modifier(NoteFormViewStyleModifier(style: self))
    }
}

// MARK: NowIndicatorNodeStyle

extension ModifiedStyle: NowIndicatorNodeStyle where Style: NowIndicatorNodeStyle {
    public func makeBody(_ configuration: NowIndicatorNodeConfiguration) -> some View {
        NowIndicatorNode(configuration)
            .nowIndicatorNodeStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct NowIndicatorNodeStyleModifier<Style: NowIndicatorNodeStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.nowIndicatorNodeStyle(self.style)
    }
}

public extension NowIndicatorNodeStyle {
    func modifier(_ modifier: some ViewModifier) -> some NowIndicatorNodeStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some NowIndicatorNodeStyle) -> some NowIndicatorNodeStyle {
        style.modifier(NowIndicatorNodeStyleModifier(style: self))
    }
}

// MARK: ObjectItemStyle

extension ModifiedStyle: ObjectItemStyle where Style: ObjectItemStyle {
    public func makeBody(_ configuration: ObjectItemConfiguration) -> some View {
        ObjectItem(configuration)
            .objectItemStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ObjectItemStyleModifier<Style: ObjectItemStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.objectItemStyle(self.style)
    }
}

public extension ObjectItemStyle {
    func modifier(_ modifier: some ViewModifier) -> some ObjectItemStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ObjectItemStyle) -> some ObjectItemStyle {
        style.modifier(ObjectItemStyleModifier(style: self))
    }
}

// MARK: OffStarImageStyle

extension ModifiedStyle: OffStarImageStyle where Style: OffStarImageStyle {
    public func makeBody(_ configuration: OffStarImageConfiguration) -> some View {
        OffStarImage(configuration)
            .offStarImageStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct OffStarImageStyleModifier<Style: OffStarImageStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.offStarImageStyle(self.style)
    }
}

public extension OffStarImageStyle {
    func modifier(_ modifier: some ViewModifier) -> some OffStarImageStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some OffStarImageStyle) -> some OffStarImageStyle {
        style.modifier(OffStarImageStyleModifier(style: self))
    }
}

// MARK: OnStarImageStyle

extension ModifiedStyle: OnStarImageStyle where Style: OnStarImageStyle {
    public func makeBody(_ configuration: OnStarImageConfiguration) -> some View {
        OnStarImage(configuration)
            .onStarImageStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct OnStarImageStyleModifier<Style: OnStarImageStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.onStarImageStyle(self.style)
    }
}

public extension OnStarImageStyle {
    func modifier(_ modifier: some ViewModifier) -> some OnStarImageStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some OnStarImageStyle) -> some OnStarImageStyle {
        style.modifier(OnStarImageStyleModifier(style: self))
    }
}

// MARK: OptionalTitleStyle

extension ModifiedStyle: OptionalTitleStyle where Style: OptionalTitleStyle {
    public func makeBody(_ configuration: OptionalTitleConfiguration) -> some View {
        OptionalTitle(configuration)
            .optionalTitleStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct OptionalTitleStyleModifier<Style: OptionalTitleStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.optionalTitleStyle(self.style)
    }
}

public extension OptionalTitleStyle {
    func modifier(_ modifier: some ViewModifier) -> some OptionalTitleStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some OptionalTitleStyle) -> some OptionalTitleStyle {
        style.modifier(OptionalTitleStyleModifier(style: self))
    }
}

// MARK: OptionsStyle

extension ModifiedStyle: OptionsStyle where Style: OptionsStyle {
    public func makeBody(_ configuration: OptionsConfiguration) -> some View {
        Options(configuration)
            .optionsStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct OptionsStyleModifier<Style: OptionsStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.optionsStyle(self.style)
    }
}

public extension OptionsStyle {
    func modifier(_ modifier: some ViewModifier) -> some OptionsStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some OptionsStyle) -> some OptionsStyle {
        style.modifier(OptionsStyleModifier(style: self))
    }
}

// MARK: OverflowActionStyle

extension ModifiedStyle: OverflowActionStyle where Style: OverflowActionStyle {
    public func makeBody(_ configuration: OverflowActionConfiguration) -> some View {
        OverflowAction(configuration)
            .overflowActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct OverflowActionStyleModifier<Style: OverflowActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.overflowActionStyle(self.style)
    }
}

public extension OverflowActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some OverflowActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some OverflowActionStyle) -> some OverflowActionStyle {
        style.modifier(OverflowActionStyleModifier(style: self))
    }
}

// MARK: PlaceholderStyle

extension ModifiedStyle: PlaceholderStyle where Style: PlaceholderStyle {
    public func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
        Placeholder(configuration)
            .placeholderStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct PlaceholderStyleModifier<Style: PlaceholderStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.placeholderStyle(self.style)
    }
}

public extension PlaceholderStyle {
    func modifier(_ modifier: some ViewModifier) -> some PlaceholderStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some PlaceholderStyle) -> some PlaceholderStyle {
        style.modifier(PlaceholderStyleModifier(style: self))
    }
}

// MARK: PlaceholderTextEditorStyle

extension ModifiedStyle: PlaceholderTextEditorStyle where Style: PlaceholderTextEditorStyle {
    public func makeBody(_ configuration: PlaceholderTextEditorConfiguration) -> some View {
        PlaceholderTextEditor(configuration)
            .placeholderTextEditorStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct PlaceholderTextEditorStyleModifier<Style: PlaceholderTextEditorStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.placeholderTextEditorStyle(self.style)
    }
}

public extension PlaceholderTextEditorStyle {
    func modifier(_ modifier: some ViewModifier) -> some PlaceholderTextEditorStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some PlaceholderTextEditorStyle) -> some PlaceholderTextEditorStyle {
        style.modifier(PlaceholderTextEditorStyleModifier(style: self))
    }
}

// MARK: PlaceholderTextFieldStyle

extension ModifiedStyle: PlaceholderTextFieldStyle where Style: PlaceholderTextFieldStyle {
    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        PlaceholderTextField(configuration)
            .placeholderTextFieldStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct PlaceholderTextFieldStyleModifier<Style: PlaceholderTextFieldStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.placeholderTextFieldStyle(self.style)
    }
}

public extension PlaceholderTextFieldStyle {
    func modifier(_ modifier: some ViewModifier) -> some PlaceholderTextFieldStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some PlaceholderTextFieldStyle) -> some PlaceholderTextFieldStyle {
        style.modifier(PlaceholderTextFieldStyleModifier(style: self))
    }
}

// MARK: ProfileHeaderStyle

extension ModifiedStyle: ProfileHeaderStyle where Style: ProfileHeaderStyle {
    public func makeBody(_ configuration: ProfileHeaderConfiguration) -> some View {
        ProfileHeader(configuration)
            .profileHeaderStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ProfileHeaderStyleModifier<Style: ProfileHeaderStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.profileHeaderStyle(self.style)
    }
}

public extension ProfileHeaderStyle {
    func modifier(_ modifier: some ViewModifier) -> some ProfileHeaderStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ProfileHeaderStyle) -> some ProfileHeaderStyle {
        style.modifier(ProfileHeaderStyleModifier(style: self))
    }
}

// MARK: RatingControlStyle

extension ModifiedStyle: RatingControlStyle where Style: RatingControlStyle {
    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .ratingControlStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct RatingControlStyleModifier<Style: RatingControlStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.ratingControlStyle(self.style)
    }
}

public extension RatingControlStyle {
    func modifier(_ modifier: some ViewModifier) -> some RatingControlStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some RatingControlStyle) -> some RatingControlStyle {
        style.modifier(RatingControlStyleModifier(style: self))
    }
}

// MARK: RatingControlFormViewStyle

extension ModifiedStyle: RatingControlFormViewStyle where Style: RatingControlFormViewStyle {
    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .ratingControlFormViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct RatingControlFormViewStyleModifier<Style: RatingControlFormViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.ratingControlFormViewStyle(self.style)
    }
}

public extension RatingControlFormViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some RatingControlFormViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some RatingControlFormViewStyle) -> some RatingControlFormViewStyle {
        style.modifier(RatingControlFormViewStyleModifier(style: self))
    }
}

// MARK: ReviewCountLabelStyle

extension ModifiedStyle: ReviewCountLabelStyle where Style: ReviewCountLabelStyle {
    public func makeBody(_ configuration: ReviewCountLabelConfiguration) -> some View {
        ReviewCountLabel(configuration)
            .reviewCountLabelStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ReviewCountLabelStyleModifier<Style: ReviewCountLabelStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.reviewCountLabelStyle(self.style)
    }
}

public extension ReviewCountLabelStyle {
    func modifier(_ modifier: some ViewModifier) -> some ReviewCountLabelStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ReviewCountLabelStyle) -> some ReviewCountLabelStyle {
        style.modifier(ReviewCountLabelStyleModifier(style: self))
    }
}

// MARK: Row1Style

extension ModifiedStyle: Row1Style where Style: Row1Style {
    public func makeBody(_ configuration: Row1Configuration) -> some View {
        Row1(configuration)
            .row1Style(self.style)
            .modifier(self.modifier)
    }
}

public struct Row1StyleModifier<Style: Row1Style>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.row1Style(self.style)
    }
}

public extension Row1Style {
    func modifier(_ modifier: some ViewModifier) -> some Row1Style {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some Row1Style) -> some Row1Style {
        style.modifier(Row1StyleModifier(style: self))
    }
}

// MARK: Row2Style

extension ModifiedStyle: Row2Style where Style: Row2Style {
    public func makeBody(_ configuration: Row2Configuration) -> some View {
        Row2(configuration)
            .row2Style(self.style)
            .modifier(self.modifier)
    }
}

public struct Row2StyleModifier<Style: Row2Style>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.row2Style(self.style)
    }
}

public extension Row2Style {
    func modifier(_ modifier: some ViewModifier) -> some Row2Style {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some Row2Style) -> some Row2Style {
        style.modifier(Row2StyleModifier(style: self))
    }
}

// MARK: Row3Style

extension ModifiedStyle: Row3Style where Style: Row3Style {
    public func makeBody(_ configuration: Row3Configuration) -> some View {
        Row3(configuration)
            .row3Style(self.style)
            .modifier(self.modifier)
    }
}

public struct Row3StyleModifier<Style: Row3Style>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.row3Style(self.style)
    }
}

public extension Row3Style {
    func modifier(_ modifier: some ViewModifier) -> some Row3Style {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some Row3Style) -> some Row3Style {
        style.modifier(Row3StyleModifier(style: self))
    }
}

// MARK: SecondaryActionStyle

extension ModifiedStyle: SecondaryActionStyle where Style: SecondaryActionStyle {
    public func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
        SecondaryAction(configuration)
            .secondaryActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SecondaryActionStyleModifier<Style: SecondaryActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.secondaryActionStyle(self.style)
    }
}

public extension SecondaryActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some SecondaryActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SecondaryActionStyle) -> some SecondaryActionStyle {
        style.modifier(SecondaryActionStyleModifier(style: self))
    }
}

// MARK: SecondaryTimestampStyle

extension ModifiedStyle: SecondaryTimestampStyle where Style: SecondaryTimestampStyle {
    public func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
        SecondaryTimestamp(configuration)
            .secondaryTimestampStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SecondaryTimestampStyleModifier<Style: SecondaryTimestampStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.secondaryTimestampStyle(self.style)
    }
}

public extension SecondaryTimestampStyle {
    func modifier(_ modifier: some ViewModifier) -> some SecondaryTimestampStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SecondaryTimestampStyle) -> some SecondaryTimestampStyle {
        style.modifier(SecondaryTimestampStyleModifier(style: self))
    }
}

// MARK: SegmentedControlPickerStyle

extension ModifiedStyle: SegmentedControlPickerStyle where Style: SegmentedControlPickerStyle {
    public func makeBody(_ configuration: SegmentedControlPickerConfiguration) -> some View {
        SegmentedControlPicker(configuration)
            .segmentedControlPickerStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SegmentedControlPickerStyleModifier<Style: SegmentedControlPickerStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.segmentedControlPickerStyle(self.style)
    }
}

public extension SegmentedControlPickerStyle {
    func modifier(_ modifier: some ViewModifier) -> some SegmentedControlPickerStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SegmentedControlPickerStyle) -> some SegmentedControlPickerStyle {
        style.modifier(SegmentedControlPickerStyleModifier(style: self))
    }
}

// MARK: SelectAllActionStyle

extension ModifiedStyle: SelectAllActionStyle where Style: SelectAllActionStyle {
    public func makeBody(_ configuration: SelectAllActionConfiguration) -> some View {
        SelectAllAction(configuration)
            .selectAllActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SelectAllActionStyleModifier<Style: SelectAllActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.selectAllActionStyle(self.style)
    }
}

public extension SelectAllActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some SelectAllActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SelectAllActionStyle) -> some SelectAllActionStyle {
        style.modifier(SelectAllActionStyleModifier(style: self))
    }
}

// MARK: SelectedEntriesSectionTitleStyle

extension ModifiedStyle: SelectedEntriesSectionTitleStyle where Style: SelectedEntriesSectionTitleStyle {
    public func makeBody(_ configuration: SelectedEntriesSectionTitleConfiguration) -> some View {
        SelectedEntriesSectionTitle(configuration)
            .selectedEntriesSectionTitleStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SelectedEntriesSectionTitleStyleModifier<Style: SelectedEntriesSectionTitleStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.selectedEntriesSectionTitleStyle(self.style)
    }
}

public extension SelectedEntriesSectionTitleStyle {
    func modifier(_ modifier: some ViewModifier) -> some SelectedEntriesSectionTitleStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SelectedEntriesSectionTitleStyle) -> some SelectedEntriesSectionTitleStyle {
        style.modifier(SelectedEntriesSectionTitleStyleModifier(style: self))
    }
}

// MARK: SideBarStyle

extension ModifiedStyle: SideBarStyle where Style: SideBarStyle {
    public func makeBody(_ configuration: SideBarConfiguration) -> some View {
        SideBar(configuration)
            .sideBarStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SideBarStyleModifier<Style: SideBarStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.sideBarStyle(self.style)
    }
}

public extension SideBarStyle {
    func modifier(_ modifier: some ViewModifier) -> some SideBarStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SideBarStyle) -> some SideBarStyle {
        style.modifier(SideBarStyleModifier(style: self))
    }
}

// MARK: SideBarListItemStyle

extension ModifiedStyle: SideBarListItemStyle where Style: SideBarListItemStyle {
    public func makeBody(_ configuration: SideBarListItemConfiguration) -> some View {
        SideBarListItem(configuration)
            .sideBarListItemStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SideBarListItemStyleModifier<Style: SideBarListItemStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.sideBarListItemStyle(self.style)
    }
}

public extension SideBarListItemStyle {
    func modifier(_ modifier: some ViewModifier) -> some SideBarListItemStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SideBarListItemStyle) -> some SideBarListItemStyle {
        style.modifier(SideBarListItemStyleModifier(style: self))
    }
}

// MARK: StatusStyle

extension ModifiedStyle: StatusStyle where Style: StatusStyle {
    public func makeBody(_ configuration: StatusConfiguration) -> some View {
        Status(configuration)
            .statusStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct StatusStyleModifier<Style: StatusStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.statusStyle(self.style)
    }
}

public extension StatusStyle {
    func modifier(_ modifier: some ViewModifier) -> some StatusStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some StatusStyle) -> some StatusStyle {
        style.modifier(StatusStyleModifier(style: self))
    }
}

// MARK: StepperFieldStyle

extension ModifiedStyle: StepperFieldStyle where Style: StepperFieldStyle {
    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        StepperField(configuration)
            .stepperFieldStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct StepperFieldStyleModifier<Style: StepperFieldStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.stepperFieldStyle(self.style)
    }
}

public extension StepperFieldStyle {
    func modifier(_ modifier: some ViewModifier) -> some StepperFieldStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some StepperFieldStyle) -> some StepperFieldStyle {
        style.modifier(StepperFieldStyleModifier(style: self))
    }
}

// MARK: StepperViewStyle

extension ModifiedStyle: StepperViewStyle where Style: StepperViewStyle {
    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .stepperViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct StepperViewStyleModifier<Style: StepperViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.stepperViewStyle(self.style)
    }
}

public extension StepperViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some StepperViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some StepperViewStyle) -> some StepperViewStyle {
        style.modifier(StepperViewStyleModifier(style: self))
    }
}

// MARK: SubAttributeStyle

extension ModifiedStyle: SubAttributeStyle where Style: SubAttributeStyle {
    public func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
        SubAttribute(configuration)
            .subAttributeStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SubAttributeStyleModifier<Style: SubAttributeStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.subAttributeStyle(self.style)
    }
}

public extension SubAttributeStyle {
    func modifier(_ modifier: some ViewModifier) -> some SubAttributeStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SubAttributeStyle) -> some SubAttributeStyle {
        style.modifier(SubAttributeStyleModifier(style: self))
    }
}

// MARK: SubstatusStyle

extension ModifiedStyle: SubstatusStyle where Style: SubstatusStyle {
    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
        Substatus(configuration)
            .substatusStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SubstatusStyleModifier<Style: SubstatusStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.substatusStyle(self.style)
    }
}

public extension SubstatusStyle {
    func modifier(_ modifier: some ViewModifier) -> some SubstatusStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SubstatusStyle) -> some SubstatusStyle {
        style.modifier(SubstatusStyleModifier(style: self))
    }
}

// MARK: SubtitleStyle

extension ModifiedStyle: SubtitleStyle where Style: SubtitleStyle {
    public func makeBody(_ configuration: SubtitleConfiguration) -> some View {
        Subtitle(configuration)
            .subtitleStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SubtitleStyleModifier<Style: SubtitleStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.subtitleStyle(self.style)
    }
}

public extension SubtitleStyle {
    func modifier(_ modifier: some ViewModifier) -> some SubtitleStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SubtitleStyle) -> some SubtitleStyle {
        style.modifier(SubtitleStyleModifier(style: self))
    }
}

// MARK: SwitchStyle

extension ModifiedStyle: SwitchStyle where Style: SwitchStyle {
    public func makeBody(_ configuration: SwitchConfiguration) -> some View {
        Switch(configuration)
            .switchStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SwitchStyleModifier<Style: SwitchStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.switchStyle(self.style)
    }
}

public extension SwitchStyle {
    func modifier(_ modifier: some ViewModifier) -> some SwitchStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SwitchStyle) -> some SwitchStyle {
        style.modifier(SwitchStyleModifier(style: self))
    }
}

// MARK: SwitchViewStyle

extension ModifiedStyle: SwitchViewStyle where Style: SwitchViewStyle {
    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        SwitchView(configuration)
            .switchViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct SwitchViewStyleModifier<Style: SwitchViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.switchViewStyle(self.style)
    }
}

public extension SwitchViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some SwitchViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some SwitchViewStyle) -> some SwitchViewStyle {
        style.modifier(SwitchViewStyleModifier(style: self))
    }
}

// MARK: TagsStyle

extension ModifiedStyle: TagsStyle where Style: TagsStyle {
    public func makeBody(_ configuration: TagsConfiguration) -> some View {
        Tags(configuration)
            .tagsStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TagsStyleModifier<Style: TagsStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.tagsStyle(self.style)
    }
}

public extension TagsStyle {
    func modifier(_ modifier: some ViewModifier) -> some TagsStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TagsStyle) -> some TagsStyle {
        style.modifier(TagsStyleModifier(style: self))
    }
}

// MARK: TertiaryActionStyle

extension ModifiedStyle: TertiaryActionStyle where Style: TertiaryActionStyle {
    public func makeBody(_ configuration: TertiaryActionConfiguration) -> some View {
        TertiaryAction(configuration)
            .tertiaryActionStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TertiaryActionStyleModifier<Style: TertiaryActionStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.tertiaryActionStyle(self.style)
    }
}

public extension TertiaryActionStyle {
    func modifier(_ modifier: some ViewModifier) -> some TertiaryActionStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TertiaryActionStyle) -> some TertiaryActionStyle {
        style.modifier(TertiaryActionStyleModifier(style: self))
    }
}

// MARK: TextFieldFormViewStyle

extension ModifiedStyle: TextFieldFormViewStyle where Style: TextFieldFormViewStyle {
    public func makeBody(_ configuration: TextFieldFormViewConfiguration) -> some View {
        TextFieldFormView(configuration)
            .textFieldFormViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TextFieldFormViewStyleModifier<Style: TextFieldFormViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.textFieldFormViewStyle(self.style)
    }
}

public extension TextFieldFormViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some TextFieldFormViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TextFieldFormViewStyle) -> some TextFieldFormViewStyle {
        style.modifier(TextFieldFormViewStyleModifier(style: self))
    }
}

// MARK: TextInputFieldStyle

extension ModifiedStyle: TextInputFieldStyle where Style: TextInputFieldStyle {
    public func makeBody(_ configuration: TextInputFieldConfiguration) -> some View {
        TextInputField(configuration)
            .textInputFieldStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TextInputFieldStyleModifier<Style: TextInputFieldStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.textInputFieldStyle(self.style)
    }
}

public extension TextInputFieldStyle {
    func modifier(_ modifier: some ViewModifier) -> some TextInputFieldStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TextInputFieldStyle) -> some TextInputFieldStyle {
        style.modifier(TextInputFieldStyleModifier(style: self))
    }
}

// MARK: TextInputInfoViewStyle

extension ModifiedStyle: TextInputInfoViewStyle where Style: TextInputInfoViewStyle {
    func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .textInputInfoViewStyle(self.style)
            .modifier(self.modifier)
    }
}

struct TextInputInfoViewStyleModifier<Style: TextInputInfoViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.textInputInfoViewStyle(self.style)
    }
}

extension TextInputInfoViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some TextInputInfoViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TextInputInfoViewStyle) -> some TextInputInfoViewStyle {
        style.modifier(TextInputInfoViewStyleModifier(style: self))
    }
}

// MARK: TextViewStyle

extension ModifiedStyle: TextViewStyle where Style: TextViewStyle {
    public func makeBody(_ configuration: TextViewConfiguration) -> some View {
        TextView(configuration)
            .textViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TextViewStyleModifier<Style: TextViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.textViewStyle(self.style)
    }
}

public extension TextViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some TextViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TextViewStyle) -> some TextViewStyle {
        style.modifier(TextViewStyleModifier(style: self))
    }
}

// MARK: TimelineStyle

extension ModifiedStyle: TimelineStyle where Style: TimelineStyle {
    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        Timeline(configuration)
            .timelineStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TimelineStyleModifier<Style: TimelineStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.timelineStyle(self.style)
    }
}

public extension TimelineStyle {
    func modifier(_ modifier: some ViewModifier) -> some TimelineStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TimelineStyle) -> some TimelineStyle {
        style.modifier(TimelineStyleModifier(style: self))
    }
}

// MARK: TimelineMarkerStyle

extension ModifiedStyle: TimelineMarkerStyle where Style: TimelineMarkerStyle {
    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarker(configuration)
            .timelineMarkerStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TimelineMarkerStyleModifier<Style: TimelineMarkerStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.timelineMarkerStyle(self.style)
    }
}

public extension TimelineMarkerStyle {
    func modifier(_ modifier: some ViewModifier) -> some TimelineMarkerStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TimelineMarkerStyle) -> some TimelineMarkerStyle {
        style.modifier(TimelineMarkerStyleModifier(style: self))
    }
}

// MARK: TimelineNodeStyle

extension ModifiedStyle: TimelineNodeStyle where Style: TimelineNodeStyle {
    public func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
        TimelineNode(configuration)
            .timelineNodeStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TimelineNodeStyleModifier<Style: TimelineNodeStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.timelineNodeStyle(self.style)
    }
}

public extension TimelineNodeStyle {
    func modifier(_ modifier: some ViewModifier) -> some TimelineNodeStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TimelineNodeStyle) -> some TimelineNodeStyle {
        style.modifier(TimelineNodeStyleModifier(style: self))
    }
}

// MARK: TimelineNowIndicatorStyle

extension ModifiedStyle: TimelineNowIndicatorStyle where Style: TimelineNowIndicatorStyle {
    public func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        TimelineNowIndicator(configuration)
            .timelineNowIndicatorStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TimelineNowIndicatorStyleModifier<Style: TimelineNowIndicatorStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.timelineNowIndicatorStyle(self.style)
    }
}

public extension TimelineNowIndicatorStyle {
    func modifier(_ modifier: some ViewModifier) -> some TimelineNowIndicatorStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TimelineNowIndicatorStyle) -> some TimelineNowIndicatorStyle {
        style.modifier(TimelineNowIndicatorStyleModifier(style: self))
    }
}

// MARK: TimelinePreviewStyle

extension ModifiedStyle: TimelinePreviewStyle where Style: TimelinePreviewStyle {
    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        TimelinePreview(configuration)
            .timelinePreviewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TimelinePreviewStyleModifier<Style: TimelinePreviewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.timelinePreviewStyle(self.style)
    }
}

public extension TimelinePreviewStyle {
    func modifier(_ modifier: some ViewModifier) -> some TimelinePreviewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TimelinePreviewStyle) -> some TimelinePreviewStyle {
        style.modifier(TimelinePreviewStyleModifier(style: self))
    }
}

// MARK: TimelinePreviewItemStyle

extension ModifiedStyle: TimelinePreviewItemStyle where Style: TimelinePreviewItemStyle {
    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        TimelinePreviewItem(configuration)
            .timelinePreviewItemStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TimelinePreviewItemStyleModifier<Style: TimelinePreviewItemStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.timelinePreviewItemStyle(self.style)
    }
}

public extension TimelinePreviewItemStyle {
    func modifier(_ modifier: some ViewModifier) -> some TimelinePreviewItemStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TimelinePreviewItemStyle) -> some TimelinePreviewItemStyle {
        style.modifier(TimelinePreviewItemStyleModifier(style: self))
    }
}

// MARK: TimestampStyle

extension ModifiedStyle: TimestampStyle where Style: TimestampStyle {
    public func makeBody(_ configuration: TimestampConfiguration) -> some View {
        Timestamp(configuration)
            .timestampStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TimestampStyleModifier<Style: TimestampStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.timestampStyle(self.style)
    }
}

public extension TimestampStyle {
    func modifier(_ modifier: some ViewModifier) -> some TimestampStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TimestampStyle) -> some TimestampStyle {
        style.modifier(TimestampStyleModifier(style: self))
    }
}

// MARK: TitleStyle

extension ModifiedStyle: TitleStyle where Style: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        Title(configuration)
            .titleStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TitleStyleModifier<Style: TitleStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.titleStyle(self.style)
    }
}

public extension TitleStyle {
    func modifier(_ modifier: some ViewModifier) -> some TitleStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TitleStyle) -> some TitleStyle {
        style.modifier(TitleStyleModifier(style: self))
    }
}

// MARK: TitleFormViewStyle

extension ModifiedStyle: TitleFormViewStyle where Style: TitleFormViewStyle {
    public func makeBody(_ configuration: TitleFormViewConfiguration) -> some View {
        TitleFormView(configuration)
            .titleFormViewStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TitleFormViewStyleModifier<Style: TitleFormViewStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.titleFormViewStyle(self.style)
    }
}

public extension TitleFormViewStyle {
    func modifier(_ modifier: some ViewModifier) -> some TitleFormViewStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TitleFormViewStyle) -> some TitleFormViewStyle {
        style.modifier(TitleFormViewStyleModifier(style: self))
    }
}

// MARK: ToastMessageStyle

extension ModifiedStyle: ToastMessageStyle where Style: ToastMessageStyle {
    public func makeBody(_ configuration: ToastMessageConfiguration) -> some View {
        ToastMessage(configuration)
            .toastMessageStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ToastMessageStyleModifier<Style: ToastMessageStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.toastMessageStyle(self.style)
    }
}

public extension ToastMessageStyle {
    func modifier(_ modifier: some ViewModifier) -> some ToastMessageStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ToastMessageStyle) -> some ToastMessageStyle {
        style.modifier(ToastMessageStyleModifier(style: self))
    }
}

// MARK: TopDividerStyle

extension ModifiedStyle: TopDividerStyle where Style: TopDividerStyle {
    public func makeBody(_ configuration: TopDividerConfiguration) -> some View {
        TopDivider(configuration)
            .topDividerStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct TopDividerStyleModifier<Style: TopDividerStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.topDividerStyle(self.style)
    }
}

public extension TopDividerStyle {
    func modifier(_ modifier: some ViewModifier) -> some TopDividerStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some TopDividerStyle) -> some TopDividerStyle {
        style.modifier(TopDividerStyleModifier(style: self))
    }
}

// MARK: ValueStyle

extension ModifiedStyle: ValueStyle where Style: ValueStyle {
    public func makeBody(_ configuration: ValueConfiguration) -> some View {
        Value(configuration)
            .valueStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ValueStyleModifier<Style: ValueStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.valueStyle(self.style)
    }
}

public extension ValueStyle {
    func modifier(_ modifier: some ViewModifier) -> some ValueStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ValueStyle) -> some ValueStyle {
        style.modifier(ValueStyleModifier(style: self))
    }
}

// MARK: ValueLabelStyle

extension ModifiedStyle: ValueLabelStyle where Style: ValueLabelStyle {
    public func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
        ValueLabel(configuration)
            .valueLabelStyle(self.style)
            .modifier(self.modifier)
    }
}

public struct ValueLabelStyleModifier<Style: ValueLabelStyle>: ViewModifier {
    let style: Style

    public func body(content: Content) -> some View {
        content.valueLabelStyle(self.style)
    }
}

public extension ValueLabelStyle {
    func modifier(_ modifier: some ViewModifier) -> some ValueLabelStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }

    func concat(_ style: some ValueLabelStyle) -> some ValueLabelStyle {
        style.modifier(ValueLabelStyleModifier(style: self))
    }
}
