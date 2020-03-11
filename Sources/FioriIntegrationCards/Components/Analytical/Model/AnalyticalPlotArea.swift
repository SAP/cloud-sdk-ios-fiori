//
//  AnalyticalPlotArea.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/11/20.
//

import Foundation

public struct AnalyticalPlotArea: Decodable {
    public let dataLabel: AnalyticalDataLabel?
    public let categoryAxisText: AnalyticalDataLabel?
    public let valueAxisText: AnalyticalDataLabel?
}
