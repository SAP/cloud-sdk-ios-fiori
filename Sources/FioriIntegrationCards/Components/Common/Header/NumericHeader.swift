import Foundation

public struct NumericHeader: Decodable, Hashable {
    public let type: String
    public let title: String
    public let subTitle: String?
    public let actions: [Action]?
    public let unitOfMeasurement: String?
    public let mainIndicator: MainIndicator?
    public let details: String?
    public let sideIndicators: [SideIndicator]?
    public let status: Status?
}

extension NumericHeader: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> NumericHeader {
        let _type = self.type.replacingPlaceholders(withValuesIn: object)
        let _title = self.title.replacingPlaceholders(withValuesIn: object)
        let _subTitle = self.subTitle?.replacingPlaceholders(withValuesIn: object)
        let _unitOfMeasurement = self.unitOfMeasurement?.replacingPlaceholders(withValuesIn: object)
        let _details = self.details?.replacingPlaceholders(withValuesIn: object)
        let _status = self.status?.replacingPlaceholders(withValuesIn: object)
        let _sideIndicators = self.sideIndicators?.map { $0.replacingPlaceholders(withValuesIn: object) }
        let _mainIndicator = self.mainIndicator?.replacingPlaceholders(withValuesIn: object)
        let _actions = self.actions?.map { $0.replacingPlaceholders(withValuesIn: object) }
            
        return NumericHeader(type: _type, title: _title, subTitle: _subTitle, actions: _actions, unitOfMeasurement: _unitOfMeasurement, mainIndicator: _mainIndicator, details: _details, sideIndicators: _sideIndicators, status: _status)
    }
}
