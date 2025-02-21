// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct OptionListPickerItem {
    @Environment(\._filterFeedbackBarStyle) var _filterFeedbackBarStyle

    var _value: Binding<[Int]>
	var _valueOptions: [String]
	var _hint: String? = nil
	var _title: String? = nil
	var _itemLayout: OptionListPickerItemLayoutType
	var _allowsMultipleSelection: Bool
	var _allowsEmptySelection: Bool
	var _onTap: ((_ index: Int) -> Void)? = nil
	var updateSearchListPickerHeight: ((CGFloat) -> ())? = nil
	@State var _height: CGFloat = 0
	var barItemFrame: CGRect = .zero
    public init(model: OptionListPickerItemModel) {
        self.init(value: Binding<[Int]>(get: { model.value }, set: { model.value = $0 }), valueOptions: model.valueOptions, hint: model.hint, title: model.title, itemLayout: model.itemLayout, allowsMultipleSelection: model.allowsMultipleSelection, allowsEmptySelection: model.allowsEmptySelection, onTap: model.onTap)
    }

    public init(value: Binding<[Int]>, valueOptions: [String] = [], hint: String? = nil, title: String? = nil, itemLayout: OptionListPickerItemLayoutType = .fixed, allowsMultipleSelection: Bool = true, allowsEmptySelection: Bool = false, onTap: ((_ index: Int) -> Void)? = nil) {
        self._value = value
		self._valueOptions = valueOptions
		self._hint = hint
		self._title = title
		self._itemLayout = itemLayout
		self._allowsMultipleSelection = allowsMultipleSelection
		self._allowsEmptySelection = allowsEmptySelection
		self._onTap = onTap
    }
}
