// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ActivationScreen<Title: View, DescriptionText: View, TextInputValue: View, ActionText: View, Footnote: View, SecondaryActionText: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.textInputValueModifier) private var textInputValueModifier
	@Environment(\.actionTextModifier) private var actionTextModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.secondaryActionTextModifier) private var secondaryActionTextModifier

    let _title: Title
	let _descriptionText: DescriptionText
	let _textInputValue: TextInputValue
	let _actionText: ActionText
	let _footnote: Footnote
	let _secondaryActionText: SecondaryActionText
	

    private var isModelInit: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isActionTextNil: Bool = false
	private var isFootnoteNil: Bool = false
	private var isSecondaryActionTextNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._textInputValue = textInputValue()
			self._actionText = actionText()
			self._footnote = footnote()
			self._secondaryActionText = secondaryActionText()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.ActivationScreen.title).concat(Fiori.ActivationScreen.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.ActivationScreen.title))
        }
    }
	@ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ActivationScreen.descriptionText).concat(Fiori.ActivationScreen.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ActivationScreen.descriptionText))
        }
    }
	@ViewBuilder var textInputValue: some View {
        if isModelInit {
            _textInputValue.modifier(textInputValueModifier.concat(Fiori.ActivationScreen.textInputValue).concat(Fiori.ActivationScreen.textInputValueCumulative))
        } else {
            _textInputValue.modifier(textInputValueModifier.concat(Fiori.ActivationScreen.textInputValue))
        }
    }
	@ViewBuilder var actionText: some View {
        if isModelInit {
            _actionText.modifier(actionTextModifier.concat(Fiori.ActivationScreen.actionText).concat(Fiori.ActivationScreen.actionTextCumulative))
        } else {
            _actionText.modifier(actionTextModifier.concat(Fiori.ActivationScreen.actionText))
        }
    }
	@ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori.ActivationScreen.footnote).concat(Fiori.ActivationScreen.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori.ActivationScreen.footnote))
        }
    }
	@ViewBuilder var secondaryActionText: some View {
        if isModelInit {
            _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.ActivationScreen.secondaryActionText).concat(Fiori.ActivationScreen.secondaryActionTextCumulative))
        } else {
            _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.ActivationScreen.secondaryActionText))
        }
    }
    
	var isDescriptionTextEmptyView: Bool {
        ((isModelInit && isDescriptionTextNil) || DescriptionText.self == EmptyView.self) ? true : false
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
		TextInputValue == _ConditionalContent<TextInput, EmptyView>,
		ActionText == _ConditionalContent<Action, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		SecondaryActionText == _ConditionalContent<SecondaryAction, EmptyView> {

    public init<Model>(model: Model) where Model: ActivationScreenModel {
        self.init(title: model.title_, descriptionText: model.descriptionText_, textInputValue: Binding<String>(get: { model.textInputValue_ }, set: { model.textInputValue_ = $0 }), actionText: model.actionText_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, onCommit: model.onCommit, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
    }

    public init(title: String, descriptionText: String? = nil, textInputValue: Binding<String>? = nil, actionText: String? = nil, footnote: String? = nil, secondaryActionText: String? = nil, onCommit: (() -> Void)? = nil, didSelectAction: (() -> Void)? = nil, didSelectSecondaryAction: (() -> Void)? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		// handle TextInputModel
        if (textInputValue != nil) {
            self._textInputValue = ViewBuilder.buildEither(first: TextInput(textInputValue: textInputValue,onCommit: onCommit))
        } else {
            self._textInputValue = ViewBuilder.buildEither(second: EmptyView())
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
		isActionTextNil = actionText == nil ? true : false
		isFootnoteNil = footnote == nil ? true : false
		isSecondaryActionTextNil = secondaryActionText == nil ? true : false
    }
}
