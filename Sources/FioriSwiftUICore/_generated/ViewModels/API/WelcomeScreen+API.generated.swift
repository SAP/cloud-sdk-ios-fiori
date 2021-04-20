// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct WelcomeScreen<Title: View, DescriptionText: View, TextFilled: View, ActionText: View, Subtitle: View, Footnote: View, SecondaryActionText: View, Icon: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.textFilledModifier) private var textFilledModifier
	@Environment(\.actionTextModifier) private var actionTextModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.secondaryActionTextModifier) private var secondaryActionTextModifier
	@Environment(\.iconModifier) private var iconModifier
	@Environment(\.horizontalSizeClass) var horizontalSizeClass

    let _title: Title
	let _descriptionText: DescriptionText
	let _textFilled: TextFilled
	let _actionText: ActionText
	let _subtitle: Subtitle
	let _footnote: Footnote
	let _secondaryActionText: SecondaryActionText
	let _icon: Icon
	

    private var isModelInit: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isTextFilledNil: Bool = false
	private var isActionTextNil: Bool = false
	private var isSubtitleNil: Bool = false
	private var isFootnoteNil: Bool = false
	private var isSecondaryActionTextNil: Bool = false
	private var isIconNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._textFilled = textFilled()
			self._actionText = actionText()
			self._subtitle = subtitle()
			self._footnote = footnote()
			self._secondaryActionText = secondaryActionText()
			self._icon = icon()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.WelcomeScreen.title).concat(Fiori.WelcomeScreen.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.WelcomeScreen.title))
        }
    }
	@ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.WelcomeScreen.descriptionText).concat(Fiori.WelcomeScreen.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.WelcomeScreen.descriptionText))
        }
    }
	@ViewBuilder var textFilled: some View {
        if isModelInit {
            _textFilled.modifier(textFilledModifier.concat(Fiori.WelcomeScreen.textFilled).concat(Fiori.WelcomeScreen.textFilledCumulative))
        } else {
            _textFilled.modifier(textFilledModifier.concat(Fiori.WelcomeScreen.textFilled))
        }
    }
	@ViewBuilder var actionText: some View {
        if isModelInit {
            _actionText.modifier(actionTextModifier.concat(Fiori.WelcomeScreen.actionText).concat(Fiori.WelcomeScreen.actionTextCumulative))
        } else {
            _actionText.modifier(actionTextModifier.concat(Fiori.WelcomeScreen.actionText))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.WelcomeScreen.subtitle).concat(Fiori.WelcomeScreen.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.WelcomeScreen.subtitle))
        }
    }
	@ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori.WelcomeScreen.footnote).concat(Fiori.WelcomeScreen.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori.WelcomeScreen.footnote))
        }
    }
	@ViewBuilder var secondaryActionText: some View {
        if isModelInit {
            _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.WelcomeScreen.secondaryActionText).concat(Fiori.WelcomeScreen.secondaryActionTextCumulative))
        } else {
            _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.WelcomeScreen.secondaryActionText))
        }
    }
	@ViewBuilder var icon: some View {
        if isModelInit {
            _icon.modifier(iconModifier.concat(Fiori.WelcomeScreen.icon).concat(Fiori.WelcomeScreen.iconCumulative))
        } else {
            _icon.modifier(iconModifier.concat(Fiori.WelcomeScreen.icon))
        }
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

	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }

	var isFootnoteEmptyView: Bool {
        ((isModelInit && isFootnoteNil) || Footnote.self == EmptyView.self) ? true : false
    }

	var isSecondaryActionTextEmptyView: Bool {
        ((isModelInit && isSecondaryActionTextNil) || SecondaryActionText.self == EmptyView.self) ? true : false
    }

	var isIconEmptyView: Bool {
        ((isModelInit && isIconNil) || Icon.self == EmptyView.self) ? true : false
    }
}

extension WelcomeScreen where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		TextFilled == _ConditionalContent<TextInput, EmptyView>,
		ActionText == _ConditionalContent<Action, EmptyView>,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		SecondaryActionText == _ConditionalContent<SecondaryAction, EmptyView>,
		Icon == _ConditionalContent<Image, EmptyView> {

    public init(model: WelcomeScreenModel) {
        self.init(title: model.title_, descriptionText: model.descriptionText_, textFilled: model.textFilled_, actionText: model.actionText_, subtitle: model.subtitle_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, icon: model.icon_, onCommit: model.onCommit, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
    }

    public init(title: String, descriptionText: String? = nil, textFilled: Binding<String>? = nil, actionText: String? = nil, subtitle: String? = nil, footnote: String? = nil, secondaryActionText: String? = nil, icon: Image? = nil, onCommit: (() -> Void)? = nil, didSelectAction: (() -> Void)? = nil, didSelectSecondaryAction: (() -> Void)? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		self._icon = icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView())
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
		isSubtitleNil = subtitle == nil ? true : false
		isFootnoteNil = footnote == nil ? true : false
		isSecondaryActionTextNil = secondaryActionText == nil ? true : false
		isIconNil = icon == nil ? true : false
    }
}
