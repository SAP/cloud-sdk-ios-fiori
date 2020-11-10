public struct SideIndicator: Decodable, Hashable {
    let title: String
    let number: String
    let unit: String
}

extension SideIndicator: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> SideIndicator {
        let _title = self.title.replacingPlaceholders(withValuesIn: object)
        let _number = self.number.replacingPlaceholders(withValuesIn: object)
        let _unit = self.unit.replacingPlaceholders(withValuesIn: object)
        return SideIndicator(title: _title, number: _number, unit: _unit)
    }
}
