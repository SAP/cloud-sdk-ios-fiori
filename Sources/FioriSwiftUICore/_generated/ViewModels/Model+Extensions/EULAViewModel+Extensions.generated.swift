// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension EULAViewModel {
    var action: _ActionModel? {
        _AgreeActionDefault()
    }

    var secondaryAction: _ActionModel? {
        _DisagreeActionDefault()
    }

    var cancelAction: _ActionModel? {
        _CancelActionDefault()
    }

    var didAgree: (() -> Void)? {
        nil
    }

    var didDisagree: (() -> Void)? {
        nil
    }

    var didCancel: (() -> Void)? {
        nil
    }
}
