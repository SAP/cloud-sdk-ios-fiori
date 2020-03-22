//
//  TimelineCard.swift
//  
//
//  Created by Ma, Xiao on 1/23/20.
//
import Combine

public class TimelineCard: BaseCard<TimelineItem, [TimelineItem]> {
    
    private var templateItem: TimelineItemTemplate!
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let value = try HavingContent<HavingTemplateItem>(from: decoder)
        templateItem = value.content.item
        template = {
            return TimelineItem(title: templateItem.title.value, description: templateItem.description?.value, dateTime: templateItem.dateTime?.value, owner: templateItem.owner?.value, ownerImage: templateItem.ownerImage?.value, icon: templateItem.icon)
        }()
        
        let data = try HavingContent<HavingData<CardData>>(from: decoder).content.data.jsonObject
        
        CurrentValueSubject<[TimelineItem], Never>([template])
            .combineLatest(data) { (_, jsonDicts) -> [TimelineItem] in
                return jsonDicts.map { (jsonDict) -> TimelineItem in
                    let _title          = self.template.title.replacingPlaceholders(withValuesIn: jsonDict)
                    let _description    = self.template.description?.replacingPlaceholders(withValuesIn: jsonDict).trimmed()
                    let _dateTime       = self.template.dateTime?.replacingPlaceholders(withValuesIn: jsonDict)
                    let _owner          = self.template.owner?.replacingPlaceholders(withValuesIn: jsonDict)
                    let _ownerImage     = self.template.ownerImage?.replacingPlaceholders(withValuesIn: jsonDict)
                    let _icon           = self.template.icon?.replacingPlaceholders(withValuesIn: jsonDict)
                    return TimelineItem(title: _title, description: _description, dateTime: _dateTime, owner: _owner, ownerImage: _ownerImage, icon: _icon)
                }
        }
        .sink(receiveValue: { [weak self] in
            self?.content = $0
        })
            .store(in: &subscribers)
    }
    
    private struct HavingTemplateItem: Decodable {
        let item: TimelineItemTemplate
    }
}

extension TimelineCard: Hashable {
    public static func == (lhs: TimelineCard, rhs: TimelineCard) -> Bool {
        return lhs.header == rhs.header &&
            lhs.content == rhs.content
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(content)
    }
}
