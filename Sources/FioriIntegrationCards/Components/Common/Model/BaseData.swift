//
//  BaseData.swift
//  AnyCodable
//
//  Created by Stan Stadelman on 3/22/20.
//

import Foundation
import AnyCodable

protocol DataHandling {
    var data: Data { get }
    var dataPublished: Published<Data> { get }
    var dataPublisher: Published<Data>.Publisher { get }
}

class BaseData: Decodable {
    let request: Request?
    @Published var json: Data? = nil
    let path: String?
    let updateInterval: Float?
    
    private enum CodingKeys: CodingKey {
        case request, json, path, updateInterval
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        request = try container.decodeIfPresent(Request.self, forKey: .request)
        let _json = try container.decodeIfPresent(AnyCodable.self, forKey: .json)
        if let json = _json {
            self.json = try JSONEncoder().encode(json)
        }
        path = try container.decodeIfPresent(String.self, forKey: .path)
        updateInterval = try container.decodeIfPresent(Float.self, forKey: .updateInterval)
    }
}
