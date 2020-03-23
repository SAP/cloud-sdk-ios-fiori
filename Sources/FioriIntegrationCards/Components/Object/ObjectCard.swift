//
//  ObjectCard.swift
//  
//
//  Created by Ma, Xiao on 1/21/20.
//

import Foundation
import AnyCodable
import Combine
import KeyedCodable_iOS


public class ObjectCard: BaseCard<[ObjectGroup], [ObjectGroup]> {
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let value = try HavingContent<HavingGroups<[ObjectGroup]>>(from: decoder)
        template = value.content.groups
        
        let dataJson = try HavingData<AnyDecodable>(from: decoder).data.value as! JSONDictionary
        let data = CurrentValueSubject<JSONDictionary, Never>(dataJson["json"] as! JSONDictionary)
        
        if let headerData = dataJson["json"] as? JSONDictionary {
            self.headerData.send(headerData)
        }
        
        CurrentValueSubject<[ObjectGroup], Never>(template)
            .combineLatest(data) { (groups, jsonDict) -> [ObjectGroup] in
                return groups.map { $0.replacingPlaceholders(withValuesIn: jsonDict) }
        }
        .sink(receiveValue: { [weak self] in
            self?.content = $0
        })
        .store(in: &subscribers)
    }
}



extension ObjectCard: Hashable {
    public static func == (lhs: ObjectCard, rhs: ObjectCard) -> Bool {
        return lhs.header == rhs.header &&
            lhs.content == rhs.content
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(content)
    }
}

extension Array: Placeholding where Element: Placeholding {
    public func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> Array<Element> {
        return map { $0.replacingPlaceholders(withValuesIn: dictionary) }
    }
    
    
}
