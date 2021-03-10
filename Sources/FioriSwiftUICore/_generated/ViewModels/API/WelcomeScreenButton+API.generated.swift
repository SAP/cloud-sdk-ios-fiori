// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct WelcomeScreenButton {
    

    var _primaryButton: String? = nil
	var _clickActionClosure: (() -> Void)? = nil
	
    public init(model: WelcomeScreenButtonModel) {
        self.init(primaryButton: model.primaryButton_, clickActionClosure: model.clickAction)
    }

    public init(primaryButton: String? = nil, clickActionClosure: (() -> Void)? = nil) {
        self._primaryButton = primaryButton
		self._clickActionClosure = clickActionClosure
    }
}
