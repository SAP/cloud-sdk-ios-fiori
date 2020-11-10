import Foundation

public struct ObjectGroup: Decodable, Identifiable, Hashable {
    public let title: String
    public let items: [ObjectGroupItem]
    public let id = UUID()
}

extension ObjectGroup: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> ObjectGroup {
        let _title = self.title.replacingPlaceholders(withValuesIn: object)
        let _items = self.items.map { $0.replacingPlaceholders(withValuesIn: object) }
        return ObjectGroup(title: _title, items: _items)
    }
}
