// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _Action {
    @Environment(\.actionTextModifier) private var actionTextModifier
	@Environment(\.sharedAction) var sharedAction

    var _actionText: String? = nil
	var _didSelectAction: (() -> Void)? = nil
	
    public init(model: _ActionModel) {
        self.init(actionText: model.actionText, didSelectAction: model.didSelectAction)
    }

    public init(actionText: String? = nil, didSelectAction: (() -> Void)? = nil) {
        self._actionText = actionText
		self._didSelectAction = didSelectAction
    }
}
