// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

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

// MARK: MandatoryFieldIndicatorStyle

public extension View {
    func mandatoryFieldIndicatorStyle(_ style: some MandatoryFieldIndicatorStyle) -> some View {
        self.transformEnvironment(\.mandatoryFieldIndicatorStyleStack) { stack in
            stack.append(style)
        }
    }

    func mandatoryFieldIndicatorStyle(@ViewBuilder content: @escaping (MandatoryFieldIndicatorConfiguration) -> some View) -> some View {
        self.transformEnvironment(\.mandatoryFieldIndicatorStyleStack) { stack in
            let style = AnyMandatoryFieldIndicatorStyle(content)
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
