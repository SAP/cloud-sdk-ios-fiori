// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct InfoView<Title: View, DescriptionText: View, ActionText: View, SecondaryActionText: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.actionTextModifier) private var actionTextModifier
	@Environment(\.secondaryActionTextModifier) private var secondaryActionTextModifier

    private let _title: Title
	private let _descriptionText: DescriptionText
	private let _actionText: ActionText
	private let _secondaryActionText: SecondaryActionText
	

    private var isModelInit: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isActionTextNil: Bool = false
	private var isSecondaryActionTextNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
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

	var isActionTextEmptyView: Bool {
        ((isModelInit && isActionTextNil) || ActionText.self == EmptyView.self) ? true : false
    }

	var isSecondaryActionTextEmptyView: Bool {
        ((isModelInit && isSecondaryActionTextNil) || SecondaryActionText.self == EmptyView.self) ? true : false
    }
}

extension InfoView where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		ActionText == _ConditionalContent<Action, EmptyView>,
		SecondaryActionText == _ConditionalContent<SecondaryAction, EmptyView> {

    public init(model: InfoViewModel) {
        self.init(title: model.title_, descriptionText: model.descriptionText_, actionText: model.actionText_, secondaryActionText: model.secondaryActionText_, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
    }

    public init(title: String, descriptionText: String? = nil, actionText: String? = nil, secondaryActionText: String? = nil, didSelectAction: (() -> Void)? = nil, didSelectSecondaryAction: (() -> Void)? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
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
		isActionTextNil = actionText == nil ? true : false
		isSecondaryActionTextNil = secondaryActionText == nil ? true : false
    }
}
