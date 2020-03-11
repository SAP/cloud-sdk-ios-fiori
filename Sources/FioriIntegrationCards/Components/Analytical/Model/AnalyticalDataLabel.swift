//
//  AnalyticalDataLabel.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/11/20.
//

import Foundation

public struct AnalyticalDataLabel: Decodable {
    public let isVisible: Bool?
    public let isShowingTotal: Bool?
    
    enum CodingKeys: String, CodingKey {
        case isVisible = "visible"
        case isShowingTotal = "showTotal"
    }
}
