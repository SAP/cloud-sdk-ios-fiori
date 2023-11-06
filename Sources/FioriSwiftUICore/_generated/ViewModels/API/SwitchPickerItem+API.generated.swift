// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SwitchPickerItem {
    @Environment(\.fioriToggleStyle) var fioriToggleStyle
	@Environment(\.filterFeedbackBarStyle) var filterFeedbackBarStyle

    var _value: Binding<Bool?>
	var _name: String? = nil
	var _hint: String? = nil
	
    public init(model: SwitchPickerItemModel) {
        self.init(value: Binding<Bool?>(get: { model.value }, set: { model.value = $0 }), name: model.name, hint: model.hint)
    }

    public init(value: Binding<Bool?>, name: String? = nil, hint: String? = nil) {
        self._value = value
		self._name = name
		self._hint = hint
    }
}
