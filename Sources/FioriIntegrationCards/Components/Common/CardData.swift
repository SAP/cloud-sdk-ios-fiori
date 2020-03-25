//
//  CardData.swift
//  FioriIntegrationCards
//
//  Created by Stan Stadelman on 3/23/20.
//

import Foundation
import Combine
import AnyCodable

class CardData: Decodable {
    
    let jsonObject = CurrentValueSubject<JSONArray, Never>([])

    private let json: [[String: AnyCodable]]?
    private let request: Request?
    private let path: String?

    enum CodingKeys: CodingKey {
        case json, request, path
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        json = try container.decodeIfPresent([[String: AnyCodable]].self, forKey: .json)
        request = try container.decodeIfPresent(Request.self, forKey: .request)
        path = try container.decodeIfPresent(String.self, forKey: .path)

        let dataPublisher = PassthroughSubject<PassthroughSubject<Data, Never>, Never>()
        
        dataPublisher
        .switchToLatest()
            .combineLatest(CurrentValueSubject<String?, Never>(path))
            .tryMap({ (try JSONSerialization.jsonObject(with: $0.0, options: .allowFragments), $0.1) })
//            .print("A")
            .map({ parsed, path -> JSONArray in
                switch parsed {
                case is NSDictionary:
                    let jsonDict = parsed as! JSONDictionary
                    guard let path = path else { return [jsonDict] }
                    guard let array: JSONArray = jsonDict.resolve(keyPath: path, separator: "/") else { return [] }
                    return array
                case is NSArray:
                    return parsed as! JSONArray
                default:
                    return []
                }
            })
//            .print("B")
            .sink(receiveCompletion: {_ in }, receiveValue: { value in
                self.jsonObject.send(value)
            })
            .store(in: &subscription)
        
        if let json = json {
            let jsonPublisher = PassthroughSubject<Data, Never>()
            dataPublisher.send(jsonPublisher)
            let data = try! JSONEncoder().encode(json)
            jsonPublisher.send(data)
        } else if let request = request {
            dataPublisher.send(request.fetchedData)
            request.send()
        }
    }
    
    private var subscription: Set<AnyCancellable> = []
}

