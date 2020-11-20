import Foundation

public struct ObjectGroupItem: Decodable, Identifiable, Hashable {
    public let icon: Icon?
    public let label: String
    public let value: String
    public let type: String?
    public let url: String?
    public let target: String?
    public let emailSubject: String?
    public let id = UUID()
}

extension ObjectGroupItem: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> ObjectGroupItem {
        let _icon = self.icon?.replacingPlaceholders(withValuesIn: objects)
        let _label = self.label.replacingPlaceholders(withValuesIn: objects)
        let _value = self.value.replacingPlaceholders(withValuesIn: objects)
        let _type: String? = self.type?.replacingPlaceholders(withValuesIn: objects)
        let _url: String? = self.url?.replacingPlaceholders(withValuesIn: objects)
        let _target: String? = self.target?.replacingPlaceholders(withValuesIn: objects)
        let _emailSubject: String? = self.emailSubject?.replacingPlaceholders(withValuesIn: objects)
        return ObjectGroupItem(icon: _icon, label: _label, value: _value, type: _type, url: _url, target: _target, emailSubject: _emailSubject)
    }
}
