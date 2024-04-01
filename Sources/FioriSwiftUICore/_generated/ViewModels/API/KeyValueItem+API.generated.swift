// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct KeyValueItem<Key: View, Value: View> {
    @Environment(\.keyModifier) private var keyModifier
	@Environment(\.valueModifier) private var valueModifier

    let _key: Key
	let _value: Value
	
    private var isModelInit: Bool = false
	private var isValueNil: Bool = false

    public init(
        @ViewBuilder key: () -> Key,
		@ViewBuilder value: () -> Value
        ) {
            self._key = key()
			self._value = value()
    }

    @ViewBuilder var key: some View {
        if isModelInit {
            _key.modifier(keyModifier.concat(Fiori.KeyValueItem.key).concat(Fiori.KeyValueItem.keyCumulative))
        } else {
            _key.modifier(keyModifier.concat(Fiori.KeyValueItem.key))
        }
    }
	@ViewBuilder var value: some View {
        if isModelInit {
            _value.modifier(valueModifier.concat(Fiori.KeyValueItem.value).concat(Fiori.KeyValueItem.valueCumulative))
        } else {
            _value.modifier(valueModifier.concat(Fiori.KeyValueItem.value))
        }
    }
    
	var isValueEmptyView: Bool {
        ((isModelInit && isValueNil) || Value.self == EmptyView.self) ? true : false
    }
}

extension KeyValueItem where Key == Text,
		Value == _ConditionalContent<Text, EmptyView> {

    public init(model: KeyValueItemModel) {
        self.init(key: model.key, value: model.value)
    }

    public init(key: String, value: String? = nil) {
        self._key = Text(key)
		self._value = value != nil ? ViewBuilder.buildEither(first: Text(value!)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isValueNil = value == nil ? true : false
    }
}
