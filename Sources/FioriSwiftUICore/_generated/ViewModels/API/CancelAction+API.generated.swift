// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct CancelAction {
    @Environment(\.cancelActionTextModifier) private var cancelActionTextModifier

    var _cancelActionText: String? = nil
	var _didSelectCancelAction: (() -> Void)? = nil
	
    public init(model: CancelActionModel) {
        self.init(cancelActionText: model.cancelActionText, didSelectCancelAction: model.didSelectCancelAction)
    }

    public init(cancelActionText: String? = NSLocalizedString("Cancel", comment: ""), didSelectCancelAction: (() -> Void)? = nil) {
        self._cancelActionText = cancelActionText
		self._didSelectCancelAction = didSelectCancelAction
    }
}
