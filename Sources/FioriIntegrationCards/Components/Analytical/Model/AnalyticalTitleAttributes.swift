import Foundation

public struct AnalyticalTitleAttributes: Decodable {
    public let text: String
    public let isVisible: Bool?
    public let alignment: String?
    
    enum CodingKeys: String, CodingKey {
        case text, alignment, isVisible = "visible"
    }
}

extension AnalyticalTitleAttributes: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalTitleAttributes {
        let _text = self.text.replacingPlaceholders(withValuesIn: object)
        let _isVisible = String(describing: isVisible).replacingPlaceholdersToBoolean(withValuesIn: object)
        let _alignment = self.alignment?.replacingPlaceholders(withValuesIn: object)
        return AnalyticalTitleAttributes(text: _text, isVisible: _isVisible, alignment: _alignment)
    }
}
