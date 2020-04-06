//
//  KeyValue.swift
//  AnyCodable
//
//  Created by Stan Stadelman on 3/30/20.
//

import Foundation

public struct KeyValue: Codable, Hashable {
    let label: String?
    let value: String
}

extension KeyValue: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> KeyValue {
        let _label = label?.replacingPlaceholders(withValuesIn: object)
        let _value = value.replacingPlaceholders(withValuesIn: object)
        return KeyValue(label: _label, value: _value)
    }
}
