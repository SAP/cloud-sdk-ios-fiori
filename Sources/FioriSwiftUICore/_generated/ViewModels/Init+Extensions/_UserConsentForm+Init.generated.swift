// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension _UserConsentForm where NextActionView == _Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where CancelActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where AllowActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where DenyActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NotNowActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, CancelActionView == _Action {
    public init(
    @ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, AllowActionView == _Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, DenyActionView == _Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where CancelActionView == _Action, AllowActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where CancelActionView == _Action, DenyActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where CancelActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where AllowActionView == _Action, DenyActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where AllowActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where DenyActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, CancelActionView == _Action, AllowActionView == _Action {
    public init(
    @ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, CancelActionView == _Action, DenyActionView == _Action {
    public init(
    @ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, CancelActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, AllowActionView == _Action, DenyActionView == _Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, AllowActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where CancelActionView == _Action, AllowActionView == _Action, DenyActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where CancelActionView == _Action, AllowActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where CancelActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where AllowActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, CancelActionView == _Action, AllowActionView == _Action, DenyActionView == _Action {
    public init(
    @ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: notNowAction,
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, CancelActionView == _Action, AllowActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, CancelActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder allowAction: () -> AllowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, AllowActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where CancelActionView == _Action, AllowActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension _UserConsentForm where NextActionView == _Action, CancelActionView == _Action, AllowActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    public init(
    @IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { _Action(model: _NextActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			allowAction: { _Action(model: _AllowActionDefault()) },
			denyAction: { _Action(model: _DenyActionDefault()) },
			notNowAction: { _Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}
