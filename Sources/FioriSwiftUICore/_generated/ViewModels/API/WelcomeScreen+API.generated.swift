// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct WelcomeScreen<Title: View, DescriptionText: View, PrimaryActionText: View, Subtitle: View, Footnote: View, SecondaryActionText: View, Icon: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.primaryActionTextModifier) private var primaryActionTextModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.secondaryActionTextModifier) private var secondaryActionTextModifier
	@Environment(\.iconModifier) private var iconModifier
	@Environment(\.horizontalSizeClass) var horizontalSizeClass

    private let _title: Title
	private let _descriptionText: DescriptionText
	private let _primaryActionText: PrimaryActionText
	private let _subtitle: Subtitle
	private let _footnote: Footnote
	private let _secondaryActionText: SecondaryActionText
	private let _icon: Icon
	

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._primaryActionText = primaryActionText()
			self._subtitle = subtitle()
			self._footnote = footnote()
			self._secondaryActionText = secondaryActionText()
			self._icon = icon()
    }

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.WelcomeScreen.title))
    }
	var descriptionText: some View {
        _descriptionText.modifier(descriptionTextModifier.concat(Fiori.WelcomeScreen.descriptionText))
    }
	var primaryActionText: some View {
        _primaryActionText.modifier(primaryActionTextModifier.concat(Fiori.WelcomeScreen.primaryActionText))
    }
	var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.WelcomeScreen.subtitle))
    }
	var footnote: some View {
        _footnote.modifier(footnoteModifier.concat(Fiori.WelcomeScreen.footnote))
    }
	var secondaryActionText: some View {
        _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.WelcomeScreen.secondaryActionText))
    }
	var icon: some View {
        _icon.modifier(iconModifier.concat(Fiori.WelcomeScreen.icon))
    }
    
}

extension WelcomeScreen where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		PrimaryActionText == _ConditionalContent<PrimaryAction, EmptyView>,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		SecondaryActionText == _ConditionalContent<SecondaryAction, EmptyView>,
		Icon == _ConditionalContent<Image, EmptyView> {

    public init(model: WelcomeScreenModel) {
        self.init(title: model.title_, descriptionText: model.descriptionText_, primaryActionText: model.primaryActionText_, subtitle: model.subtitle_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, icon: model.icon_, didSelectPrimaryActionClosure: model.didSelectPrimaryAction, didSelectSecondaryActionClosure: model.didSelectSecondaryAction)
    }

    public init(title: String, descriptionText: String? = nil, primaryActionText: String? = nil, subtitle: String? = nil, footnote: String? = nil, secondaryActionText: String? = nil, icon: Image? = nil, didSelectPrimaryActionClosure: (() -> Void)? = nil, didSelectSecondaryActionClosure: (() -> Void)? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		self._icon = icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView())
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
