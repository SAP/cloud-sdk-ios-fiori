// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI


public protocol TitleComponent {
    var title_: String { get }
}

public protocol SubtitleComponent {
    var subtitle_: String? { get }
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

public protocol StatusComponent {
    var status_: String? { get }
}

public protocol SubstatusComponent {
    var substatus_: String? { get }
}

public protocol BodyComponent {
    var body_: String? { get }
}

public protocol IconComponent {
    var icon_: Image? { get }
}

public protocol IconsComponent {
    var icons_: [String] { get }
}

public protocol ActionTitleComponent {
    var actionTitle_: String? { get }
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

public protocol TagsComponent {
    var tags_: [String] { get }
}

public protocol LowerBoundTitleComponent {
    var lowerBoundTitle_: String? { get }
}

public protocol UpperBoundTitleComponent {
    var upperBoundTitle_: String? { get }
}

public protocol ActionItemsComponent {
	// sourcery: backingComponent=ActivityItems
	// sourcery: backingComponentArgumentLabel=actionItemsControl
	// sourcery: no_style
	var actionItems_: [ActivityItemDataType]? { get }
	func didSelect(_ activityItem: ActivityItemDataType)
}
