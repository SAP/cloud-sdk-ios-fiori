// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension UserConsentFormModel {
    var nextAction: NextActionModel? {
        return _NextActionDefaultModel()
    }

	var cancelAction: CancelActionModel? {
        return _CancelActionDefaultModel()
    }

	var allowAction: AllowActionModel? {
        return _AllowActionDefaultModel()
    }

	var denyAction: DenyActionModel? {
        return _DenyActionDefaultModel()
    }

	var notNowAction: NotNowActionModel? {
        return _NotNowActionDefaultModel()
    }

	var isRequired: Bool {
        return true
    }

	var alertConfiguration: AlertConfiguration {
        return AlertConfiguration.UserConsentFormDefault
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
