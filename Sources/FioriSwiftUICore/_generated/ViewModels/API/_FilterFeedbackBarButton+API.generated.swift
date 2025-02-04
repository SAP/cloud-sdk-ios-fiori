// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _FilterFeedbackBarButton<LeftIcon: View, Title: View> {
    @Environment(\.leftIconModifier) private var leftIconModifier
	@Environment(\.titleModifier) private var titleModifier
	@Environment(\.optionListPickerStyle) var optionListPickerStyle

    let _leftIcon: LeftIcon
	let _title: Title
	let _isSelected: Bool
	

    private var isModelInit: Bool = false
	private var isLeftIconNil: Bool = false

    public init(
        @ViewBuilder leftIcon: () -> LeftIcon,
		@ViewBuilder title: () -> Title,
		isSelected: Bool
        ) {
            self._leftIcon = leftIcon()
			self._title = title()
			self._isSelected = isSelected
    }

    @ViewBuilder var leftIcon: some View {
        if isModelInit {
            _leftIcon.modifier(leftIconModifier.concat(Fiori._FilterFeedbackBarButton.leftIcon).concat(Fiori._FilterFeedbackBarButton.leftIconCumulative))
        } else {
            _leftIcon.modifier(leftIconModifier.concat(Fiori._FilterFeedbackBarButton.leftIcon))
        }
    }
	@ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori._FilterFeedbackBarButton.title).concat(Fiori._FilterFeedbackBarButton.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori._FilterFeedbackBarButton.title))
        }
    }
    
	var isLeftIconEmptyView: Bool {
        ((isModelInit && isLeftIconNil) || LeftIcon.self == EmptyView.self) ? true : false
    }
}

extension _FilterFeedbackBarButton where LeftIcon == _ConditionalContent<Image, EmptyView>,
		Title == Text {

    public init(model: _FilterFeedbackBarButtonModel) {
        self.init(leftIcon: model.leftIcon, title: model.title, isSelected: model.isSelected)
    }

    public init(leftIcon: Image? = nil, title: String, isSelected: Bool) {
        self._leftIcon = leftIcon != nil ? ViewBuilder.buildEither(first: leftIcon!) : ViewBuilder.buildEither(second: EmptyView())
		self._title = Text(title)
		self._isSelected = isSelected

		isModelInit = true
		isLeftIconNil = leftIcon == nil ? true : false
    }
}
