// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension UserConsentForm where NextActionView == Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
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

extension UserConsentForm where CancelActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
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

extension UserConsentForm where AllowActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: { Action(model: _AllowActionDefault()) },
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

extension UserConsentForm where DenyActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: { Action(model: _DenyActionDefault()) },
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

extension UserConsentForm where NotNowActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == Action, CancelActionView == Action {
    public init(
    @ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
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

extension UserConsentForm where NextActionView == Action, AllowActionView == Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: { Action(model: _AllowActionDefault()) },
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

extension UserConsentForm where NextActionView == Action, DenyActionView == Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: { Action(model: _DenyActionDefault()) },
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

extension UserConsentForm where NextActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where CancelActionView == Action, AllowActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: { Action(model: _AllowActionDefault()) },
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

extension UserConsentForm where CancelActionView == Action, DenyActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: { Action(model: _DenyActionDefault()) },
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

extension UserConsentForm where CancelActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where AllowActionView == Action, DenyActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: { Action(model: _DenyActionDefault()) },
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

extension UserConsentForm where AllowActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where DenyActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: { Action(model: _DenyActionDefault()) },
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == Action, CancelActionView == Action, AllowActionView == Action {
    public init(
    @ViewBuilder denyAction: () -> DenyActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: { Action(model: _AllowActionDefault()) },
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

extension UserConsentForm where NextActionView == Action, CancelActionView == Action, DenyActionView == Action {
    public init(
    @ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: { Action(model: _DenyActionDefault()) },
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

extension UserConsentForm where NextActionView == Action, CancelActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder allowAction: () -> AllowActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == Action, AllowActionView == Action, DenyActionView == Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: { Action(model: _DenyActionDefault()) },
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

extension UserConsentForm where NextActionView == Action, AllowActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == Action, DenyActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: { Action(model: _DenyActionDefault()) },
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where CancelActionView == Action, AllowActionView == Action, DenyActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: { Action(model: _DenyActionDefault()) },
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

extension UserConsentForm where CancelActionView == Action, AllowActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where CancelActionView == Action, DenyActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder allowAction: () -> AllowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: { Action(model: _DenyActionDefault()) },
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where AllowActionView == Action, DenyActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: cancelAction,
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: { Action(model: _DenyActionDefault()) },
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == Action, CancelActionView == Action, AllowActionView == Action, DenyActionView == Action {
    public init(
    @ViewBuilder notNowAction: () -> NotNowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: { Action(model: _DenyActionDefault()) },
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

extension UserConsentForm where NextActionView == Action, CancelActionView == Action, AllowActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder denyAction: () -> DenyActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: denyAction,
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == Action, CancelActionView == Action, DenyActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder allowAction: () -> AllowActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: allowAction,
			denyAction: { Action(model: _DenyActionDefault()) },
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == Action, AllowActionView == Action, DenyActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: cancelAction,
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: { Action(model: _DenyActionDefault()) },
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where CancelActionView == Action, AllowActionView == Action, DenyActionView == Action, NotNowActionView == Action {
    public init(
    @ViewBuilder nextAction: () -> NextActionView,
		@IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: nextAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: { Action(model: _DenyActionDefault()) },
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == Action, CancelActionView == Action, AllowActionView == Action, DenyActionView == Action, NotNowActionView == Action {
    public init(
    @IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { Action(model: _NextActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			allowAction: { Action(model: _AllowActionDefault()) },
			denyAction: { Action(model: _DenyActionDefault()) },
			notNowAction: { Action(model: _NotNowActionDefault()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}
