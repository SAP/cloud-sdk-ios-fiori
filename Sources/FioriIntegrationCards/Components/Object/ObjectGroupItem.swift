//
//  ObjectGroupItem.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/10/20.
//

import Foundation

public struct ObjectGroupItem: Decodable, Identifiable, Hashable {
    public let icon: Icon?
    public let label: String
    public let value: String
    public let type: String?
    public let url: String?
    public let target: String?
    public let emailSubject: String?
    public let id: UUID = UUID()
}
