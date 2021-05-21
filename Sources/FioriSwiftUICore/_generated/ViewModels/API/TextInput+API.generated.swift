// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct TextInput {
    @Environment(\.textFilledModifier) private var textFilledModifier

    var _textFilled: Binding<String>? = nil
	var _onCommit: (() -> Void)? = nil
	
    public init(model: TextInputModel) {
        self.init(textFilled: model.textFilled_, onCommit: model.onCommit)
    }

    public init(textFilled: Binding<String>? = nil, onCommit: (() -> Void)? = nil) {
        self._textFilled = textFilled
		self._onCommit = onCommit
    }
}
