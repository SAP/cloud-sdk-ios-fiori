public struct SideIndicator: Decodable, Hashable {
    let title: String
    let number: String
    let unit: String
}

extension SideIndicator: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> SideIndicator {
        let _title = self.title.replacingPlaceholders(withValuesIn: objects)
        let _number = self.number.replacingPlaceholders(withValuesIn: objects)
        let _unit = self.unit.replacingPlaceholders(withValuesIn: objects)
        return SideIndicator(title: _title, number: _number, unit: _unit)
    }
}
