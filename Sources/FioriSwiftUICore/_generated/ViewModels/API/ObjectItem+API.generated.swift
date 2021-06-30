// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ObjectItem<Title: View, Subtitle: View, Footnote: View, DescriptionText: View, Status: View, Substatus: View, DetailImage: View, Icons: View, ActionText: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.statusModifier) private var statusModifier
	@Environment(\.substatusModifier) private var substatusModifier
	@Environment(\.detailImageModifier) private var detailImageModifier
	@Environment(\.actionTextModifier) private var actionTextModifier
	@Environment(\.splitPercent) var splitPercent
	@Environment(\.sizeCategory) var sizeCategory
	@Environment(\.horizontalSizeClass) var horizontalSizeClass

    let _title: Title
	let _subtitle: Subtitle
	let _footnote: Footnote
	let _descriptionText: DescriptionText
	let _status: Status
	let _substatus: Substatus
	let _detailImage: DetailImage
	let _icons: Icons
	let _actionText: ActionText
	@State var mainViewSize: CGSize = .zero

    private var isModelInit: Bool = false
	private var isSubtitleNil: Bool = false
	private var isFootnoteNil: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isStatusNil: Bool = false
	private var isSubstatusNil: Bool = false
	private var isDetailImageNil: Bool = false
	private var isIconsNil: Bool = false
	private var isActionTextNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
        ) {
            self._title = title()
			self._subtitle = subtitle()
			self._footnote = footnote()
			self._descriptionText = descriptionText()
			self._status = status()
			self._substatus = substatus()
			self._detailImage = detailImage()
			self._icons = icons()
			self._actionText = actionText()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.ObjectItem.title).concat(Fiori.ObjectItem.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.ObjectItem.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.ObjectItem.subtitle).concat(Fiori.ObjectItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.ObjectItem.subtitle))
        }
    }
	@ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori.ObjectItem.footnote).concat(Fiori.ObjectItem.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori.ObjectItem.footnote))
        }
    }
	@ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ObjectItem.descriptionText).concat(Fiori.ObjectItem.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ObjectItem.descriptionText))
        }
    }
	@ViewBuilder var status: some View {
        if isModelInit {
            _status.modifier(statusModifier.concat(Fiori.ObjectItem.status).concat(Fiori.ObjectItem.statusCumulative))
        } else {
            _status.modifier(statusModifier.concat(Fiori.ObjectItem.status))
        }
    }
	@ViewBuilder var substatus: some View {
        if isModelInit {
            _substatus.modifier(substatusModifier.concat(Fiori.ObjectItem.substatus).concat(Fiori.ObjectItem.substatusCumulative))
        } else {
            _substatus.modifier(substatusModifier.concat(Fiori.ObjectItem.substatus))
        }
    }
	@ViewBuilder var detailImage: some View {
        if isModelInit {
            _detailImage.modifier(detailImageModifier.concat(Fiori.ObjectItem.detailImage).concat(Fiori.ObjectItem.detailImageCumulative))
        } else {
            _detailImage.modifier(detailImageModifier.concat(Fiori.ObjectItem.detailImage))
        }
    }
	var icons: some View {
        _icons
    }
	@ViewBuilder var actionText: some View {
        if isModelInit {
            _actionText.modifier(actionTextModifier.concat(Fiori.ObjectItem.actionText).concat(Fiori.ObjectItem.actionTextCumulative))
        } else {
            _actionText.modifier(actionTextModifier.concat(Fiori.ObjectItem.actionText))
        }
    }
    
	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
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

	var isIconsEmptyView: Bool {
        ((isModelInit && isIconsNil) || Icons.self == EmptyView.self) ? true : false
    }

	var isActionTextEmptyView: Bool {
        ((isModelInit && isActionTextNil) || ActionText.self == EmptyView.self) ? true : false
    }
}

extension ObjectItem where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<TextOrIconView, EmptyView>,
		Substatus == _ConditionalContent<TextOrIconView, EmptyView>,
		DetailImage == _ConditionalContent<Image, EmptyView>,
		Icons == _ConditionalContent<IconStack, EmptyView>,
		ActionText == _ConditionalContent<Action, EmptyView> {

    public init(model: ObjectItemModel) {
        self.init(title: model.title_, subtitle: model.subtitle_, footnote: model.footnote_, descriptionText: model.descriptionText_, status: model.status_, substatus: model.substatus_, detailImage: model.detailImage_, icons: model.icons_, actionText: model.actionText_, didSelectAction: model.didSelectAction)
    }

    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, status: TextOrIcon? = nil, substatus: TextOrIcon? = nil, detailImage: Image? = nil, icons: [TextOrIcon]? = nil, actionText: String? = nil, didSelectAction: (() -> Void)? = nil) {
        self._title = Text(title)
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._status = status != nil ? ViewBuilder.buildEither(first: TextOrIconView(status: status)) : ViewBuilder.buildEither(second: EmptyView())
		self._substatus = substatus != nil ? ViewBuilder.buildEither(first: TextOrIconView(substatus: substatus)) : ViewBuilder.buildEither(second: EmptyView())
		self._detailImage = detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView())
		self._icons = icons != nil ? ViewBuilder.buildEither(first: IconStack(icons: icons)) : ViewBuilder.buildEither(second: EmptyView())
		// handle ActionModel
        if (actionText != nil) {
            self._actionText = ViewBuilder.buildEither(first: Action(actionText: actionText,didSelectAction: didSelectAction))
        } else {
            self._actionText = ViewBuilder.buildEither(second: EmptyView())
        }

		isModelInit = true
		isSubtitleNil = subtitle == nil ? true : false
		isFootnoteNil = footnote == nil ? true : false
		isDescriptionTextNil = descriptionText == nil ? true : false
		isStatusNil = status == nil ? true : false
		isSubstatusNil = substatus == nil ? true : false
		isDetailImageNil = detailImage == nil ? true : false
		isIconsNil = icons == nil ? true : false
		isActionTextNil = actionText == nil ? true : false
    }
}
