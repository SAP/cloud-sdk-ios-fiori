// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ActivationScreen<Title: View, DescriptionText: View, Subtitle: View, PrimaryActionLabel: View, Footnote: View, SecondaryActionLabel: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier

    private let _title: Title
	private let _descriptionText: DescriptionText
	private let _subtitle: Subtitle
	private let _primaryActionLabel: PrimaryActionLabel
	private let _footnote: Footnote
	private let _secondaryActionLabel: SecondaryActionLabel
	@State var buttonEnabled: Bool = false
	@State var emailFilled: String = ""

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._subtitle = subtitle()
			self._primaryActionLabel = primaryActionLabel()
			self._footnote = footnote()
			self._secondaryActionLabel = secondaryActionLabel()
    }

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.ActivationScreen.title))
    }
	var descriptionText: some View {
        _descriptionText.modifier(descriptionTextModifier.concat(Fiori.ActivationScreen.descriptionText))
    }
	var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.ActivationScreen.subtitle))
    }
	var primaryActionLabel: some View {
        _primaryActionLabel
    }
	var footnote: some View {
        _footnote.modifier(footnoteModifier.concat(Fiori.ActivationScreen.footnote))
    }
	var secondaryActionLabel: some View {
        _secondaryActionLabel
    }
    
}

extension ActivationScreen where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		PrimaryActionLabel == _ConditionalContent<PrimaryAction, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		SecondaryActionLabel == _ConditionalContent<SecondaryAction, EmptyView> {

    public init(model: ActivationScreenModel) {
        self.init(title: model.title_, descriptionText: model.descriptionText_, subtitle: model.subtitle_, primaryActionLabel: model.primaryActionLabel_, footnote: model.footnote_, secondaryActionLabel: model.secondaryActionLabel_, didSelectPrimaryActionClosure: model.didSelectPrimaryAction, didSelectSecondaryActionClosure: model.didSelectSecondaryAction)
    }

    public init(title: String, descriptionText: String? = nil, subtitle: String? = nil, primaryActionLabel: String? = nil, footnote: String? = nil, secondaryActionLabel: String? = nil, didSelectPrimaryActionClosure: (() -> Void)? = nil, didSelectSecondaryActionClosure: (() -> Void)? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		// handle PrimaryActionModel
        if (primaryActionLabel != nil || didSelectPrimaryActionClosure != nil) {
            self._primaryActionLabel =  ViewBuilder.buildEither(first: PrimaryAction(primaryActionLabel: primaryActionLabel,didSelectPrimaryActionClosure: didSelectPrimaryActionClosure))
        } else {
            self._primaryActionLabel = ViewBuilder.buildEither(second: EmptyView())
        }
		// handle SecondaryActionModel
        if (secondaryActionLabel != nil || didSelectSecondaryActionClosure != nil) {
            self._secondaryActionLabel =  ViewBuilder.buildEither(first: SecondaryAction(secondaryActionLabel: secondaryActionLabel,didSelectSecondaryActionClosure: didSelectSecondaryActionClosure))
        } else {
            self._secondaryActionLabel = ViewBuilder.buildEither(second: EmptyView())
        }
    }
}
