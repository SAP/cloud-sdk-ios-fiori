// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ContactItem<Title: View, Subtitle: View, Footnote: View, DescriptionText: View, DetailImage: View, ActionItems: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.detailImageModifier) private var detailImageModifier
	@Environment(\.horizontalSizeClass) var horizontalSizeClass

    let _title: Title
	let _subtitle: Subtitle
	let _footnote: Footnote
	let _descriptionText: DescriptionText
	let _detailImage: DetailImage
	let _actionItems: ActionItems
	

    private var isModelInit: Bool = false
	private var isSubtitleNil: Bool = false
	private var isFootnoteNil: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isDetailImageNil: Bool = false
	private var isActionItemsNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
        ) {
            self._title = title()
			self._subtitle = subtitle()
			self._footnote = footnote()
			self._descriptionText = descriptionText()
			self._detailImage = detailImage()
			self._actionItems = actionItems()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.ContactItem.title).concat(Fiori.ContactItem.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.ContactItem.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.ContactItem.subtitle).concat(Fiori.ContactItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.ContactItem.subtitle))
        }
    }
	@ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori.ContactItem.footnote).concat(Fiori.ContactItem.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori.ContactItem.footnote))
        }
    }
	@ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ContactItem.descriptionText).concat(Fiori.ContactItem.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ContactItem.descriptionText))
        }
    }
	@ViewBuilder var detailImage: some View {
        if isModelInit {
            _detailImage.modifier(detailImageModifier.concat(Fiori.ContactItem.detailImage).concat(Fiori.ContactItem.detailImageCumulative))
        } else {
            _detailImage.modifier(detailImageModifier.concat(Fiori.ContactItem.detailImage))
        }
    }
	var actionItems: some View {
        _actionItems
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

	var isDetailImageEmptyView: Bool {
        ((isModelInit && isDetailImageNil) || DetailImage.self == EmptyView.self) ? true : false
    }

	var isActionItemsEmptyView: Bool {
        ((isModelInit && isActionItemsNil) || ActionItems.self == EmptyView.self) ? true : false
    }
}

extension ContactItem where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		DetailImage == _ConditionalContent<Image, EmptyView>,
		ActionItems == _ConditionalContent<ActivityItems, EmptyView> {

    public init(model: ContactItemModel) {
        self.init(title: model.title_, subtitle: model.subtitle_, footnote: model.footnote_, descriptionText: model.descriptionText_, detailImage: model.detailImage_, actionItems: model.actionItems_, didSelectActivityItem: model.didSelectActivityItem(_:))
    }

    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, detailImage: Image? = nil, actionItems: [ActivityItemDataType]? = nil, didSelectActivityItem: ((ActivityItemDataType) -> Void)? = nil) {
        self._title = Text(title)
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._detailImage = detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView())
		// handle ActivityItemsModel
        if (actionItems != nil) {
            self._actionItems = ViewBuilder.buildEither(first: ActivityItems(actionItems: actionItems,didSelectActivityItem: didSelectActivityItem))
        } else {
            self._actionItems = ViewBuilder.buildEither(second: EmptyView())
        }

		isModelInit = true
		isSubtitleNil = subtitle == nil ? true : false
		isFootnoteNil = footnote == nil ? true : false
		isDescriptionTextNil = descriptionText == nil ? true : false
		isDetailImageNil = detailImage == nil ? true : false
		isActionItemsNil = actionItems == nil ? true : false
    }
}
