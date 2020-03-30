//
//  TableCard.swift
//  
//
//  Created by Ma, Xiao on 1/22/20.
//
import Combine

open typealias TableCard: OneManyCard<TableRow>


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
