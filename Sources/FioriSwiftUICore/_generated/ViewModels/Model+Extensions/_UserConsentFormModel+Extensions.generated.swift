// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension _UserConsentFormModel {
    var nextAction: _ActionModel? {
        return _NextActionDefault()
    }

	var cancelAction: _ActionModel? {
        return _CancelActionDefault()
    }

	var allowAction: _ActionModel? {
        return _AllowActionDefault()
    }

	var denyAction: _ActionModel? {
        return _DenyActionDefault()
    }

	var notNowAction: _ActionModel? {
        return _NotNowActionDefault()
    }

	var isRequired: Bool {
        return true
    }

	var alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? {
        return _UserConsentFormAlertConfigurationDefault
    }

	var didAllow: (() -> Void)? {
        return nil
    }

	var didDeny: ((Bool) -> Void)? {
        return nil
    }

	var didCancel: (() -> Void)? {
        return nil
    }
}
