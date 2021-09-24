// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct UserConsentPage<Title: View, BodyAttributedText: View, ActionView: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.bodyAttributedTextModifier) private var bodyAttributedTextModifier
	@Environment(\.actionModifier) private var actionModifier

    let _title: Title
	let _bodyAttributedText: BodyAttributedText
	let _action: ActionView
	

    private var isModelInit: Bool = false
	private var isBodyAttributedTextNil: Bool = false
	private var isActionNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder bodyAttributedText: () -> BodyAttributedText,
		@ViewBuilder action: () -> ActionView
        ) {
            self._title = title()
			self._bodyAttributedText = bodyAttributedText()
			self._action = action()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.UserConsentPage.title).concat(Fiori.UserConsentPage.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.UserConsentPage.title))
        }
    }
	@ViewBuilder var bodyAttributedText: some View {
        if isModelInit {
            _bodyAttributedText.modifier(bodyAttributedTextModifier.concat(Fiori.UserConsentPage.bodyAttributedText).concat(Fiori.UserConsentPage.bodyAttributedTextCumulative))
        } else {
            _bodyAttributedText.modifier(bodyAttributedTextModifier.concat(Fiori.UserConsentPage.bodyAttributedText))
        }
    }
	@ViewBuilder var action: some View {
        if isModelInit {
            _action.modifier(actionModifier.concat(Fiori.UserConsentPage.action).concat(Fiori.UserConsentPage.actionCumulative))
        } else {
            _action.modifier(actionModifier.concat(Fiori.UserConsentPage.action))
        }
    }
    
	var isBodyAttributedTextEmptyView: Bool {
        ((isModelInit && isBodyAttributedTextNil) || BodyAttributedText.self == EmptyView.self) ? true : false
    }

	var isActionEmptyView: Bool {
        ((isModelInit && isActionNil) || ActionView.self == EmptyView.self) ? true : false
    }
}

extension UserConsentPage where Title == Text,
		BodyAttributedText == _ConditionalContent<AttributedText, EmptyView>,
		ActionView == _ConditionalContent<Action, EmptyView> {

    public init(model: UserConsentPageModel) {
        self.init(title: model.title, bodyAttributedText: model.bodyAttributedText, action: model.action != nil ? Action(model: model.action!) : nil)
    }

    public init(title: String, bodyAttributedText: NSAttributedString? = nil, action: Action? = nil) {
        self._title = Text(title)
		self._bodyAttributedText = bodyAttributedText != nil ? ViewBuilder.buildEither(first: AttributedText(bodyAttributedText: bodyAttributedText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._action = action != nil ? ViewBuilder.buildEither(first: action!) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isBodyAttributedTextNil = bodyAttributedText == nil ? true : false
		isActionNil = action == nil ? true : false
    }
}
