import Foundation

public struct AnalyticalDataLabel: Decodable {
    public let isVisible: Bool?
    public let isShowingTotal: Bool?
    
    enum CodingKeys: String, CodingKey {
        case isVisible = "visible"
        case isShowingTotal = "showTotal"
    }
}

extension AnalyticalDataLabel: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalDataLabel {
        let _isVisible = String(describing: isVisible).replacingPlaceholdersToBoolean(withValuesIn: object)
        let _isShowingTotal = String(describing: isShowingTotal).replacingPlaceholdersToBoolean(withValuesIn: object)
        return AnalyticalDataLabel(isVisible: _isVisible, isShowingTotal: _isShowingTotal)
    }
}
