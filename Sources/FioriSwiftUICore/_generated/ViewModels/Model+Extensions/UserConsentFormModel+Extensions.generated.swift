// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension UserConsentFormModel {
    var nextAction: _ActionModel? {
        _NextActionDefault()
    }

    var cancelAction: _ActionModel? {
        _CancelActionDefault()
    }

    var allowAction: _ActionModel? {
        _AllowActionDefault()
    }

    var denyAction: _ActionModel? {
        _DenyActionDefault()
    }

    var notNowAction: _ActionModel? {
        _NotNowActionDefault()
    }

    var isRequired: Bool {
        true
    }

    var alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? {
        _UserConsentFormAlertConfigurationDefault
    }

    var didAllow: (() -> Void)? {
        nil
    }

    var didDeny: ((Bool) -> Void)? {
        nil
    }

    var didCancel: (() -> Void)? {
        nil
    }
}
