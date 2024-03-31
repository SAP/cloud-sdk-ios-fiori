// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct DurationPicker {
    

    var _selection: Binding<Int>
	var _maximumMinutes: Int
	var _minimumMinutes: Int
	var _minuteInterval: Int
	var _measurementFormatter: MeasurementFormatter
	
    public init(model: DurationPickerModel) {
        self.init(selection: Binding<Int>(get: { model.selection }, set: { model.selection = $0 }), maximumMinutes: model.maximumMinutes, minimumMinutes: model.minimumMinutes, minuteInterval: model.minuteInterval, measurementFormatter: model.measurementFormatter)
    }

    public init(selection: Binding<Int>, maximumMinutes: Int = 1439, minimumMinutes: Int = 0, minuteInterval: Int = 1, measurementFormatter: MeasurementFormatter = MeasurementFormatter()) {
        self._selection = selection
		self._maximumMinutes = maximumMinutes
		self._minimumMinutes = minimumMinutes
		self._minuteInterval = minuteInterval
		self._measurementFormatter = measurementFormatter
    }
}
