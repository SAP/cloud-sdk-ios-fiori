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
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let contentContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .content)
        template = try contentContainer.decodeIfPresent(TimelineItem.self, forKey: .item)
        

        let data = try HavingContent<HavingData<CardData>>(from: decoder).content.data.jsonObject
        Just(template).compactMap({ $0 })
            .combineLatest(data.compactMap({ $0 }))
            .map({ value in
                value.1.map({ value.0.replacingPlaceholders(withValuesIn: $0) })
            })
            .sink(receiveValue: { [unowned self] items in
                self.content = items
            })
            .store(in: &subscribers)
//        data
//            .map({ template.replacingPlaceholders(withValuesIn: $0) })
//        CurrentValueSubject<[TimelineItem], Never>([template])
//            .combineLatest(data) { (_, jsonDicts) -> [TimelineItem] in
//                return jsonDicts.map { (jsonDict) -> TimelineItem in
//                    let _title          = self.template.title.replacingPlaceholders(withValuesIn: jsonDict)
//                    let _description    = self.template.description?.replacingPlaceholders(withValuesIn: jsonDict).trimmed()
//                    let _dateTime       = self.template.dateTime?.replacingPlaceholders(withValuesIn: jsonDict)
//                    let _owner          = self.template.owner?.replacingPlaceholders(withValuesIn: jsonDict)
//                    let _ownerImage     = self.template.ownerImage?.replacingPlaceholders(withValuesIn: jsonDict)
//                    let _icon           = self.template.icon?.replacingPlaceholders(withValuesIn: jsonDict)
//                    return TimelineItem(title: _title, description: _description, dateTime: _dateTime, owner: _owner, ownerImage: _ownerImage, icon: _icon)
//                }
//        }
//        .sink(receiveValue: { [weak self] in
//            self?.content = $0
//        })
//            .store(in: &subscribers)
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
