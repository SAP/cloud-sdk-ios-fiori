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
    public func replacingPlaceholders(withValuesIn object: Any) -> ObjectGroupItem {
        let _icon = self.icon?.replacingPlaceholders(withValuesIn: object)
        let _label = self.label.replacingPlaceholders(withValuesIn: object)
        let _value = self.value.replacingPlaceholders(withValuesIn: object)
        let _type = self.type?.replacingPlaceholders(withValuesIn: object)
        let _url = self.url?.replacingPlaceholders(withValuesIn: object)
        let _target = self.target?.replacingPlaceholders(withValuesIn: object)
        let _emailSubject = self.emailSubject?.replacingPlaceholders(withValuesIn: object)
        return ObjectGroupItem(icon: _icon, label: _label, value: _value, type: _type, url: _url, target: _target, emailSubject: _emailSubject)
    }
}
