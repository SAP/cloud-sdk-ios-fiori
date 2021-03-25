// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct TextInput {
    @Environment(\.textFilledModifier) private var textFilledModifier

    var _textFilled: String? = nil
	var _onCommitClosure: (() -> Void)? = nil
	@ObservedObject var textInputValue = UserInput()
    public init(model: TextInputModel) {
        self.init(textFilled: model.textFilled_, onCommitClosure: model.onCommit)
    }

    public init(textFilled: String? = nil, onCommitClosure: (() -> Void)? = nil) {
        self._textFilled = textFilled
		self._onCommitClosure = onCommitClosure
    }
}
