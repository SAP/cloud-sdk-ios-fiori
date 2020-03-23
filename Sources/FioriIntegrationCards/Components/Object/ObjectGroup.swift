//
//  ObjectGroup.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/10/20.
//

import Foundation

public struct ObjectGroup: Decodable, Identifiable, Hashable {
    public let title: String
    public let items: [ObjectGroupItem]
    public let id: UUID = UUID()
}

extension ObjectGroup: Placeholding {
    public func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> ObjectGroup {
        let _title = title.replacingPlaceholders(withValuesIn: dictionary)
        let _items = items.map { $0.replacingPlaceholders(withValuesIn: dictionary) }
        return ObjectGroup(title: _title, items: _items)
    }
}
