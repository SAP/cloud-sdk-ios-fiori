// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SortFilterMenu<Items: View> {
    @Environment(\.itemsModifier) private var itemsModifier

    var _items: Items
	var _onUpdate: (() -> Void)?
	

    private var isModelInit: Bool = false
	private var isOnUpdateNil: Bool = false

    public init(
        @ViewBuilder items: () -> Items,
		onUpdate: (() -> Void)? = nil
        ) {
            self._items = items()
			self._onUpdate = onUpdate
    }

    @ViewBuilder var items: some View {
        if isModelInit {
            _items.modifier(itemsModifier.concat(Fiori.SortFilterMenu.items).concat(Fiori.SortFilterMenu.itemsCumulative))
        } else {
            _items.modifier(itemsModifier.concat(Fiori.SortFilterMenu.items))
        }
    }
    
	
}

extension SortFilterMenu where Items == _SortFilterMenuItemContainer {

    public init(model: SortFilterMenuModel) {
        self.init(items: Binding<[[SortFilterItem]]>(get: { model.items }, set: { model.items = $0 }), onUpdate: model.onUpdate)
    }

    public init(items: Binding<[[SortFilterItem]]>, onUpdate: (() -> Void)? = nil) {
        self._items = _SortFilterMenuItemContainer(items: items)
		self._onUpdate = onUpdate

		isModelInit = true
		isOnUpdateNil = onUpdate == nil ? true : false
    }
}
