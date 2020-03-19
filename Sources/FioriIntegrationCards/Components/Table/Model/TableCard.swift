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
        
        template = try HavingContent<HavingRow>(from: decoder).content.row
        
        let data = try HavingData<CardData>(from: decoder).data.jsonObject
        
        CurrentValueSubject<[TableRow], Never>([template])
            .combineLatest(data) { (_, jsonDicts) -> [TableRow] in
                return jsonDicts.map { self.template.replacingPlaceholders(withValuesIn: $0) }
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
