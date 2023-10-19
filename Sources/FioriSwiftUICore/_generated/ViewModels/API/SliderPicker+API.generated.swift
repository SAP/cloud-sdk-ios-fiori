// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SliderPicker {
    @Environment(\.formatterModifier) private var formatterModifier
	@Environment(\.sortFilterMenuItemStyle) var sortFilterMenuItemStyle

    var _value: Binding<Int?>
	var _formatter: String? = nil
	var _minimumValue: Int
	var _maximumValue: Int
	var _hint: String? = nil
	
    public init(model: SliderPickerModel) {
        self.init(value: Binding<Int?>(get: { model.value }, set: { model.value = $0 }), formatter: model.formatter, minimumValue: model.minimumValue, maximumValue: model.maximumValue, hint: model.hint)
    }

    public init(value: Binding<Int?>, formatter: String? = nil, minimumValue: Int = 0, maximumValue: Int = 100, hint: String? = nil) {
        self._value = value
		self._formatter = formatter
		self._minimumValue = minimumValue
		self._maximumValue = maximumValue
		self._hint = hint
    }
}
