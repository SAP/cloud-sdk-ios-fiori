//
//  BaseData.swift
//  AnyCodable
//
//  Created by Stan Stadelman on 3/22/20.
//

import Foundation
import Combine
import AnyCodable

protocol DataHandling {
    var data: Data { get }
    var dataPublished: Published<Data> { get }
    var dataPublisher: Published<Data>.Publisher { get }
}

public class DataFetcher: Decodable {
    let request: Request?
    let json = CurrentValueSubject<Data?, Never>(nil)
    let path: String?
    let updateInterval: Float?
    
    private enum CodingKeys: CodingKey {
        case request, json, path, updateInterval
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        request = try container.decodeIfPresent(Request.self, forKey: .request)
        let _json = try container.decodeIfPresent(AnyCodable.self, forKey: .json)
        if let json = _json {
            self.json.send(try JSONEncoder().encode(json))
        }
        path = try container.decodeIfPresent(String.self, forKey: .path)
        updateInterval = try container.decodeIfPresent(Float.self, forKey: .updateInterval)
                
        request?.fetchedData
            .compactMap({ $0 })
            .sink(receiveValue: { [unowned self] in
                self.json.send($0)
            })
            .store(in: &subscribers)
        
//        self.json.lane("DataFetcher json?").compactMap({ $0 }).lane("DataFetcher json").sink(receiveValue: { print("JSON: \(String(data: $0, encoding: .utf8)!)") }).store(in: &subscribers)
        
        load()
    }
    
    public func load() {
        request?.send()
    }
    
    private var subscribers = Set<AnyCancellable>()
}

extension DataFetcher: Equatable {
    public static func == (lhs: DataFetcher, rhs: DataFetcher) -> Bool {
        return lhs.request == rhs.request &&
            lhs.path == rhs.path &&
            lhs.updateInterval == rhs.updateInterval
    }
}

extension DataFetcher: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(request)
        hasher.combine(path)
        hasher.combine(updateInterval)
    }
}
