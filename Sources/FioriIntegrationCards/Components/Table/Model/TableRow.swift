//
//  TableRow.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/10/20.
//

import Foundation

public struct TableRow: Identifiable, Decodable, Hashable {
    public let columns: [TableColumn]?
    public let actions: [Action]?
    public let id: UUID = UUID()
}
