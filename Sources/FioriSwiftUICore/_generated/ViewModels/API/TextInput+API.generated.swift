// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct TextInput {
    @Environment(\.textInputValueModifier) private var textInputValueModifier

    var _textInputValue: Binding<String>
	var _onCommit: (() -> Void)? = nil
	
    public init(model: TextInputModel) {
        self.init(textInputValue: Binding<String>(get: { model.textInputValue }, set: { model.textInputValue = $0 }), onCommit: model.onCommit)
    }

    public init(textInputValue: Binding<String>? = nil, onCommit: (() -> Void)? = nil) {
        self._textInputValue = textInputValue ?? .constant("")
		self._onCommit = onCommit
    }
}
