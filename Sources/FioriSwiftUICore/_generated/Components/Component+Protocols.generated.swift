// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI


public protocol TitleComponent {
    var title: String { get }
}

public protocol SubtitleComponent {
    var subtitle: String? { get }
}

public protocol TagsComponent {
	// sourcery: backingComponent=TagStack
	// sourcery: customFunctionBuilder=TagBuilder
    var tags: [String]? { get }
}

public protocol FootnoteComponent {
    var footnote: String? { get }
}

public protocol DescriptionTextComponent {
    var descriptionText: String? { get }
}

public protocol DetailImageComponent {
    var detailImage: Image? { get }
}

public protocol AttributeComponent {
    var attribute: String? { get }
}

public protocol SecondaryAttributeComponent {
    var secondaryAttribute: String? { get }
}

public protocol TimestampComponent {
    var timestamp: String? { get }
}

public protocol SecondaryTimestampComponent {
    var secondaryTimestamp: String? { get }
}

public protocol TrendComponent {
    var trend: String? { get }
}

public protocol TrendImageComponent {
    var trendImage: Image? { get }
}

public protocol StatusComponent {
	// sourcery: backingComponent=TextOrIconView
    var status: TextOrIcon? { get }
}

public protocol SubstatusComponent {
	// sourcery: backingComponent=TextOrIconView
    var substatus: TextOrIcon? { get }
}

public protocol BodyTextComponent {
    var bodyText: String? { get }
}

public protocol BodyAttributedTextComponent {
	// sourcery: backingComponent=AttributedText
    var bodyAttributedText: NSAttributedString? { get }
}

public protocol IconComponent {
    var icon: Image? { get }
}

public protocol AccessoryIconComponent {
    var accessoryIcon: Image? { get }
}

public protocol IconsComponent {
	// sourcery: backingComponent=IconStack
	// sourcery: customFunctionBuilder=IconBuilder
    var icons: [TextOrIcon]? { get }
}

public protocol ActionTitleComponent {
    var actionTitle: String? { get }
}

public protocol FirstActionTitleComponent {
    var firstActionTitle: String? { get }
}

public protocol SecondActionTitleComponent {
    var secondActionTitle: String? { get }
}

public protocol SeriesTitlesComponent {
    var seriesTitles: [String] { get }
}

public protocol KeyComponent {
    var key: String { get }
}

public protocol ValueComponent {
    var value: String? { get }
}

public protocol ValuesComponent {
    var values: [String] { get }
}

public protocol ValueAxisTitleComponent {
    var valueAxisTitle: String? { get }
}

public protocol SecondaryValuesAxisTitleComponent {
    var secondaryValuesAxisTitle: String? { get }
}

public protocol CategoryAxisTitleComponent {
    var categoryAxisTitle: String? { get }
}

public protocol EmptyTextComponent {
    var emptyText: String? { get }
}

public protocol KpiComponent {
    var kpi: String? { get }
}

public protocol PlaceholderComponent {
    var placeholder: String? { get }
}

public protocol LowerBoundTitleComponent {
    var lowerBoundTitle: String? { get }
}

public protocol UpperBoundTitleComponent {
    var upperBoundTitle: String? { get }
}


public protocol ActionComponent {
    var actionText: String? { get }
	// sourcery: no_view
    var didSelectAction: (() -> Void)? { get }
}

public protocol ActionItemsComponent {
    var actionItems: [ActivityItemDataType]? { get }
	// sourcery: no_view
    var didSelectActivityItem: ((ActivityItemDataType) -> Void)? { get }
}

public protocol KpiProgressComponent : KpiComponent {
	// sourcery: no_view
    var fraction: Double? { get }
}

public protocol ProgressIndicatorComponent {
    var progressIndicatorText: String? { get }
}

public protocol TextInputComponent : AnyObject {
	// sourcery: bindingPropertyOptional=.constant("")
    var textInputValue: String { get set }
	// sourcery: no_view
    var onCommit: (() -> Void)? { get }
}
