//
//  AnalyticalLegend.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/11/20.
//

import Foundation

public struct AnalyticalLegend: Decodable {
    public let title: String?
    public let drawingEffect: String?
    public let isHierarchical: Bool?
    public let isScrollable: Bool?
    public let isVisible: Bool?
    
    enum CodingKeys: String, CodingKey {
        case title, drawingEffect, isHierarchical, isScrollable, isVisible = "visible"
    }
}
