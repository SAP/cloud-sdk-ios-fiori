import Foundation

// loose port of https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFiori/Contact%20views.html#/s:8SAPFiori18FUIActivityControlC

public struct ActivityItemsCustom {
    internal var activityItems: [ActivityItemDataType] = []
    internal var actionHandler: ((ActivityItemDataType) -> Void)?

    public init(model: ActionItemsComponent & ActivityItemsBehavior) {
        self.activityItems = model.actionItems_ ?? []
        self.actionHandler = model.didSelect(_:)
    }

    public init(items: [ActivityItemDataType], action: ((ActivityItemDataType) -> Void)? = nil) {
        self.activityItems = items
        self.actionHandler = action
    }
}
