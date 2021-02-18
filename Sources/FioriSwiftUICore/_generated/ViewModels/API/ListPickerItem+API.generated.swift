import SwiftUI

public struct ListPickerItem<Key: View, Value: View> {
    @Environment(\.keyModifier) private var keyModifier
    @Environment(\.valueModifier) private var valueModifier

    private let _key: Key
    private let _value: Value
    var destinationView: AnyView?
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
}

public extension ListPickerItem where Key == Text,
    Value == _ConditionalContent<Text, EmptyView>
{
    init(model: ListPickerItemModel) {
        self.init(key: model.key_, value: model.value_)
    }

    init(key: String, value: String? = nil) {
        self._key = Text(key)
        self._value = value != nil ? ViewBuilder.buildEither(first: Text(value!)) : ViewBuilder.buildEither(second: EmptyView())
    }
}
