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

}



extension TimelineItem: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> TimelineItem {
        let _title = title?.replacingPlaceholders(withValuesIn: object)
        let _description = description?.replacingPlaceholders(withValuesIn: object)
        let _dateTime = dateTime?.replacingPlaceholders(withValuesIn: object)
        let _owner = owner?.replacingPlaceholders(withValuesIn: object)
        let _ownerImage = ownerImage?.replacingPlaceholders(withValuesIn: object)
        let _icon = icon?.replacingPlaceholders(withValuesIn: object)
        return TimelineItem(title: _title, description: _description, dateTime: _dateTime, owner: _owner, ownerImage: _ownerImage, icon: _icon)
    }
}
