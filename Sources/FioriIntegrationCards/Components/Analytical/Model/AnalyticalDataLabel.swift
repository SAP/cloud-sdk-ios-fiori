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
    public func replacingPlaceholders(withValuesIn objects: Any...) -> AnalyticalDataLabel {
        let _isVisible = String(describing: isVisible).replacingPlaceholdersToBoolean(withValuesIn: objects)
        let _isShowingTotal = String(describing: isShowingTotal).replacingPlaceholdersToBoolean(withValuesIn: objects)
        return AnalyticalDataLabel(isVisible: _isVisible, isShowingTotal: _isShowingTotal)
    }
}
