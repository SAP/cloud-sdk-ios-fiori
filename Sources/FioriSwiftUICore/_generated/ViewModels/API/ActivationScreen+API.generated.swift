// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ActivationScreen<Title: View, DescriptionText: View, TextFilled: View, ActionText: View, Footnote: View, SecondaryActionText: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.textFilledModifier) private var textFilledModifier
	@Environment(\.actionTextModifier) private var actionTextModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.secondaryActionTextModifier) private var secondaryActionTextModifier

    private let _title: Title
	private let _descriptionText: DescriptionText
	private let _textFilled: TextFilled
	private let _actionText: ActionText
	private let _footnote: Footnote
	private let _secondaryActionText: SecondaryActionText
	@State var buttonEnabled: Bool = false
	@ObservedObject var emailFilled = UserInput()

    private var isModelInit: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isTextFilledNil: Bool = false
	private var isActionTextNil: Bool = false
	private var isFootnoteNil: Bool = false
	private var isSecondaryActionTextNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._textFilled = textFilled()
			self._actionText = actionText()
			self._footnote = footnote()
			self._secondaryActionText = secondaryActionText()
    }

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.ActivationScreen.title))
    }
	var descriptionText: some View {
        _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ActivationScreen.descriptionText))
    }
	var textFilled: some View {
        _textFilled.modifier(textFilledModifier.concat(Fiori.ActivationScreen.textFilled))
    }
	var actionText: some View {
        _actionText.modifier(actionTextModifier.concat(Fiori.ActivationScreen.actionText))
    }
	var footnote: some View {
        _footnote.modifier(footnoteModifier.concat(Fiori.ActivationScreen.footnote))
    }
	var secondaryActionText: some View {
        _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.ActivationScreen.secondaryActionText))
    }
    
	var isDescriptionTextEmptyView: Bool {
        ((isModelInit && isDescriptionTextNil) || DescriptionText.self == EmptyView.self) ? true : false
    }

	var isTextFilledEmptyView: Bool {
        ((isModelInit && isTextFilledNil) || TextFilled.self == EmptyView.self) ? true : false
    }

	var isActionTextEmptyView: Bool {
        ((isModelInit && isActionTextNil) || ActionText.self == EmptyView.self) ? true : false
    }

	var isFootnoteEmptyView: Bool {
        ((isModelInit && isFootnoteNil) || Footnote.self == EmptyView.self) ? true : false
    }

	var isSecondaryActionTextEmptyView: Bool {
        ((isModelInit && isSecondaryActionTextNil) || SecondaryActionText.self == EmptyView.self) ? true : false
    }
}

extension ActivationScreen where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		TextFilled == _ConditionalContent<TextInput, EmptyView>,
		ActionText == _ConditionalContent<Action, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		SecondaryActionText == _ConditionalContent<SecondaryAction, EmptyView> {

    public init(model: ActivationScreenModel) {
        self.init(title: model.title_, descriptionText: model.descriptionText_, textFilled: model.textFilled_, actionText: model.actionText_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, onCommit: model.onCommit, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
    }

    public init(title: String, descriptionText: String? = nil, textFilled: String? = nil, actionText: String? = nil, footnote: String? = nil, secondaryActionText: String? = nil, onCommit: (() -> Void)? = nil, didSelectAction: (() -> Void)? = nil, didSelectSecondaryAction: (() -> Void)? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		// handle TextInputModel
        if (textFilled != nil || onCommit != nil) {
            self._textFilled =  ViewBuilder.buildEither(first: TextInput(textFilled: textFilled,onCommit: onCommit))
        } else {
            self._textFilled = ViewBuilder.buildEither(second: EmptyView())
        }
		// handle ActionModel
        if (actionText != nil || didSelectAction != nil) {
            self._actionText =  ViewBuilder.buildEither(first: Action(actionText: actionText,didSelectAction: didSelectAction))
        } else {
            self._actionText = ViewBuilder.buildEither(second: EmptyView())
        }
		// handle SecondaryActionModel
        if (secondaryActionText != nil || didSelectSecondaryAction != nil) {
            self._secondaryActionText =  ViewBuilder.buildEither(first: SecondaryAction(secondaryActionText: secondaryActionText,didSelectSecondaryAction: didSelectSecondaryAction))
        } else {
            self._secondaryActionText = ViewBuilder.buildEither(second: EmptyView())
        }

		isModelInit = true
		isDescriptionTextNil = descriptionText == nil ? true : false
		isTextFilledNil = textFilled == nil ? true : false
		isActionTextNil = actionText == nil ? true : false
		isFootnoteNil = footnote == nil ? true : false
		isSecondaryActionTextNil = secondaryActionText == nil ? true : false
    }
}
