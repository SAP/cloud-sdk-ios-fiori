// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SecondaryAction {
    @Environment(\.secondaryActionTextModifier) private var secondaryActionTextModifier

    var _secondaryActionText: String? = nil
	var _didSelectSecondaryAction: (() -> Void)? = nil
	
    public init(model: SecondaryActionModel) {
        self.init(secondaryActionText: model.secondaryActionText_, didSelectSecondaryAction: model.didSelectSecondaryAction)
    }

    public init(secondaryActionText: String? = nil, didSelectSecondaryAction: (() -> Void)? = nil) {
        self._secondaryActionText = secondaryActionText
		self._didSelectSecondaryAction = didSelectSecondaryAction
    }
}
