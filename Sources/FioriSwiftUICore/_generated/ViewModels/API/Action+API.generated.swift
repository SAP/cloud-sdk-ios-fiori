// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct Action {
    @Environment(\.actionTextModifier) private var actionTextModifier

    var _actionText: String? = nil
	var _didSelectActionClosure: (() -> Void)? = nil
	
    public init(model: ActionModel) {
        self.init(actionText: model.actionText_, didSelectActionClosure: model.didSelectAction)
    }

    public init(actionText: String? = nil, didSelectActionClosure: (() -> Void)? = nil) {
        self._actionText = actionText
		self._didSelectActionClosure = didSelectActionClosure
    }
}
