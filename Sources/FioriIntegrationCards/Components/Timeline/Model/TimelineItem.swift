import Foundation

public struct TimelineItem: Identifiable, Decodable, Hashable {
    public let title: KeyValue?
    public let description: KeyValue?
    public let dateTime: KeyValue?
    public let owner: KeyValue?
    public let ownerImage: KeyValue?
    public let icon: Icon?
    public let id = UUID()
}

extension TimelineItem: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> TimelineItem {
        let _title = self.title?.replacingPlaceholders(withValuesIn: object)
        let _description = self.description?.replacingPlaceholders(withValuesIn: object)
        let _dateTime = self.dateTime?.replacingPlaceholders(withValuesIn: object)
        let _owner = self.owner?.replacingPlaceholders(withValuesIn: object)
        let _ownerImage = self.ownerImage?.replacingPlaceholders(withValuesIn: object)
        let _icon = self.icon?.replacingPlaceholders(withValuesIn: object)
        return TimelineItem(title: _title, description: _description, dateTime: _dateTime, owner: _owner, ownerImage: _ownerImage, icon: _icon)
    }
}
