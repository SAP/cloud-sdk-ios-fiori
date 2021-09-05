// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct AllowAction {
    @Environment(\.allowActionTextModifier) private var allowActionTextModifier

    var _allowActionText: String? = nil
	var _didSelectAllowAction: (() -> Void)? = nil
	
    public init(model: AllowActionModel) {
        self.init(allowActionText: model.allowActionText, didSelectAllowAction: model.didSelectAllowAction)
    }

    public init(allowActionText: String? = NSLocalizedString("Allow", comment: ""), didSelectAllowAction: (() -> Void)? = nil) {
        self._allowActionText = allowActionText
		self._didSelectAllowAction = didSelectAllowAction
    }
}
