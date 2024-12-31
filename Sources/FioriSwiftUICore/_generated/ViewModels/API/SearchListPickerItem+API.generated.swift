// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SearchListPickerItem {
    @Environment(\.filterFeedbackBarStyle) var filterFeedbackBarStyle

    var _value: Binding<[Int]>
	var _valueOptions: [String]
	var _hint: String? = nil
	var _onTap: ((_ index: Int) -> Void)? = nil
	var barItemFrame: CGRect = .zero
	var allowsDisplaySelectionCount: Bool = true
	var updateSearchListPickerHeight: ((CGFloat) -> ())? = nil
	var allowsEmptySelection: Bool = false
	@State var _keyboardHeight: CGFloat = 0.0
	@State var _searchViewCornerRadius: CGFloat = 18
	var isSearchBarHidden: Bool = false
	var allowsMultipleSelection: Bool = false
	var disableListEntriesSection: Bool = false
	@State var _height: CGFloat = 44
	let popoverWidth = 393.0
	var selectAll: ((Bool) -> ())? = nil
	@State var _searchText: String = ""
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
