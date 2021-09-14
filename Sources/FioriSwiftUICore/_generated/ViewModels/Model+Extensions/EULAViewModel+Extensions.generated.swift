// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension EULAViewModel {
    var action: ActionModel? {
        return _AgreeActionDefault()
    }

	var secondaryAction: ActionModel? {
        return _DisagreeActionDefault()
    }

	var cancelAction: ActionModel? {
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
