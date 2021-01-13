import SwiftUI

internal protocol _ComponentGenerating {}

internal struct _Component: _ComponentGenerating {
    let title_: String
    let subtitle_: String?
    let footnote_: String?
    let descriptionText_: String?
    let detailImage_: Image?
    let attribute_: String?
    let secondaryAttribute_: String?
    let timestamp_: String?
    let secondaryTimestamp_: String?
    let trend_: String?
    let status_: String?
    let substatus_: String?
    let body_: String?
    let icon_: Image?
    let icons_: [String]
    let actionTitle_: String?
    let seriesTitles_: [String]
    let key_: String
    let value_: String?
    let values_: [String]
    let valueAxisTitle_: String?
    let secondaryValuesAxisTitle_: String?
    let categoryAxisTitle_: String?
    let emptyText_: String?
    let kpi_: String?
    let placeholder_: String?
    let tags_: [String]
    let lowerBoundTitle_: String?
    let upperBoundTitle_: String?
    var activities_: [ActivityItem] // need to be optional ?
}
