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
    public func replacingPlaceholders(withValuesIn objects: Any...) -> NumericHeader {
        let _type = self.type.replacingPlaceholders(withValuesIn: objects)
        let _title = self.title.replacingPlaceholders(withValuesIn: objects)
        let _subTitle = self.subTitle?.replacingPlaceholders(withValuesIn: objects)
        let _unitOfMeasurement = self.unitOfMeasurement?.replacingPlaceholders(withValuesIn: objects)
        let _details = self.details?.replacingPlaceholders(withValuesIn: objects)
        let _status = self.status?.replacingPlaceholders(withValuesIn: objects)
        let _sideIndicators = self.sideIndicators?.map { $0.replacingPlaceholders(withValuesIn: objects) }
        let _mainIndicator = self.mainIndicator?.replacingPlaceholders(withValuesIn: objects)
        let _actions = self.actions?.map { $0.replacingPlaceholders(withValuesIn: objects) }
            
        return NumericHeader(type: _type, title: _title, subTitle: _subTitle, actions: _actions, unitOfMeasurement: _unitOfMeasurement, mainIndicator: _mainIndicator, details: _details, sideIndicators: _sideIndicators, status: _status)
    }
}
