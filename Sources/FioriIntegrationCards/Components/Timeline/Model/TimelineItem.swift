//
//  TimelineItem.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/10/20.
//

import Foundation

public struct TimelineItem: Identifiable, Decodable, Hashable {
    public let title: KeyValue?
    public let description: KeyValue?
    public let dateTime: KeyValue?
    public let owner: KeyValue?
    public let ownerImage: KeyValue?
    public let icon: Icon?
    public let id: UUID = UUID()
    
    public struct KeyValue: Codable, Hashable {
        let label: String?
        let value: String
    }
}

extension TimelineItem.KeyValue : Placeholding {
    func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> TimelineItem.KeyValue {
        let _label = label?.replacingPlaceholders(withValuesIn: dictionary)
        let _value = value.replacingPlaceholders(withValuesIn: dictionary)
        return TimelineItem.KeyValue(label: _label, value: _value)
    }
}

extension TimelineItem: Placeholding {
    func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> TimelineItem {
        let _title = title?.replacingPlaceholders(withValuesIn: dictionary)
        let _description = description?.replacingPlaceholders(withValuesIn: dictionary)
        let _dateTime = dateTime?.replacingPlaceholders(withValuesIn: dictionary)
        let _owner = owner?.replacingPlaceholders(withValuesIn: dictionary)
        let _ownerImage = ownerImage?.replacingPlaceholders(withValuesIn: dictionary)
        let _icon = icon?.replacingPlaceholders(withValuesIn: dictionary)
        return TimelineItem(title: _title, description: _description, dateTime: _dateTime, owner: _owner, ownerImage: _ownerImage, icon: _icon)
    }
}
