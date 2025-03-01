// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _ContactItem<Title: View, Subtitle: View, DescriptionText: View, DetailImage: View, ActionItems: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.detailImageModifier) private var detailImageModifier
	@Environment(\.actionItemsModifier) private var actionItemsModifier
	@Environment(\.splitPercent) var splitPercent
	@Environment(\.sizeCategory) var sizeCategory
	@Environment(\.horizontalSizeClass) var horizontalSizeClass

    let _title: Title
	let _subtitle: Subtitle
	let _descriptionText: DescriptionText
	let _detailImage: DetailImage
	let _actionItems: ActionItems
	@State var mainViewSize: CGSize = .zero

    private var isModelInit: Bool = false
	private var isSubtitleNil: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isDetailImageNil: Bool = false
	private var isActionItemsNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder actionItems: () -> ActionItems
        ) {
            self._title = title()
			self._subtitle = subtitle()
			self._descriptionText = descriptionText()
			self._detailImage = detailImage()
			self._actionItems = actionItems()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori._ContactItem.title).concat(Fiori._ContactItem.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori._ContactItem.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori._ContactItem.subtitle).concat(Fiori._ContactItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori._ContactItem.subtitle))
        }
    }
	@ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori._ContactItem.descriptionText).concat(Fiori._ContactItem.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori._ContactItem.descriptionText))
        }
    }
	@ViewBuilder var detailImage: some View {
        if isModelInit {
            _detailImage.modifier(detailImageModifier.concat(Fiori._ContactItem.detailImage).concat(Fiori._ContactItem.detailImageCumulative))
        } else {
            _detailImage.modifier(detailImageModifier.concat(Fiori._ContactItem.detailImage))
        }
    }
	@ViewBuilder var actionItems: some View {
        if isModelInit {
            _actionItems.modifier(actionItemsModifier.concat(Fiori._ContactItem.actionItems).concat(Fiori._ContactItem.actionItemsCumulative))
        } else {
            _actionItems.modifier(actionItemsModifier.concat(Fiori._ContactItem.actionItems))
        }
    }
    
	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
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

extension _ContactItem where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		DetailImage == _ConditionalContent<Image, EmptyView>,
		ActionItems == _ConditionalContent<_ActivityItems, EmptyView> {

    public init(model: _ContactItemModel) {
        self.init(title: model.title, subtitle: model.subtitle, descriptionText: model.descriptionText, detailImage: model.detailImage, actionItems: model.actionItems != nil ? _ActivityItems(model: model.actionItems!) : nil)
    }

    public init(title: String, subtitle: String? = nil, descriptionText: String? = nil, detailImage: Image? = nil, actionItems: _ActivityItems? = nil) {
        self._title = Text(title)
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._detailImage = detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView())
		self._actionItems = actionItems != nil ? ViewBuilder.buildEither(first: actionItems!) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isSubtitleNil = subtitle == nil ? true : false
		isDescriptionTextNil = descriptionText == nil ? true : false
		isDetailImageNil = detailImage == nil ? true : false
		isActionItemsNil = actionItems == nil ? true : false
    }
}
