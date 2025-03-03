// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _FilterFeedbackBar<Items: View> {
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
            _items.modifier(itemsModifier.concat(Fiori._FilterFeedbackBar.items).concat(Fiori._FilterFeedbackBar.itemsCumulative))
        } else {
            _items.modifier(itemsModifier.concat(Fiori._FilterFeedbackBar.items))
        }
    }
    
	
}

extension _FilterFeedbackBar where Items == _SortFilterMenuItemContainer {

    public init(model: _FilterFeedbackBarModel) {
        self.init(items: Binding<[[SortFilterItem]]>(get: { model.items }, set: { model.items = $0 }), onUpdate: model.onUpdate)
    }

    public init(items: Binding<[[SortFilterItem]]>, onUpdate: (() -> Void)? = nil) {
        self._items = _SortFilterMenuItemContainer(items: items)
		self._onUpdate = onUpdate

		isModelInit = true
		isOnUpdateNil = onUpdate == nil ? true : false
    }
}
