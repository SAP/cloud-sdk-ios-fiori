// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _InfoView<Title: View, DescriptionText: View, ActionView: View, SecondaryActionView: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.actionModifier) private var actionModifier
	@Environment(\.secondaryActionModifier) private var secondaryActionModifier

    let _title: Title
	let _descriptionText: DescriptionText
	let _showLoadingIndicator: Bool?
	let _loadingIndicatorText: String?
	let _action: ActionView
	let _secondaryAction: SecondaryActionView
	

    private var isModelInit: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isShowLoadingIndicatorNil: Bool = false
	private var isLoadingIndicatorTextNil: Bool = false
	private var isActionNil: Bool = false
	private var isSecondaryActionNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		showLoadingIndicator: Bool? = nil,
		loadingIndicatorText: String? = nil,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._showLoadingIndicator = showLoadingIndicator
			self._loadingIndicatorText = loadingIndicatorText
			self._action = action()
			self._secondaryAction = secondaryAction()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori._InfoView.title).concat(Fiori._InfoView.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori._InfoView.title))
        }
    }
	@ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori._InfoView.descriptionText).concat(Fiori._InfoView.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori._InfoView.descriptionText))
        }
    }
	@ViewBuilder var action: some View {
        if isModelInit {
            _action.modifier(actionModifier.concat(Fiori._InfoView.action).concat(Fiori._InfoView.actionCumulative))
        } else {
            _action.modifier(actionModifier.concat(Fiori._InfoView.action))
        }
    }
	@ViewBuilder var secondaryAction: some View {
        if isModelInit {
            _secondaryAction.modifier(secondaryActionModifier.concat(Fiori._InfoView.secondaryAction).concat(Fiori._InfoView.secondaryActionCumulative))
        } else {
            _secondaryAction.modifier(secondaryActionModifier.concat(Fiori._InfoView.secondaryAction))
        }
    }
    
	var isDescriptionTextEmptyView: Bool {
        ((isModelInit && isDescriptionTextNil) || DescriptionText.self == EmptyView.self) ? true : false
    }

	var isActionEmptyView: Bool {
        ((isModelInit && isActionNil) || ActionView.self == EmptyView.self) ? true : false
    }

	var isSecondaryActionEmptyView: Bool {
        ((isModelInit && isSecondaryActionNil) || SecondaryActionView.self == EmptyView.self) ? true : false
    }
}

extension _InfoView where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		ActionView == _ConditionalContent<_Action, EmptyView>,
		SecondaryActionView == _ConditionalContent<_Action, EmptyView> {

    public init(model: _InfoViewModel) {
        self.init(title: model.title, descriptionText: model.descriptionText, showLoadingIndicator: model.showLoadingIndicator, loadingIndicatorText: model.loadingIndicatorText, action: model.action != nil ? _Action(model: model.action!) : nil, secondaryAction: model.secondaryAction != nil ? _Action(model: model.secondaryAction!) : nil)
    }

    public init(title: String, descriptionText: String? = nil, showLoadingIndicator: Bool? = nil, loadingIndicatorText: String? = nil, action: _Action? = nil, secondaryAction: _Action? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._showLoadingIndicator = showLoadingIndicator
		self._loadingIndicatorText = loadingIndicatorText
		self._action = action != nil ? ViewBuilder.buildEither(first: action!) : ViewBuilder.buildEither(second: EmptyView())
		self._secondaryAction = secondaryAction != nil ? ViewBuilder.buildEither(first: secondaryAction!) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isDescriptionTextNil = descriptionText == nil ? true : false
		isShowLoadingIndicatorNil = showLoadingIndicator == nil ? true : false
		isLoadingIndicatorTextNil = loadingIndicatorText == nil ? true : false
		isActionNil = action == nil ? true : false
		isSecondaryActionNil = secondaryAction == nil ? true : false
    }
}
