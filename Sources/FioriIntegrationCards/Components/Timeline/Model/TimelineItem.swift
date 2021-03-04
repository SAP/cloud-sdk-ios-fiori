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
    public func replacingPlaceholders(withValuesIn objects: Any...) -> TimelineItem {
        let _title = self.title?.replacingPlaceholders(withValuesIn: objects)
        let _description = self.description?.replacingPlaceholders(withValuesIn: objects)
        let _dateTime = self.dateTime?.replacingPlaceholders(withValuesIn: objects)
        let _owner = self.owner?.replacingPlaceholders(withValuesIn: objects)
        let _ownerImage = self.ownerImage?.replacingPlaceholders(withValuesIn: objects)
        let _icon = self.icon?.replacingPlaceholders(withValuesIn: objects)
        return TimelineItem(title: _title, description: _description, dateTime: _dateTime, owner: _owner, ownerImage: _ownerImage, icon: _icon)
    }
}
