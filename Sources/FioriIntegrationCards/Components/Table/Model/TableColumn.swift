import Foundation

public struct TableColumn: Identifiable, Decodable, Hashable {
    public let title: String?
    public let width: String?
    public let value: String?
    public let icon: Icon?
    public let state: String?
    public let url: String?
    public let target: String?
    public let identifier: Bool?
    public let progressIndicator: String?
    public let id = UUID()
}

extension TableColumn: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> TableColumn {
        let _value = self.value?.replacingPlaceholders(withValuesIn: object)
        let _title = self.title?.replacingPlaceholders(withValuesIn: object)
        let _width = self.width?.replacingPlaceholders(withValuesIn: object)
        let _icon = self.icon?.replacingPlaceholders(withValuesIn: object)
        let _state = self.state?.replacingPlaceholders(withValuesIn: object)
        let _url = self.url?.replacingPlaceholders(withValuesIn: object)
        let _target = self.target?.replacingPlaceholders(withValuesIn: object)
        let _identifier = self.identifier
        let _progressIndicator = self.progressIndicator?.replacingPlaceholders(withValuesIn: object)
        return TableColumn(title: _title, width: _width, value: _value, icon: _icon, state: _state, url: _url, target: _target, identifier: _identifier, progressIndicator: _progressIndicator)
    }
}
