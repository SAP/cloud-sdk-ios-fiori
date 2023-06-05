// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct Action {
    @Environment(\.actionTextModifier) private var actionTextModifier
    @Environment(\.sharedAction) var sharedAction

    var _actionText: String? = nil
	var _didSelectAction: (() -> Void)? = nil
	
    public init(model: ActionModel) {
        self.init(actionText: model.actionText, didSelectAction: model.didSelectAction)
    }

    public init(actionText: String? = nil, didSelectAction: (() -> Void)? = nil) {
        self._actionText = actionText
		self._didSelectAction = didSelectAction
    }
}
