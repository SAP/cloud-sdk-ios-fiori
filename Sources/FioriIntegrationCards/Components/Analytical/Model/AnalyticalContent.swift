//
//  AnalyticalContent.swift
//  FioriIntegrationCards
//
//  Created by Stan Stadelman on 4/3/20.
//

import Foundation
import FioriCharts

public struct AnalyticalContent: Decodable {
    public let chartType: String
    public let legend: AnalyticalLegend?
    public let plotArea: AnalyticalPlotArea?
    public let title: AnalyticalTitleAttributes?
    public let measureAxis: String?
    public let dimensionAxis: String?
    public let measures: [AnalyticalMeasureDimension]
    public let dimensions: [AnalyticalMeasureDimension]
    public var categories: [DataCategory] = []
        
    private enum CodingKeys: CodingKey {
        case chartType, legend, plotArea, title, measureAxis, dimensionAxis, measures, dimensions
    }
//
//    public enum ChartType: String, Decodable, CaseIterable {
//        case line = "Line"
//        case stackedBar = "StackedBar"
//        case stackedColumn = "StackedColumn"
//        case donut = "Donut"
//    }
}

extension AnalyticalContent: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalContent {
        let _chartType       = chartType.replacingPlaceholders(withValuesIn: object)
        let _measureAxis     = measureAxis?.replacingPlaceholders(withValuesIn: object)
        let _dimensionAxis   = dimensionAxis?.replacingPlaceholders(withValuesIn: object)
        let _legend          = legend?.replacingPlaceholders(withValuesIn: object)
        let _title           = title?.replacingPlaceholders(withValuesIn: object)
        let _plotArea        = plotArea?.replacingPlaceholders(withValuesIn: object)
        let _measures        = measures.map { $0.replacingPlaceholders(withValuesIn: object) }
        let _dimensions      = dimensions.map { $0.replacingPlaceholders(withValuesIn: object) }
        let _data            = categories.map({ $0.replacingPlaceholders(withValuesIn: object)})
        
        return .init(chartType: _chartType, legend: _legend, plotArea: _plotArea, title: _title, measureAxis: _measureAxis, dimensionAxis: _dimensionAxis, measures: _measures, dimensions: _dimensions, categories: _data)
    }
}
