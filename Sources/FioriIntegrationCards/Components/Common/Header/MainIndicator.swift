public struct MainIndicator: Decodable, Hashable {
    let number: String
    let unit: String
    let trend: String
    let state: String
}

extension MainIndicator: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> MainIndicator {
        let _number = self.number.replacingPlaceholders(withValuesIn: objects)
        let _unit = self.unit.replacingPlaceholders(withValuesIn: objects)
        let _trend = self.trend.replacingPlaceholders(withValuesIn: objects)
        let _state = self.state.replacingPlaceholders(withValuesIn: objects)
        return MainIndicator(number: _number, unit: _unit, trend: _trend, state: _state)
    }
}
