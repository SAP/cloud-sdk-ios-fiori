//
//  AnalyticalTitleAttributes.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/11/20.
//

import Foundation

public struct AnalyticalTitleAttributes: Decodable {
    public let text: String
    public let isVisible: Bool?
    public let alignment: String?
    
    enum CodingKeys: String, CodingKey {
        case text, alignment, isVisible = "visible"
    }
}
