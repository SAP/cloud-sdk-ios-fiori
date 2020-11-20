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
    public func replacingPlaceholders(withValuesIn objects: Any...) -> AnalyticalTitleAttributes {
        let _text = self.text.replacingPlaceholders(withValuesIn: objects)
        let _isVisible = String(describing: isVisible).replacingPlaceholdersToBoolean(withValuesIn: objects)
        let _alignment = self.alignment?.replacingPlaceholders(withValuesIn: objects)
        return AnalyticalTitleAttributes(text: _text, isVisible: _isVisible, alignment: _alignment)
    }
}
