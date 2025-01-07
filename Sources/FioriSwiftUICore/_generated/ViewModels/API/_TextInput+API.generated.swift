// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _TextInput {
    @Environment(\.textInputValueModifier) private var textInputValueModifier

    var _textInputValue: Binding<String>
	var _onCommit: (() -> Void)? = nil
	
    public init(model: _TextInputModel) {
        self.init(textInputValue: Binding<String>(get: { model.textInputValue }, set: { model.textInputValue = $0 }), onCommit: model.onCommit)
    }

    public init(textInputValue: Binding<String>? = nil, onCommit: (() -> Void)? = nil) {
        self._textInputValue = textInputValue ?? .constant("")
		self._onCommit = onCommit
    }
}
