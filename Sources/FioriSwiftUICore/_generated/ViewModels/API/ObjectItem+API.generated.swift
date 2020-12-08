// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct ObjectItem<Title: View, Subtitle: View, Footnote: View, DescriptionText: View, Status: View, Substatus: View, DetailImage: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.statusModifier) private var statusModifier
	@Environment(\.substatusModifier) private var substatusModifier
	@Environment(\.detailImageModifier) private var detailImageModifier
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private let _title: () -> Title
	private let _subtitle: () -> Subtitle
	private let _footnote: () -> Footnote
	private let _descriptionText: () -> DescriptionText
	private let _status: () -> Status
	private let _substatus: () -> Substatus
	private let _detailImage: () -> DetailImage

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
            self._title = title
			self._subtitle = subtitle
			self._footnote = footnote
			self._descriptionText = descriptionText
			self._status = status
			self._substatus = substatus
			self._detailImage = detailImage
    }

    @ViewBuilder var title: some View {
		_title().modifier(titleModifier.concat(Fiori.ObjectItem.title))
	}
	@ViewBuilder var subtitle: some View {
		_subtitle().modifier(subtitleModifier.concat(Fiori.ObjectItem.subtitle))
	}
	@ViewBuilder var footnote: some View {
		_footnote().modifier(footnoteModifier.concat(Fiori.ObjectItem.footnote))
	}
	@ViewBuilder var descriptionText: some View {
		_descriptionText().modifier(descriptionTextModifier.concat(Fiori.ObjectItem.descriptionText))
	}
	@ViewBuilder var status: some View {
		_status().modifier(statusModifier.concat(Fiori.ObjectItem.status))
	}
	@ViewBuilder var substatus: some View {
		_substatus().modifier(substatusModifier.concat(Fiori.ObjectItem.substatus))
	}
	@ViewBuilder var detailImage: some View {
		_detailImage().modifier(detailImageModifier.concat(Fiori.ObjectItem.detailImage))
	}
}

extension ObjectItem where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<Text, EmptyView>,
		Substatus == _ConditionalContent<Text, EmptyView>,
		DetailImage == _ConditionalContent<Image, EmptyView> {
    
    public init(model: ObjectItemModel) {
        self.init(title: model.title_, subtitle: model.subtitle_, footnote: model.footnote_, descriptionText: model.descriptionText_, status: model.status_, substatus: model.substatus_, detailImage: model.detailImage_)
    }

    public init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, status: String? = nil, substatus: String? = nil, detailImage: Image? = nil) {
        self._title = { Text(title) }
		self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._footnote = { footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._descriptionText = { descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._status = { status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._substatus = { substatus != nil ? ViewBuilder.buildEither(first: Text(substatus!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._detailImage = { detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 
