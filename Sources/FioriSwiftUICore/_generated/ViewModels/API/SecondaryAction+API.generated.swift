// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SecondaryAction {
    

    var _secondaryActionText: String? = nil
	var _didSelectSecondaryActionClosure: (() -> Void)? = nil
	
    public init(model: SecondaryActionModel) {
        self.init(secondaryActionText: model.secondaryActionText_, didSelectSecondaryActionClosure: model.didSelectSecondaryAction)
    }

    public init(secondaryActionText: String? = nil, didSelectSecondaryActionClosure: (() -> Void)? = nil) {
        self._secondaryActionText = secondaryActionText
		self._didSelectSecondaryActionClosure = didSelectSecondaryActionClosure
    }
}
