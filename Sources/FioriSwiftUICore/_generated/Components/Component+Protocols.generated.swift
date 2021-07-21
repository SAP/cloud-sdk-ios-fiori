// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI


public protocol TitleComponent {
    var title_: String { get }
}

public protocol SubtitleComponent {
    var subtitle_: String? { get }
}

public protocol TagsComponent {
	// sourcery: backingComponent=TagStack
	// sourcery: customFunctionBuilder=TagBuilder
	// sourcery: no_style
    var tags_: [String]? { get }
}

public protocol FootnoteComponent {
    var footnote_: String? { get }
}

public protocol DescriptionTextComponent {
    var descriptionText_: String? { get }
}

public protocol DetailImageComponent {
    var detailImage_: Image? { get }
}

public protocol AttributeComponent {
    var attribute_: String? { get }
}

public protocol SecondaryAttributeComponent {
    var secondaryAttribute_: String? { get }
}

public protocol TimestampComponent {
    var timestamp_: String? { get }
}

public protocol SecondaryTimestampComponent {
    var secondaryTimestamp_: String? { get }
}

public protocol TrendComponent {
    var trend_: String? { get }
}

public protocol TrendImageComponent {
    var trendImage_: Image? { get }
}

public protocol StatusComponent {
	// sourcery: backingComponent=TextOrIconView
    var status_: TextOrIcon? { get }
}

public protocol SubstatusComponent {
	// sourcery: backingComponent=TextOrIconView
    var substatus_: TextOrIcon? { get }
}

public protocol BodyTextComponent {
    var bodyText_: String? { get }
}

public protocol IconComponent {
    var icon_: Image? { get }
}

public protocol AccessoryIconComponent {
    var accessoryIcon_: Image? { get }
}

public protocol IconsComponent {
	// sourcery: backingComponent=IconStack
	// sourcery: customFunctionBuilder=IconBuilder
	// sourcery: no_style
    var icons_: [TextOrIcon]? { get }
}

public protocol ActionTitleComponent {
    var actionTitle_: String? { get }
}

public protocol FirstActionTitleComponent {
    var firstActionTitle_: String? { get }
}

public protocol SecondActionTitleComponent {
    var secondActionTitle_: String? { get }
}

public protocol SeriesTitlesComponent {
    var seriesTitles_: [String] { get }
}

public protocol KeyComponent {
    var key_: String { get }
}

public protocol ValueComponent {
    var value_: String? { get }
}

public protocol ValuesComponent {
    var values_: [String] { get }
}

public protocol ValueAxisTitleComponent {
    var valueAxisTitle_: String? { get }
}

public protocol SecondaryValuesAxisTitleComponent {
    var secondaryValuesAxisTitle_: String? { get }
}

public protocol CategoryAxisTitleComponent {
    var categoryAxisTitle_: String? { get }
}

public protocol EmptyTextComponent {
    var emptyText_: String? { get }
}

public protocol KpiComponent {
    var kpi_: String? { get }
}

public protocol PlaceholderComponent {
    var placeholder_: String? { get }
}

public protocol LowerBoundTitleComponent {
    var lowerBoundTitle_: String? { get }
}

public protocol UpperBoundTitleComponent {
    var upperBoundTitle_: String? { get }
}


// sourcery: backingComponent=Action
public protocol ActionComponent {
    var actionText_: String? { get }
    // sourcery: no_nil_check
	func didSelectAction() -> Void
}

// sourcery: backingComponent=ActivityItems
public protocol ActionItemsComponent {
	// sourcery: no_style
    var actionItems_: [ActivityItemDataType]? { get }
    // sourcery: no_nil_check
	func didSelectActivityItem(_ activityItem: ActivityItemDataType) -> Void
}

// sourcery: backingComponent=HTMLView
public protocol HTMLViewComponent {
    var htmlContent_: NSAttributedString? { get }
}

public protocol KpiProgressComponent : KpiComponent {
	// sourcery: no_view
    var fraction_: Double? { get }
}

// sourcery: backingComponent=ProgressIndicator
public protocol ProgressIndicatorComponent {
    var progressIndicatorText_: String? { get }
}

// sourcery: backingComponent=SecondaryAction
public protocol SecondaryActionComponent {
    var secondaryActionText_: String? { get }
    // sourcery: no_nil_check
	func didSelectSecondaryAction() -> Void
}

// sourcery: backingComponent=TextInput
public protocol TextInputComponent : ObservableObject {
	// sourcery: bindingPropertyOptional=.constant("")
    var textInputValue_: String { get set }
    // sourcery: no_nil_check
	func onCommit() -> Void
}

// sourcery: backingComponent=UserConsentForms
public protocol UserConsentFormsComponent {
	// sourcery: no_view
    var itemAccepted_: Binding<[Int]> { get set }
	// sourcery: no_view
    var forms_: [UserConsentFormData] { get }
    // sourcery: no_nil_check
	func onCancel() -> Void
    // sourcery: no_nil_check
	func onAccepted(currentIndex: Int) -> Void
}
