// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ActivationScreen<Title: View, DescriptionText: View, TextFilled: View, PrimaryActionText: View, Footnote: View, SecondaryActionText: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.textFilledModifier) private var textFilledModifier
	@Environment(\.primaryActionTextModifier) private var primaryActionTextModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.secondaryActionTextModifier) private var secondaryActionTextModifier

    private let _title: Title
	private let _descriptionText: DescriptionText
	private let _textFilled: TextFilled
	private let _primaryActionText: PrimaryActionText
	private let _footnote: Footnote
	private let _secondaryActionText: SecondaryActionText
	@State var buttonEnabled: Bool = false
	@ObservedObject var emailFilled = UserInput()

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._textFilled = textFilled()
			self._primaryActionText = primaryActionText()
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
	var primaryActionText: some View {
        _primaryActionText.modifier(primaryActionTextModifier.concat(Fiori.ActivationScreen.primaryActionText))
    }
	var footnote: some View {
        _footnote.modifier(footnoteModifier.concat(Fiori.ActivationScreen.footnote))
    }
	var secondaryActionText: some View {
        _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.ActivationScreen.secondaryActionText))
    }
    
}

extension ActivationScreen where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		TextFilled == _ConditionalContent<TextInput, EmptyView>,
		PrimaryActionText == _ConditionalContent<PrimaryAction, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		SecondaryActionText == _ConditionalContent<SecondaryAction, EmptyView> {

    public init(model: ActivationScreenModel) {
        self.init(title: model.title_, descriptionText: model.descriptionText_, textFilled: model.textFilled_, primaryActionText: model.primaryActionText_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, onCommitClosure: model.onCommit, didSelectPrimaryActionClosure: model.didSelectPrimaryAction, didSelectSecondaryActionClosure: model.didSelectSecondaryAction)
    }

    public init(title: String, descriptionText: String? = nil, textFilled: String? = nil, primaryActionText: String? = nil, footnote: String? = nil, secondaryActionText: String? = nil, onCommitClosure: (() -> Void)? = nil, didSelectPrimaryActionClosure: (() -> Void)? = nil, didSelectSecondaryActionClosure: (() -> Void)? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		// handle TextInputModel
        if (textFilled != nil || onCommitClosure != nil) {
            self._textFilled =  ViewBuilder.buildEither(first: TextInput(textFilled: textFilled,onCommitClosure: onCommitClosure))
        } else {
            self._textFilled = ViewBuilder.buildEither(second: EmptyView())
        }
		// handle PrimaryActionModel
        if (primaryActionText != nil || didSelectPrimaryActionClosure != nil) {
            self._primaryActionText =  ViewBuilder.buildEither(first: PrimaryAction(primaryActionText: primaryActionText,didSelectPrimaryActionClosure: didSelectPrimaryActionClosure))
        } else {
            self._primaryActionText = ViewBuilder.buildEither(second: EmptyView())
        }
		// handle SecondaryActionModel
        if (secondaryActionText != nil || didSelectSecondaryActionClosure != nil) {
            self._secondaryActionText =  ViewBuilder.buildEither(first: SecondaryAction(secondaryActionText: secondaryActionText,didSelectSecondaryActionClosure: didSelectSecondaryActionClosure))
        } else {
            self._secondaryActionText = ViewBuilder.buildEither(second: EmptyView())
        }
    }
}
