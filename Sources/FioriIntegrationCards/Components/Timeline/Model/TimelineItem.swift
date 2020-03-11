//
//  TimelineItem.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/10/20.
//

import Foundation

public struct TimelineItem: Identifiable, Decodable, Hashable {
    public let title: String
    public let description: String?
    public let dateTime: String?
    public let owner: String?
    public let ownerImage: String?
    public let icon: Icon?
    public let id: UUID = UUID()
}
