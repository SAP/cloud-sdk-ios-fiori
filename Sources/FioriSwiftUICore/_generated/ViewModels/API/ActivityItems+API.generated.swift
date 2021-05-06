// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ActivityItems {
    

    var _actionItems: [ActivityItemDataType]? = nil
	var _didSelectActivityItem: ((ActivityItemDataType) -> Void)? = nil
	
    public init(model: ActivityItemsModel) {
        self.init(actionItems: model.actionItems_, didSelectActivityItem: model.didSelectActivityItem(_:))
    }

    public init(actionItems: [ActivityItemDataType]? = nil, didSelectActivityItem: ((ActivityItemDataType) -> Void)? = nil) {
        self._actionItems = actionItems
		self._didSelectActivityItem = didSelectActivityItem
    }
}
