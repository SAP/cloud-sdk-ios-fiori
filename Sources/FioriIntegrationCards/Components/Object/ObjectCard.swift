//
//  ObjectCard.swift
//  
//
//  Created by Ma, Xiao on 1/21/20.
//

import Foundation
import AnyCodable
import Combine


public class ObjectCard: ManyManyCard<[ObjectGroup]> {
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
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
