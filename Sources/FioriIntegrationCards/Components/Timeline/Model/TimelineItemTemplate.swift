//
//  TimelineItemTemplate.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/10/20.
//

import Foundation

public struct TimelineItemTemplate: Decodable {
    public let title: TimelineBaseModel
    public let description: TimelineBaseModel?
    public let dateTime: TimelineBaseModel?
    public let owner: TimelineBaseModel?
    public let ownerImage: TimelineBaseModel?
    public let icon: Icon?
}

public struct TimelineBaseModel: Decodable {
    let label: String?
    let value: String
}
