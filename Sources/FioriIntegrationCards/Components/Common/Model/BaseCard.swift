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

extension BaseCard where Content == Array<Template> {
    func bind(template: Template, data: JSONArray) -> Content {
        return data.map({ template.replacingPlaceholders(withValuesIn: $0) })
    }
}

extension BaseCard where Content == Array<Placeholding>, Template == Content {
    func bind(template: Template, data: JSONArray) -> Content {
        return zip(template, data).map({ $0.0.replacingPlaceholders(withValuesIn: $0.1) })
    }
}

extension BaseCard where Template == Content {
    
}



public class BaseCard<Template: Decodable & Placeholding, Content: Decodable & Placeholding>: Decodable, ObservableObject {
    
    @Published var header: Header
    @Published public var data: DataFetcher?
    @Published var content: Content? = nil
    
    var template: Template!
    
    private let _headerData: DataFetcher?
    private let _cardData: DataFetcher?
    private let _contentData: DataFetcher?
    
    public let cardData = CurrentValueSubject<JSONDictionary?, Never>(nil)
    public let headerData = CurrentValueSubject<JSONDictionary?, Never>(nil)
    public let contentData = CurrentValueSubject<JSONDictionary?, Never>(nil)
    
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
        
        // MARK: - Subscribe to `Data` incoming from 3 data fetchers
        // Note:
        _headerData?.$json
            .compactMap({ $0 })
            .sink(receiveValue: {
                print("RECEIVED HEADER DATA: \($0)")
            })
            .store(in: &subscribers)
        
        _cardData?.$json
            .compactMap({ $0 })
            .sink(receiveValue: {
                print("RECEIVED CARD DATA: \($0)")
            })
            .store(in: &subscribers)
        
        _contentData?.$json
            .compactMap({ $0 })
            .sink(receiveValue: {
                print("RECEIVED CONTENT DATA: \($0)")
            })
            .store(in: &subscribers)
        
        
        // MARK: - handle binding of cardData / headerData to header template
        cardData
            .combineLatest(headerData)
            .map({ value -> JSONDictionary in
                switch (value.0, value.1) {
                    case (.some(let content), .some(let card)):
                        return content.merging(card, uniquingKeysWith: { $1 })
                    case (.some(let card), .none):
                        return card
                    case (.none, .some(let content)):
                        return content
                    default:
                        return [:]
                }
            })
            .sink(receiveValue: { [unowned self] value in
                self.header = self.header.replacingPlaceholders(withValuesIn: value)
            })
            .store(in: &subscribers)
        
        
        // MARK: - handle binding of cardData / contentData to header template
        cardData
            .combineLatest(contentData)
            .map({ value -> JSONDictionary in
                switch (value.0, value.1) {
                    case (.some(let content), .some(let card)):
                        return content.merging(card, uniquingKeysWith: { $1 })
                    case (.some(let card), .none):
                        return card
                    case (.none, .some(let content)):
                        return content
                    default:
                        return [:]
                }
            })
            .sink(receiveValue: { [unowned self] value in
                // TODO: fix setting content to result of template replacing placeholders
                self.content = self.content?.replacingPlaceholders(withValuesIn: value)
            })
            .store(in: &subscribers)
        
    }
    
    public func load() {
        data?.load()
    }
    
    public var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    internal var subscribers = Set<AnyCancellable>()
    
}

// MARK: - union of all content-related keys across the cards
fileprivate enum BaseCardCodingKeys: CodingKey, CaseIterable {
    case header, data, content, item, groups, row
    
    static let contentKeys: [BaseCardCodingKeys] = [.item, .groups, .row]
}
