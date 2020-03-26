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
    public func replacingPlaceholders(withValuesIn object: Any) -> ObjectGroup {
        let _title = title.replacingPlaceholders(withValuesIn: object)
        let _items = items.map { $0.replacingPlaceholders(withValuesIn: object) }
        return ObjectGroup(title: _title, items: _items)
    }
}
