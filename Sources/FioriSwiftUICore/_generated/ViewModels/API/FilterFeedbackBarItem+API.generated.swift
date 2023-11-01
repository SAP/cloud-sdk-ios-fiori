// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct FilterFeedbackBarItem<LeftIcon: View, Title: View, RightIcon: View> {
    @Environment(\.leftIconModifier) private var leftIconModifier
	@Environment(\.titleModifier) private var titleModifier
	@Environment(\.rightIconModifier) private var rightIconModifier
	@Environment(\.sortFilterMenuItemStyle) var sortFilterMenuItemStyle

    let _leftIcon: LeftIcon
	let _title: Title
	let _rightIcon: RightIcon
	let _isSelected: Bool
	@StateObject var context: SortFilterContext = SortFilterContext()

    private var isModelInit: Bool = false
	private var isLeftIconNil: Bool = false
	private var isRightIconNil: Bool = false

    public init(
        @ViewBuilder leftIcon: () -> LeftIcon,
		@ViewBuilder title: () -> Title,
		@ViewBuilder rightIcon: () -> RightIcon,
		isSelected: Bool
        ) {
            self._leftIcon = leftIcon()
			self._title = title()
			self._rightIcon = rightIcon()
			self._isSelected = isSelected
    }

    @ViewBuilder var leftIcon: some View {
        if isModelInit {
            _leftIcon.modifier(leftIconModifier.concat(Fiori.FilterFeedbackBarItem.leftIcon).concat(Fiori.FilterFeedbackBarItem.leftIconCumulative))
        } else {
            _leftIcon.modifier(leftIconModifier.concat(Fiori.FilterFeedbackBarItem.leftIcon))
        }
    }
	@ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.FilterFeedbackBarItem.title).concat(Fiori.FilterFeedbackBarItem.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.FilterFeedbackBarItem.title))
        }
    }
	@ViewBuilder var rightIcon: some View {
        if isModelInit {
            _rightIcon.modifier(rightIconModifier.concat(Fiori.FilterFeedbackBarItem.rightIcon).concat(Fiori.FilterFeedbackBarItem.rightIconCumulative))
        } else {
            _rightIcon.modifier(rightIconModifier.concat(Fiori.FilterFeedbackBarItem.rightIcon))
        }
    }
    
	var isLeftIconEmptyView: Bool {
        ((isModelInit && isLeftIconNil) || LeftIcon.self == EmptyView.self) ? true : false
    }

	var isRightIconEmptyView: Bool {
        ((isModelInit && isRightIconNil) || RightIcon.self == EmptyView.self) ? true : false
    }
}

extension FilterFeedbackBarItem where LeftIcon == _ConditionalContent<Image, EmptyView>,
		Title == Text,
		RightIcon == _ConditionalContent<Image, EmptyView> {

    public init(model: FilterFeedbackBarItemModel) {
        self.init(leftIcon: model.leftIcon, title: model.title, rightIcon: model.rightIcon, isSelected: model.isSelected)
    }

    public init(leftIcon: Image? = nil, title: String, rightIcon: Image? = nil, isSelected: Bool) {
        self._leftIcon = leftIcon != nil ? ViewBuilder.buildEither(first: leftIcon!) : ViewBuilder.buildEither(second: EmptyView())
		self._title = Text(title)
		self._rightIcon = rightIcon != nil ? ViewBuilder.buildEither(first: rightIcon!) : ViewBuilder.buildEither(second: EmptyView())
		self._isSelected = isSelected

		isModelInit = true
		isLeftIconNil = leftIcon == nil ? true : false
		isRightIconNil = rightIcon == nil ? true : false
    }
}
