import SwiftUI

protocol _ComponentGenerating {}

struct _Component: _ComponentGenerating {
    let title_: String
    let subtitle_: String?
    // sourcery: backingComponent=TagStack
    // sourcery: customFunctionBuilder=TagBuilder
    let tags_: [String]?
    let footnote_: String?
    let descriptionText_: String?
    let detailImage_: Image?
    let attribute_: String?
    let secondaryAttribute_: String?
    let timestamp_: String?
    let secondaryTimestamp_: String?
    let trend_: String?
    let trendImage_: Image?
    // sourcery: backingComponent=TextOrIconView
    let status_: TextOrIcon?
    // sourcery: backingComponent=TextOrIconView
    let substatus_: TextOrIcon?
    let bodyText_: String?
    // sourcery: backingComponent=AttributedText
    let bodyAttributedText_: NSAttributedString?
    let icon_: Image?
    let accessoryIcon_: Image?
    // sourcery: backingComponent=IconStack
    // sourcery: customFunctionBuilder=IconBuilder
    let icons_: [TextOrIcon]?
    let actionTitle_: String?
    let firstActionTitle_: String?
    let secondActionTitle_: String?
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
    let lowerBoundTitle_: String?
    let upperBoundTitle_: String?
    
    // sourcery: backingComponent=AvatarStack
    // sourcery: customFunctionBuilder=AvatarsBuilder
    let avatars_: [TextOrIcon]?
    // sourcery: backingComponent=FootnoteIconStack
    // sourcery: customFunctionBuilder=FootnoteIconsBuilder
    let footnoteIcons_: [TextOrIcon]?
    let leftIcon_: Image?
    let rightIcon_: Image?
}
