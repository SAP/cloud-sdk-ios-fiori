import Foundation

public struct App: Codable, Identifiable, Hashable {
    public let id: String
    public let type: String
    public let title: String?
    public let subTitle: String?
    public let dataSources: [String: DataSource]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case title
        case subTitle
        case dataSources
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(String.self, forKey: .type)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.subTitle = try container.decodeIfPresent(String.self, forKey: .subTitle)
        self.dataSources = try container.decodeIfPresent([String: DataSource].self, forKey: .dataSources) ?? [:]
    }
}
