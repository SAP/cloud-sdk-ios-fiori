//
//  ObjectGroupItem.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/10/20.
//

import Foundation

public struct ObjectGroupItem: Decodable, Identifiable, Hashable {
    public let icon: Icon?
    public let label: String
    public let value: String
    public let type: String?
    public let url: String?
    public let target: String?
    public let emailSubject: String?
    public let id: UUID = UUID()
}

extension ObjectGroupItem: Placeholding {
    func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> ObjectGroupItem {
        let _icon = icon?.replacingPlaceholders(withValuesIn: dictionary)
        let _label = label.replacingPlaceholders(withValuesIn: dictionary)
        let _value = value.replacingPlaceholders(withValuesIn: dictionary)
        let _type = type?.replacingPlaceholders(withValuesIn: dictionary)
        let _url = url?.replacingPlaceholders(withValuesIn: dictionary)
        let _target = target?.replacingPlaceholders(withValuesIn: dictionary)
        let _emailSubject = emailSubject?.replacingPlaceholders(withValuesIn: dictionary)
        return ObjectGroupItem(icon: _icon, label: _label, value: _value, type: _type, url: _url, target: _target, emailSubject: _emailSubject)
    }
}
