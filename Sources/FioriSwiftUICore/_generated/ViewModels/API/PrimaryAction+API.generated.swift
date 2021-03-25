// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct PrimaryAction {
    @Environment(\.primaryActionTextModifier) private var primaryActionTextModifier

    var _primaryActionText: String? = nil
	var _didSelectPrimaryActionClosure: (() -> Void)? = nil
	
    public init(model: PrimaryActionModel) {
        self.init(primaryActionText: model.primaryActionText_, didSelectPrimaryActionClosure: model.didSelectPrimaryAction)
    }

    public init(primaryActionText: String? = nil, didSelectPrimaryActionClosure: (() -> Void)? = nil) {
        self._primaryActionText = primaryActionText
		self._didSelectPrimaryActionClosure = didSelectPrimaryActionClosure
    }
}
