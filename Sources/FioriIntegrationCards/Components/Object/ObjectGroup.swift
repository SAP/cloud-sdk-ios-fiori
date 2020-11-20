import Foundation

public struct ObjectGroup: Decodable, Identifiable, Hashable {
    public let title: String
    public let items: [ObjectGroupItem]
    public let id = UUID()
}

extension ObjectGroup: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> ObjectGroup {
        let _title = self.title.replacingPlaceholders(withValuesIn: objects)
        let _items = self.items.map { $0.replacingPlaceholders(withValuesIn: objects) }
        return ObjectGroup(title: _title, items: _items)
    }
}
