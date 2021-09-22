// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension UserConsentFormModel {
    var nextAction: ActionModel? {
        return _NextActionDefault()
    }

	var cancelAction: ActionModel? {
        return _CancelActionDefault()
    }

	var allowAction: ActionModel? {
        return _AllowActionDefault()
    }

	var denyAction: ActionModel? {
        return _DenyActionDefault()
    }

	var notNowAction: ActionModel? {
        return _NotNowActionDefault()
    }

	var isRequired: Bool {
        return true
    }

	var alertConfiguration: AlertConfiguration {
        return AlertConfiguration._UserConsentFormDefault
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
