//
//  BaseCard.swift
//  DevTest
//
//  Created by Stadelman, Stan on 1/23/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import Foundation
import AnyCodable
import Combine
import TinyNetworking



/// JSON data must be in `array` form
open class OneManyCard<Template: Decodable & Placeholding>: BaseCard<Template> {
    
    @Published var content: [Template] = []
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap({ $0?.value })
            .tryMap({ try JSONSerialization.jsonObject(with: $0, options: .mutableContainers)})
            .map({ $0 })
            .sink(receiveCompletion: {
                switch $0 {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        print("FINISHED")
                }
            }, receiveValue: { [unowned self] object in
                if let array = object as? JSONArray {
                    self.content = array.map({ self.template.replacingPlaceholders(withValuesIn: $0) })
                } else if let dict = object as? JSONDictionary {
                    self.content = [self.template.replacingPlaceholders(withValuesIn: dict)]
                }
            })
            .store(in: &subscribers)
    }
}



open class ManyManyCard<Template: Decodable & Placeholding & Sequence>: BaseCard<Template> where Template.Element: Placeholding {
    
    @Published var content: Template? = nil
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap({ $0?.value })
            .tryMap({ try JSONSerialization.jsonObject(with: $0, options: .mutableContainers)})
            .map({ $0 })
            .sink(receiveCompletion: {
                switch $0 {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        print("FINISHED")
                }
            }, receiveValue: { [unowned self] object in
                if let array = object as? JSONArray {
                    self.content = zip(self.template, array).map({ $0.0.replacingPlaceholders(withValuesIn: $0.1) }) as? Template
                } else if let dict = object as? JSONDictionary {
                    self.content = self.template.replacingPlaceholders(withValuesIn: dict)
                }
            })
            .store(in: &subscribers)
    }
}

//open class ManyManyCard<Content: Decodable, Template: Decodable & Placeholding>: BaseCard<Template> where Content

open class BaseCard<Template: Decodable & Placeholding>: Decodable, ObservableObject, Identifiable {
    
    open var id: String {
        return UUID().uuidString
    }
    
    @Published var header: Header
    
    var template: Template!
    
    internal let _headerData: DataFetcher?
    internal let _cardData: DataFetcher?
    internal let _contentData: DataFetcher?
    
    public let headerPublisher = CurrentValueSubject<CurrentValueSubject<Data?, Never>?, Never>(nil)
    public '[let contentPublisher = CurrentValueSubject<CurrentValueSubject<Data?, Never>?, Never>(nil)
    
    required public init(from decoder: Decoder) throws {
        
        // MARK: - Decode `header`, `content`, `template`, and 3 data fetchers
        
        let container = try decoder.container(keyedBy: BaseCardCodingKeys.self)
        header = try container.decode(Header.self, forKey: .header)
        
        // MARK: get nested data from header node
        let headerContainer = try container.nestedContainer(keyedBy: BaseCardCodingKeys.self, forKey: .header)
        _headerData = try headerContainer.decodeIfPresent(DataFetcher.self, forKey: .data)
        
        // MARK: get card data
        _cardData = try container.decodeIfPresent(DataFetcher.self, forKey: .data)
        
        // MARK: get nested data from content node
        let contentContainer = try container.nestedContainer(keyedBy: BaseCardCodingKeys.self, forKey: .content)
        _contentData = try contentContainer.decodeIfPresent(DataFetcher.self, forKey: .data)
        
        // MARK: get nested Template from content node
        for k in BaseCardCodingKeys.contentKeys {
            if let t = try? contentContainer.decodeIfPresent(Template.self, forKey: k) {
                template = t
                break
            }
        }
        
        precondition(template != nil, "Unable to load template from card: \(self)")
        
        headerPublisher
            .compactMap({ $0 })
            .map({ $0.value })
            .compactMap({ $0 })
            .tryMap({ try JSONSerialization.jsonObject(with: $0, options: .mutableContainers)})
//
//            .map({
//                print($0)
//                return $0.mapValues({ $0.value }) })
            .sink(receiveCompletion: {
                switch $0 {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        return
                }
            }, receiveValue:  { [unowned self] in
                
                
                self.header = self.header.replacingPlaceholders(withValuesIn: $0)
            })
            .store(in: &subscribers)
        
        
        if let headerData = _headerData ?? _cardData {
            headerPublisher.send(headerData.json)
        }
        
        if let contentData = _contentData ?? _cardData {
            contentPublisher.send(contentData.json)
        }
    }
    
    
    public var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    internal var subscribers = Set<AnyCancellable>()
    
}

// MARK: - union of all content-related keys across the cards
fileprivate enum BaseCardCodingKeys: CodingKey, CaseIterable {
    case header, data, content, item, groups, row
    
    static let contentKeys: [BaseCardCodingKeys] = [.item, .groups, .row]
}
