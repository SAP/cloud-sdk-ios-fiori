// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension UserConsentForm where NextActionView == NextAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
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

extension UserConsentForm where CancelActionView == CancelAction {
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
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
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

extension UserConsentForm where AllowActionView == AllowAction {
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
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
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

extension UserConsentForm where DenyActionView == DenyAction {
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
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
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

extension UserConsentForm where NotNowActionView == NotNowAction {
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
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == NextAction, CancelActionView == CancelAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
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

extension UserConsentForm where NextActionView == NextAction, AllowActionView == AllowAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: cancelAction,
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
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

extension UserConsentForm where NextActionView == NextAction, DenyActionView == DenyAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
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

extension UserConsentForm where NextActionView == NextAction, NotNowActionView == NotNowAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where CancelActionView == CancelAction, AllowActionView == AllowAction {
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
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
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

extension UserConsentForm where CancelActionView == CancelAction, DenyActionView == DenyAction {
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
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: allowAction,
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
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

extension UserConsentForm where CancelActionView == CancelAction, NotNowActionView == NotNowAction {
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
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where AllowActionView == AllowAction, DenyActionView == DenyAction {
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
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
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

extension UserConsentForm where AllowActionView == AllowAction, NotNowActionView == NotNowAction {
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
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: denyAction,
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where DenyActionView == DenyAction, NotNowActionView == NotNowAction {
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
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == NextAction, CancelActionView == CancelAction, AllowActionView == AllowAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
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

extension UserConsentForm where NextActionView == NextAction, CancelActionView == CancelAction, DenyActionView == DenyAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: allowAction,
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
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

extension UserConsentForm where NextActionView == NextAction, CancelActionView == CancelAction, NotNowActionView == NotNowAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: allowAction,
			denyAction: denyAction,
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == NextAction, AllowActionView == AllowAction, DenyActionView == DenyAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: cancelAction,
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
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

extension UserConsentForm where NextActionView == NextAction, AllowActionView == AllowAction, NotNowActionView == NotNowAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: cancelAction,
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: denyAction,
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == NextAction, DenyActionView == DenyAction, NotNowActionView == NotNowAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: cancelAction,
			allowAction: allowAction,
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where CancelActionView == CancelAction, AllowActionView == AllowAction, DenyActionView == DenyAction {
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
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
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

extension UserConsentForm where CancelActionView == CancelAction, AllowActionView == AllowAction, NotNowActionView == NotNowAction {
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
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: denyAction,
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where CancelActionView == CancelAction, DenyActionView == DenyAction, NotNowActionView == NotNowAction {
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
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: allowAction,
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where AllowActionView == AllowAction, DenyActionView == DenyAction, NotNowActionView == NotNowAction {
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
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == NextAction, CancelActionView == CancelAction, AllowActionView == AllowAction, DenyActionView == DenyAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
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

extension UserConsentForm where NextActionView == NextAction, CancelActionView == CancelAction, AllowActionView == AllowAction, NotNowActionView == NotNowAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: denyAction,
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == NextAction, CancelActionView == CancelAction, DenyActionView == DenyAction, NotNowActionView == NotNowAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: allowAction,
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == NextAction, AllowActionView == AllowAction, DenyActionView == DenyAction, NotNowActionView == NotNowAction {
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
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: cancelAction,
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where CancelActionView == CancelAction, AllowActionView == AllowAction, DenyActionView == DenyAction, NotNowActionView == NotNowAction {
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
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}

extension UserConsentForm where NextActionView == NextAction, CancelActionView == CancelAction, AllowActionView == AllowAction, DenyActionView == DenyAction, NotNowActionView == NotNowAction {
    public init(
    @IndexedViewBuilder userConsentPages: () -> UserConsentPages,
		isRequired: Bool = true,
		alertConfiguration: AlertConfiguration = AlertConfiguration.UserConsentFormDefault,
		didAllow: (() -> Void)? = nil,
		didDeny: ((Bool) -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            nextAction: { NextAction(model: _NextActionDefaultModel()) },
			cancelAction: { CancelAction(model: _CancelActionDefaultModel()) },
			allowAction: { AllowAction(model: _AllowActionDefaultModel()) },
			denyAction: { DenyAction(model: _DenyActionDefaultModel()) },
			notNowAction: { NotNowAction(model: _NotNowActionDefaultModel()) },
			userConsentPages: userConsentPages,
			isRequired: isRequired,
			alertConfiguration: alertConfiguration,
			didAllow: didAllow,
			didDeny: didDeny,
			didCancel: didCancel
        )
    }
}