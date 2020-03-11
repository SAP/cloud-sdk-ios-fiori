//
//  ObjectGroup.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/10/20.
//

import Foundation

public struct ObjectGroup: Decodable, Identifiable, Hashable {
    public let title: String
    public let items: [ObjectGroupItem]
    public let id: UUID = UUID()
}
