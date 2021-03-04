import AnyCodable
import Combine
import Foundation

public class DataFetcher: Decodable {
    let request: Request?
    let json = CurrentValueSubject<(Data, String?)?, Never>(nil)
    let path: String?
    let updateInterval: Float?
    
    private enum CodingKeys: CodingKey {
        case request, json, path, updateInterval
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.request = try container.decodeIfPresent(Request.self, forKey: .request)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.updateInterval = try container.decodeIfPresent(Float.self, forKey: .updateInterval)
        
        let _json = try container.decodeIfPresent(AnyCodable.self, forKey: .json)
        if let json = _json {
            self.json.send((try JSONEncoder().encode(json), self.path))
        }
                
        self.request?.fetchedData
            .compactMap { $0 }
            .sink(receiveValue: { [unowned self] in
                self.json.send(($0, self.path))
            })
            .store(in: &self.subscribers)
        
        self.load()
    }
    
    public func load(baseURL: URL? = nil) {
        self.request?.send(baseURL: baseURL)
    }
    
    private var subscribers = Set<AnyCancellable>()
}

extension DataFetcher: Equatable {
    public static func == (lhs: DataFetcher, rhs: DataFetcher) -> Bool {
        lhs.request == rhs.request &&
            lhs.path == rhs.path &&
            lhs.updateInterval == rhs.updateInterval
    }
}

extension DataFetcher: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.request)
        hasher.combine(self.path)
        hasher.combine(self.updateInterval)
    }
}
