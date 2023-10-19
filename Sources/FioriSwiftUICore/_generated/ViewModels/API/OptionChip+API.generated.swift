// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct OptionChip<LeftIcon: View, Title: View> {
    @Environment(\.leftIconModifier) private var leftIconModifier
	@Environment(\.titleModifier) private var titleModifier
	@Environment(\.optionChipStyle) var optionChipStyle

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
            _leftIcon.modifier(leftIconModifier.concat(Fiori.OptionChip.leftIcon).concat(Fiori.OptionChip.leftIconCumulative))
        } else {
            _leftIcon.modifier(leftIconModifier.concat(Fiori.OptionChip.leftIcon))
        }
    }
	@ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.OptionChip.title).concat(Fiori.OptionChip.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.OptionChip.title))
        }
    }
    
	var isLeftIconEmptyView: Bool {
        ((isModelInit && isLeftIconNil) || LeftIcon.self == EmptyView.self) ? true : false
    }
}

extension OptionChip where LeftIcon == _ConditionalContent<Image, EmptyView>,
		Title == Text {

    public init(model: OptionChipModel) {
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
