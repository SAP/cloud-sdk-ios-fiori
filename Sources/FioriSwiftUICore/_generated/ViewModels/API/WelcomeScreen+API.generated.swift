// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct WelcomeScreen<Title: View, DescriptionText: View, PrimaryButton: View, Subtitle: View, Footnote: View, ActionTitle: View, Icon: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.actionTitleModifier) private var actionTitleModifier
	@Environment(\.iconModifier) private var iconModifier
	@Environment(\.horizontalSizeClass) var horizontalSizeClass

    private let _title: Title
	private let _descriptionText: DescriptionText
	private let _primaryButton: PrimaryButton
	private let _subtitle: Subtitle
	private let _footnote: Footnote
	private let _actionTitle: ActionTitle
	private let _icon: Icon
	

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._primaryButton = primaryButton()
			self._subtitle = subtitle()
			self._footnote = footnote()
			self._actionTitle = actionTitle()
			self._icon = icon()
    }

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.WelcomeScreen.title))
    }
	var descriptionText: some View {
        _descriptionText.modifier(descriptionTextModifier.concat(Fiori.WelcomeScreen.descriptionText))
    }
	var primaryButton: some View {
        _primaryButton
    }
	var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.WelcomeScreen.subtitle))
    }
	var footnote: some View {
        _footnote.modifier(footnoteModifier.concat(Fiori.WelcomeScreen.footnote))
    }
	var actionTitle: some View {
        _actionTitle.modifier(actionTitleModifier.concat(Fiori.WelcomeScreen.actionTitle))
    }
	var icon: some View {
        _icon.modifier(iconModifier.concat(Fiori.WelcomeScreen.icon))
    }
    
}

extension WelcomeScreen where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		PrimaryButton == _ConditionalContent<WelcomeScreenButton, EmptyView>,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		ActionTitle == _ConditionalContent<Text, EmptyView>,
		Icon == _ConditionalContent<Image, EmptyView> {

    public init(model: WelcomeScreenModel) {
        self.init(title: model.title_, descriptionText: model.descriptionText_, primaryButton: model.primaryButton_, subtitle: model.subtitle_, footnote: model.footnote_, actionTitle: model.actionTitle_, icon: model.icon_, clickActionClosure: model.clickAction)
    }

    public init(title: String, descriptionText: String? = nil, primaryButton: String? = nil, subtitle: String? = nil, footnote: String? = nil, actionTitle: String? = nil, icon: Image? = nil, clickActionClosure: (() -> Void)? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		self._actionTitle = actionTitle != nil ? ViewBuilder.buildEither(first: Text(actionTitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._icon = icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView())
		// handle WelcomeScreenButtonModel
        if (primaryButton != nil || clickActionClosure != nil) {
            self._primaryButton =  ViewBuilder.buildEither(first: WelcomeScreenButton(primaryButton: primaryButton,clickActionClosure: clickActionClosure))
        } else {
            self._primaryButton = ViewBuilder.buildEither(second: EmptyView())
        }
    }
}
