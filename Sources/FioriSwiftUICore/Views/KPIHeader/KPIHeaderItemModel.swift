/// Items data model for `KPIHeader`.
public protocol KPIHeaderItemModel: Sendable {}

extension KPIItem: KPIHeaderItemModel, @unchecked Sendable {}

extension KPIProgressItem: KPIHeaderItemModel, @unchecked Sendable {}
