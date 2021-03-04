import Foundation

public struct KeyValue: Codable, Hashable {
    let label: String?
    let value: String
}

extension KeyValue: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> KeyValue {
        let _label = self.label?.replacingPlaceholders(withValuesIn: objects) as String?
        let _value = self.value.replacingPlaceholders(withValuesIn: objects)
        return KeyValue(label: _label, value: _value)
    }
}
