import Foundation

public struct Action: Decodable, Hashable {
    public let type: String?
    public let url: String?
}

extension Action: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> Action {
        let _type = self.type?.replacingPlaceholders(withValuesIn: objects)
        let _url = self.url?.replacingPlaceholders(withValuesIn: objects)
        return Action(type: _type, url: _url)
    }
}
