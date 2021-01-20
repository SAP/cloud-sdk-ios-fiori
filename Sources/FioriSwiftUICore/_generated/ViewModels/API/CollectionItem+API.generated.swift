// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct CollectionItem<DetailImage: View, Title: View, Subtitle: View> {
    @Environment(\.detailImageModifier) private var detailImageModifier
	@Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier

    private let _detailImage: DetailImage
	private let _title: Title
	private let _subtitle: Subtitle

    public init(
        @ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
            self._detailImage = detailImage()
			self._title = title()
			self._subtitle = subtitle()
    }

    var detailImage: some View {
        _detailImage.modifier(detailImageModifier.concat(Fiori.CollectionItem.detailImage))
    }
	var title: some View {
        _title.modifier(titleModifier.concat(Fiori.CollectionItem.title))
    }
	var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.CollectionItem.subtitle))
    }
}

extension CollectionItem where DetailImage == _ConditionalContent<Image, EmptyView>,
		Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView> {
    
    public init(model: CollectionItemModel) {
        self.init(detailImage: model.detailImage_, title: model.title_, subtitle: model.subtitle_) 
    }

    public init(detailImage: Image? = nil, title: String, subtitle: String? = nil) {
        self._detailImage = detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView())
			self._title = Text(title)
			self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) 
    }
} 
