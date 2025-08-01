import Foundation
import SwiftUI

// swiftlint:disable file_length

/**
 Components in this file will have `View` and `Style` definitions generated by Sourcery.
 */

// sourcery: BaseComponent
protocol _TitleComponent {
    // sourcery: @ViewBuilder
    var title: AttributedString { get }
}

// sourcery: BaseComponent
protocol _SubtitleComponent {
    // sourcery: @ViewBuilder
    var subtitle: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _TagsComponent {
    // sourcery: resultBuilder.name = @TagBuilder, resultBuilder.backingComponent = TagStack
    var tags: [AttributedString] { get }
}

// sourcery: BaseComponent
protocol _TagComponent {
    // sourcery: resultBuilder.name = @ViewBuilder, resultBuilder.backingComponent = TextOrIconView
    var tag: TextOrIcon { get }
}

// sourcery: BaseComponent
protocol _FootnoteComponent {
    // sourcery: @ViewBuilder
    var footnote: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _DescriptionComponent {
    // sourcery: @ViewBuilder
    var description: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _DescriptionTextComponent {
    // sourcery: @ViewBuilder
    var descriptionText: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _StatusComponent {
    // sourcery: resultBuilder.name = @ViewBuilder, resultBuilder.backingComponent = TextOrIconView
    var status: TextOrIcon? { get }
}

// sourcery: BaseComponent
protocol _SubstatusComponent {
    // sourcery: resultBuilder.name = @ViewBuilder, resultBuilder.backingComponent = TextOrIconView
    var substatus: TextOrIcon? { get }
}

// sourcery: BaseComponent
protocol _DetailImageComponent {
    // sourcery: @ViewBuilder
    var detailImage: Image? { get }
}

// sourcery: BaseComponent
protocol _IconsComponent {
    // sourcery: resultBuilder.name = @IconBuilder, resultBuilder.backingComponent = IconStack
    var icons: [TextOrIcon] { get }
}

// sourcery: BaseComponent
protocol _FilledIconComponent {
    // sourcery: @ViewBuilder
    var filledIcon: Image? { get }
}

// sourcery: BaseComponent
protocol _AccessoryIconComponent {
    // sourcery: @ViewBuilder
    var accessoryIcon: Image? { get }
}

// sourcery: BaseComponent
protocol _FootnoteIconsComponent {
    // sourcery: resultBuilder.name = @FootnoteIconsBuilder, resultBuilder.backingComponent = FootnoteIconStack
    var footnoteIcons: [TextOrIcon] { get }
}

// sourcery: BaseComponent
protocol _FootnoteIconsTextComponent {
    // sourcery: @ViewBuilder
    var footnoteIconsText: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _AvatarsComponent {
    // sourcery: resultBuilder.name = @AvatarsBuilder, resultBuilder.backingComponent = AvatarsListStack
    var avatars: [TextOrIcon] { get }
}

// sourcery: BaseComponent
protocol _IconComponent {
    // sourcery: @ViewBuilder
    var icon: Image? { get }
}

// sourcery: BaseComponent
protocol _LinearProgressIndicatorComponent {
    // sourcery: @Binding
    var indicatorProgress: Double { get }
}

// TODO: rename to _ActionComponent after resolving the conflict.
// sourcery: BaseComponent
protocol _ActionComponent {
    // sourcery: @ViewBuilder
    var action: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _SwitchComponent {
    // sourcery: @Binding
    var isOn: Bool { get }
}

// sourcery: BaseComponent
protocol _CounterComponent {
    // sourcery: @ViewBuilder
    var counter: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _HeaderActionComponent {
    // sourcery: @ViewBuilder
    var headerAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _SecondaryActionComponent {
    // sourcery: @ViewBuilder
    var secondaryAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _TertiaryActionComponent {
    // sourcery: @ViewBuilder
    var tertiaryAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _OverflowActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Image(systemName: "ellipsis") }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Image(systemName: "ellipsis") } }"
    var overflowAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _Row1Component {
//    var numberOfLines: Int { get set }
    
    @ViewBuilder
    var row1: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _Row2Component {
    @ViewBuilder
    var row2: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _Row3Component {
    @ViewBuilder
    var row3: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _CardBodyComponent {
//    var separator: Bool { get set }
    
    @ViewBuilder
    var cardBody: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _MediaImageComponent {
    // sourcery: @ViewBuilder, resultBuilder.backingComponent = OptionalImage
    var mediaImage: Image? { get }
}

// sourcery: BaseComponent
protocol _KpiComponent {
    // sourcery: @ViewBuilder, resultBuilder.backingComponent = OptionalKPIItem
    var kpi: KPIItemData? { get }
}

// sourcery: BaseComponent
protocol _KpiCaptionComponent {
    // sourcery: @ViewBuilder
    var kpiCaption: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _PlaceholderComponent {
    // sourcery: @ViewBuilder
    var placeholder: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _TextViewComponent {
    // sourcery: @Binding
    var text: String { get }
}

// sourcery: BaseComponent
protocol _HelperTextComponent {
    // sourcery: @ViewBuilder
    var helperText: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _MoreActionOverflowComponent {
    @ViewBuilder
    var moreActionOverflow: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _GreetingTextComponent {
    // sourcery: @ViewBuilder
    var greetingText: AttributedString { get }
}

// sourcery: BaseComponent
protocol _MessageContentComponent {
    @ViewBuilder
    var messageContent: (() -> any View)? { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _DecrementActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in FioriIcon.actions.less }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in FioriIcon.actions.less } }"
    var decrementAction: FioriButton? { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _IncrementActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in FioriIcon.actions.add }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in FioriIcon.actions.add } }"
    var incrementAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _TopDividerComponent {
    // sourcery: defaultValue = "{ Rectangle().fill(Color.clear) }"
    @ViewBuilder
    var topDivider: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _CloseActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Image(fioriName: "fiori.decline") }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Image(fioriName: "fiori.decline") } }"
    var closeAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _TimestampComponent {
    // sourcery: @ViewBuilder
    var timestamp: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _SecondaryTimestampComponent {
    // sourcery: resultBuilder.name = @ViewBuilder, resultBuilder.backingComponent = TextOrIconView
    var secondaryTimestamp: TextOrIcon? { get }
}

// sourcery: BaseComponent
protocol _TimelineNodeComponent {
    // sourcery: resultBuilder.name = @ViewBuilder, resultBuilder.backingComponent = TimelineNodeView
    var timelineNode: TimelineNodeType { get }
}

// sourcery: BaseComponent
protocol _AttributeComponent {
    // sourcery: @ViewBuilder
    var attribute: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _SubAttributeComponent {
    // sourcery: @ViewBuilder
    var subAttribute: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _NowIndicatorNodeComponent {
    // sourcery: defaultValue = "{ Image(systemName: "circle.fill") }"
    @ViewBuilder
    var nowIndicatorNode: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _OptionsComponent {
    var options: [AttributedString] { get }
}

// sourcery: BaseComponent
protocol _OptionalTitleComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = ""
    var optionalTitle: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _ValueLabelComponent {
    // sourcery: @ViewBuilder
    var valueLabel: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _AvatarsTitleComponent {
    // sourcery: @ViewBuilder
    var avatarsTitle: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _ReviewCountLabelComponent {
    // sourcery: @ViewBuilder
    var reviewCountLabel: AttributedString? { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _OnStarImageComponent {
    /// The image to be used for "On" rating star.
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriIcon.actions.favorite.renderingMode(.template).resizable()"
    var onStarImage: Image { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _OffStarImageComponent {
    //// The image to be used for "Off" rating star.
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriIcon.actions.unfavorite.renderingMode(.template).resizable()"
    var offStarImage: Image { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _HalfStarImageComponent {
    //// The image to be used for "half" rating star.
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriIcon.actions.halfStar.renderingMode(.template).resizable()"
    var halfStarImage: Image { get }
}

// sourcery: BaseComponent
protocol _ValueComponent {
    // sourcery: @ViewBuilder
    var value: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _CancelActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Cancel".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Cancel".localizedFioriString()) } }"
    var cancelAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _ApplyActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Apply".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Apply".localizedFioriString()) } }"
    var applyAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _SelectedEntriesSectionTitleComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "AttributedString("Selected".localizedFioriString())"
    // sourcery: resultBuilder.defaultValue = "{ Text("Selected".localizedFioriString()) }"
    var selectedEntriesSectionTitle: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _AllEntriesSectionTitleComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "AttributedString("All".localizedFioriString())"
    // sourcery: resultBuilder.defaultValue = "{ Text("All".localizedFioriString()) }"
    var allEntriesSectionTitle: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _SelectAllActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Select All".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Select All".localizedFioriString()) } }"
    var selectAllAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _DeselectAllActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Deselect All".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Deselect All".localizedFioriString()) } }"
    var deselectAllAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _ListPickerContentComponent {
    @ViewBuilder
    var listPickerContent: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _PromptComponent {
    // sourcery: @ViewBuilder
    var prompt: AttributedString? { get }
}

/// `CheckoutIndicator` provides a circular indicator that shows the state of a process.
///
/// ## Usage
/// ```swift
/// @State var displayState = DisplayState.inProgress
///
/// CheckoutIndicator(displayState: self.$displayState)
/// ```
// sourcery: BaseComponent
protocol _CheckoutIndicatorComponent {
    // sourcery: @Binding
    /// The current state of this view. Changing this property will result in a different icon and view.
    var displayState: DisplayState { get }
}

// sourcery: BaseComponent
protocol _ProgressIndicatorProtocol {
    // sourcery: @Binding
    var progress: Double { get }
}

// sourcery: BaseComponent
protocol _ProgressComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "ProgressView()"
    var progress: ProgressView<EmptyView, EmptyView> { get }
}

// sourcery: BaseComponent
protocol _KPIContentComponent {
    @ViewBuilder
    var kPIContent: (() -> any View)? { get }
}

/// `ActivityItems` provides a view that shows several items with action.
///
/// ## Usage
/// ```swift
/// ActivityItems(activityItems: [
///    .init(type: .phone, didSelectActivityItem: {
///        print("click phone")
///    })
/// ])
/// ```
// sourcery: BaseComponent
protocol _ActivityItemsComponent {
    // sourcery: resultBuilder.name = @ActivityItemsBuilder, resultBuilder.backingComponent = ActivityItemsListStack
    var activityItems: [ActivityItemDataType] { get }
}

// sourcery: BaseComponent
protocol _TextInputComponent {
    // sourcery: @Binding
    // sourcery: defaultValue = ".constant("")"
    var textInputValue: String { get }
    // sourcery: no_view
    var onCommit: (() -> Void)? { get }
}

// sourcery: BaseComponent
protocol _LowerThumbComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "Circle()"
    var lowerThumb: any Shape { get }
}

// sourcery: BaseComponent
protocol _UpperThumbComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "Circle()"
    var upperThumb: any Shape { get }
}

// sourcery: BaseComponent
protocol _ActiveTrackComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "Capsule()"
    var activeTrack: any Shape { get }
}

// sourcery: BaseComponent
protocol _InactiveTrackComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "Capsule()"
    var inactiveTrack: any Shape { get }
}

// sourcery: BaseComponent
protocol _LeadingAccessoryComponent {
    @ViewBuilder
    var leadingAccessory: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _TrailingAccessoryComponent {
    @ViewBuilder
    var trailingAccessory: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _NodeComponent {
    // sourcery: resultBuilder.name = @ViewBuilder, resultBuilder.backingComponent = TextOrIconView
    var node: TextOrIcon? { get }
}

// sourcery: BaseComponent
protocol _LineComponent {
    // sourcery: defaultValue = "{ Rectangle() }"
    @ViewBuilder
    var line: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _AttachmentTitleComponent {
    // sourcery: @ViewBuilder
    var attachmentTitle: AttributedString { get }
}

// sourcery: BaseComponent
protocol _AttachmentSubtitleComponent {
    // sourcery: @ViewBuilder
    var attachmentSubtitle: AttributedString { get }
}

// sourcery: BaseComponent
protocol _AttachmentFootnoteComponent {
    // sourcery: @ViewBuilder
    var attachmentFootnote: AttributedString { get }
}

// sourcery: BaseComponent
protocol _BodyTextComponent {
    // sourcery: @ViewBuilder
    var bodyText: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _DetailContentComponent {
    @ViewBuilder
    var detailContent: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _InnerCircleComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "Circle()"
    var innerCircle: any Shape { get }
}

// sourcery: BaseComponent
protocol _OuterCircleComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "Circle()"
    var outerCircle: any Shape { get }
}

// sourcery: BaseComponent
protocol _TrendComponent {
    // sourcery: @ViewBuilder
    var trend: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _TrendImageComponent {
    // sourcery: @ViewBuilder
    var trendImage: Image? { get }
}

// sourcery: BaseComponent
protocol _ResetActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Reset".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Reset".localizedFioriString()) } }"
    var resetAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _StartSignatureActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Tap to Sign".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Tap to Sign".localizedFioriString()) } }"
    var startSignatureAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _ReenterSignatureActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Re-enter Signature".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Re-enter Signature".localizedFioriString()) } }"
    var reenterSignatureAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _ClearActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Clear".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Clear".localizedFioriString()) } }"
    var clearAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _SaveActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Save".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Save".localizedFioriString()) } }"
    var saveAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _XmarkComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "Image(systemName: "xmark")"
    // sourcery: resultBuilder.defaultValue = "{ Image(systemName: "xmark") }"
    var xmark: Image? { get }
}

// sourcery: BaseComponent
protocol _WatermarkComponent {
    // sourcery: @ViewBuilder
    var watermark: AttributedString? { get }
}

// sourcery: BaseComponent
protocol _KeyComponent {
    // sourcery: @ViewBuilder
    var key: AttributedString { get }
}

// sourcery: BaseComponent
protocol _KPISubItemComponent {
    // sourcery: resultBuilder.name = @ViewBuilder, resultBuilder.backingComponent = TextOrIconView
    var kPISubItemValue: TextOrIcon? { get }
    // sourcery: defaultValue = "KPISubitemType.unit"
    var kPISubItemType: KPISubitemType { get }
}

// sourcery: BaseComponent
protocol _NextActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Next".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Next".localizedFioriString()) } }"
    var nextAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _AllowActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Allow".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Allow".localizedFioriString()) } }"
    var allowAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _DenyActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Deny".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Deny".localizedFioriString()) } }"
    var denyAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _NotNowActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("NotNow".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("NotNow".localizedFioriString()) } }"
    var notNowAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _AgreeActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Agree".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Agree".localizedFioriString()) } }"
    var agreeAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _DisagreeActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Disagree".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Disagree".localizedFioriString()) } }"
    var disagreeAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _AuthInputComponent {
    @ViewBuilder
    var authInput: (() -> any View)? { get }
}

// sourcery: BaseComponent
protocol _SignInActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Sign In".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Sign In".localizedFioriString()) } }"
    var signInAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _CheckmarkComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "Image(systemName: "checkmark")"
    // sourcery: resultBuilder.defaultValue = "{ Image(systemName: "checkmark") }"
    var checkmark: Image? { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _UpVoteActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in FioriIcon.actions.thumbUp }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in FioriIcon.actions.thumbUp } }"
    var upVoteAction: FioriButton? { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _DownVoteActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in FioriIcon.actions.thumbDown }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in FioriIcon.actions.thumbDown } }"
    var downVoteAction: FioriButton? { get }
}

// sourcery: BaseComponent
protocol _SubmitActionComponent {
    // sourcery: @ViewBuilder
    var submitAction: FioriButton? { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _UndoActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton._undoButton"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton._undoButton }"
    var undoAction: FioriButton? { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _RedoActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton._redoButton"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton._redoButton }"
    var redoAction: FioriButton? { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _DoneActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton { _ in Text("Done".localizedFioriString()) }"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton { _ in Text("Done".localizedFioriString()) } }"
    var doneAction: FioriButton? { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _WritingAssistantActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton._writingAssistantButton"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton._writingAssistantButton }"
    var writingAssistantAction: FioriButton? { get }
}

// sourcery: BaseComponent
// sourcery: importFrameworks = ["FioriThemeManager"]
protocol _BackActionComponent {
    // sourcery: @ViewBuilder
    // sourcery: defaultValue = "FioriButton._backButton"
    // sourcery: resultBuilder.defaultValue = "{ FioriButton._backButton }"
    var backAction: FioriButton? { get }
}
