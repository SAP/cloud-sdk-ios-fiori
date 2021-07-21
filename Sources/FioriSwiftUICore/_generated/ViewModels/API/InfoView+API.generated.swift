// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct InfoView<Title: View, DescriptionText: View, ProgressIndicatorText: View, ActionText: View, SecondaryActionText: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.progressIndicatorTextModifier) private var progressIndicatorTextModifier
	@Environment(\.actionTextModifier) private var actionTextModifier
	@Environment(\.secondaryActionTextModifier) private var secondaryActionTextModifier

    let _title: Title
	let _descriptionText: DescriptionText
	let _progressIndicatorText: ProgressIndicatorText
	let _actionText: ActionText
	let _secondaryActionText: SecondaryActionText
	

    private var isModelInit: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isProgressIndicatorTextNil: Bool = false
	private var isActionTextNil: Bool = false
	private var isSecondaryActionTextNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder progressIndicatorText: @escaping () -> ProgressIndicatorText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._progressIndicatorText = progressIndicatorText()
			self._actionText = actionText()
			self._secondaryActionText = secondaryActionText()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.InfoView.title).concat(Fiori.InfoView.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.InfoView.title))
        }
    }
	@ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.InfoView.descriptionText).concat(Fiori.InfoView.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.InfoView.descriptionText))
        }
    }
	@ViewBuilder var progressIndicatorText: some View {
        if isModelInit {
            _progressIndicatorText.modifier(progressIndicatorTextModifier.concat(Fiori.InfoView.progressIndicatorText).concat(Fiori.InfoView.progressIndicatorTextCumulative))
        } else {
            _progressIndicatorText.modifier(progressIndicatorTextModifier.concat(Fiori.InfoView.progressIndicatorText))
        }
    }
	@ViewBuilder var actionText: some View {
        if isModelInit {
            _actionText.modifier(actionTextModifier.concat(Fiori.InfoView.actionText).concat(Fiori.InfoView.actionTextCumulative))
        } else {
            _actionText.modifier(actionTextModifier.concat(Fiori.InfoView.actionText))
        }
    }
	@ViewBuilder var secondaryActionText: some View {
        if isModelInit {
            _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.InfoView.secondaryActionText).concat(Fiori.InfoView.secondaryActionTextCumulative))
        } else {
            _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.InfoView.secondaryActionText))
        }
    }
    
	var isDescriptionTextEmptyView: Bool {
        ((isModelInit && isDescriptionTextNil) || DescriptionText.self == EmptyView.self) ? true : false
    }

	var isProgressIndicatorTextEmptyView: Bool {
        ((isModelInit && isProgressIndicatorTextNil) || ProgressIndicatorText.self == EmptyView.self) ? true : false
    }

	var isActionTextEmptyView: Bool {
        ((isModelInit && isActionTextNil) || ActionText.self == EmptyView.self) ? true : false
    }

	var isSecondaryActionTextEmptyView: Bool {
        ((isModelInit && isSecondaryActionTextNil) || SecondaryActionText.self == EmptyView.self) ? true : false
    }
}

extension InfoView where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		ProgressIndicatorText == _ConditionalContent<ProgressIndicator, EmptyView>,
		ActionText == _ConditionalContent<Action, EmptyView>,
		SecondaryActionText == _ConditionalContent<SecondaryAction, EmptyView> {

    public init(model: InfoViewModel) {
        self.init(title: model.title_, descriptionText: model.descriptionText_, progressIndicatorText: model.progressIndicatorText_, actionText: model.actionText_, secondaryActionText: model.secondaryActionText_, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
    }

    public init(title: String, descriptionText: String? = nil, progressIndicatorText: String? = nil, actionText: String? = nil, secondaryActionText: String? = nil, didSelectAction: (() -> Void)? = nil, didSelectSecondaryAction: (() -> Void)? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		// handle ProgressIndicatorModel
        if (progressIndicatorText != nil) {
            self._progressIndicatorText = ViewBuilder.buildEither(first: ProgressIndicator(progressIndicatorText: progressIndicatorText))
        } else {
            self._progressIndicatorText = ViewBuilder.buildEither(second: EmptyView())
        }
		// handle ActionModel
        if (actionText != nil) {
            self._actionText = ViewBuilder.buildEither(first: Action(actionText: actionText,didSelectAction: didSelectAction))
        } else {
            self._actionText = ViewBuilder.buildEither(second: EmptyView())
        }
		// handle SecondaryActionModel
        if (secondaryActionText != nil) {
            self._secondaryActionText = ViewBuilder.buildEither(first: SecondaryAction(secondaryActionText: secondaryActionText,didSelectSecondaryAction: didSelectSecondaryAction))
        } else {
            self._secondaryActionText = ViewBuilder.buildEither(second: EmptyView())
        }

		isModelInit = true
		isDescriptionTextNil = descriptionText == nil ? true : false
		isProgressIndicatorTextNil = progressIndicatorText == nil ? true : false
		isActionTextNil = actionText == nil ? true : false
		isSecondaryActionTextNil = secondaryActionText == nil ? true : false
    }
}
