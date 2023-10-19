// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SliderPicker {
    @Environment(\.sortFilterMenuItemStyle) var sortFilterMenuItemStyle

    var _value: Binding<Int?>
	var _minimumValue: Int
	var _maximumValue: Int
	var _hint: String? = nil
	
    public init(model: SliderPickerModel) {
        self.init(value: Binding<Int?>(get: { model.value }, set: { model.value = $0 }), minimumValue: model.minimumValue, maximumValue: model.maximumValue, hint: model.hint)
    }

    public init(value: Binding<Int?>, minimumValue: Int = 0, maximumValue: Int = 100, hint: String? = nil) {
        self._value = value
		self._minimumValue = minimumValue
		self._maximumValue = maximumValue
		self._hint = hint
    }
}
