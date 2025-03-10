// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension _EULAViewModel {
    var action: _ActionModel? {
        return _AgreeActionDefault()
    }

	var secondaryAction: _ActionModel? {
        return _DisagreeActionDefault()
    }

	var cancelAction: _ActionModel? {
        return _CancelActionDefault()
    }

	var didAgree: (() -> Void)? {
        return nil
    }

	var didDisagree: (() -> Void)? {
        return nil
    }

	var didCancel: (() -> Void)? {
        return nil
    }
}
