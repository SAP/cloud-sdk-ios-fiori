//
//  TableCard.swift
//  
//
//  Created by Ma, Xiao on 1/22/20.
//
import Combine

protocol DataLoading {
    func loadData()
}

public class TableCard: BaseCard<TableRow, [TableRow]> {
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        template = try HavingContent<HavingRow<TableRow>>(from: decoder).content.row
        
        let dataPub = try HavingData<CardData>(from: decoder).data.jsonObject
        
        dataPub.combineLatest(Just(template).compactMap({ $0 }))
            .map({ value in
                value.0.map({ value.1.replacingPlaceholders(withValuesIn: $0) })
            })
            .sink (receiveValue: { [unowned self] in
                self.content = $0
            })
            .store(in: &subscribers)
    }
}

//extension TableCard: DataLoading {
//    func loadData() {
//        Publishers.TryMap({ }
//        .sink(receiveValue: { [weak self] in
//            self?.contentData.send($0)
//        })
//    }
//}

public struct HavingRow<Model: Decodable>: Decodable {
    let row: Model
}
extension TableCard: Hashable {
    public static func == (lhs: TableCard, rhs: TableCard) -> Bool {
        return lhs.header == rhs.header && lhs.content == lhs.content
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(content)
    }
}
