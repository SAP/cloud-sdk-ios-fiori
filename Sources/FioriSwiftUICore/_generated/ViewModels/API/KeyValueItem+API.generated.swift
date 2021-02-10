// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct KeyValueItem<Key: View, Value: View> {
    @Environment(\.keyModifier) private var keyModifier
	@Environment(\.valueModifier) private var valueModifier

    private let _key: Key
	private let _value: Value

    public init(
        @ViewBuilder key: @escaping () -> Key,
		@ViewBuilder value: @escaping () -> Value
        ) {
            self._key = key()
			self._value = value()
    }

    var key: some View {
        _key.modifier(keyModifier.concat(Fiori.KeyValueItem.key))
    }
	var value: some View {
        _value.modifier(valueModifier.concat(Fiori.KeyValueItem.value))
    }
    
}

extension KeyValueItem where Key == Text,
		Value == _ConditionalContent<Text, EmptyView> {

    public init(model: KeyValueItemModel) {
        self.init(key: model.key_, value: model.value_)
    }

    public init(key: String, value: String? = nil) {
        self._key = Text(key)
		self._value = value != nil ? ViewBuilder.buildEither(first: Text(value!)) : ViewBuilder.buildEither(second: EmptyView())
    }
}
