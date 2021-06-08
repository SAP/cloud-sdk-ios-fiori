// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct CollectionItem<DetailImage: View, Title: View, Subtitle: View> {
    @Environment(\.detailImageModifier) private var detailImageModifier
	@Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier

    let _detailImage: DetailImage
	let _title: Title
	let _subtitle: Subtitle
	
    private var isModelInit: Bool = false
	private var isDetailImageNil: Bool = false
	private var isSubtitleNil: Bool = false

    public init(
        @ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
            self._detailImage = detailImage()
			self._title = title()
			self._subtitle = subtitle()
    }

    @ViewBuilder var detailImage: some View {
        if isModelInit {
            _detailImage.modifier(detailImageModifier.concat(Fiori.CollectionItem.detailImage).concat(Fiori.CollectionItem.detailImageCumulative))
        } else {
            _detailImage.modifier(detailImageModifier.concat(Fiori.CollectionItem.detailImage))
        }
    }
	@ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.CollectionItem.title).concat(Fiori.CollectionItem.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.CollectionItem.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.CollectionItem.subtitle).concat(Fiori.CollectionItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.CollectionItem.subtitle))
        }
    }
    
	var isDetailImageEmptyView: Bool {
        ((isModelInit && isDetailImageNil) || DetailImage.self == EmptyView.self) ? true : false
    }

	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
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

		isModelInit = true
		isDetailImageNil = detailImage == nil ? true : false
		isSubtitleNil = subtitle == nil ? true : false
    }
}
