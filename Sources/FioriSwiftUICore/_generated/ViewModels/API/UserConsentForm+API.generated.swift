// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct UserConsentForm<NextActionView: View, CancelActionView: View, AllowActionView: View, DenyActionView: View, NotNowActionView: View, UserConsentPages: IndexedViewContainer> {
    @Environment(\.nextActionModifier) private var nextActionModifier
	@Environment(\.cancelActionModifier) private var cancelActionModifier
	@Environment(\.allowActionModifier) private var allowActionModifier
	@Environment(\.denyActionModifier) private var denyActionModifier
	@Environment(\.notNowActionModifier) private var notNowActionModifier
	@Environment(\.userConsentFormDidCancel) var userConsentFormDidCancel
	@Environment(\.userConsentFormDidDeny) var userConsentFormDidDeny
	@Environment(\.userConsentFormDidAllow) var userConsentFormDidAllow

    let _nextAction: NextActionView
	let _cancelAction: CancelActionView
	let _allowAction: AllowActionView
	let _denyAction: DenyActionView
	let _notNowAction: NotNowActionView
	let _userConsentPages: UserConsentPages
	let _isRequired: Bool
	let _alertConfiguration: AlertConfiguration
	let _didAllow: (() -> Void)?
	let _didDeny: ((Bool) -> Void)?
	let _didCancel: (() -> Void)?
	@State var _showAlert = false
	@State var _pageIndex = 0

    private var isModelInit: Bool = false
	private var isNextActionNil: Bool = false
	private var isCancelActionNil: Bool = false
	private var isAllowActionNil: Bool = false
	private var isDenyActionNil: Bool = false
	private var isNotNowActionNil: Bool = false
	private var isDidAllowNil: Bool = false
	private var isDidDenyNil: Bool = false
	private var isDidCancelNil: Bool = false

    public init(
        @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration._UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
        ) {
            self._nextAction = nextAction()
			self._cancelAction = cancelAction()
			self._allowAction = allowAction()
			self._denyAction = denyAction()
			self._notNowAction = notNowAction()
			self._userConsentPages = userConsentPages()
			self._isRequired = isRequired
			self._alertConfiguration = alertConfiguration
			self._didAllow = didAllow
			self._didDeny = didDeny
			self._didCancel = didCancel
    }

    @ViewBuilder var nextAction: some View {
        if isModelInit {
            _nextAction.modifier(nextActionModifier.concat(Fiori.UserConsentForm.nextAction).concat(Fiori.UserConsentForm.nextActionCumulative))
        } else {
            _nextAction.modifier(nextActionModifier.concat(Fiori.UserConsentForm.nextAction))
        }
    }
	@ViewBuilder var cancelAction: some View {
        if isModelInit {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.UserConsentForm.cancelAction).concat(Fiori.UserConsentForm.cancelActionCumulative))
        } else {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.UserConsentForm.cancelAction))
        }
    }
	@ViewBuilder var allowAction: some View {
        if isModelInit {
            _allowAction.modifier(allowActionModifier.concat(Fiori.UserConsentForm.allowAction).concat(Fiori.UserConsentForm.allowActionCumulative))
        } else {
            _allowAction.modifier(allowActionModifier.concat(Fiori.UserConsentForm.allowAction))
        }
    }
	@ViewBuilder var denyAction: some View {
        if isModelInit {
            _denyAction.modifier(denyActionModifier.concat(Fiori.UserConsentForm.denyAction).concat(Fiori.UserConsentForm.denyActionCumulative))
        } else {
            _denyAction.modifier(denyActionModifier.concat(Fiori.UserConsentForm.denyAction))
        }
    }
	@ViewBuilder var notNowAction: some View {
        if isModelInit {
            _notNowAction.modifier(notNowActionModifier.concat(Fiori.UserConsentForm.notNowAction).concat(Fiori.UserConsentForm.notNowActionCumulative))
        } else {
            _notNowAction.modifier(notNowActionModifier.concat(Fiori.UserConsentForm.notNowAction))
        }
    }
	var userConsentPages: UserConsentPages {
        _userConsentPages
    }
    
	var isNextActionEmptyView: Bool {
        ((isModelInit && isNextActionNil) || NextActionView.self == EmptyView.self) ? true : false
    }

	var isCancelActionEmptyView: Bool {
        ((isModelInit && isCancelActionNil) || CancelActionView.self == EmptyView.self) ? true : false
    }

	var isAllowActionEmptyView: Bool {
        ((isModelInit && isAllowActionNil) || AllowActionView.self == EmptyView.self) ? true : false
    }

	var isDenyActionEmptyView: Bool {
        ((isModelInit && isDenyActionNil) || DenyActionView.self == EmptyView.self) ? true : false
    }

	var isNotNowActionEmptyView: Bool {
        ((isModelInit && isNotNowActionNil) || NotNowActionView.self == EmptyView.self) ? true : false
    }
}

extension UserConsentForm where NextActionView == _ConditionalContent<Action, EmptyView>,
		CancelActionView == _ConditionalContent<Action, EmptyView>,
		AllowActionView == _ConditionalContent<Action, EmptyView>,
		DenyActionView == _ConditionalContent<Action, EmptyView>,
		NotNowActionView == _ConditionalContent<Action, EmptyView>,
		UserConsentPages == _UserConsentPagesContainer {

    public init(model: UserConsentFormModel) {
        self.init(nextAction: model.nextAction != nil ? Action(model: model.nextAction!) : nil, cancelAction: model.cancelAction != nil ? Action(model: model.cancelAction!) : nil, allowAction: model.allowAction != nil ? Action(model: model.allowAction!) : nil, denyAction: model.denyAction != nil ? Action(model: model.denyAction!) : nil, notNowAction: model.notNowAction != nil ? Action(model: model.notNowAction!) : nil, userConsentPages: model.userConsentPages, isRequired: model.isRequired, alertConfiguration: model.alertConfiguration, didAllow: model.didAllow, didDeny: model.didDeny, didCancel: model.didCancel)
    }

    public init(nextAction: Action? = Action(model: _NextActionDefault()), cancelAction: Action? = Action(model: _CancelActionDefault()), allowAction: Action? = Action(model: _AllowActionDefault()), denyAction: Action? = Action(model: _DenyActionDefault()), notNowAction: Action? = Action(model: _NotNowActionDefault()), userConsentPages: [UserConsentPageModel] = [], isRequired: Bool = true, alertConfiguration: AlertConfiguration = AlertConfiguration._UserConsentFormDefault, didAllow: (() -> Void)? = nil, didDeny: ((Bool) -> Void)? = nil, didCancel: (() -> Void)? = nil) {
        self._nextAction = nextAction != nil ? ViewBuilder.buildEither(first: nextAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._cancelAction = cancelAction != nil ? ViewBuilder.buildEither(first: cancelAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._allowAction = allowAction != nil ? ViewBuilder.buildEither(first: allowAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._denyAction = denyAction != nil ? ViewBuilder.buildEither(first: denyAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._notNowAction = notNowAction != nil ? ViewBuilder.buildEither(first: notNowAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._userConsentPages = _UserConsentPagesContainer(userConsentPages: userConsentPages)
		self._isRequired = isRequired
		self._alertConfiguration = alertConfiguration
		self._didAllow = didAllow
		self._didDeny = didDeny
		self._didCancel = didCancel

		isModelInit = true
		isNextActionNil = nextAction == nil ? true : false
		isCancelActionNil = cancelAction == nil ? true : false
		isAllowActionNil = allowAction == nil ? true : false
		isDenyActionNil = denyAction == nil ? true : false
		isNotNowActionNil = notNowAction == nil ? true : false
		isDidAllowNil = didAllow == nil ? true : false
		isDidDenyNil = didDeny == nil ? true : false
		isDidCancelNil = didCancel == nil ? true : false
    }
}
