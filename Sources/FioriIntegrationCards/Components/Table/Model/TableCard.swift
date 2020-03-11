//
//  TableCard.swift
//  
//
//  Created by Ma, Xiao on 1/22/20.
//
import Combine

public class TableCard: BaseCard<TableRow, [TableRow]> {
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: HavingHeader.CodingKeys.self)
        
        header = try container.decode(Header.self, forKey: .header)
        
        template = try HavingContent<HavingRow>(from: decoder).content.row
        
        let data = try HavingData<CardData>(from: decoder).data.jsonObject
        
        CurrentValueSubject<[TableRow], Never>([template])
            .combineLatest(data) { (_, jsonDicts) -> [TableRow] in
                return jsonDicts.map { (jsonDict) -> TableRow in
                    var _columns: [TableColumn]?
                    var _actions: [Action]?
                    
                    if let columns = self.template.columns {
                        _columns = columns.map({ (col) -> TableColumn in
                            let _value               = col.value?.replacingPlaceholders(withValuesIn: jsonDict)
                            let _title               = col.title?.replacingPlaceholders(withValuesIn: jsonDict)
                            let _width               = col.width?.replacingPlaceholders(withValuesIn: jsonDict)
                            let _icon                = col.icon?.replacingPlaceholders(withValuesIn: jsonDict)
                            let _state               = col.state?.replacingPlaceholders(withValuesIn: jsonDict)
                            let _url                 = col.url?.replacingPlaceholders(withValuesIn: jsonDict)
                            let _target              = col.target?.replacingPlaceholders(withValuesIn: jsonDict)
                            let _identifier          = col.identifier
                            let _progressIndicator   = col.progressIndicator?.replacingPlaceholders(withValuesIn: jsonDict)
                            
                            return TableColumn(title: _title, width: _width, value: _value, icon: _icon, state: _state, url: _url, target: _target, identifier: _identifier, progressIndicator: _progressIndicator)
                        })
                    }
                    
                    if let actions = self.template.actions {
                        _actions = actions.map({ (act) -> Action in
                            let _type = act.type?.replacingPlaceholders(withValuesIn: jsonDict)
                            let _url  = act.url?.replacingPlaceholders(withValuesIn: jsonDict)
                            return Action(type: _type, url: _url)
                        })
                    }
                    
                    return TableRow(columns: _columns, actions: _actions)
                }
        }
        .sink(receiveValue: { [weak self] in
            self?.content.send($0)
        })
            .store(in: &subscribers)
        
    }
    
    private struct HavingRow: Decodable {
        let row: TableRow
    }
}

extension TableCard: Hashable {
    public static func == (lhs: TableCard, rhs: TableCard) -> Bool {
        return lhs.header == rhs.header && lhs.content.value == lhs.content.value
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(content.value)
    }
}
