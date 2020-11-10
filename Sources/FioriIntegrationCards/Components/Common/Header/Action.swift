import Foundation

public struct Action: Decodable, Hashable {
    public let type: String?
    public let url: String?
}

extension Action: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> Action {
        let _type = self.type?.replacingPlaceholders(withValuesIn: object)
        let _url = self.url?.replacingPlaceholders(withValuesIn: object)
        return Action(type: _type, url: _url)
    }
}
