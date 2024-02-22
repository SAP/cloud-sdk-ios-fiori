// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension UserConsentForm where NextActionView == _Action {
    init(
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

public extension UserConsentForm where CancelActionView == _Action {
    init(
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

public extension UserConsentForm where AllowActionView == _Action {
    init(
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

public extension UserConsentForm where DenyActionView == _Action {
    init(
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

public extension UserConsentForm where NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, CancelActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, AllowActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, DenyActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where CancelActionView == _Action, AllowActionView == _Action {
    init(
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

public extension UserConsentForm where CancelActionView == _Action, DenyActionView == _Action {
    init(
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

public extension UserConsentForm where CancelActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where AllowActionView == _Action, DenyActionView == _Action {
    init(
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

public extension UserConsentForm where AllowActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where DenyActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, CancelActionView == _Action, AllowActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, CancelActionView == _Action, DenyActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, CancelActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, AllowActionView == _Action, DenyActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, AllowActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where CancelActionView == _Action, AllowActionView == _Action, DenyActionView == _Action {
    init(
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

public extension UserConsentForm where CancelActionView == _Action, AllowActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where CancelActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where AllowActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, CancelActionView == _Action, AllowActionView == _Action, DenyActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, CancelActionView == _Action, AllowActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, CancelActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, AllowActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where CancelActionView == _Action, AllowActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    init(
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

public extension UserConsentForm where NextActionView == _Action, CancelActionView == _Action, AllowActionView == _Action, DenyActionView == _Action, NotNowActionView == _Action {
    init(
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
