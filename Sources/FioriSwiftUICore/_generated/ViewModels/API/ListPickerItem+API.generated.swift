// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ListPickerItem<Key: View, Value: View> {
    @Environment(\.keyModifier) private var keyModifier
	@Environment(\.valueModifier) private var valueModifier

    private let _key: Key
	private let _value: Value
	var destinationView: AnyView? = nil
    private var isModelInit: Bool = false
	private var isValueNil: Bool = false

    public init(
        @ViewBuilder key: @escaping () -> Key,
		@ViewBuilder value: @escaping () -> Value
        ) {
            self._key = key()
			self._value = value()
    }

    var key: some View {
        _key.modifier(keyModifier.concat(Fiori.ListPickerItem.key))
    }
	var value: some View {
        _value.modifier(valueModifier.concat(Fiori.ListPickerItem.value))
    }
    
	var isValueEmptyView: Bool {
        ((isModelInit && isValueNil) || Value.self == EmptyView.self) ? true : false
    }
}

extension ListPickerItem where Key == Text,
		Value == _ConditionalContent<Text, EmptyView> {

    public init(model: ListPickerItemModel) {
        self.init(key: model.key_, value: model.value_)
    }

    public init(key: String, value: String? = nil) {
        self._key = Text(key)
		self._value = value != nil ? ViewBuilder.buildEither(first: Text(value!)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isValueNil = value == nil ? true : false
    }
}
