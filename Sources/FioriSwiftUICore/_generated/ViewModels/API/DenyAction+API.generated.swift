// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct DenyAction {
    @Environment(\.denyActionTextModifier) private var denyActionTextModifier

    var _denyActionText: String? = nil
	var _didSelectDenyAction: (() -> Void)? = nil
	
    public init(model: DenyActionModel) {
        self.init(denyActionText: model.denyActionText, didSelectDenyAction: model.didSelectDenyAction)
    }

    public init(denyActionText: String? = NSLocalizedString("Deny", comment: ""), didSelectDenyAction: (() -> Void)? = nil) {
        self._denyActionText = denyActionText
		self._didSelectDenyAction = didSelectDenyAction
    }
}
