import SwiftUI

public struct ActivityItems {
    var _actionItems: [ActivityItemDataType]?
    var _didSelectClosure: ((ActivityItemDataType) -> Void)?
	
    public init(model: ActivityItemsModel) {
        self.init(actionItems: model.actionItems_, didSelectClosure: model.didSelect(_:))
    }

    public init(actionItems: [ActivityItemDataType]? = nil, didSelectClosure: ((ActivityItemDataType) -> Void)? = nil) {
        self._actionItems = actionItems
        self._didSelectClosure = didSelectClosure
    }
}
