import Foundation

public struct AnalyticalMeasureDimension: Decodable {
    public let label: String
    public let value: String
}

extension AnalyticalMeasureDimension: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> AnalyticalMeasureDimension {
        let _label = self.label.replacingPlaceholders(withValuesIn: objects)
        let _value = self.value.replacingPlaceholders(withValuesIn: objects)
        return .init(label: _label, value: _value)
    }
}
