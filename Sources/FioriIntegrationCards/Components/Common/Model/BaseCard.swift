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
import ObservableArray

/// JSON data must be in `array` form
open class OneOneCard<Template: Decodable & Placeholding>: BaseCard<Template> {
    
    @Published var content: Template? {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap({ $0?.value })
            .tryMap({ (try JSONSerialization.jsonObject(with: $0.0, options: .mutableContainers), $0.1) })
            .compactMap({ o -> Any? in return `Any`.resolve(o.0, keyPath: o.1, separator: "/") })
            .sink(receiveCompletion: {
                switch $0 {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        print("FINISHED")
                }
            }, receiveValue: { [unowned self] object in
                self.content = self.template.replacingPlaceholders(withValuesIn: object)
            })
            .store(in: &subscribers)
    }
}

/// JSON data must be in `array` form
open class OneManyCard<Template: Decodable & Placeholding>: BaseCard<Template> {
    
    @Published var content: [Template] = [] {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap({ $0?.value })
            .tryMap({ (try JSONSerialization.jsonObject(with: $0.0, options: .mutableContainers), $0.1) })
            .compactMap({ o -> Any? in return `Any`.resolve(o.0, keyPath: o.1, separator: "/") })
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
    
    @Published var content: Template? = nil {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap({ $0?.value })
            .tryMap({ (try JSONSerialization.jsonObject(with: $0.0, options: .mutableContainers), $0.1) })
            .compactMap({ o -> Any? in return `Any`.resolve(o.0, keyPath: o.1, separator: "/") })
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

open class BaseCard<Template: Decodable & Placeholding>: BackingCard {
    
    var template: Template!
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        // MARK: - Decode `header`, `content`, `template`, and 3 data fetchers
        
        let container = try decoder.container(keyedBy: BaseCardCodingKeys.self)
        let contentContainer = try container.nestedContainer(keyedBy: BaseCardCodingKeys.self, forKey: .content)
        
        // MARK: get nested Template from content node
        for k in BaseCardCodingKeys.contentKeys {
            if let t = try? contentContainer.decodeIfPresent(Template.self, forKey: k) {
                template = t
                break
            }
        }
        
        precondition(template != nil, "Unable to load template from card: \(self)")
    }
}

// MARK: - union of all content-related keys across the cards
internal enum BaseCardCodingKeys: CodingKey, CaseIterable {
    case header, data, content, item, groups, row
    
    static let contentKeys: [BaseCardCodingKeys] = [.item, .groups, .row]
}

open class BackingCard: Decodable, ObservableObject, Identifiable {
    
    open var id: String = UUID().uuidString
    
    @Published var header: Header
        
    internal let _headerData: DataFetcher?
    internal let _cardData: DataFetcher?
    internal let _contentData: DataFetcher?
    
    public let headerPublisher = CurrentValueSubject<CurrentValueSubject<(Data, String?)?, Never>?, Never>(nil)
    public let contentPublisher = CurrentValueSubject<CurrentValueSubject<(Data, String?)?, Never>?, Never>(nil)
    public let baseURL: CurrentValueSubject<URL?, Never> = CurrentValueSubject<URL?, Never>(nil)
    required public init(from decoder: Decoder) throws {
        
        // MARK: - Decode `header`, `content`, `template`, and 3 data fetchers
        
        let container = try decoder.container(keyedBy: BaseCardCodingKeys.self)
        
        let tempHeader = try container.decode(Header.self, forKey: .header)
        _header = Published(initialValue: tempHeader)
        
        // MARK: get nested data from header node
        let headerContainer = try container.nestedContainer(keyedBy: BaseCardCodingKeys.self, forKey: .header)
        _headerData = try headerContainer.decodeIfPresent(DataFetcher.self, forKey: .data)
        
        // MARK: get card data
        _cardData = try container.decodeIfPresent(DataFetcher.self, forKey: .data)
        
        // MARK: get nested data from content node
        let contentContainer = try container.nestedContainer(keyedBy: BaseCardCodingKeys.self, forKey: .content)
        _contentData = try contentContainer.decodeIfPresent(DataFetcher.self, forKey: .data)
        
        headerPublisher
            .compactMap({ $0?.value })
            .tryMap({ (try JSONSerialization.jsonObject(with: $0.0, options: .mutableContainers), $0.1) })
            .map({ `Any`.resolve($0.0, keyPath: $0.1, separator: "/")})
            .sink(receiveCompletion: {
                switch $0 {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        return
                }
            }, receiveValue: { [unowned self] in
                
                self.header = self.header.replacingPlaceholders(withValuesIn: $0)
            })
            .store(in: &subscribers)
        
        baseURL
            .sink {[unowned self] (url) in
                guard url != nil else {
                    return
                }
                self._contentData?.load(baseURL: url)
                self._cardData?.load(baseURL: url)
                self._headerData?.load(baseURL: url)
        }
        .store(in: &subscribers)
        
        if let headerData = combinedData(cardData: _cardData, headerOrContentData: _headerData) {
            headerData.json.sink {[unowned self] _ in
                self.headerPublisher.send(headerData.json)
            }
            .store(in: &subscribers)
        }
        
        if let contentData = combinedData(cardData: _cardData, headerOrContentData: _contentData) {
            contentData.json.sink {[unowned self] _ in
                self.contentPublisher.send(contentData.json)
            }
            .store(in: &subscribers)
        }
    }
    
    public var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    internal var subscribers = Set<AnyCancellable>()
    
    func combinedData(cardData: DataFetcher?, headerOrContentData: DataFetcher?) -> DataFetcher? {
        
        // prioritize the data in header or content
        guard let outputDataWithPath = headerOrContentData else {
            return cardData
        }
        
        // if data exists in the card level, combine it with the path from header or content level
        if let actualData = cardData?.json.value?.0 {
            outputDataWithPath.json.send((actualData, outputDataWithPath.path))
        }
        
        return outputDataWithPath
    }
    
}
