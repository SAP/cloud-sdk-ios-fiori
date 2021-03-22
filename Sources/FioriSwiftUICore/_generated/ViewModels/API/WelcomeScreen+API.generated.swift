// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct WelcomeScreen<Title: View, DescriptionText: View, PrimaryActionLabel: View, Subtitle: View, Footnote: View, SecondaryActionLabel: View, Icon: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.iconModifier) private var iconModifier
	@Environment(\.horizontalSizeClass) var horizontalSizeClass

    private let _title: Title
	private let _descriptionText: DescriptionText
	private let _primaryActionLabel: PrimaryActionLabel
	private let _subtitle: Subtitle
	private let _footnote: Footnote
	private let _secondaryActionLabel: SecondaryActionLabel
	private let _icon: Icon
	

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._primaryActionLabel = primaryActionLabel()
			self._subtitle = subtitle()
			self._footnote = footnote()
			self._secondaryActionLabel = secondaryActionLabel()
			self._icon = icon()
    }

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.WelcomeScreen.title))
    }
	var descriptionText: some View {
        _descriptionText.modifier(descriptionTextModifier.concat(Fiori.WelcomeScreen.descriptionText))
    }
	var primaryActionLabel: some View {
        _primaryActionLabel
    }
	var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.WelcomeScreen.subtitle))
    }
	var footnote: some View {
        _footnote.modifier(footnoteModifier.concat(Fiori.WelcomeScreen.footnote))
    }
	var secondaryActionLabel: some View {
        _secondaryActionLabel
    }
	var icon: some View {
        _icon.modifier(iconModifier.concat(Fiori.WelcomeScreen.icon))
    }
    
}

extension WelcomeScreen where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		PrimaryActionLabel == _ConditionalContent<PrimaryAction, EmptyView>,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		SecondaryActionLabel == _ConditionalContent<SecondaryAction, EmptyView>,
		Icon == _ConditionalContent<Image, EmptyView> {

    public init(model: WelcomeScreenModel) {
        self.init(title: model.title_, descriptionText: model.descriptionText_, primaryActionLabel: model.primaryActionLabel_, subtitle: model.subtitle_, footnote: model.footnote_, secondaryActionLabel: model.secondaryActionLabel_, icon: model.icon_, didSelectPrimaryActionClosure: model.didSelectPrimaryAction, didSelectSecondaryActionClosure: model.didSelectSecondaryAction)
    }

    public init(title: String, descriptionText: String? = nil, primaryActionLabel: String? = nil, subtitle: String? = nil, footnote: String? = nil, secondaryActionLabel: String? = nil, icon: Image? = nil, didSelectPrimaryActionClosure: (() -> Void)? = nil, didSelectSecondaryActionClosure: (() -> Void)? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		self._icon = icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView())
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
