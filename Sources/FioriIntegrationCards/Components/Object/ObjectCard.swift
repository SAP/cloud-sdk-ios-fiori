//
//  ObjectCard.swift
//  
//
//  Created by Ma, Xiao on 1/21/20.
//

import Foundation
import AnyCodable
import Combine

open class ObjectCard: ManyManyCard<[ObjectGroup]> {

}

extension ObjectCard: Hashable {
    public static func == (lhs: ObjectCard, rhs: ObjectCard) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Array: Placeholding where Element: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> [Element] {
        return map { $0.replacingPlaceholders(withValuesIn: object) }
    }
    
}
