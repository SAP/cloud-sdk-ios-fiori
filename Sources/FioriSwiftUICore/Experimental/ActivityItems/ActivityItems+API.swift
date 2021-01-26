import Foundation

// loose port of https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFiori/Contact%20views.html#/s:8SAPFiori18FUIActivityControlC

public struct ActivityItems {
    internal var activityItems: [ActivityItem] = []
    internal var actionHandler: ((ActivityItem) -> Void)?

    public init(model: ActivityItemsComponent & ActivityItemsBehavior) {
        self.activityItems = model.activityItems_
        self.actionHandler = model.didSelect(_:)
    }

    public init(items: [ActivityItem], action: ((ActivityItem) -> Void)?) {
        self.activityItems = items
        self.actionHandler = action
    }
}
