public struct MainIndicator: Decodable, Hashable {
    let number: String
    let unit: String
    let trend: String
    let state: String
}

extension MainIndicator: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> MainIndicator {
        let _number = self.number.replacingPlaceholders(withValuesIn: object)
        let _unit = self.unit.replacingPlaceholders(withValuesIn: object)
        let _trend = self.trend.replacingPlaceholders(withValuesIn: object)
        let _state = self.state.replacingPlaceholders(withValuesIn: object)
        return MainIndicator(number: _number, unit: _unit, trend: _trend, state: _state)
    }
}
