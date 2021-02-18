import SwiftUI

public struct TimelineItem<Title: View, Subtitle: View, Footnote: View, Attribute: View, SecondaryAttribute: View, Timestamp: View, SecondaryTimestamp: View, Status: View, Substatus: View> {
    @Environment(\.titleModifier) private var titleModifier
    @Environment(\.subtitleModifier) private var subtitleModifier
    @Environment(\.footnoteModifier) private var footnoteModifier
    @Environment(\.attributeModifier) private var attributeModifier
    @Environment(\.secondaryAttributeModifier) private var secondaryAttributeModifier
    @Environment(\.timestampModifier) private var timestampModifier
    @Environment(\.secondaryTimestampModifier) private var secondaryTimestampModifier
    @Environment(\.statusModifier) private var statusModifier
    @Environment(\.substatusModifier) private var substatusModifier

    private let _title: Title
    private let _subtitle: Subtitle
    private let _footnote: Footnote
    private let _attribute: Attribute
    private let _secondaryAttribute: SecondaryAttribute
    private let _timestamp: Timestamp
    private let _secondaryTimestamp: SecondaryTimestamp
    private let _status: Status
    private let _substatus: Substatus
	
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle,
        @ViewBuilder footnote: @escaping () -> Footnote,
        @ViewBuilder attribute: @escaping () -> Attribute,
        @ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
        @ViewBuilder timestamp: @escaping () -> Timestamp,
        @ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
        @ViewBuilder status: @escaping () -> Status,
        @ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self._title = title()
        self._subtitle = subtitle()
        self._footnote = footnote()
        self._attribute = attribute()
        self._secondaryAttribute = secondaryAttribute()
        self._timestamp = timestamp()
        self._secondaryTimestamp = secondaryTimestamp()
        self._status = status()
        self._substatus = substatus()
    }

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.TimelineItem.title))
    }

    var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.TimelineItem.subtitle))
    }

    var footnote: some View {
        _footnote.modifier(footnoteModifier.concat(Fiori.TimelineItem.footnote))
    }

    var attribute: some View {
        _attribute.modifier(attributeModifier.concat(Fiori.TimelineItem.attribute))
    }

    var secondaryAttribute: some View {
        _secondaryAttribute.modifier(secondaryAttributeModifier.concat(Fiori.TimelineItem.secondaryAttribute))
    }

    var timestamp: some View {
        _timestamp.modifier(timestampModifier.concat(Fiori.TimelineItem.timestamp))
    }

    var secondaryTimestamp: some View {
        _secondaryTimestamp.modifier(secondaryTimestampModifier.concat(Fiori.TimelineItem.secondaryTimestamp))
    }

    var status: some View {
        _status.modifier(statusModifier.concat(Fiori.TimelineItem.status))
    }

    var substatus: some View {
        _substatus.modifier(substatusModifier.concat(Fiori.TimelineItem.substatus))
    }
}

public extension TimelineItem where Title == Text,
    Subtitle == _ConditionalContent<Text, EmptyView>,
    Footnote == _ConditionalContent<Text, EmptyView>,
    Attribute == _ConditionalContent<Text, EmptyView>,
    SecondaryAttribute == _ConditionalContent<Text, EmptyView>,
    Timestamp == _ConditionalContent<Text, EmptyView>,
    SecondaryTimestamp == _ConditionalContent<Text, EmptyView>,
    Status == _ConditionalContent<Text, EmptyView>,
    Substatus == _ConditionalContent<Text, EmptyView>
{
    init(model: TimelineItemModel) {
        self.init(title: model.title_, subtitle: model.subtitle_, footnote: model.footnote_, attribute: model.attribute_, secondaryAttribute: model.secondaryAttribute_, timestamp: model.timestamp_, secondaryTimestamp: model.secondaryTimestamp_, status: model.status_, substatus: model.substatus_)
    }

    init(title: String, subtitle: String? = nil, footnote: String? = nil, attribute: String? = nil, secondaryAttribute: String? = nil, timestamp: String? = nil, secondaryTimestamp: String? = nil, status: String? = nil, substatus: String? = nil) {
        self._title = Text(title)
        self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
        self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
        self._attribute = attribute != nil ? ViewBuilder.buildEither(first: Text(attribute!)) : ViewBuilder.buildEither(second: EmptyView())
        self._secondaryAttribute = secondaryAttribute != nil ? ViewBuilder.buildEither(first: Text(secondaryAttribute!)) : ViewBuilder.buildEither(second: EmptyView())
        self._timestamp = timestamp != nil ? ViewBuilder.buildEither(first: Text(timestamp!)) : ViewBuilder.buildEither(second: EmptyView())
        self._secondaryTimestamp = secondaryTimestamp != nil ? ViewBuilder.buildEither(first: Text(secondaryTimestamp!)) : ViewBuilder.buildEither(second: EmptyView())
        self._status = status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView())
        self._substatus = substatus != nil ? ViewBuilder.buildEither(first: Text(substatus!)) : ViewBuilder.buildEither(second: EmptyView())
    }
}
