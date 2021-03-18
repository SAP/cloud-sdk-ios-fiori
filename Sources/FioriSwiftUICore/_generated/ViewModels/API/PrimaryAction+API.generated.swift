// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct PrimaryAction {
    

    var _primaryActionLabel: String? = nil
	var _didSelectPrimaryActionClosure: (() -> Void)? = nil
	
    public init(model: PrimaryActionModel) {
        self.init(primaryActionLabel: model.primaryActionLabel_, didSelectPrimaryActionClosure: model.didSelectPrimaryAction)
    }

    public init(primaryActionLabel: String? = nil, didSelectPrimaryActionClosure: (() -> Void)? = nil) {
        self._primaryActionLabel = primaryActionLabel
		self._didSelectPrimaryActionClosure = didSelectPrimaryActionClosure
    }
}
