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
    
    init(chartType: String, legend: AnalyticalLegend?, plotArea: AnalyticalPlotArea?, title: AnalyticalTitleAttributes?, measureAxis: String?, dimensionAxis: String?) {
        self.chartType = chartType
        self.legend = legend
        self.plotArea = plotArea
        self.title = title
        self.measureAxis = measureAxis
        self.dimensionAxis = dimensionAxis

    }
}

extension AnalyticalContent: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalContent {
        let _chartType       = chartType.replacingPlaceholders(withValuesIn: object)
        let _measureAxis     = measureAxis?.replacingPlaceholders(withValuesIn: object)
        let _dimensionAxis   = dimensionAxis?.replacingPlaceholders(withValuesIn: object)
        let _legend          = legend?.replacingPlaceholders(withValuesIn: object)
        let _title           = title?.replacingPlaceholders(withValuesIn: object)
        let _plotArea        = plotArea?.replacingPlaceholders(withValuesIn: object)
        
        return .init(chartType: _chartType, legend: _legend, plotArea: _plotArea, title: _title, measureAxis: _measureAxis, dimensionAxis: _dimensionAxis)
    }
}
