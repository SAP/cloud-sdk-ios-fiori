// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SecondaryAction {
    

    var _secondaryActionLabel: String? = nil
	var _didSelectSecondaryActionClosure: (() -> Void)? = nil
	
    public init(model: SecondaryActionModel) {
        self.init(secondaryActionLabel: model.secondaryActionLabel_, didSelectSecondaryActionClosure: model.didSelectSecondaryAction)
    }

    public init(secondaryActionLabel: String? = nil, didSelectSecondaryActionClosure: (() -> Void)? = nil) {
        self._secondaryActionLabel = secondaryActionLabel
		self._didSelectSecondaryActionClosure = didSelectSecondaryActionClosure
    }
}
