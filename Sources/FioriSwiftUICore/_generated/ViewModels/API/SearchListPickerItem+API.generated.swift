// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SearchListPickerItem {
    @Environment(\._filterFeedbackBarStyle) var _filterFeedbackBarStyle

    var _value: Binding<[Int]>
	var _valueOptions: [String]
	var _hint: String? = nil
	var _onTap: ((_ index: Int) -> Void)? = nil
	@State var _height: CGFloat = 44
	var allowsDisplaySelectionCount: Bool = true
	@State var _searchViewCornerRadius: CGFloat = 18
	var updateSearchListPickerHeight: ((CGFloat) -> ())? = nil
	var barItemFrame: CGRect = .zero
	var selectAll: ((Bool) -> ())? = nil
	var allowsEmptySelection: Bool = false
	@State var _searchText: String = ""
	@State var _keyboardHeight: CGFloat = 0.0
	var disableListEntriesSection: Bool = false
	var isSearchBarHidden: Bool = false
	let popoverWidth = 393.0
	var allowsMultipleSelection: Bool = false
	var uuidValueOptions: [[String: String]] = []
    public init(model: SearchListPickerItemModel) {
        self.init(value: Binding<[Int]>(get: { model.value }, set: { model.value = $0 }), valueOptions: model.valueOptions, hint: model.hint, onTap: model.onTap)
    }

    public init(value: Binding<[Int]>, valueOptions: [String] = [], hint: String? = nil, onTap: ((_ index: Int) -> Void)? = nil) {
        self._value = value
		self._valueOptions = valueOptions
		self._hint = hint
		self._onTap = onTap
    }
}
