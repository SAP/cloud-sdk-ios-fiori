//
//  TableColumn.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/10/20.
//

import Foundation

public struct TableColumn: Identifiable, Decodable, Hashable {
    public let title: String?
    public let width: String?
    public let value: String?
    public let icon: Icon?
    public let state: String?
    public let url: String?
    public let target: String?
    public let identifier: Bool?
    public let progressIndicator: String?
    public let id: UUID = UUID()
}
