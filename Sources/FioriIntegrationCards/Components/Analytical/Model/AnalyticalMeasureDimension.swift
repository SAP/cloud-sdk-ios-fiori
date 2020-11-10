import Foundation

public struct AnalyticalMeasureDimension: Decodable {
    public let label: String
    public let value: String
}

extension AnalyticalMeasureDimension: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalMeasureDimension {
        let _label = self.label.replacingPlaceholders(withValuesIn: object)
        let _value = self.value.replacingPlaceholders(withValuesIn: object)
        return .init(label: _label, value: _value)
    }
}
