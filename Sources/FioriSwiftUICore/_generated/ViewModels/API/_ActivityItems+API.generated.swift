// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _ActivityItems {
    @Environment(\.actionItemsModifier) private var actionItemsModifier

    var _actionItems: [ActivityItemDataType]? = nil
	var _didSelectActivityItem: ((ActivityItemDataType) -> Void)? = nil
	
    public init(model: _ActivityItemsModel) {
        self.init(actionItems: model.actionItems, didSelectActivityItem: model.didSelectActivityItem)
    }

    public init(actionItems: [ActivityItemDataType]? = nil, didSelectActivityItem: ((ActivityItemDataType) -> Void)? = nil) {
        self._actionItems = actionItems
		self._didSelectActivityItem = didSelectActivityItem
    }
}
