//
//  TimelineCard.swift
//  
//
//  Created by Ma, Xiao on 1/23/20.
//
import Combine

public class TimelineCard: BaseCard<TimelineItem, [TimelineItem]> {
        
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let contentContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .content)
//        template = try contentContainer.decodeIfPresent(TimelineItem.self, forKey: .item)
        

//        let data = try HavingContent<HavingData<CardData>>(from: decoder).content.data.jsonObject
//        Just(template).compactMap({ $0 })
//            .combineLatest(data)
//            .map({ value in
//                value.1.map({ value.0.replacingPlaceholders(withValuesIn: $0) })
//            })
//            .sink(receiveValue: { [unowned self] items in
//                self.content = items
//            })
//            .store(in: &subscribers)
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
