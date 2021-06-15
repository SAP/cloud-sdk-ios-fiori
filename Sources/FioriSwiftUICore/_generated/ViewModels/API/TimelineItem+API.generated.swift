// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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

    let _title: Title
	let _subtitle: Subtitle
	let _footnote: Footnote
	let _attribute: Attribute
	let _secondaryAttribute: SecondaryAttribute
	let _timestamp: Timestamp
	let _secondaryTimestamp: SecondaryTimestamp
	let _status: Status
	let _substatus: Substatus
	
    private var isModelInit: Bool = false
	private var isSubtitleNil: Bool = false
	private var isFootnoteNil: Bool = false
	private var isAttributeNil: Bool = false
	private var isSecondaryAttributeNil: Bool = false
	private var isTimestampNil: Bool = false
	private var isSecondaryTimestampNil: Bool = false
	private var isStatusNil: Bool = false
	private var isSubstatusNil: Bool = false

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

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.TimelineItem.title).concat(Fiori.TimelineItem.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.TimelineItem.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.TimelineItem.subtitle).concat(Fiori.TimelineItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.TimelineItem.subtitle))
        }
    }
	@ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori.TimelineItem.footnote).concat(Fiori.TimelineItem.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori.TimelineItem.footnote))
        }
    }
	@ViewBuilder var attribute: some View {
        if isModelInit {
            _attribute.modifier(attributeModifier.concat(Fiori.TimelineItem.attribute).concat(Fiori.TimelineItem.attributeCumulative))
        } else {
            _attribute.modifier(attributeModifier.concat(Fiori.TimelineItem.attribute))
        }
    }
	@ViewBuilder var secondaryAttribute: some View {
        if isModelInit {
            _secondaryAttribute.modifier(secondaryAttributeModifier.concat(Fiori.TimelineItem.secondaryAttribute).concat(Fiori.TimelineItem.secondaryAttributeCumulative))
        } else {
            _secondaryAttribute.modifier(secondaryAttributeModifier.concat(Fiori.TimelineItem.secondaryAttribute))
        }
    }
	@ViewBuilder var timestamp: some View {
        if isModelInit {
            _timestamp.modifier(timestampModifier.concat(Fiori.TimelineItem.timestamp).concat(Fiori.TimelineItem.timestampCumulative))
        } else {
            _timestamp.modifier(timestampModifier.concat(Fiori.TimelineItem.timestamp))
        }
    }
	@ViewBuilder var secondaryTimestamp: some View {
        if isModelInit {
            _secondaryTimestamp.modifier(secondaryTimestampModifier.concat(Fiori.TimelineItem.secondaryTimestamp).concat(Fiori.TimelineItem.secondaryTimestampCumulative))
        } else {
            _secondaryTimestamp.modifier(secondaryTimestampModifier.concat(Fiori.TimelineItem.secondaryTimestamp))
        }
    }
	@ViewBuilder var status: some View {
        if isModelInit {
            _status.modifier(statusModifier.concat(Fiori.TimelineItem.status).concat(Fiori.TimelineItem.statusCumulative))
        } else {
            _status.modifier(statusModifier.concat(Fiori.TimelineItem.status))
        }
    }
	@ViewBuilder var substatus: some View {
        if isModelInit {
            _substatus.modifier(substatusModifier.concat(Fiori.TimelineItem.substatus).concat(Fiori.TimelineItem.substatusCumulative))
        } else {
            _substatus.modifier(substatusModifier.concat(Fiori.TimelineItem.substatus))
        }
    }
    
	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }

	var isFootnoteEmptyView: Bool {
        ((isModelInit && isFootnoteNil) || Footnote.self == EmptyView.self) ? true : false
    }

	var isAttributeEmptyView: Bool {
        ((isModelInit && isAttributeNil) || Attribute.self == EmptyView.self) ? true : false
    }

	var isSecondaryAttributeEmptyView: Bool {
        ((isModelInit && isSecondaryAttributeNil) || SecondaryAttribute.self == EmptyView.self) ? true : false
    }

	var isTimestampEmptyView: Bool {
        ((isModelInit && isTimestampNil) || Timestamp.self == EmptyView.self) ? true : false
    }

	var isSecondaryTimestampEmptyView: Bool {
        ((isModelInit && isSecondaryTimestampNil) || SecondaryTimestamp.self == EmptyView.self) ? true : false
    }

	var isStatusEmptyView: Bool {
        ((isModelInit && isStatusNil) || Status.self == EmptyView.self) ? true : false
    }

	var isSubstatusEmptyView: Bool {
        ((isModelInit && isSubstatusNil) || Substatus.self == EmptyView.self) ? true : false
    }
}

extension TimelineItem where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		Attribute == _ConditionalContent<Text, EmptyView>,
		SecondaryAttribute == _ConditionalContent<Text, EmptyView>,
		Timestamp == _ConditionalContent<Text, EmptyView>,
		SecondaryTimestamp == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<TextOrIconView, EmptyView>,
		Substatus == _ConditionalContent<TextOrIconView, EmptyView> {

    public init(model: TimelineItemModel) {
        self.init(title: model.title_, subtitle: model.subtitle_, footnote: model.footnote_, attribute: model.attribute_, secondaryAttribute: model.secondaryAttribute_, timestamp: model.timestamp_, secondaryTimestamp: model.secondaryTimestamp_, status: model.status_, substatus: model.substatus_)
    }

    public init(title: String, subtitle: String? = nil, footnote: String? = nil, attribute: String? = nil, secondaryAttribute: String? = nil, timestamp: String? = nil, secondaryTimestamp: String? = nil, status: TextOrIcon? = nil, substatus: TextOrIcon? = nil) {
        self._title = Text(title)
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		self._attribute = attribute != nil ? ViewBuilder.buildEither(first: Text(attribute!)) : ViewBuilder.buildEither(second: EmptyView())
		self._secondaryAttribute = secondaryAttribute != nil ? ViewBuilder.buildEither(first: Text(secondaryAttribute!)) : ViewBuilder.buildEither(second: EmptyView())
		self._timestamp = timestamp != nil ? ViewBuilder.buildEither(first: Text(timestamp!)) : ViewBuilder.buildEither(second: EmptyView())
		self._secondaryTimestamp = secondaryTimestamp != nil ? ViewBuilder.buildEither(first: Text(secondaryTimestamp!)) : ViewBuilder.buildEither(second: EmptyView())
		self._status = status != nil ? ViewBuilder.buildEither(first: TextOrIconView(status: status)) : ViewBuilder.buildEither(second: EmptyView())
		self._substatus = substatus != nil ? ViewBuilder.buildEither(first: TextOrIconView(substatus: substatus)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isSubtitleNil = subtitle == nil ? true : false
		isFootnoteNil = footnote == nil ? true : false
		isAttributeNil = attribute == nil ? true : false
		isSecondaryAttributeNil = secondaryAttribute == nil ? true : false
		isTimestampNil = timestamp == nil ? true : false
		isSecondaryTimestampNil = secondaryTimestamp == nil ? true : false
		isStatusNil = status == nil ? true : false
		isSubstatusNil = substatus == nil ? true : false
    }
}
