//
//  ListCard.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/23/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import AnyCodable
import Combine
import TinyNetworking

extension ListCard: Hashable {
    public static func == (lhs: ListCard, rhs: ListCard) -> Bool {
        return lhs.header == rhs.header &&
            lhs.items.value == lhs.items.value
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(items.value)
    }
}

public class ListCard: Decodable, ObservableObject {
    
    public var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    
    struct Item: Decodable, Identifiable, Hashable {
        let title: String?
        let description: String?
        let info: [String]?
        let highlight: Highlight?
        let icon: Icon?
        let actions: [Action]?
        let id: String = UUID().uuidString
    }
    
    let header: Header
    let bindingPlaceholders: Item
    
    let items = CurrentValueSubject<[Item], Never>([])
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: HavingHeader.CodingKeys.self)
        
        header = try container.decode(Header.self, forKey: .header)
        let value = try HavingContent<HavingItem>(from: decoder)
        bindingPlaceholders = value.content.item
        
        items.receive(on: RunLoop.main)
            .sink(receiveValue: { _ in self.objectWillChange.send() })
            .store(in: &subscribers)
        
        let data = try HavingContent<HavingData<CardData>>(from: decoder)
        
        CurrentValueSubject<Item, Never>(bindingPlaceholders)
            .combineLatest(data.content.data.jsonObject) { (item, jsonArray) -> [Item] in
                return jsonArray.map {
                    let _icon = item.icon?.replacingPlaceholders(withValuesIn: $0)
                    let _title = item.title?.replacingPlaceholders(withValuesIn: $0)
                    let _description = item.description?.replacingPlaceholders(withValuesIn: $0)
                    let _highlight = item.highlight?.replacingPlaceholders(withValuesIn: $0)
                    return Item(title: _title, description: _description, info: nil, highlight: _highlight, icon: _icon, actions: nil)
                }
        }
        .sink(receiveValue: { [weak self] in
            self?.items.send($0)
        })
        .store(in: &subscribers)
    }
    
    private var subscribers = Set<AnyCancellable>()
    
    private struct HavingItem: Decodable {
        let item: Item
    }
    
    private struct HavingData<Model: Decodable>: Decodable {
        let data: Model
    }
    
//    func transformedData() -> [Item] {
//        guard let json = data.json else { return [] }
//        return json.map {
////            let data = $0.compactMapValues( { $0.value })
//            let data = $0
//            let _icon = item.icon?.replacingPlaceholders(withValuesIn: data)
//            let _title = item.title?.replacingPlaceholders(withValuesIn: data)
//            let _description = item.description?.replacingPlaceholders(withValuesIn: data)
//            let _highlight = item.highlight?.replacingPlaceholders(withValuesIn: data)
//            return Item(title: _title, description: _description, info: nil, highlight: _highlight, icon: _icon, actions: nil)
//        }
//    }
}

/// MARK: - Binding structs: will contain placeholder strings

//private protocol HavingCardData {
//    associatedtype JSONModel: Decodable
//    associatedtype Item: Decodable
//    var data: CardData<JSONModel> { get }
//    var item: Item { get }
//}

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
            .print("A")
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
            .print("B")
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

enum ParseError: Error {
    case convert
}



/*
 do {
     let parsed = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
     switch parsed {
     case is NSDictionary:
         let jsonDict = parsed as! JSONDictionary
         if let root: JSONArray = resolve(jsonDict, keyPath: path, separator: "/") {
             print("set async")
             DispatchQueue.main.async {
                 self.data = root.map { Data.init(data: $0, binding: self.item) }
             }
         }
     case is NSArray:
         let jsonArray = parsed as! JSONArray
         print("jsonArray: \(jsonArray)")
     default:
         break
     }
 } catch {
     print(error)
 }
 */
