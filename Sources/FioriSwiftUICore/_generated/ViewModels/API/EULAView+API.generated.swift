// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct EULAView<Title: View, BodyAttributedText: View, ActionView: View, SecondaryActionView: View, CancelActionView: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.bodyAttributedTextModifier) private var bodyAttributedTextModifier
	@Environment(\.actionModifier) private var actionModifier
	@Environment(\.secondaryActionModifier) private var secondaryActionModifier
	@Environment(\.cancelActionModifier) private var cancelActionModifier
	@Environment(\.presentationMode) var presentationMode

    let _title: Title
	let _bodyAttributedText: BodyAttributedText
	let _action: ActionView
	let _secondaryAction: SecondaryActionView
	let _cancelAction: CancelActionView
	let _didAgree: (() -> Void)?
	let _didDisagree: (() -> Void)?
	let _didCancel: (() -> Void)?
	@State var contentHeight: CGFloat = .zero

    private var isModelInit: Bool = false
	private var isBodyAttributedTextNil: Bool = false
	private var isActionNil: Bool = false
	private var isSecondaryActionNil: Bool = false
	private var isCancelActionNil: Bool = false
	private var isDidAgreeNil: Bool = false
	private var isDidDisagreeNil: Bool = false
	private var isDidCancelNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder bodyAttributedText: () -> BodyAttributedText,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
        ) {
            self._title = title()
			self._bodyAttributedText = bodyAttributedText()
			self._action = action()
			self._secondaryAction = secondaryAction()
			self._cancelAction = cancelAction()
			self._didAgree = didAgree
			self._didDisagree = didDisagree
			self._didCancel = didCancel
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.EULAView.title).concat(Fiori.EULAView.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.EULAView.title))
        }
    }
	@ViewBuilder var bodyAttributedText: some View {
        if isModelInit {
            _bodyAttributedText.modifier(bodyAttributedTextModifier.concat(Fiori.EULAView.bodyAttributedText).concat(Fiori.EULAView.bodyAttributedTextCumulative))
        } else {
            _bodyAttributedText.modifier(bodyAttributedTextModifier.concat(Fiori.EULAView.bodyAttributedText))
        }
    }
	@ViewBuilder var action: some View {
        if isModelInit {
            _action.modifier(actionModifier.concat(Fiori.EULAView.action).concat(Fiori.EULAView.actionCumulative))
        } else {
            _action.modifier(actionModifier.concat(Fiori.EULAView.action))
        }
    }
	@ViewBuilder var secondaryAction: some View {
        if isModelInit {
            _secondaryAction.modifier(secondaryActionModifier.concat(Fiori.EULAView.secondaryAction).concat(Fiori.EULAView.secondaryActionCumulative))
        } else {
            _secondaryAction.modifier(secondaryActionModifier.concat(Fiori.EULAView.secondaryAction))
        }
    }
	@ViewBuilder var cancelAction: some View {
        if isModelInit {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.EULAView.cancelAction).concat(Fiori.EULAView.cancelActionCumulative))
        } else {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.EULAView.cancelAction))
        }
    }
    
	var isBodyAttributedTextEmptyView: Bool {
        ((isModelInit && isBodyAttributedTextNil) || BodyAttributedText.self == EmptyView.self) ? true : false
    }

	var isActionEmptyView: Bool {
        ((isModelInit && isActionNil) || ActionView.self == EmptyView.self) ? true : false
    }

	var isSecondaryActionEmptyView: Bool {
        ((isModelInit && isSecondaryActionNil) || SecondaryActionView.self == EmptyView.self) ? true : false
    }

	var isCancelActionEmptyView: Bool {
        ((isModelInit && isCancelActionNil) || CancelActionView.self == EmptyView.self) ? true : false
    }
}

extension EULAView where Title == Text,
		BodyAttributedText == _ConditionalContent<AttributedText, EmptyView>,
		ActionView == _ConditionalContent<_Action, EmptyView>,
		SecondaryActionView == _ConditionalContent<_Action, EmptyView>,
		CancelActionView == _ConditionalContent<_Action, EmptyView> {

    public init(model: EULAViewModel) {
        self.init(title: model.title, bodyAttributedText: model.bodyAttributedText, action: model.action != nil ? _Action(model: model.action!) : nil, secondaryAction: model.secondaryAction != nil ? _Action(model: model.secondaryAction!) : nil, cancelAction: model.cancelAction != nil ? _Action(model: model.cancelAction!) : nil, didAgree: model.didAgree, didDisagree: model.didDisagree, didCancel: model.didCancel)
    }

    public init(title: String, bodyAttributedText: NSAttributedString? = nil, action: _Action? = _Action(model: _AgreeActionDefault()), secondaryAction: _Action? = _Action(model: _DisagreeActionDefault()), cancelAction: _Action? = _Action(model: _CancelActionDefault()), didAgree: (() -> Void)? = nil, didDisagree: (() -> Void)? = nil, didCancel: (() -> Void)? = nil) {
        self._title = Text(title)
		self._bodyAttributedText = bodyAttributedText != nil ? ViewBuilder.buildEither(first: AttributedText(bodyAttributedText: bodyAttributedText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._action = action != nil ? ViewBuilder.buildEither(first: action!) : ViewBuilder.buildEither(second: EmptyView())
		self._secondaryAction = secondaryAction != nil ? ViewBuilder.buildEither(first: secondaryAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._cancelAction = cancelAction != nil ? ViewBuilder.buildEither(first: cancelAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._didAgree = didAgree
		self._didDisagree = didDisagree
		self._didCancel = didCancel

		isModelInit = true
		isBodyAttributedTextNil = bodyAttributedText == nil ? true : false
		isActionNil = action == nil ? true : false
		isSecondaryActionNil = secondaryAction == nil ? true : false
		isCancelActionNil = cancelAction == nil ? true : false
		isDidAgreeNil = didAgree == nil ? true : false
		isDidDisagreeNil = didDisagree == nil ? true : false
		isDidCancelNil = didCancel == nil ? true : false
    }
}
