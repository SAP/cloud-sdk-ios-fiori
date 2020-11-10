import Foundation

public struct KeyValue: Codable, Hashable {
    let label: String?
    let value: String
}

extension KeyValue: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> KeyValue {
        let _label = self.label?.replacingPlaceholders(withValuesIn: object)
        let _value = self.value.replacingPlaceholders(withValuesIn: object)
        return KeyValue(label: _label, value: _value)
    }
}
