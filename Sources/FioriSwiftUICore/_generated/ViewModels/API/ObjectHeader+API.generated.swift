// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ObjectHeader<Title: View, Subtitle: View, Tags: View, BodyText: View, Footnote: View, DescriptionText: View, Status: View, Substatus: View, DetailImage: View, DetailContent: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.tagsModifier) private var tagsModifier
	@Environment(\.bodyTextModifier) private var bodyTextModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.statusModifier) private var statusModifier
	@Environment(\.substatusModifier) private var substatusModifier
	@Environment(\.detailImageModifier) private var detailImageModifier
	@Environment(\.sizeCategory) var sizeCategory
	@Environment(\.horizontalSizeClass) var horizontalSizeClass

    let _title: Title
	let _subtitle: Subtitle
	let _tags: Tags
	let _bodyText: BodyText
	let _footnote: Footnote
	let _descriptionText: DescriptionText
	let _status: Status
	let _substatus: Substatus
	let _detailImage: DetailImage
	let _detailContent: DetailContent
	@State var mainViewSize: CGSize = .zero
	@State var statusViewSize: CGSize = .zero
	@State var middleViewSize: CGSize = CGSize(width: 312, height: 0)
	@State var rightViewSize: CGSize = CGSize(width: 120, height: 0)
	@State var currentTabIndex: Int = 0
	@State var leftViewSize: CGSize = CGSize(width: 740, height: 0)

    private var isModelInit: Bool = false
	private var isSubtitleNil: Bool = false
	private var isTagsNil: Bool = false
	private var isBodyTextNil: Bool = false
	private var isFootnoteNil: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isStatusNil: Bool = false
	private var isSubstatusNil: Bool = false
	private var isDetailImageNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
        ) {
            self._title = title()
			self._subtitle = subtitle()
			self._tags = tags()
			self._bodyText = bodyText()
			self._footnote = footnote()
			self._descriptionText = descriptionText()
			self._status = status()
			self._substatus = substatus()
			self._detailImage = detailImage()
			self._detailContent = detailContent()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.ObjectHeader.title).concat(Fiori.ObjectHeader.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.ObjectHeader.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.ObjectHeader.subtitle).concat(Fiori.ObjectHeader.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.ObjectHeader.subtitle))
        }
    }
	@ViewBuilder var tags: some View {
        if isModelInit {
            _tags.modifier(tagsModifier.concat(Fiori.ObjectHeader.tags).concat(Fiori.ObjectHeader.tagsCumulative))
        } else {
            _tags.modifier(tagsModifier.concat(Fiori.ObjectHeader.tags))
        }
    }
	@ViewBuilder var bodyText: some View {
        if isModelInit {
            _bodyText.modifier(bodyTextModifier.concat(Fiori.ObjectHeader.bodyText).concat(Fiori.ObjectHeader.bodyTextCumulative))
        } else {
            _bodyText.modifier(bodyTextModifier.concat(Fiori.ObjectHeader.bodyText))
        }
    }
	@ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori.ObjectHeader.footnote).concat(Fiori.ObjectHeader.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori.ObjectHeader.footnote))
        }
    }
	@ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ObjectHeader.descriptionText).concat(Fiori.ObjectHeader.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ObjectHeader.descriptionText))
        }
    }
	@ViewBuilder var status: some View {
        if isModelInit {
            _status.modifier(statusModifier.concat(Fiori.ObjectHeader.status).concat(Fiori.ObjectHeader.statusCumulative))
        } else {
            _status.modifier(statusModifier.concat(Fiori.ObjectHeader.status))
        }
    }
	@ViewBuilder var substatus: some View {
        if isModelInit {
            _substatus.modifier(substatusModifier.concat(Fiori.ObjectHeader.substatus).concat(Fiori.ObjectHeader.substatusCumulative))
        } else {
            _substatus.modifier(substatusModifier.concat(Fiori.ObjectHeader.substatus))
        }
    }
	@ViewBuilder var detailImage: some View {
        if isModelInit {
            _detailImage.modifier(detailImageModifier.concat(Fiori.ObjectHeader.detailImage).concat(Fiori.ObjectHeader.detailImageCumulative))
        } else {
            _detailImage.modifier(detailImageModifier.concat(Fiori.ObjectHeader.detailImage))
        }
    }
    var detailContent: some View {
        _detailContent
    }
	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }

	var isTagsEmptyView: Bool {
        ((isModelInit && isTagsNil) || Tags.self == EmptyView.self) ? true : false
    }

	var isBodyTextEmptyView: Bool {
        ((isModelInit && isBodyTextNil) || BodyText.self == EmptyView.self) ? true : false
    }

	var isFootnoteEmptyView: Bool {
        ((isModelInit && isFootnoteNil) || Footnote.self == EmptyView.self) ? true : false
    }

	var isDescriptionTextEmptyView: Bool {
        ((isModelInit && isDescriptionTextNil) || DescriptionText.self == EmptyView.self) ? true : false
    }

	var isStatusEmptyView: Bool {
        ((isModelInit && isStatusNil) || Status.self == EmptyView.self) ? true : false
    }

	var isSubstatusEmptyView: Bool {
        ((isModelInit && isSubstatusNil) || Substatus.self == EmptyView.self) ? true : false
    }

	var isDetailImageEmptyView: Bool {
        ((isModelInit && isDetailImageNil) || DetailImage.self == EmptyView.self) ? true : false
    }
}

extension ObjectHeader where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Tags == _ConditionalContent<TagStack, EmptyView>,
		BodyText == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<TextOrIconView, EmptyView>,
		Substatus == _ConditionalContent<TextOrIconView, EmptyView>,
		DetailImage == _ConditionalContent<Image, EmptyView> {

    public init(model: ObjectHeaderModel, @ViewBuilder detailContent: () -> DetailContent) {
        self.init(title: model.title, subtitle: model.subtitle, tags: model.tags, bodyText: model.bodyText, footnote: model.footnote, descriptionText: model.descriptionText, status: model.status, substatus: model.substatus, detailImage: model.detailImage, detailContent: detailContent)
    }

    public init(title: String, subtitle: String? = nil, tags: [String]? = nil, bodyText: String? = nil, footnote: String? = nil, descriptionText: String? = nil, status: TextOrIcon? = nil, substatus: TextOrIcon? = nil, detailImage: Image? = nil, @ViewBuilder detailContent: () -> DetailContent) {
        self._title = Text(title)
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._tags = tags != nil ? ViewBuilder.buildEither(first: TagStack(tags: tags!)) : ViewBuilder.buildEither(second: EmptyView())
		self._bodyText = bodyText != nil ? ViewBuilder.buildEither(first: Text(bodyText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._status = status != nil ? ViewBuilder.buildEither(first: TextOrIconView(status: status!)) : ViewBuilder.buildEither(second: EmptyView())
		self._substatus = substatus != nil ? ViewBuilder.buildEither(first: TextOrIconView(substatus: substatus!)) : ViewBuilder.buildEither(second: EmptyView())
		self._detailImage = detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView())
		self._detailContent = detailContent()

		isModelInit = true
		isSubtitleNil = subtitle == nil ? true : false
		isTagsNil = tags == nil ? true : false
		isBodyTextNil = bodyText == nil ? true : false
		isFootnoteNil = footnote == nil ? true : false
		isDescriptionTextNil = descriptionText == nil ? true : false
		isStatusNil = status == nil ? true : false
		isSubstatusNil = substatus == nil ? true : false
		isDetailImageNil = detailImage == nil ? true : false
    }
}
