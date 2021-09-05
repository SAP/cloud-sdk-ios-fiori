// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct NextAction {
    @Environment(\.nextActionTextModifier) private var nextActionTextModifier

    var _nextActionText: String? = nil
	var _didSelectNextAction: (() -> Void)? = nil
	
    public init(model: NextActionModel) {
        self.init(nextActionText: model.nextActionText, didSelectNextAction: model.didSelectNextAction)
    }

    public init(nextActionText: String? = NSLocalizedString("Next", comment: ""), didSelectNextAction: (() -> Void)? = nil) {
        self._nextActionText = nextActionText
		self._didSelectNextAction = didSelectNextAction
    }
}
