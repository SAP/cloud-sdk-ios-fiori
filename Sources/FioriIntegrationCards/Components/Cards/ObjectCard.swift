//
//  ObjectCard.swift
//  
//
//  Created by Ma, Xiao on 1/21/20.
//

import Foundation
import AnyCodable
import Combine

public class ObjectCard: BaseCard<[ObjectGroup], [ObjectGroup]> {
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: HavingHeader.CodingKeys.self)
        
        header = try container.decode(Header.self, forKey: .header)
        
        let value = try HavingContent<HavingGroups>(from: decoder)
        template = value.content.groups
        
        let dataJson = try HavingData<AnyDecodable>(from: decoder).data.value as! JSONDictionary
        let data = CurrentValueSubject<JSONDictionary, Never>(dataJson["json"] as! JSONDictionary)
        
        let headerData = dataJson["json"] as! JSONDictionary
        switch self.header {
        case .default(let value):
            let _type        = value.type?.replacingPlaceholders(withValuesIn: headerData)
            let _title       = value.title.replacingPlaceholders(withValuesIn: headerData)
            let _subTitle    = value.subTitle?.replacingPlaceholders(withValuesIn: headerData)
            let _actions     = value.actions
            let _icon        = value.icon
            let _status      = value.status
            let defaultHeader = DefaultHeader(type: _type, title: _title, subTitle: _subTitle, actions: _actions, icon: _icon, status: _status)
            header = .default(defaultHeader)
        default:
            break
        }
        
        CurrentValueSubject<[ObjectGroup], Never>(template)
            .combineLatest(data) { (groups, jsonDict) -> [ObjectGroup] in
                return groups.map {
                    let items = $0.items.map { (item) -> ObjectGroupItem in
                        let _icon = item.icon?.replacingPlaceholders(withValuesIn: jsonDict)
                        let _label = item.label.replacingPlaceholders(withValuesIn: jsonDict)
                        let _value = item.value.replacingPlaceholders(withValuesIn: jsonDict)
                        let _type = item.type?.replacingPlaceholders(withValuesIn: jsonDict)
                        let _url = item.url?.replacingPlaceholders(withValuesIn: jsonDict)
                        let _target = item.target?.replacingPlaceholders(withValuesIn: jsonDict)
                        let _emailSubject = item.emailSubject?.replacingPlaceholders(withValuesIn: jsonDict)
                        return ObjectGroupItem(icon: _icon, label: _label, value: _value, type: _type, url: _url, target: _target, emailSubject: _emailSubject)
                    }
                    return ObjectGroup(title: $0.title, items: items)
                }
        }
        .sink(receiveValue: { [weak self] in
            self?.content.send($0)
        })
        .store(in: &subscribers)
    }
    
    private struct HavingGroups: Decodable {
        let groups: [ObjectGroup]
    }
}

extension ObjectCard: Hashable {
    public static func == (lhs: ObjectCard, rhs: ObjectCard) -> Bool {
        return lhs.header == rhs.header &&
            lhs.content.value == rhs.content.value
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(content.value)
    }
}
