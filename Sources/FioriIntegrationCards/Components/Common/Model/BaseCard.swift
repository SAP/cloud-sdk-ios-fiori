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


public class BaseCard<Template: Decodable, Content: Decodable>: Decodable, ObservableObject {
    
    @Published var header: Header
    @Published var data: BaseData?
    @Published var content: Content? = nil
    
    var template: Template!
    
    public let cardData = CurrentValueSubject<JSONDictionary?, Never>(nil)
    public let headerData = CurrentValueSubject<JSONDictionary?, Never>(nil)
    public let contentData = CurrentValueSubject<JSONDictionary?, Never>(nil)
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        header = try container.decode(Header.self, forKey: .header)
        data = try container.decodeIfPresent(BaseData.self, forKey: .data)
//        content = try container.decodeIfPresent(Content.self, forKey: .content)
        
        // MARK: - handle binding of headerData to header template
        headerData
            .compactMap({ $0 })
            .sink(receiveValue: { [unowned self] in
                self.header = self.header.replacingPlaceholders(withValuesIn: $0)
            })
            .store(in: &subscribers)
        

    }
    
    public var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    internal var subscribers = Set<AnyCancellable>()
    
    // MARK: - union of all content-related keys across the cards
    enum CodingKeys: CodingKey {
        case header, data, content, item
    }

}
