// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension SortFilterViewModel {
    var cancelAction: _ActionModel? {
        return _CancelActionDefault()
    }

	var resetAction: _ActionModel? {
        return _ResetActionDefault()
    }

	var applyAction: _ActionModel? {
        return _ApplyActionDefault()
    }

	var onUpdate: (() -> Void)? {
        return nil
    }
}
