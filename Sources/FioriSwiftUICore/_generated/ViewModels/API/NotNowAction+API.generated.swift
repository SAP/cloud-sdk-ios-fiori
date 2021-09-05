// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct NotNowAction {
    @Environment(\.notNowActionTextModifier) private var notNowActionTextModifier

    var _notNowActionText: String? = nil
	var _didSelectNotNowAction: (() -> Void)? = nil
	
    public init(model: NotNowActionModel) {
        self.init(notNowActionText: model.notNowActionText, didSelectNotNowAction: model.didSelectNotNowAction)
    }

    public init(notNowActionText: String? = NSLocalizedString("Not Now", comment: ""), didSelectNotNowAction: (() -> Void)? = nil) {
        self._notNowActionText = notNowActionText
		self._didSelectNotNowAction = didSelectNotNowAction
    }
}
