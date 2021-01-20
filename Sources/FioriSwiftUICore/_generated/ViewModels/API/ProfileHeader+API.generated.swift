// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ProfileHeader<Title: View, Subtitle: View, Footnote: View, DescriptionText: View, DetailImage: View, ActionItems: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.detailImageModifier) private var detailImageModifier
	@Environment(\.horizontalSizeClass) var horizontalSizeClass

    private let _title: Title
	private let _subtitle: Subtitle
	private let _footnote: Footnote
	private let _descriptionText: DescriptionText
	private let _detailImage: DetailImage
	private let _actionItems: ActionItems 

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

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.ProfileHeader.title))
    }
	var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.ProfileHeader.subtitle))
    }
	var footnote: some View {
        _footnote.modifier(footnoteModifier.concat(Fiori.ProfileHeader.footnote))
    }
	var descriptionText: some View {
        _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ProfileHeader.descriptionText))
    }
	var detailImage: some View {
        _detailImage.modifier(detailImageModifier.concat(Fiori.ProfileHeader.detailImage))
    }
    var actionItems: some View {
        _actionItems
    }
}

extension ProfileHeader where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		DetailImage == _ConditionalContent<Image, EmptyView> {
    
    public init(model: ProfileHeaderModel, @ViewBuilder actionItems: @escaping () -> ActionItems) {
        self.init(title: model.title_, subtitle: model.subtitle_, footnote: model.footnote_, descriptionText: model.descriptionText_, detailImage: model.detailImage_, actionItems: actionItems) 
    }

    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, detailImage: Image? = nil, @ViewBuilder actionItems: @escaping () -> ActionItems) {
        self._title = Text(title)
			self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
			self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
			self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
			self._detailImage = detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView())
			self._actionItems = actionItems() 
    }
} 
