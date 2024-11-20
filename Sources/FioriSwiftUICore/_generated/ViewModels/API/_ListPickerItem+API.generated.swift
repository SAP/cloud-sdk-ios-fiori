// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _ListPickerItem<Key: View, Value: View> {
    @Environment(\.keyModifier) private var keyModifier
	@Environment(\.valueModifier) private var valueModifier
	@Environment(\.listPickerListViewModifier) var listPickerListViewModifier
	@Environment(\.listpickerListStyle) var listpickerListStyle
	@Environment(\.listBackground) var listBackground

    let _key: Key
	let _value: Value
	let _axis: Axis
	var destinationConfiguration: _ListPickerItemConfiguration? = nil
    
    private var isModelInit: Bool = false
	private var isValueNil: Bool = false

    public init(
        @ViewBuilder key: () -> Key,
		@ViewBuilder value: () -> Value,
		axis: Axis = .horizontal
        ) {
            self._key = key()
			self._value = value()
			self._axis = axis
    }

    @ViewBuilder var key: some View {
        if isModelInit {
            _key.modifier(keyModifier.concat(Fiori._ListPickerItem.key).concat(Fiori._ListPickerItem.keyCumulative))
        } else {
            _key.modifier(keyModifier.concat(Fiori._ListPickerItem.key))
        }
    }
	@ViewBuilder var value: some View {
        if isModelInit {
            _value.modifier(valueModifier.concat(Fiori._ListPickerItem.value).concat(Fiori._ListPickerItem.valueCumulative))
        } else {
            _value.modifier(valueModifier.concat(Fiori._ListPickerItem.value))
        }
    }
    
	var isValueEmptyView: Bool {
        ((isModelInit && isValueNil) || Value.self == EmptyView.self) ? true : false
    }
}

extension _ListPickerItem where Key == Text,
		Value == _ConditionalContent<Text, EmptyView> {

    public init(model: _ListPickerItemModel) {
        self.init(key: model.key, value: model.value)
    }

    public init(key: String, value: String? = nil, axis: Axis = .horizontal) {
        self._key = Text(key)
		self._value = value != nil ? ViewBuilder.buildEither(first: Text(value!)) : ViewBuilder.buildEither(second: EmptyView())
		self._axis = axis

		isModelInit = true
		isValueNil = value == nil ? true : false
    }
}
