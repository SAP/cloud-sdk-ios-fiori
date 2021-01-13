import Foundation

// loose port of https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFiori/Contact%20views.html#/s:8SAPFiori18FUIActivityControlC

public struct ActivityItems {
    public var model: ActivityItemsComponent & ActivityItemsBehavior

    public init(model: ActivityItemsComponent & ActivityItemsBehavior) {
        self.model = model
    }
}
