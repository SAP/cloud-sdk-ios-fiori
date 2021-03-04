//
//  TableCard.swift
//
//
//  Created by Ma, Xiao on 1/22/20.
//
import Combine

open class TableCard: OneManyCard<TableRow> {}

extension TableCard: Hashable {
    public static func == (lhs: TableCard, rhs: TableCard) -> Bool {
        lhs.header == rhs.header && lhs.content == rhs.content
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(content)
    }
}
